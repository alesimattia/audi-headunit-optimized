#!/usr/bin/env bash
# compile_sign_align.sh — Build completa + zipalign + firma di NTG_062 (app modificata con apktool).
#
# Uso:
#   ./compile_sign_align.sh                                 -> build completa: pulizia cache + apktool b + zipalign + firma
#                                                              output: NTG_062_audi_it.apk (sovrascritto se esiste)
#   ./compile_sign_align.sh <output.apk>                    -> build completa con nome di output scelto da te (sovrascritto)
#   ./compile_sign_align.sh --signOnly <in.apk> [out.apk]   -> SOLO zipalign + firma di un APK gia' costruito
#
# FIRMA: uber-apk-signer.jar (incluso nel repo) -> zipalign (built-in) + firma in un colpo solo.
#        AUTOCONTENUTO: serve solo un JDK, NIENTE Android SDK/build-tools.
#        NB: uber 1.3.0 applica gli schemi di default (v2 + v3); non sa limitarsi a un singolo
#        schema come apksigner. Va benissimo per Android 9 / API 28 (lo schema v3 e' stato
#        introdotto proprio in API 28; v1/JAR non serve sopra API 24).
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
UBER="$HERE/uber-apk-signer.jar"         # firmatario autocontenuto: zipalign built-in + firma v2+v3

# zipalign + firma di un APK GIA' costruito, via uber-apk-signer.  $1 = input.apk, $2 = output.apk
sign_apk() {
  local IN="$1" OUT="$2"

  [ -f "$UBER" ] || { echo "[ERR] uber-apk-signer.jar non trovato: $UBER"; exit 1; }

  if [ ! -f "$KS" ]; then
    echo "[*] Creo keystore di debug: $KS"
    "$KEYTOOL" -genkeypair -v -keystore "$KS" -alias "$ALIAS" -keyalg RSA -keysize 2048 \
      -validity 10000 -storepass "$PW" -keypass "$PW" -dname "CN=Android Debug,O=Android,C=US"
  fi

  # uber fa zipalign (built-in) + firma. Scrive in una CARTELLA (--out), con suffisso
  # "-aligned-signed.apk"; lo si sposta poi sul nome di output voluto.
  # --allowResign: consente di ri-firmare un APK gia' firmato (utile in --signOnly).
  echo "[*] uber-apk-signer: zipalign (built-in) + firma v2+v3"
  local OUTDIR; OUTDIR="$(mktemp -d)"
  "$JAVA" -jar "$UBER" --apks "$IN" \
    --ks "$KS" --ksAlias "$ALIAS" --ksPass "$PW" --ksKeyPass "$PW" \
    --allowResign --out "$OUTDIR"

  local PRODUCED; PRODUCED="$(ls "$OUTDIR"/*.apk 2>/dev/null | head -1)"
  [ -n "$PRODUCED" ] || { echo "[ERR] uber-apk-signer non ha prodotto alcun apk in $OUTDIR"; rm -rf "$OUTDIR"; exit 1; }
  mv -f "$PRODUCED" "$OUT"
  rm -rf "$OUTDIR"
  echo "[OK] $OUT  (zipalign + firma v2+v3 via uber-apk-signer)"
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
echo "[FATTO] build + zipalign + firma (v2+v3, uber-apk-signer) completate -> $OUT"
