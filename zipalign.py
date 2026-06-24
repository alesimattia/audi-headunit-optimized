#!/usr/bin/env python3
"""zipalign auto-contenuto (4 byte), senza Android SDK.
Da eseguire DOPO la firma v1 (jarsigner): ripaddabilita solo il campo 'extra'
dell'header locale per allineare i dati di ogni voce; il contenuto NON cambia,
quindi la firma v1 (JAR) resta valida.  Per firma v2/v3 usare invece
uber-apk-signer (vedi compile_sign_align.sh).

Uso:  python3 zipalign.py <input.apk> <output.apk>
"""
import zipfile, struct, sys

ALIGN = 4

def align(src, dst):
    zin = zipfile.ZipFile(src, "r")
    with zipfile.ZipFile(dst, "w") as zout:
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
    zin.close()

def verify(apk):
    """Controllo corretto: legge l'extra dell'header LOCALE (non quello centrale)."""
    f = open(apk, "rb")
    z = zipfile.ZipFile(apk, "r")
    bad = 0
    stored = 0
    for info in z.infolist():
        f.seek(info.header_offset)
        lh = f.read(30)
        name_len, extra_len = struct.unpack("<HH", lh[26:30])
        data_off = info.header_offset + 30 + name_len + extra_len
        if info.compress_type == zipfile.ZIP_STORED:
            stored += 1
            if data_off % ALIGN:
                bad += 1
    f.close()
    return stored, bad

if __name__ == "__main__":
    src, dst = sys.argv[1], sys.argv[2]
    align(src, dst)
    stored, bad = verify(dst)
    print(f"zipalign: {dst}")
    print(f"  voci STORED: {stored}, non allineate: {bad} -> {'OK' if bad == 0 else 'FAIL'}")
