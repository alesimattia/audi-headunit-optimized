package androidx.core.graphics;

import android.content.Context;
import android.content.res.Resources;
import android.os.Process;
import android.util.Log;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.annotation.RestrictTo;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
public class TypefaceCompatUtil {
    private static final String CACHE_FILE_PREFIX = ".font";
    private static final String TAG = "TypefaceCompatUtil";

    private TypefaceCompatUtil() {
    }

    @Nullable
    public static File getTempFile(Context context) {
        String prefix = CACHE_FILE_PREFIX + Process.myPid() + "-" + Process.myTid() + "-";
        for (int i = 0; i < 100; i++) {
            File file = new File(context.getCacheDir(), prefix + i);
            if (file.createNewFile()) {
                return file;
            }
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002f A[Catch: IOException -> 0x0033, TryCatch #3 {IOException -> 0x0033, blocks: (B:3:0x0001, B:5:0x0017, B:14:0x0026, B:19:0x0032, B:18:0x002f, B:17:0x002b), top: B:26:0x0001, inners: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0026 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @androidx.annotation.Nullable
    @androidx.annotation.RequiresApi(19)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.nio.ByteBuffer mmap(java.io.File r10) throws java.lang.Throwable {
        /*
            r0 = 0
            java.io.FileInputStream r1 = new java.io.FileInputStream     // Catch: java.io.IOException -> L33
            r1.<init>(r10)     // Catch: java.io.IOException -> L33
            java.nio.channels.FileChannel r2 = r1.getChannel()     // Catch: java.lang.Throwable -> L1b java.lang.Throwable -> L1e
            long r7 = r2.size()     // Catch: java.lang.Throwable -> L1b java.lang.Throwable -> L1e
            java.nio.channels.FileChannel$MapMode r4 = java.nio.channels.FileChannel.MapMode.READ_ONLY     // Catch: java.lang.Throwable -> L1b java.lang.Throwable -> L1e
            r5 = 0
            r3 = r2
            java.nio.MappedByteBuffer r3 = r3.map(r4, r5, r7)     // Catch: java.lang.Throwable -> L1b java.lang.Throwable -> L1e
            r1.close()     // Catch: java.io.IOException -> L33
            return r3
        L1b:
            r2 = move-exception
            r3 = r0
            goto L24
        L1e:
            r2 = move-exception
            throw r2     // Catch: java.lang.Throwable -> L20
        L20:
            r3 = move-exception
            r9 = r3
            r3 = r2
            r2 = r9
        L24:
            if (r3 == 0) goto L2f
            r1.close()     // Catch: java.lang.Throwable -> L2a java.io.IOException -> L33
            goto L32
        L2a:
            r4 = move-exception
            r3.addSuppressed(r4)     // Catch: java.io.IOException -> L33
            goto L32
        L2f:
            r1.close()     // Catch: java.io.IOException -> L33
        L32:
            throw r2     // Catch: java.io.IOException -> L33
        L33:
            r1 = move-exception
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.core.graphics.TypefaceCompatUtil.mmap(java.io.File):java.nio.ByteBuffer");
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x004b A[Catch: all -> 0x004f, Throwable -> 0x0052, TryCatch #5 {Throwable -> 0x0052, blocks: (B:8:0x0014, B:10:0x002e, B:26:0x004e, B:25:0x004b, B:24:0x0047), top: B:48:0x0014 }] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0042 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:57:? A[Catch: IOException -> 0x0069, SYNTHETIC, TRY_LEAVE, TryCatch #0 {IOException -> 0x0069, blocks: (B:3:0x0005, B:6:0x0010, B:12:0x0033, B:35:0x005c, B:39:0x0065, B:38:0x0061, B:40:0x0068), top: B:43:0x0005, inners: #3 }] */
    @androidx.annotation.Nullable
    @androidx.annotation.RequiresApi(19)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.nio.ByteBuffer mmap(android.content.Context r12, android.os.CancellationSignal r13, android.net.Uri r14) throws java.lang.Throwable {
        /*
            android.content.ContentResolver r0 = r12.getContentResolver()
            r1 = 0
            java.lang.String r2 = "r"
            android.os.ParcelFileDescriptor r2 = r0.openFileDescriptor(r14, r2, r13)     // Catch: java.io.IOException -> L69
            if (r2 != 0) goto L14
        Le:
            if (r2 == 0) goto L13
            r2.close()     // Catch: java.io.IOException -> L69
        L13:
            return r1
        L14:
            java.io.FileInputStream r3 = new java.io.FileInputStream     // Catch: java.lang.Throwable -> L4f java.lang.Throwable -> L52
            java.io.FileDescriptor r4 = r2.getFileDescriptor()     // Catch: java.lang.Throwable -> L4f java.lang.Throwable -> L52
            r3.<init>(r4)     // Catch: java.lang.Throwable -> L4f java.lang.Throwable -> L52
            java.nio.channels.FileChannel r4 = r3.getChannel()     // Catch: java.lang.Throwable -> L37 java.lang.Throwable -> L3a
            long r9 = r4.size()     // Catch: java.lang.Throwable -> L37 java.lang.Throwable -> L3a
            java.nio.channels.FileChannel$MapMode r6 = java.nio.channels.FileChannel.MapMode.READ_ONLY     // Catch: java.lang.Throwable -> L37 java.lang.Throwable -> L3a
            r7 = 0
            r5 = r4
            java.nio.MappedByteBuffer r5 = r5.map(r6, r7, r9)     // Catch: java.lang.Throwable -> L37 java.lang.Throwable -> L3a
            r3.close()     // Catch: java.lang.Throwable -> L4f java.lang.Throwable -> L52
            if (r2 == 0) goto L36
            r2.close()     // Catch: java.io.IOException -> L69
        L36:
            return r5
        L37:
            r4 = move-exception
            r5 = r1
            goto L40
        L3a:
            r4 = move-exception
            throw r4     // Catch: java.lang.Throwable -> L3c
        L3c:
            r5 = move-exception
            r11 = r5
            r5 = r4
            r4 = r11
        L40:
            if (r5 == 0) goto L4b
            r3.close()     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L4f
            goto L4e
        L46:
            r6 = move-exception
            r5.addSuppressed(r6)     // Catch: java.lang.Throwable -> L4f java.lang.Throwable -> L52
            goto L4e
        L4b:
            r3.close()     // Catch: java.lang.Throwable -> L4f java.lang.Throwable -> L52
        L4e:
            throw r4     // Catch: java.lang.Throwable -> L4f java.lang.Throwable -> L52
        L4f:
            r3 = move-exception
            r4 = r1
            goto L58
        L52:
            r3 = move-exception
            throw r3     // Catch: java.lang.Throwable -> L54
        L54:
            r4 = move-exception
            r11 = r4
            r4 = r3
            r3 = r11
        L58:
            if (r2 == 0) goto L68
            if (r4 == 0) goto L65
            r2.close()     // Catch: java.lang.Throwable -> L60 java.io.IOException -> L69
            goto L68
        L60:
            r5 = move-exception
            r4.addSuppressed(r5)     // Catch: java.io.IOException -> L69
            goto L68
        L65:
            r2.close()     // Catch: java.io.IOException -> L69
        L68:
            throw r3     // Catch: java.io.IOException -> L69
        L69:
            r2 = move-exception
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.core.graphics.TypefaceCompatUtil.mmap(android.content.Context, android.os.CancellationSignal, android.net.Uri):java.nio.ByteBuffer");
    }

    @Nullable
    @RequiresApi(19)
    public static ByteBuffer copyToDirectBuffer(Context context, Resources res, int id) {
        File tmpFile = getTempFile(context);
        ByteBuffer byteBufferMmap = null;
        if (tmpFile == null) {
            return null;
        }
        try {
            if (copyToFile(tmpFile, res, id)) {
                byteBufferMmap = mmap(tmpFile);
            }
            return byteBufferMmap;
        } finally {
            tmpFile.delete();
        }
    }

    public static boolean copyToFile(File file, InputStream is) {
        FileOutputStream os = null;
        boolean z = false;
        try {
            try {
                os = new FileOutputStream(file, false);
                byte[] buffer = new byte[1024];
                while (true) {
                    int readLen = is.read(buffer);
                    if (readLen == -1) {
                        break;
                    }
                    os.write(buffer, 0, readLen);
                }
                z = true;
            } catch (IOException e) {
                Log.e(TAG, "Error copying resource contents to temp file: " + e.getMessage());
            }
            return z;
        } finally {
            closeQuietly(os);
        }
    }

    public static boolean copyToFile(File file, Resources res, int id) {
        InputStream is = null;
        try {
            is = res.openRawResource(id);
            return copyToFile(file, is);
        } finally {
            closeQuietly(is);
        }
    }

    public static void closeQuietly(Closeable c) {
        if (c != null) {
            try {
                c.close();
            } catch (IOException e) {
            }
        }
    }
}
