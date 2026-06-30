package com.spd.xhsntg;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Environment;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.text.format.DateFormat;
import android.util.Log;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

/**
 * BLUEPRINT DI RIFERIMENTO (NON compilato: l'implementazione viva e' lo smali a mano in
 * NtgLog.smali + NtgLog$1.smali, vedi nota build in ntg062-modding-build).
 *
 * Logger che rispecchia su file i Log dell'app, OLTRE a logcat. File:
 * Download/NTG_062_log.log (distinto dal logger can-box ntg_carinfo_log.txt). Sovrascritto a
 * ogni avvio (apertura in troncamento). Scrittura su THREAD DI BACKGROUND (HandlerThread):
 * i call-site (anche su percorsi caldi) fanno solo Log + invio di un Message, mai I/O.
 *
 * Sicurezza: ogni metodo pubblico e' avvolto in try/catch(Throwable) -> NtgLog NON puo' mai far
 * crashare l'app; al peggio il file non viene scritto ma logcat e l'app restano integri.
 *
 * Permesso: la scrittura in Download richiede WRITE_EXTERNAL_STORAGE. Finche' non e' concesso le
 * righe restano bufferizzate in memoria (sPending, accesso confinato al thread di scrittura) e
 * vengono svuotate alla prima apertura riuscita. FullscreenActivity richiede il permesso in
 * onCreate (one-time) e, alla concessione, chiama flush() per forzare l'apertura.
 *
 * Usato da: tutte le classi com.spd.* (i Log.d/e/i/w/v sono reindirizzati a NtgLog ai call-site).
 *
 * @since 30/06/26 Mattia Alesi
 */
public final class NtgLog {

    static final String FILE_NAME = "NTG_062_log.log";
    static final int MSG_WRITE = 0;
    static final int MAX_PENDING = 2000;

    static Context sCtx;
    static Handler sHandler;          // sul thread di background
    static volatile boolean sInit;

    // Tutti questi sono toccati SOLO dal thread di background (handleMessage) -> niente sync.
    static BufferedWriter sWriter;
    static ArrayList<String> sPending = new ArrayList<String>();

    private NtgLog() { }

    /** Inizializza il logger (idempotente). Da chiamare il prima possibile in onCreate. */
    public static synchronized void init(Context ctx) {
        if (sInit) {
            return;
        }
        sInit = true;
        try {
            sCtx = ctx.getApplicationContext();
            HandlerThread t = new HandlerThread("NtgLog");
            t.start();
            Looper looper = t.getLooper();
            sHandler = new NtgLogHandler(looper);   // NtgLog$1 nello smali
        } catch (Throwable ignored) {
            sHandler = null;
        }
    }

    public static int d(String tag, String msg) { return log(Log.DEBUG, "D", tag, msg); }
    public static int e(String tag, String msg) { return log(Log.ERROR, "E", tag, msg); }
    public static int i(String tag, String msg) { return log(Log.INFO, "I", tag, msg); }
    public static int w(String tag, String msg) { return log(Log.WARN, "W", tag, msg); }
    public static int v(String tag, String msg) { return log(Log.VERBOSE, "V", tag, msg); }

    /** Forza un tentativo di apertura/flush (es. dopo la concessione del permesso). */
    public static void flush() {
        try {
            Handler h = sHandler;
            if (h != null) {
                // sentinella: tag null -> handleMessage prova solo open + flush dei pending
                Message m = h.obtainMessage(MSG_WRITE, new String[] { null, null, null });
                h.sendMessage(m);
            }
        } catch (Throwable ignored) {
        }
    }

    private static int log(int prio, String lvl, String tag, String msg) {
        int r = 0;
        try {
            r = Log.println(prio, tag, msg);   // logcat invariato
        } catch (Throwable ignored) {
        }
        try {
            Handler h = sHandler;
            if (h != null) {
                Message m = h.obtainMessage(MSG_WRITE, new String[] { lvl, tag, msg });
                h.sendMessage(m);
            }
        } catch (Throwable ignored) {
        }
        return r;
    }

    /** Eseguito SUL thread di background (NtgLog$1.handleMessage). */
    static void handle(Message msg) {
        try {
            String[] e = (String[]) msg.obj;
            // apri il file se non gia' aperto e il permesso e' disponibile
            if (sWriter == null) {
                openIfPossible();
            }
            String line = null;
            if (e != null && e[0] != null) {
                CharSequence ts = DateFormat.format("HH:mm:ss", System.currentTimeMillis());
                line = ts + " " + e[0] + "/" + e[1] + ": " + e[2] + "\n";
            }
            if (sWriter != null) {
                if (!sPending.isEmpty()) {
                    int n = sPending.size();
                    for (int k = 0; k < n; k++) {
                        sWriter.write(sPending.get(k));
                    }
                    sPending.clear();
                }
                if (line != null) {
                    sWriter.write(line);
                }
                sWriter.flush();
            } else if (line != null) {
                if (sPending.size() >= MAX_PENDING) {
                    sPending.remove(0);
                }
                sPending.add(line);
            }
        } catch (Throwable ignored) {
            // mai propagare: il thread di log non deve morire
        }
    }

    private static void openIfPossible() {
        try {
            Context c = sCtx;
            if (c == null) {
                return;
            }
            if (c.checkSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE")
                    != PackageManager.PERMISSION_GRANTED) {
                return;
            }
            File dir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            if (dir != null && !dir.exists()) {
                dir.mkdirs();
            }
            File f = new File(dir, FILE_NAME);
            sWriter = new BufferedWriter(new FileWriter(f, false));   // false = troncamento a ogni avvio
        } catch (Throwable ignored) {
            sWriter = null;
        }
    }
}
