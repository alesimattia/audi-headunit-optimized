package com.tencent.taes.util;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Environment;
import android.text.format.Formatter;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class FileUtils {
    public static final String FILE_EXTENSION_SEPARATOR = ".";

    private FileUtils() {
        throw new AssertionError();
    }

    public static void saveObject(String path, Object saveObject) {
        FileOutputStream fos = null;
        ObjectOutputStream oos = null;
        File f = new File(path);
        try {
            try {
                fos = new FileOutputStream(f);
                oos = new ObjectOutputStream(fos);
                oos.writeObject(saveObject);
                oos.close();
                fos.close();
            } catch (IOException e) {
            }
        } catch (IOException e2) {
            if (oos != null) {
                oos.close();
            }
            if (fos != null) {
                fos.close();
            }
        } catch (Throwable th) {
            if (oos != null) {
                try {
                    oos.close();
                } catch (IOException e3) {
                    throw th;
                }
            }
            if (fos != null) {
                fos.close();
            }
            throw th;
        }
    }

    public static Object restoreObject(String path) {
        FileInputStream fis = null;
        ObjectInputStream ois = null;
        File f = new File(path);
        if (!f.exists()) {
            return null;
        }
        try {
            try {
                fis = new FileInputStream(f);
                ois = new ObjectInputStream(fis);
                Object object = ois.readObject();
                try {
                    ois.close();
                    fis.close();
                } catch (IOException e) {
                }
                return object;
            } catch (IOException | ClassNotFoundException | IllegalArgumentException e2) {
                Log.e("FileUtils", "restoreObject : " + e2.getMessage());
                if (ois != null) {
                    try {
                        ois.close();
                    } catch (IOException e3) {
                        return null;
                    }
                }
                if (fis != null) {
                    fis.close();
                }
                return null;
            }
        } catch (Throwable th) {
            if (ois != null) {
                try {
                    ois.close();
                } catch (IOException e4) {
                    throw th;
                }
            }
            if (fis != null) {
                fis.close();
            }
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x0062 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.StringBuilder readFile(java.lang.String r8, java.lang.String r9) throws java.io.IOException {
        /*
            java.io.File r0 = new java.io.File
            r0.<init>(r8)
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            java.lang.String r2 = ""
            r1.<init>(r2)
            boolean r2 = r0.isFile()
            r3 = 0
            if (r2 != 0) goto L14
            goto L70
        L14:
            r2 = r3
            java.io.InputStreamReader r4 = new java.io.InputStreamReader     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            java.io.FileInputStream r5 = new java.io.FileInputStream     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            r5.<init>(r0)     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            r4.<init>(r5, r9)     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            java.io.BufferedReader r5 = new java.io.BufferedReader     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            r5.<init>(r4)     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            r2 = r5
        L26:
            java.lang.String r5 = r2.readLine()     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            r3 = r5
            if (r5 == 0) goto L42
            java.lang.String r5 = r1.toString()     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            java.lang.String r6 = ""
            boolean r5 = r5.equals(r6)     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            if (r5 != 0) goto L3e
            java.lang.String r5 = "\r\n"
            r1.append(r5)     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
        L3e:
            r1.append(r3)     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            goto L26
        L42:
            r2.close()     // Catch: java.lang.Throwable -> L55 java.io.IOException -> L57
            r2.close()     // Catch: java.io.IOException -> L4b
            goto L54
        L4b:
            r5 = move-exception
            java.lang.RuntimeException r6 = new java.lang.RuntimeException
            java.lang.String r7 = "IOException occurred. "
            r6.<init>(r7, r5)
            throw r6
        L54:
            return r1
        L55:
            r3 = move-exception
            goto L60
        L57:
            r3 = move-exception
            java.lang.RuntimeException r4 = new java.lang.RuntimeException     // Catch: java.lang.Throwable -> L55
            java.lang.String r5 = "IOException occurred. "
            r4.<init>(r5, r3)     // Catch: java.lang.Throwable -> L55
            throw r4     // Catch: java.lang.Throwable -> L55
        L60:
            if (r2 == 0) goto L6f
            r2.close()     // Catch: java.io.IOException -> L66
            goto L6f
        L66:
            r3 = move-exception
            java.lang.RuntimeException r4 = new java.lang.RuntimeException
            java.lang.String r5 = "IOException occurred. "
            r4.<init>(r5, r3)
            throw r4
        L6f:
            throw r3
        L70:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.taes.util.FileUtils.readFile(java.lang.String, java.lang.String):java.lang.StringBuilder");
    }

    public static boolean writeFile(String filePath, String content, boolean append) throws IOException {
        if (StringUtils.isEmpty(content)) {
            return false;
        }
        FileWriter fileWriter = null;
        try {
            try {
                makeDirs(filePath);
                fileWriter = new FileWriter(filePath, append);
                fileWriter.write(content);
                fileWriter.close();
                try {
                    fileWriter.close();
                    return true;
                } catch (IOException e) {
                    throw new RuntimeException("IOException occurred. ", e);
                }
            } catch (IOException e2) {
                throw new RuntimeException("IOException occurred. ", e2);
            }
        } catch (Throwable e3) {
            if (fileWriter != null) {
                try {
                    fileWriter.close();
                } catch (IOException e4) {
                    throw new RuntimeException("IOException occurred. ", e4);
                }
            }
            throw e3;
        }
    }

    public static boolean writeFile(String filePath, List<String> contentList, boolean append) throws IOException {
        if (ListUtils.isEmpty(contentList)) {
            return false;
        }
        FileWriter fileWriter = null;
        try {
            try {
                makeDirs(filePath);
                fileWriter = new FileWriter(filePath, append);
                int i = 0;
                for (String line : contentList) {
                    int i2 = i + 1;
                    if (i > 0) {
                        fileWriter.write("\r\n");
                    }
                    fileWriter.write(line);
                    i = i2;
                }
                fileWriter.close();
                try {
                    fileWriter.close();
                    return true;
                } catch (IOException e) {
                    throw new RuntimeException("IOException occurred. ", e);
                }
            } catch (IOException e2) {
                throw new RuntimeException("IOException occurred. ", e2);
            }
        } catch (Throwable e3) {
            if (fileWriter != null) {
                try {
                    fileWriter.close();
                } catch (IOException e4) {
                    throw new RuntimeException("IOException occurred. ", e4);
                }
            }
            throw e3;
        }
    }

    public static boolean writeFile(String filePath, String content) {
        return writeFile(filePath, content, false);
    }

    public static boolean writeFile(String filePath, List<String> contentList) {
        return writeFile(filePath, contentList, false);
    }

    public static boolean writeFile(String filePath, InputStream stream) {
        return writeFile(filePath, stream, false);
    }

    public static boolean writeFile(String filePath, InputStream stream, boolean append) {
        return writeFile(filePath != null ? new File(filePath) : null, stream, append);
    }

    public static boolean writeFile(File file, InputStream stream) {
        return writeFile(file, stream, false);
    }

    public static boolean writeFile(File file, InputStream stream, boolean append) throws IOException {
        if (file == null) {
            return false;
        }
        OutputStream o = null;
        try {
            try {
                makeDirs(file.getAbsolutePath());
                o = new FileOutputStream(file, append);
                byte[] data = new byte[1024];
                while (true) {
                    int length = stream.read(data);
                    if (length != -1) {
                        o.write(data, 0, length);
                    } else {
                        o.flush();
                        try {
                            o.close();
                            stream.close();
                            return true;
                        } catch (IOException e) {
                            throw new RuntimeException("IOException occurred. ", e);
                        }
                    }
                }
            } catch (Throwable e2) {
                if (o != null) {
                    try {
                        o.close();
                        stream.close();
                    } catch (IOException e3) {
                        throw new RuntimeException("IOException occurred. ", e3);
                    }
                }
                throw e2;
            }
        } catch (FileNotFoundException e4) {
            throw new RuntimeException("FileNotFoundException occurred. ", e4);
        } catch (IOException e5) {
            throw new RuntimeException("IOException occurred. ", e5);
        }
    }

    public static void copyFile(File src, File dst) {
        try {
            FileInputStream in = new FileInputStream(src);
            FileOutputStream out = new FileOutputStream(dst);
            byte[] buffer = new byte[2048];
            while (true) {
                int len = in.read(buffer);
                if (len > 0) {
                    out.write(buffer, 0, len);
                } else {
                    in.close();
                    out.close();
                    return;
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }

    public static boolean copyFile(String sourceFilePath, String destFilePath) {
        try {
            InputStream inputStream = new FileInputStream(sourceFilePath);
            return writeFile(destFilePath, inputStream);
        } catch (FileNotFoundException e) {
            throw new RuntimeException("FileNotFoundException occurred. ", e);
        }
    }

    public static List<String> readFileToList(String filePath, String charsetName) throws IOException {
        File file = new File(filePath);
        List<String> fileContent = new ArrayList<>();
        if (!file.isFile()) {
            return null;
        }
        BufferedReader reader = null;
        try {
            try {
                InputStreamReader is = new InputStreamReader(new FileInputStream(file), charsetName);
                reader = new BufferedReader(is);
                while (true) {
                    String line = reader.readLine();
                    if (line != null) {
                        fileContent.add(line);
                    } else {
                        reader.close();
                        try {
                            reader.close();
                            return fileContent;
                        } catch (IOException e) {
                            throw new RuntimeException("IOException occurred. ", e);
                        }
                    }
                }
            } catch (Throwable e2) {
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (IOException e3) {
                        throw new RuntimeException("IOException occurred. ", e3);
                    }
                }
                throw e2;
            }
        } catch (IOException e4) {
            throw new RuntimeException("IOException occurred. ", e4);
        }
    }

    public static String getFileName(String filePath) {
        if (StringUtils.isEmpty(filePath)) {
            return filePath;
        }
        int filePosi = filePath.lastIndexOf(File.separator);
        return filePosi == -1 ? filePath : filePath.substring(filePosi + 1);
    }

    public static String getFolderName(String filePath) {
        if (StringUtils.isEmpty(filePath)) {
            return filePath;
        }
        int filePosi = filePath.lastIndexOf(File.separator);
        return filePosi == -1 ? "" : filePath.substring(0, filePosi);
    }

    public static String getFileExtension(String filePath) {
        if (StringUtils.isBlank(filePath)) {
            return filePath;
        }
        int extenPosi = filePath.lastIndexOf(FILE_EXTENSION_SEPARATOR);
        int filePosi = filePath.lastIndexOf(File.separator);
        return (extenPosi != -1 && filePosi < extenPosi) ? filePath.substring(extenPosi + 1) : "";
    }

    public static boolean makeDirs(String filePath) {
        String folderName = getFolderName(filePath);
        if (StringUtils.isEmpty(folderName)) {
            return false;
        }
        File folder = new File(folderName);
        if (folder.exists() && folder.isDirectory()) {
            return true;
        }
        return folder.mkdirs();
    }

    public static boolean makeFolders(String filePath) {
        return makeDirs(filePath);
    }

    public static boolean isFileExist(String filePath) {
        if (StringUtils.isBlank(filePath)) {
            return false;
        }
        File file = new File(filePath);
        return file.exists() && file.isFile();
    }

    public static boolean isFolderExist(String directoryPath) {
        if (StringUtils.isBlank(directoryPath)) {
            return false;
        }
        File dire = new File(directoryPath);
        return dire.exists() && dire.isDirectory();
    }

    public static boolean deleteFile(String path) {
        if (StringUtils.isBlank(path)) {
            return true;
        }
        File file = new File(path);
        if (!file.exists()) {
            return true;
        }
        if (file.isFile()) {
            return file.delete();
        }
        if (!file.isDirectory()) {
            return false;
        }
        for (File f : file.listFiles()) {
            if (f.isFile()) {
                f.delete();
            } else if (f.isDirectory()) {
                deleteFile(f.getAbsolutePath());
            }
        }
        return file.delete();
    }

    public static void deleteFile(File file) {
        if (file.exists()) {
            if (file.isDirectory()) {
                File[] files = file.listFiles();
                for (File file2 : files) {
                    deleteFile(file2);
                }
                return;
            }
            file.delete();
        }
    }

    public static boolean hasSDCard() {
        return "mounted".equals(Environment.getExternalStorageState());
    }

    public static File sdcard() {
        return Environment.getExternalStorageDirectory();
    }

    public static File createFile(File dir, String name) {
        File file = new File(dir, name);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return file;
    }

    public static long getFileSize(String path) {
        if (StringUtils.isBlank(path)) {
            return -1L;
        }
        File file = new File(path);
        if (file.exists() && file.isFile()) {
            return file.length();
        }
        return -1L;
    }

    public static String formateFileSize(Context context, long size) {
        return Formatter.formatFileSize(context, size);
    }

    public static boolean isVideoFile(String path) {
        String pathLowerCase = path.toLowerCase();
        return pathLowerCase.endsWith(".mp4") || pathLowerCase.endsWith(".3gp") || pathLowerCase.endsWith(".mkv") || pathLowerCase.endsWith(".avi") || pathLowerCase.endsWith(".mpeg") || pathLowerCase.endsWith(".rmvb") || pathLowerCase.endsWith(".mov");
    }

    public static boolean isTheSameFile(String path, int length) {
        File file = new File(path);
        if (file.exists() && file.length() == length) {
            return true;
        }
        return false;
    }

    private static void moveFile(File src, File des) {
        FileInputStream in = null;
        FileOutputStream stream = null;
        try {
            try {
                try {
                    try {
                        in = new FileInputStream(src);
                        stream = new FileOutputStream(des);
                        byte[] buffer = new byte[2048];
                        while (true) {
                            int size = in.read(buffer);
                            if (size <= 0) {
                                src.delete();
                                in.close();
                                stream.close();
                                return;
                            }
                            stream.write(buffer, 0, size);
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } catch (FileNotFoundException e2) {
                    e2.printStackTrace();
                    if (in != null) {
                        in.close();
                    }
                    if (stream != null) {
                        stream.close();
                    }
                }
            } catch (IOException e3) {
                e3.printStackTrace();
                if (in != null) {
                    in.close();
                }
                if (stream != null) {
                    stream.close();
                }
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    in.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                    throw th;
                }
            }
            if (0 != 0) {
                stream.close();
            }
            throw th;
        }
    }

    public static String readInputStream(InputStream is) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            while (true) {
                int len = is.read(buffer);
                if (len != -1) {
                    baos.write(buffer, 0, len);
                } else {
                    is.close();
                    baos.close();
                    byte[] result = baos.toByteArray();
                    return new String(result);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static byte[] readInputStreamBytes(InputStream is) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            while (true) {
                int len = is.read(buffer);
                if (len != -1) {
                    baos.write(buffer, 0, len);
                } else {
                    is.close();
                    baos.close();
                    byte[] result = baos.toByteArray();
                    return result;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Uri copyAssetsUri(Context context, String assetFileName) {
        File file = new File(context.getApplicationContext().getExternalCacheDir().getAbsolutePath() + File.separator + assetFileName);
        if (file.exists()) {
            return Uri.fromFile(file);
        }
        BufferedOutputStream bos = null;
        BufferedInputStream bis = null;
        try {
            file.createNewFile();
            bos = new BufferedOutputStream(new FileOutputStream(file));
            bis = new BufferedInputStream(context.getAssets().open(assetFileName));
            byte[] buf = new byte[2048];
            while (true) {
                int readSize = bis.read(buf);
                if (-1 == readSize) {
                    break;
                }
                bos.write(buf, 0, readSize);
            }
            bos.flush();
            Uri uriFromFile = Uri.fromFile(file);
            try {
                bos.close();
            } catch (IOException e) {
            }
            try {
                bis.close();
            } catch (IOException e2) {
            }
            return uriFromFile;
        } catch (Exception e3) {
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e4) {
                }
            }
            if (bis != null) {
                try {
                    bis.close();
                } catch (IOException e5) {
                }
            }
            return null;
        } catch (Throwable th) {
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e6) {
                }
            }
            if (bis != null) {
                try {
                    bis.close();
                    throw th;
                } catch (IOException e7) {
                    throw th;
                }
            }
            throw th;
        }
    }

    public static String readAssets(Context context, String fileName) throws Exception {
        StringBuffer sb = new StringBuffer();
        InputStream in = context.getResources().getAssets().open(fileName);
        BufferedReader br = new BufferedReader(new InputStreamReader(in, "utf8"));
        while (true) {
            String line = br.readLine();
            if (line != null) {
                sb.append(line + "\n");
            } else {
                in.close();
                br.close();
                return sb.toString();
            }
        }
    }

    public static Bitmap getImageFromAssetsFile(Context context, String fileName) {
        Bitmap image = null;
        AssetManager am = context.getResources().getAssets();
        try {
            InputStream is = am.open(fileName);
            image = BitmapFactory.decodeStream(is);
            is.close();
            return image;
        } catch (IOException e) {
            e.printStackTrace();
            return image;
        }
    }

    public static boolean saveImageFile(Bitmap bitmap, File file) {
        if (bitmap == null || file == null) {
            return false;
        }
        try {
            if (file.exists()) {
                file.delete();
            }
            file.createNewFile();
            FileOutputStream output = new FileOutputStream(file);
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, output);
            output.flush();
            output.close();
            return true;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e2) {
            e2.printStackTrace();
            return false;
        }
    }
}
