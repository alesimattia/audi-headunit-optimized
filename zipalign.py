#!/usr/bin/env python3
"""zipalign auto-contenuto (4 byte), senza Android SDK.

Riallinea a 4 byte l'offset dei dati di ogni voce dello ZIP/APK paddando il
campo 'extra' dell'header LOCALE. I contenuti (decompressi) restano identici.

Posizione nella pipeline: e' il FALLBACK di compile_sign_align.sh quando manca
lo zipalign dell'SDK. Va eseguito PRIMA di apksigner (firma v2): apksigner
preserva l'allineamento -> ordine corretto = zipalign -> firma v2.
NB: lo zipalign dell'SDK fa anche il page-align 4K delle .so (flag '-p'); questo
fallback fa SOLO l'allineamento a 4 byte, sufficiente per APK senza librerie
native (come questa app). Niente piu' a che vedere con la vecchia firma v1.

Uso:  python3 zipalign.py <input.apk> <output.apk>
Exit: 0 = allineato e verificato; 1 = errore/FAIL; 2 = uso errato.
"""
import zipfile, struct, sys, os

ALIGN = 4

def align(src, dst):
    with zipfile.ZipFile(src, "r") as zin, zipfile.ZipFile(dst, "w") as zout:
        for info in zin.infolist():
            data = zin.read(info.filename)            # bytes non compressi (identici)
            ni = zipfile.ZipInfo(info.filename, date_time=info.date_time)
            ni.compress_type = info.compress_type     # mantiene STORED/DEFLATED
            ni.external_attr = info.external_attr
            ni.internal_attr = info.internal_attr
            ni.create_system = info.create_system
            name_len = len(info.filename.encode("utf-8"))
            pos = zout.fp.tell()                      # inizio dell'header locale
            pad = (ALIGN - ((pos + 30 + name_len) % ALIGN)) % ALIGN
            ni.extra = b"\x00" * pad                  # padding -> data offset % 4 == 0
            zout.writestr(ni, data, compress_type=info.compress_type)

def verify(apk):
    """Controllo corretto: legge l'extra dell'header LOCALE (non quello centrale)."""
    stored = 0
    bad = 0
    with open(apk, "rb") as f, zipfile.ZipFile(apk, "r") as z:
        for info in z.infolist():
            f.seek(info.header_offset)
            lh = f.read(30)
            name_len, extra_len = struct.unpack("<HH", lh[26:30])
            data_off = info.header_offset + 30 + name_len + extra_len
            if info.compress_type == zipfile.ZIP_STORED:
                stored += 1
                if data_off % ALIGN:
                    bad += 1
    return stored, bad

def main(argv):
    if len(argv) != 3:
        print("Uso: python3 zipalign.py <input.apk> <output.apk>", file=sys.stderr)
        return 2
    src, dst = argv[1], argv[2]
    if not os.path.isfile(src):
        print(f"[ERR] input non trovato: {src}", file=sys.stderr)
        return 1
    if not zipfile.is_zipfile(src):
        print(f"[ERR] non e' uno ZIP/APK valido: {src}", file=sys.stderr)
        return 1
    align(src, dst)
    stored, bad = verify(dst)
    print(f"zipalign: {dst}")
    print(f"  voci STORED: {stored}, non allineate: {bad} -> {'OK' if bad == 0 else 'FAIL'}")
    return 0 if bad == 0 else 1

if __name__ == "__main__":
    sys.exit(main(sys.argv))
