package androidx.core.database.sqlite;

import android.database.sqlite.SQLiteCursor;
import androidx.annotation.NonNull;
import androidx.core.os.BuildCompat;

/* JADX INFO: loaded from: classes.dex */
public final class SQLiteCursorCompat {
    private SQLiteCursorCompat() {
    }

    public void setFillWindowForwardOnly(@NonNull SQLiteCursor cursor, boolean fillWindowForwardOnly) {
        if (BuildCompat.isAtLeastP()) {
            cursor.setFillWindowForwardOnly(fillWindowForwardOnly);
        }
    }
}
