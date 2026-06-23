package android.support.v4.media.session;

import android.media.session.MediaSession;
import androidx.annotation.RequiresApi;

/* JADX INFO: loaded from: classes.dex */
@RequiresApi(22)
class MediaSessionCompatApi22 {
    public static void setRatingType(Object sessionObj, int type) {
        ((MediaSession) sessionObj).setRatingType(type);
    }

    private MediaSessionCompatApi22() {
    }
}
