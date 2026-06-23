package androidx.print;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.pdf.PdfDocument;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.print.PageRange;
import android.print.PrintAttributes;
import android.print.PrintDocumentAdapter;
import android.print.PrintDocumentInfo;
import android.print.PrintManager;
import android.print.pdf.PrintedPdfDocument;
import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: loaded from: classes.dex */
public final class PrintHelper {
    public static final int COLOR_MODE_COLOR = 2;
    public static final int COLOR_MODE_MONOCHROME = 1;
    private static final boolean IS_MIN_MARGINS_HANDLING_CORRECT;
    private static final String LOG_TAG = "PrintHelper";
    private static final int MAX_PRINT_SIZE = 3500;
    public static final int ORIENTATION_LANDSCAPE = 1;
    public static final int ORIENTATION_PORTRAIT = 2;
    private static final boolean PRINT_ACTIVITY_RESPECTS_ORIENTATION;
    public static final int SCALE_MODE_FILL = 2;
    public static final int SCALE_MODE_FIT = 1;
    private final Context mContext;
    BitmapFactory.Options mDecodeOptions = null;
    private final Object mLock = new Object();
    int mScaleMode = 2;
    int mColorMode = 2;
    int mOrientation = 1;

    public interface OnPrintFinishCallback {
        void onFinish();
    }

    static {
        PRINT_ACTIVITY_RESPECTS_ORIENTATION = Build.VERSION.SDK_INT < 20 || Build.VERSION.SDK_INT > 23;
        IS_MIN_MARGINS_HANDLING_CORRECT = Build.VERSION.SDK_INT != 23;
    }

    public static boolean systemSupportsPrint() {
        return Build.VERSION.SDK_INT >= 19;
    }

    public PrintHelper(@NonNull Context context) {
        this.mContext = context;
    }

    public void setScaleMode(int scaleMode) {
        this.mScaleMode = scaleMode;
    }

    public int getScaleMode() {
        return this.mScaleMode;
    }

    public void setColorMode(int colorMode) {
        this.mColorMode = colorMode;
    }

    public int getColorMode() {
        return this.mColorMode;
    }

    public void setOrientation(int orientation) {
        this.mOrientation = orientation;
    }

    public int getOrientation() {
        if (Build.VERSION.SDK_INT >= 19 && this.mOrientation == 0) {
            return 1;
        }
        return this.mOrientation;
    }

    public void printBitmap(@NonNull String jobName, @NonNull Bitmap bitmap) {
        printBitmap(jobName, bitmap, (OnPrintFinishCallback) null);
    }

    public void printBitmap(@NonNull String jobName, @NonNull Bitmap bitmap, @Nullable OnPrintFinishCallback callback) {
        PrintAttributes.MediaSize mediaSize;
        if (Build.VERSION.SDK_INT < 19 || bitmap == null) {
            return;
        }
        PrintManager printManager = (PrintManager) this.mContext.getSystemService("print");
        if (isPortrait(bitmap)) {
            mediaSize = PrintAttributes.MediaSize.UNKNOWN_PORTRAIT;
        } else {
            mediaSize = PrintAttributes.MediaSize.UNKNOWN_LANDSCAPE;
        }
        PrintAttributes attr = new PrintAttributes.Builder().setMediaSize(mediaSize).setColorMode(this.mColorMode).build();
        printManager.print(jobName, new PrintBitmapAdapter(jobName, this.mScaleMode, bitmap, callback), attr);
    }

    @RequiresApi(19)
    private class PrintBitmapAdapter extends PrintDocumentAdapter {
        private PrintAttributes mAttributes;
        private final Bitmap mBitmap;
        private final OnPrintFinishCallback mCallback;
        private final int mFittingMode;
        private final String mJobName;

        PrintBitmapAdapter(String jobName, int fittingMode, Bitmap bitmap, OnPrintFinishCallback callback) {
            this.mJobName = jobName;
            this.mFittingMode = fittingMode;
            this.mBitmap = bitmap;
            this.mCallback = callback;
        }

        @Override // android.print.PrintDocumentAdapter
        public void onLayout(PrintAttributes oldPrintAttributes, PrintAttributes newPrintAttributes, CancellationSignal cancellationSignal, PrintDocumentAdapter.LayoutResultCallback layoutResultCallback, Bundle bundle) {
            this.mAttributes = newPrintAttributes;
            PrintDocumentInfo info = new PrintDocumentInfo.Builder(this.mJobName).setContentType(1).setPageCount(1).build();
            boolean changed = true ^ newPrintAttributes.equals(oldPrintAttributes);
            layoutResultCallback.onLayoutFinished(info, changed);
        }

        @Override // android.print.PrintDocumentAdapter
        public void onWrite(PageRange[] pageRanges, ParcelFileDescriptor fileDescriptor, CancellationSignal cancellationSignal, PrintDocumentAdapter.WriteResultCallback writeResultCallback) {
            PrintHelper.this.writeBitmap(this.mAttributes, this.mFittingMode, this.mBitmap, fileDescriptor, cancellationSignal, writeResultCallback);
        }

        @Override // android.print.PrintDocumentAdapter
        public void onFinish() {
            if (this.mCallback != null) {
                this.mCallback.onFinish();
            }
        }
    }

    public void printBitmap(@NonNull String jobName, @NonNull Uri imageFile) throws FileNotFoundException {
        printBitmap(jobName, imageFile, (OnPrintFinishCallback) null);
    }

    public void printBitmap(@NonNull String jobName, @NonNull Uri imageFile, @Nullable OnPrintFinishCallback callback) throws FileNotFoundException {
        if (Build.VERSION.SDK_INT < 19) {
            return;
        }
        PrintDocumentAdapter printDocumentAdapter = new PrintUriAdapter(jobName, imageFile, callback, this.mScaleMode);
        PrintManager printManager = (PrintManager) this.mContext.getSystemService("print");
        PrintAttributes.Builder builder = new PrintAttributes.Builder();
        builder.setColorMode(this.mColorMode);
        if (this.mOrientation == 1 || this.mOrientation == 0) {
            builder.setMediaSize(PrintAttributes.MediaSize.UNKNOWN_LANDSCAPE);
        } else if (this.mOrientation == 2) {
            builder.setMediaSize(PrintAttributes.MediaSize.UNKNOWN_PORTRAIT);
        }
        PrintAttributes attr = builder.build();
        printManager.print(jobName, printDocumentAdapter, attr);
    }

    @RequiresApi(19)
    private class PrintUriAdapter extends PrintDocumentAdapter {
        private PrintAttributes mAttributes;
        Bitmap mBitmap = null;
        private final OnPrintFinishCallback mCallback;
        private final int mFittingMode;
        private final Uri mImageFile;
        private final String mJobName;
        AsyncTask<Uri, Boolean, Bitmap> mLoadBitmap;

        PrintUriAdapter(String jobName, Uri imageFile, OnPrintFinishCallback callback, int fittingMode) {
            this.mJobName = jobName;
            this.mImageFile = imageFile;
            this.mCallback = callback;
            this.mFittingMode = fittingMode;
        }

        /* JADX WARN: Type inference failed for: r0v3, types: [androidx.print.PrintHelper$PrintUriAdapter$1] */
        @Override // android.print.PrintDocumentAdapter
        public void onLayout(final PrintAttributes oldPrintAttributes, final PrintAttributes newPrintAttributes, final CancellationSignal cancellationSignal, final PrintDocumentAdapter.LayoutResultCallback layoutResultCallback, Bundle bundle) {
            synchronized (this) {
                this.mAttributes = newPrintAttributes;
            }
            if (cancellationSignal.isCanceled()) {
                layoutResultCallback.onLayoutCancelled();
            } else {
                if (this.mBitmap != null) {
                    PrintDocumentInfo info = new PrintDocumentInfo.Builder(this.mJobName).setContentType(1).setPageCount(1).build();
                    boolean changed = true ^ newPrintAttributes.equals(oldPrintAttributes);
                    layoutResultCallback.onLayoutFinished(info, changed);
                    return;
                }
                this.mLoadBitmap = new AsyncTask<Uri, Boolean, Bitmap>() { // from class: androidx.print.PrintHelper.PrintUriAdapter.1
                    @Override // android.os.AsyncTask
                    protected void onPreExecute() {
                        cancellationSignal.setOnCancelListener(new CancellationSignal.OnCancelListener() { // from class: androidx.print.PrintHelper.PrintUriAdapter.1.1
                            @Override // android.os.CancellationSignal.OnCancelListener
                            public void onCancel() {
                                PrintUriAdapter.this.cancelLoad();
                                cancel(false);
                            }
                        });
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // android.os.AsyncTask
                    public Bitmap doInBackground(Uri... uris) {
                        try {
                            return PrintHelper.this.loadConstrainedBitmap(PrintUriAdapter.this.mImageFile);
                        } catch (FileNotFoundException e) {
                            return null;
                        }
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
                        jadx.core.utils.exceptions.JadxRuntimeException: Can't find top splitter block for handler:B:17:0x004d
                        	at jadx.core.utils.BlockUtils.getTopSplitterForHandler(BlockUtils.java:1182)
                        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.collectHandlerRegions(ExcHandlersRegionMaker.java:53)
                        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.process(ExcHandlersRegionMaker.java:38)
                        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:27)
                        */
                    @Override // android.os.AsyncTask
                    public void onPostExecute(android.graphics.Bitmap r12) throws java.lang.Throwable {
                        /*
                            r11 = this;
                            super.onPostExecute(r12)
                            r0 = 0
                            if (r12 == 0) goto L50
                            boolean r1 = androidx.print.PrintHelper.access$400()
                            if (r1 == 0) goto L14
                            androidx.print.PrintHelper$PrintUriAdapter r1 = androidx.print.PrintHelper.PrintUriAdapter.this
                            androidx.print.PrintHelper r1 = androidx.print.PrintHelper.this
                            int r1 = r1.mOrientation
                            if (r1 != 0) goto L50
                        L14:
                            monitor-enter(r11)
                            androidx.print.PrintHelper$PrintUriAdapter r1 = androidx.print.PrintHelper.PrintUriAdapter.this     // Catch: java.lang.Throwable -> L4d
                            android.print.PrintAttributes r1 = androidx.print.PrintHelper.PrintUriAdapter.access$500(r1)     // Catch: java.lang.Throwable -> L4d
                            android.print.PrintAttributes$MediaSize r1 = r1.getMediaSize()     // Catch: java.lang.Throwable -> L4d
                            monitor-exit(r11)     // Catch: java.lang.Throwable -> L48
                            if (r1 == 0) goto L50
                            boolean r2 = r1.isPortrait()
                            boolean r3 = androidx.print.PrintHelper.access$600(r12)
                            if (r2 == r3) goto L50
                            android.graphics.Matrix r2 = new android.graphics.Matrix
                            r2.<init>()
                            r3 = 1119092736(0x42b40000, float:90.0)
                            r2.postRotate(r3)
                            r4 = 0
                            r5 = 0
                            int r6 = r12.getWidth()
                            int r7 = r12.getHeight()
                            r9 = 1
                            r3 = r12
                            r8 = r2
                            android.graphics.Bitmap r12 = android.graphics.Bitmap.createBitmap(r3, r4, r5, r6, r7, r8, r9)
                            goto L50
                        L48:
                            r0 = move-exception
                            r10 = r1
                            r1 = r0
                            r0 = r10
                            goto L4e
                        L4d:
                            r1 = move-exception
                        L4e:
                            monitor-exit(r11)     // Catch: java.lang.Throwable -> L4d
                            throw r1
                        L50:
                            androidx.print.PrintHelper$PrintUriAdapter r1 = androidx.print.PrintHelper.PrintUriAdapter.this
                            r1.mBitmap = r12
                            if (r12 == 0) goto L7d
                            android.print.PrintDocumentInfo$Builder r1 = new android.print.PrintDocumentInfo$Builder
                            androidx.print.PrintHelper$PrintUriAdapter r2 = androidx.print.PrintHelper.PrintUriAdapter.this
                            java.lang.String r2 = androidx.print.PrintHelper.PrintUriAdapter.access$700(r2)
                            r1.<init>(r2)
                            r2 = 1
                            android.print.PrintDocumentInfo$Builder r1 = r1.setContentType(r2)
                            android.print.PrintDocumentInfo$Builder r1 = r1.setPageCount(r2)
                            android.print.PrintDocumentInfo r1 = r1.build()
                            android.print.PrintAttributes r3 = r3
                            android.print.PrintAttributes r4 = r4
                            boolean r3 = r3.equals(r4)
                            r2 = r2 ^ r3
                            android.print.PrintDocumentAdapter$LayoutResultCallback r3 = r5
                            r3.onLayoutFinished(r1, r2)
                            goto L82
                        L7d:
                            android.print.PrintDocumentAdapter$LayoutResultCallback r1 = r5
                            r1.onLayoutFailed(r0)
                        L82:
                            androidx.print.PrintHelper$PrintUriAdapter r1 = androidx.print.PrintHelper.PrintUriAdapter.this
                            r1.mLoadBitmap = r0
                            return
                        */
                        throw new UnsupportedOperationException("Method not decompiled: androidx.print.PrintHelper.PrintUriAdapter.AnonymousClass1.onPostExecute(android.graphics.Bitmap):void");
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // android.os.AsyncTask
                    public void onCancelled(Bitmap result) {
                        layoutResultCallback.onLayoutCancelled();
                        PrintUriAdapter.this.mLoadBitmap = null;
                    }
                }.execute(new Uri[0]);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void cancelLoad() {
            synchronized (PrintHelper.this.mLock) {
                if (PrintHelper.this.mDecodeOptions != null) {
                    PrintHelper.this.mDecodeOptions.requestCancelDecode();
                    PrintHelper.this.mDecodeOptions = null;
                }
            }
        }

        @Override // android.print.PrintDocumentAdapter
        public void onFinish() {
            super.onFinish();
            cancelLoad();
            if (this.mLoadBitmap != null) {
                this.mLoadBitmap.cancel(true);
            }
            if (this.mCallback != null) {
                this.mCallback.onFinish();
            }
            if (this.mBitmap != null) {
                this.mBitmap.recycle();
                this.mBitmap = null;
            }
        }

        @Override // android.print.PrintDocumentAdapter
        public void onWrite(PageRange[] pageRanges, ParcelFileDescriptor fileDescriptor, CancellationSignal cancellationSignal, PrintDocumentAdapter.WriteResultCallback writeResultCallback) {
            PrintHelper.this.writeBitmap(this.mAttributes, this.mFittingMode, this.mBitmap, fileDescriptor, cancellationSignal, writeResultCallback);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isPortrait(Bitmap bitmap) {
        return bitmap.getWidth() <= bitmap.getHeight();
    }

    @RequiresApi(19)
    private static PrintAttributes.Builder copyAttributes(PrintAttributes other) {
        PrintAttributes.Builder b = new PrintAttributes.Builder().setMediaSize(other.getMediaSize()).setResolution(other.getResolution()).setMinMargins(other.getMinMargins());
        if (other.getColorMode() != 0) {
            b.setColorMode(other.getColorMode());
        }
        if (Build.VERSION.SDK_INT >= 23 && other.getDuplexMode() != 0) {
            b.setDuplexMode(other.getDuplexMode());
        }
        return b;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Matrix getMatrix(int imageWidth, int imageHeight, RectF content, int fittingMode) {
        float scale;
        Matrix matrix = new Matrix();
        float scale2 = content.width() / imageWidth;
        if (fittingMode == 2) {
            scale = Math.max(scale2, content.height() / imageHeight);
        } else {
            scale = Math.min(scale2, content.height() / imageHeight);
        }
        matrix.postScale(scale, scale);
        float translateX = (content.width() - (imageWidth * scale)) / 2.0f;
        float translateY = (content.height() - (imageHeight * scale)) / 2.0f;
        matrix.postTranslate(translateX, translateY);
        return matrix;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r0v5, types: [androidx.print.PrintHelper$1] */
    @RequiresApi(19)
    public void writeBitmap(final PrintAttributes attributes, final int fittingMode, final Bitmap bitmap, final ParcelFileDescriptor fileDescriptor, final CancellationSignal cancellationSignal, final PrintDocumentAdapter.WriteResultCallback writeResultCallback) {
        PrintAttributes printAttributesBuild;
        if (IS_MIN_MARGINS_HANDLING_CORRECT) {
            printAttributesBuild = attributes;
        } else {
            printAttributesBuild = copyAttributes(attributes).setMinMargins(new PrintAttributes.Margins(0, 0, 0, 0)).build();
        }
        final PrintAttributes pdfAttributes = printAttributesBuild;
        new AsyncTask<Void, Void, Throwable>() { // from class: androidx.print.PrintHelper.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Throwable doInBackground(Void... params) {
                RectF contentRect;
                try {
                    if (cancellationSignal.isCanceled()) {
                        return null;
                    }
                    PrintedPdfDocument pdfDocument = new PrintedPdfDocument(PrintHelper.this.mContext, pdfAttributes);
                    Bitmap maybeGrayscale = PrintHelper.convertBitmapForColorMode(bitmap, pdfAttributes.getColorMode());
                    if (cancellationSignal.isCanceled()) {
                        return null;
                    }
                    try {
                        PdfDocument.Page page = pdfDocument.startPage(1);
                        if (PrintHelper.IS_MIN_MARGINS_HANDLING_CORRECT) {
                            contentRect = new RectF(page.getInfo().getContentRect());
                        } else {
                            PrintedPdfDocument dummyDocument = new PrintedPdfDocument(PrintHelper.this.mContext, attributes);
                            PdfDocument.Page dummyPage = dummyDocument.startPage(1);
                            RectF contentRect2 = new RectF(dummyPage.getInfo().getContentRect());
                            dummyDocument.finishPage(dummyPage);
                            dummyDocument.close();
                            contentRect = contentRect2;
                        }
                        Matrix matrix = PrintHelper.getMatrix(maybeGrayscale.getWidth(), maybeGrayscale.getHeight(), contentRect, fittingMode);
                        if (!PrintHelper.IS_MIN_MARGINS_HANDLING_CORRECT) {
                            matrix.postTranslate(contentRect.left, contentRect.top);
                            page.getCanvas().clipRect(contentRect);
                        }
                        page.getCanvas().drawBitmap(maybeGrayscale, matrix, null);
                        pdfDocument.finishPage(page);
                        if (!cancellationSignal.isCanceled()) {
                            pdfDocument.writeTo(new FileOutputStream(fileDescriptor.getFileDescriptor()));
                            pdfDocument.close();
                            if (fileDescriptor != null) {
                                try {
                                    fileDescriptor.close();
                                } catch (IOException e) {
                                }
                            }
                            if (maybeGrayscale != bitmap) {
                                maybeGrayscale.recycle();
                            }
                            return null;
                        }
                        pdfDocument.close();
                        if (fileDescriptor != null) {
                            try {
                                fileDescriptor.close();
                            } catch (IOException e2) {
                            }
                        }
                        if (maybeGrayscale != bitmap) {
                            maybeGrayscale.recycle();
                        }
                        return null;
                    } finally {
                    }
                } catch (Throwable t) {
                    return t;
                }
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public void onPostExecute(Throwable throwable) {
                if (cancellationSignal.isCanceled()) {
                    writeResultCallback.onWriteCancelled();
                } else if (throwable == null) {
                    writeResultCallback.onWriteFinished(new PageRange[]{PageRange.ALL_PAGES});
                } else {
                    Log.e(PrintHelper.LOG_TAG, "Error writing printed content", throwable);
                    writeResultCallback.onWriteFailed(null);
                }
            }
        }.execute(new Void[0]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Can't find top splitter block for handler:B:41:0x0067
        	at jadx.core.utils.BlockUtils.getTopSplitterForHandler(BlockUtils.java:1182)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.collectHandlerRegions(ExcHandlersRegionMaker.java:53)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.process(ExcHandlersRegionMaker.java:38)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:27)
        */
    public android.graphics.Bitmap loadConstrainedBitmap(android.net.Uri r11) throws java.io.FileNotFoundException {
        /*
            r10 = this;
            if (r11 == 0) goto L6c
            android.content.Context r0 = r10.mContext
            if (r0 == 0) goto L6c
            android.graphics.BitmapFactory$Options r0 = new android.graphics.BitmapFactory$Options
            r0.<init>()
            r1 = 1
            r0.inJustDecodeBounds = r1
            r10.loadBitmap(r11, r0)
            int r2 = r0.outWidth
            int r3 = r0.outHeight
            r4 = 0
            if (r2 <= 0) goto L6b
            if (r3 > 0) goto L1b
            goto L6b
        L1b:
            int r5 = java.lang.Math.max(r2, r3)
            r6 = r5
            r5 = r1
        L21:
            r7 = 3500(0xdac, float:4.905E-42)
            if (r6 <= r7) goto L2a
            int r6 = r6 >>> 1
            int r5 = r5 << 1
            goto L21
        L2a:
            if (r5 <= 0) goto L6a
            int r7 = java.lang.Math.min(r2, r3)
            int r7 = r7 / r5
            if (r7 > 0) goto L34
            goto L6a
        L34:
            java.lang.Object r7 = r10.mLock
            monitor-enter(r7)
            android.graphics.BitmapFactory$Options r8 = new android.graphics.BitmapFactory$Options     // Catch: java.lang.Throwable -> L67
            r8.<init>()     // Catch: java.lang.Throwable -> L67
            r10.mDecodeOptions = r8     // Catch: java.lang.Throwable -> L67
            android.graphics.BitmapFactory$Options r8 = r10.mDecodeOptions     // Catch: java.lang.Throwable -> L67
            r8.inMutable = r1     // Catch: java.lang.Throwable -> L67
            android.graphics.BitmapFactory$Options r1 = r10.mDecodeOptions     // Catch: java.lang.Throwable -> L67
            r1.inSampleSize = r5     // Catch: java.lang.Throwable -> L67
            android.graphics.BitmapFactory$Options r1 = r10.mDecodeOptions     // Catch: java.lang.Throwable -> L67
            monitor-exit(r7)     // Catch: java.lang.Throwable -> L62
            android.graphics.Bitmap r7 = r10.loadBitmap(r11, r1)     // Catch: java.lang.Throwable -> L57
            java.lang.Object r8 = r10.mLock
            monitor-enter(r8)
            r10.mDecodeOptions = r4     // Catch: java.lang.Throwable -> L54
            monitor-exit(r8)     // Catch: java.lang.Throwable -> L54
            return r7
        L54:
            r4 = move-exception
            monitor-exit(r8)     // Catch: java.lang.Throwable -> L54
            throw r4
        L57:
            r7 = move-exception
            java.lang.Object r8 = r10.mLock
            monitor-enter(r8)
            r10.mDecodeOptions = r4     // Catch: java.lang.Throwable -> L5f
            monitor-exit(r8)     // Catch: java.lang.Throwable -> L5f
            throw r7
        L5f:
            r4 = move-exception
            monitor-exit(r8)     // Catch: java.lang.Throwable -> L5f
            throw r4
        L62:
            r4 = move-exception
            r9 = r4
            r4 = r1
            r1 = r9
            goto L68
        L67:
            r1 = move-exception
        L68:
            monitor-exit(r7)     // Catch: java.lang.Throwable -> L67
            throw r1
        L6a:
            return r4
        L6b:
            return r4
        L6c:
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "bad argument to getScaledBitmap"
            r0.<init>(r1)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.print.PrintHelper.loadConstrainedBitmap(android.net.Uri):android.graphics.Bitmap");
    }

    private Bitmap loadBitmap(Uri uri, BitmapFactory.Options o) throws FileNotFoundException {
        if (uri == null || this.mContext == null) {
            throw new IllegalArgumentException("bad argument to loadBitmap");
        }
        InputStream is = null;
        try {
            is = this.mContext.getContentResolver().openInputStream(uri);
            return BitmapFactory.decodeStream(is, null, o);
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException t) {
                    Log.w(LOG_TAG, "close fail ", t);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Bitmap convertBitmapForColorMode(Bitmap original, int colorMode) {
        if (colorMode != 1) {
            return original;
        }
        Bitmap grayscale = Bitmap.createBitmap(original.getWidth(), original.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(grayscale);
        Paint p = new Paint();
        ColorMatrix cm = new ColorMatrix();
        cm.setSaturation(0.0f);
        ColorMatrixColorFilter f = new ColorMatrixColorFilter(cm);
        p.setColorFilter(f);
        c.drawBitmap(original, 0.0f, 0.0f, p);
        c.setBitmap(null);
        return grayscale;
    }
}
