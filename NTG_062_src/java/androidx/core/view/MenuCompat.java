package androidx.core.view;

import android.annotation.SuppressLint;
import android.view.Menu;
import android.view.MenuItem;
import androidx.core.internal.view.SupportMenu;
import androidx.core.os.BuildCompat;

/* JADX INFO: loaded from: classes.dex */
public final class MenuCompat {
    @Deprecated
    public static void setShowAsAction(MenuItem item, int actionEnum) {
        item.setShowAsAction(actionEnum);
    }

    @SuppressLint({"NewApi"})
    public static void setGroupDividerEnabled(Menu menu, boolean enabled) {
        if (menu instanceof SupportMenu) {
            ((SupportMenu) menu).setGroupDividerEnabled(enabled);
        } else if (BuildCompat.isAtLeastP()) {
            menu.setGroupDividerEnabled(enabled);
        }
    }

    private MenuCompat() {
    }
}
