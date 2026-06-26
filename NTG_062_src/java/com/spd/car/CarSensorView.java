package com.spd.car;

import android.content.Context;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.spd.carinfo.CarInfo;

/**
 * Pagina "Sensori/Marcia" (indice 3 dello slider) che sostituisce la vecchia
 * CarKeyView (i cui tasti non erano funzionanti). Mostra in tempo reale:
 * marcia inserita, stato retromarcia e la prossimita dei 4 lati (anteriore,
 * posteriore, sinistra, destra) con barre grafiche + valore numerico.
 *
 * NIENTE TPMS (l'auto di destinazione non lo supporta).
 *
 * I dati arrivano dal servizio CarInfo via la classe ReverseAndAVM (gia
 * registrata in CarInfoManager, quindi disponibile): si leggono in PULL con
 * un polling ogni 300 ms quando la pagina e visibile (stesso approccio della
 * pagina Sistema, com.spd.xhsntg.SystemView). Il polling viene avviato/fermato
 * da com.spd.xhsntg.FullscreenActivity$1.onPageSelected (indice 3).
 *
 * NB onesta tecnica: il servizio CarInfo si collega anche sotto "Strada C"
 * (confermato: porte/velocita leggono dati reali senza privilegi system).
 * Resta da validare sul campo SE il CAN-box dell'Audi popoli questi specifici
 * what (gear/radar) e con quale scala/unita: la barra usa max=8 e la marcia
 * mostra il valore grezzo, da tarare con logcat sul dispositivo.
 *
 * Costruita interamente in codice (come SystemView): non usa file di layout.
 * La versione che fa fede e lo smali in apktool/smali/com/spd/car/CarSensorView*.smali;
 * questo .java e il blueprint leggibile equivalente.
 *
 * @since 25/06/26 Mattia Alesi
 */
public class CarSensorView {

    // what di CarInfo.ReverseAndAVM (range 140xxx, classe gia registrata)
    private static final int WHAT_GEAR = 140080;          // marcia inserita (codice grezzo)
    private static final int WHAT_REVERSE = 140011;       // 1 = retromarcia inserita
    private static final int WHAT_FRONT_DISTANCE = 140016; // distanza radar anteriore
    private static final int WHAT_REAR_DISTANCE = 140017;  // distanza radar posteriore
    private static final int WHAT_FRONT_LEVEL = 140007;    // livello prossimita anteriore
    private static final int WHAT_REAR_LEVEL = 140006;     // livello prossimita posteriore
    private static final int WHAT_LEFT_LEVEL = 140008;     // livello prossimita sinistra
    private static final int WHAT_RIGHT_LEVEL = 140009;    // livello prossimita destra

    private static final int BAR_MAX = 8;                  // scala barre (da tarare sul campo)
    private static final int REFRESH_MS = 300;             // periodo polling

    private static Context sCtx;
    private static TextView sGearText;
    private static TextView sRevText;
    private static ProgressBar sFrontBar, sRearBar, sLeftBar, sRightBar;
    private static TextView sFrontText, sRearText, sLeftText, sRightText;
    private static Handler sHandler;
    private static Runnable sTicker;
    private static boolean sRunning;

    /**
     * Costruisce la vista della pagina e prepara handler/ticker.
     * Chiamato da com.spd.view.MyViewPageAdapter.&lt;init&gt;.
     */
    public static View createView(Context ctx) {
        sCtx = ctx;

        LinearLayout root = new LinearLayout(ctx);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.BLACK);
        root.setPadding(24, 24, 24, 24);

        sGearText = makeLabel(ctx, "Marcia: --", 24.0f);
        root.addView(sGearText);
        sRevText = makeLabel(ctx, "Retromarcia: --", 18.0f);
        root.addView(sRevText);

        // 4 righe sensore: [etichetta | barra | valore]
        sFrontBar = new ProgressBar(ctx, null, android.R.attr.progressBarStyleHorizontal);
        sFrontText = makeLabel(ctx, "--", 18.0f);
        root.addView(makeSensorRow(ctx, "Anteriore", sFrontBar, sFrontText));

        sRearBar = new ProgressBar(ctx, null, android.R.attr.progressBarStyleHorizontal);
        sRearText = makeLabel(ctx, "--", 18.0f);
        root.addView(makeSensorRow(ctx, "Posteriore", sRearBar, sRearText));

        sLeftBar = new ProgressBar(ctx, null, android.R.attr.progressBarStyleHorizontal);
        sLeftText = makeLabel(ctx, "--", 18.0f);
        root.addView(makeSensorRow(ctx, "Sinistra", sLeftBar, sLeftText));

        sRightBar = new ProgressBar(ctx, null, android.R.attr.progressBarStyleHorizontal);
        sRightText = makeLabel(ctx, "--", 18.0f);
        root.addView(makeSensorRow(ctx, "Destra", sRightBar, sRightText));

        sHandler = new Handler(Looper.getMainLooper());
        sTicker = new CarSensorTicker();
        return root;
    }

    // Crea una TextView bianca con la dimensione data e padding verticale.
    private static TextView makeLabel(Context ctx, String text, float sizeSp) {
        TextView tv = new TextView(ctx);
        tv.setTextColor(Color.WHITE);
        tv.setTextSize(sizeSp);
        tv.setPadding(0, 12, 0, 12);
        tv.setText(text);
        return tv;
    }

    // Costruisce una riga orizzontale [etichetta larga 220px | barra (peso 1) | valore].
    private static View makeSensorRow(Context ctx, String label, ProgressBar bar, TextView value) {
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        TextView lbl = makeLabel(ctx, label, 18.0f);
        lbl.setWidth(220);
        row.addView(lbl);

        bar.setMax(BAR_MAX);
        LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        barLp.leftMargin = 16;
        barLp.rightMargin = 16;
        row.addView(bar, barLp);

        value.setWidth(140);
        row.addView(value);
        return row;
    }

    /** Avvia il polling periodico (idempotente). Chiamato da FullscreenActivity$1. */
    public static void start() {
        if (sRunning || sHandler == null) {
            return;
        }
        sRunning = true;
        sHandler.post(sTicker);
    }

    /** Ferma il polling periodico. Chiamato da FullscreenActivity$1. */
    public static void stop() {
        sRunning = false;
        if (sHandler != null) {
            sHandler.removeCallbacks(sTicker);
        }
    }

    // Aggiorna tutte le righe leggendo i what da CarInfo (main thread).
    static void refresh() {
        int gear = pullInt(WHAT_GEAR);
        sGearText.setText("Marcia: " + (gear < 0 ? "--" : Integer.toString(gear)));

        int rev = pullInt(WHAT_REVERSE);
        sRevText.setText("Retromarcia: " + (rev < 0 ? "--" : (rev == 1 ? "SI" : "NO")));

        // anteriore/posteriore: barra dal livello, valore = distanza (se disponibile) altrimenti livello
        updateSide(sFrontBar, sFrontText, WHAT_FRONT_LEVEL, WHAT_FRONT_DISTANCE);
        updateSide(sRearBar, sRearText, WHAT_REAR_LEVEL, WHAT_REAR_DISTANCE);
        // sinistra/destra: solo livello (niente what distanza dedicato)
        updateSide(sLeftBar, sLeftText, WHAT_LEFT_LEVEL, -1);
        updateSide(sRightBar, sRightText, WHAT_RIGHT_LEVEL, -1);
    }

    // Aggiorna una riga: barra dal livello (0..BAR_MAX), testo dalla distanza se whatDist valido.
    private static void updateSide(ProgressBar bar, TextView text, int whatLevel, int whatDist) {
        int level = pullInt(whatLevel);
        int progress = level < 0 ? 0 : (level > BAR_MAX ? BAR_MAX : level);
        bar.setProgress(progress);

        if (whatDist >= 0) {
            int dist = pullInt(whatDist);
            if (dist >= 0) {
                text.setText(dist + " cm");
                return;
            }
        }
        text.setText(level < 0 ? "--" : Integer.toString(level));
    }

    // Legge un int da CarInfo in PULL; ritorna -1 se non connesso/non disponibile.
    private static int pullInt(int what) {
        try {
            Integer v = CarInfo.instance().get(what, 0, Integer.valueOf(0));
            return v == null ? -1 : v.intValue();
        } catch (Throwable t) {
            return -1;
        }
    }

    // Runnable che ripete refresh() ogni REFRESH_MS finche sRunning.
    private static final class CarSensorTicker implements Runnable {
        @Override
        public void run() {
            refresh();
            if (sRunning && sHandler != null) {
                sHandler.postDelayed(this, REFRESH_MS);
            }
        }
    }
}
