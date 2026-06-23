package androidx.core.content.pm;

import android.content.pm.PackageInfo;
import androidx.annotation.NonNull;
import androidx.core.os.BuildCompat;

/* JADX INFO: loaded from: classes.dex */
public final class PackageInfoCompat {
    public static long getLongVersionCode(@NonNull PackageInfo info) {
        if (BuildCompat.isAtLeastP()) {
            return info.getLongVersionCode();
        }
        return info.versionCode;
    }

    private PackageInfoCompat() {
    }
}
