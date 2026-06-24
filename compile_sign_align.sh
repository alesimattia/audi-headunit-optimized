#!/usr/bin/env bash
# compile_sign_align.sh — Build completa + zipalign + firma di NTG_062 (app modificata con apktool).
#
# Uso:
#   ./compile_sign_align.sh                        -> build completa: pulizia cache + apktool b + zipalign + firma
#                                                     output: NTG_062_audi_it_aligned.apk (sovrascritto se esiste)
#   ./compile_sign_align.sh <output.apk>           -> build completa con nome di output scelto da te (sovrascritto)
#   ./compile_sign_align.sh --signOnly <in.apk> [out.apk] -> SOLO zipalign + firma di un APK già costruito
#
# Se uber-apk-signer.jar è in questa cartella -> zipalign + firma v1/v2/v3 (consigliato).
# Altrimenti fallback auto-contenuto -> jarsigner (firma v1) + zipalign.py.
# La keystore di DEBUG (password "android") viene creata una volta e riusata
# (firma coerente tra le build -> niente disinstalla/reinstalla tra i tuoi APK).
# NB: chiave di debug, NON per Google Play.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"

# JDK di Homebrew: gli stub in /usr/bin falliscono ("Unable to locate a Java Runtime").
JBIN="$(ls -d /opt/homebrew/Cellar/openjdk/*/bin 2>/dev/null | sort -V | tail -1)"
JAVA="$JBIN/java"; KEYTOOL="$JBIN/keytool"; JARSIGNER="$JBIN/jarsigner"

SRC="$HERE/NTG_062_src/apktool"          # sorgenti apktool da cui si compila
KS="$HERE/debug.keystore"; ALIAS=androiddebugkey; PW=android
UBER="$HERE/uber-apk-signer.jar"

# zipalign + firma di un APK GIÀ costruito.  $1 = input.apk, $2 = output.apk
sign_apk() {
  local IN="$1" OUT="$2"
  if [ ! -f "$KS" ]; then
    echo "[*] Creo keystore di debug: $KS"
    "$KEYTOOL" -genkeypair -v -keystore "$KS" -alias "$ALIAS" -keyalg RSA -keysize 2048 \
      -validity 10000 -storepass "$PW" -keypass "$PW" -dname "CN=Android Debug,O=Android,C=US"
  fi
  if [ -f "$UBER" ]; then
    echo "[*] uber-apk-signer: zipalign + firma v1/v2/v3"
    local TMPD; TMPD="$(mktemp -d)"
    "$JAVA" -jar "$UBER" --apks "$IN" --ks "$KS" --ksAlias "$ALIAS" \
      --ksPass "$PW" --ksKeyPass "$PW" --out "$TMPD"
    mv "$TMPD"/*-aligned-signed.apk "$OUT"
    rm -rf "$TMPD"
    echo "[OK] $OUT  (allineato, v1/v2/v3)"
  else
    echo "[*] fallback: jarsigner (v1) + zipalign.py"
    local TMP; TMP="$(mktemp -u).apk"; cp "$IN" "$TMP"
    "$JARSIGNER" -keystore "$KS" -storepass "$PW" -keypass "$PW" \
      -sigalg SHA256withRSA -digestalg SHA-256 "$TMP" "$ALIAS"
    python3 "$HERE/zipalign.py" "$TMP" "$OUT"   # zipalign DOPO la firma v1 (ordine corretto)
    rm -f "$TMP"
    echo "[OK] $OUT  (allineato, v1)"
  fi
}

# MODO "solo firma": SOLO col flag esplicito --signOnly <input.apk> [output.apk].
if [ "${1:-}" = "--signOnly" ]; then
  IN="${2:?Uso: ./compile_sign_align.sh --signOnly <input.apk> [output.apk]}"
  [ -f "$IN" ] || { echo "[ERR] APK non trovato: $IN"; exit 1; }
  OUT="${3:-${IN%.apk}-aligned-signed.apk}"
  sign_apk "$IN" "$OUT"
  exit 0
fi

# MODO "build completa" (default): pulizia cache + apktool b + firma.
# Sovrascrive SEMPRE l'output. Nome di output: $1 se passato, altrimenti il default.
OUT="${1:-$HERE/NTG_062_audi_it_aligned.apk}"
[ -d "$SRC" ] || { echo "[ERR] sorgenti apktool non trovati: $SRC"; exit 1; }

echo "[*] Pulizia cache di build (build/ dist/)"
rm -rf "$SRC/build" "$SRC/dist"

echo "[*] apktool b -> compilo l'APK dai sorgenti"
UNSIGNED="$(mktemp -u).apk"
apktool b "$SRC" -o "$UNSIGNED"

sign_apk "$UNSIGNED" "$OUT"
rm -f "$UNSIGNED"
echo "[FATTO] build + zipalign + firma completate -> $OUT"
