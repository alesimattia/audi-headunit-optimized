#!/usr/bin/env bash
# sign_align.sh — Zipalign + firma di un APK (workflow per app NTG modificate con apktool).
#
# Uso:    ./sign_align.sh <input.apk> [output.apk]
# Tipico: apktool b progetto -o NTG_mod.apk && ./sign_align.sh NTG_mod.apk
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

IN="${1:?Uso: ./sign_align.sh <input.apk> [output.apk]}"
OUT="${2:-${IN%.apk}-aligned-signed.apk}"
KS="$HERE/debug.keystore"; ALIAS=androiddebugkey; PW=android

if [ ! -f "$KS" ]; then
  echo "[*] Creo keystore di debug: $KS"
  "$KEYTOOL" -genkeypair -v -keystore "$KS" -alias "$ALIAS" -keyalg RSA -keysize 2048 \
    -validity 10000 -storepass "$PW" -keypass "$PW" -dname "CN=Android Debug,O=Android,C=US"
fi

UBER="$HERE/uber-apk-signer.jar"
if [ -f "$UBER" ]; then
  echo "[*] uber-apk-signer: zipalign + firma v1/v2/v3"
  TMPD="$(mktemp -d)"
  "$JAVA" -jar "$UBER" --apks "$IN" --ks "$KS" --ksAlias "$ALIAS" \
    --ksPass "$PW" --ksKeyPass "$PW" --out "$TMPD"
  mv "$TMPD"/*-aligned-signed.apk "$OUT"
  rm -rf "$TMPD"
  echo "[OK] $OUT  (allineato, v1/v2/v3)"
else
  echo "[*] fallback: jarsigner (v1) + zipalign.py"
  TMP="$(mktemp -u).apk"; cp "$IN" "$TMP"
  "$JARSIGNER" -keystore "$KS" -storepass "$PW" -keypass "$PW" \
    -sigalg SHA256withRSA -digestalg SHA-256 "$TMP" "$ALIAS"
  python3 "$HERE/zipalign.py" "$TMP" "$OUT"   # zipalign DOPO la firma v1 (ordine corretto)
  rm -f "$TMP"
  echo "[OK] $OUT  (allineato, v1)"
fi
