#!/usr/bin/env bash
# compile_sign_align.sh — Build completa + zipalign + firma SOLO v2 di NTG_062 (app modificata con apktool).
#
# Uso:
#   ./compile_sign_align.sh                                 -> build completa: pulizia cache + apktool b + zipalign + firma v2
#                                                              output: NTG_062_audi_it.apk (sovrascritto se esiste)
#   ./compile_sign_align.sh <output.apk>                    -> build completa con nome di output scelto da te (sovrascritto)
#   ./compile_sign_align.sh --signOnly <in.apk> [out.apk]   -> SOLO zipalign + firma v2 di un APK gia' costruito
#
# FIRMA: esclusivamente APK Signature Scheme v2 — niente v1/v3/v4 (v2 e' sufficiente per
#        Android 9 / API 28, l'unico target di questa app).
# MOTORE: apksigner (Android SDK build-tools) e' l'UNICO strumento che firma in v2 "puro"
#        (--vN-signing-enabled). uber-apk-signer/jarsigner NON sanno limitare gli schemi
#        -> volutamente NON usati. Se apksigner non e' presente lo script si ferma con errore
#        (meglio fermarsi che produrre un APK con schemi non richiesti).
# Keystore di DEBUG (password "android") creata una volta e riusata. NB: NON per Google Play.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"

# JDK di Homebrew: gli stub in /usr/bin falliscono ("Unable to locate a Java Runtime").
# '|| true' evita l'uscita silenziosa di set -e se il glob non trova nulla; poi si controlla esplicitamente.
JBIN="$(ls -d /opt/homebrew/Cellar/openjdk/*/bin 2>/dev/null | sort -V | tail -1 || true)"
[ -n "$JBIN" ] || { echo "[ERR] JDK Homebrew non trovato in /opt/homebrew/Cellar/openjdk (installa: brew install openjdk)"; exit 1; }
JAVA="$JBIN/java"; KEYTOOL="$JBIN/keytool"
{ [ -x "$JAVA" ] && [ -x "$KEYTOOL" ]; } || { echo "[ERR] java/keytool non eseguibili in $JBIN"; exit 1; }

SRC="$HERE/NTG_062_src/apktool"          # sorgenti apktool da cui si compila
KS="$HERE/debug.keystore"; ALIAS=androiddebugkey; PW=android

# Android SDK build-tools: apksigner (firma v2 pura) + zipalign (stessa cartella).
SDK="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}"
APKSIGNER_JAR="$(ls "$SDK"/build-tools/*/lib/apksigner.jar 2>/dev/null | sort -V | tail -1 || true)"
ZIPALIGN="$(ls "$SDK"/build-tools/*/zipalign 2>/dev/null | sort -V | tail -1 || true)"

# Esegue zipalign su $1 producendo $2. Usa lo zipalign dell'SDK se disponibile,
# altrimenti ricade su zipalign.py incluso nel repo (richiede python3).
align_apk() {
  local IN="$1" OUT="$2"
  if [ -n "$ZIPALIGN" ]; then
    "$ZIPALIGN" -f -p 4 "$IN" "$OUT"
  else
    command -v python3 >/dev/null || { echo "[ERR] ne' zipalign dell'SDK ne' python3 disponibili per allineare"; exit 1; }
    python3 "$HERE/zipalign.py" "$IN" "$OUT"
  fi
}

# zipalign + firma SOLO v2 di un APK GIA' costruito.  $1 = input.apk, $2 = output.apk
sign_apk() {
  local IN="$1" OUT="$2"

  # apksigner e' obbligatorio: e' l'unico che firma in v2 puro.
  if [ -z "$APKSIGNER_JAR" ]; then
    echo "[ERR] apksigner non trovato nell'SDK ($SDK)."
    echo "[ERR] Serve per firmare in v2 puro (uber-apk-signer/jarsigner non sanno limitare gli schemi)."
    echo "[ERR] Installa le Android SDK build-tools (es. sdkmanager 'build-tools;34.0.0')"
    echo "[ERR] oppure esporta ANDROID_HOME verso un SDK che le contiene."
    exit 1
  fi

  if [ ! -f "$KS" ]; then
    echo "[*] Creo keystore di debug: $KS"
    "$KEYTOOL" -genkeypair -v -keystore "$KS" -alias "$ALIAS" -keyalg RSA -keysize 2048 \
      -validity 10000 -storepass "$PW" -keypass "$PW" -dname "CN=Android Debug,O=Android,C=US"
  fi

  # apksigner richiede l'APK GIA' allineato prima della firma -> zipalign PRIMA.
  echo "[*] apksigner: zipalign + firma SOLO v2"
  local ALIGNED; ALIGNED="$(mktemp -u).apk"
  align_apk "$IN" "$ALIGNED"

  "$JAVA" -jar "$APKSIGNER_JAR" sign \
    --ks "$KS" --ks-key-alias "$ALIAS" --ks-pass "pass:$PW" --key-pass "pass:$PW" \
    --v1-signing-enabled false \
    --v2-signing-enabled true \
    --v3-signing-enabled false \
    --out "$OUT" "$ALIGNED"
  rm -f "$ALIGNED" "${OUT}.idsig"
  echo "[OK] $OUT  (allineato; firma SOLO v2)"
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
OUT="${1:-$HERE/NTG_062_audi_it.apk}"
[ -d "$SRC" ] || { echo "[ERR] sorgenti apktool non trovati: $SRC"; exit 1; }
command -v apktool >/dev/null || { echo "[ERR] apktool non trovato nel PATH (installa: brew install apktool)"; exit 1; }

echo "[*] Pulizia cache di build (build/ dist/)"
rm -rf "$SRC/build" "$SRC/dist"

echo "[*] apktool b -> compilo l'APK dai sorgenti"
UNSIGNED="$(mktemp -u).apk"
apktool b "$SRC" -o "$UNSIGNED"

sign_apk "$UNSIGNED" "$OUT"
rm -f "$UNSIGNED"
echo "[FATTO] build + zipalign + firma v2 completate -> $OUT"
