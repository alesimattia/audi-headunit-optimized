package androidx.media;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Context;
import android.support.v4.media.session.MediaSessionCompat;
import androidx.annotation.NonNull;
import androidx.media.MediaLibraryService2;
import androidx.media.MediaSession2;
import androidx.media.MediaSession2ImplBase;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
@TargetApi(19)
class MediaLibrarySessionImplBase extends MediaSession2ImplBase {
    MediaLibrarySessionImplBase(Context context, MediaSessionCompat sessionCompat, String id, BaseMediaPlayer player, MediaPlaylistAgent playlistAgent, VolumeProviderCompat volumeProvider, PendingIntent sessionActivity, Executor callbackExecutor, MediaSession2.SessionCallback callback) {
        super(context, sessionCompat, id, player, playlistAgent, volumeProvider, sessionActivity, callbackExecutor, callback);
    }

    @Override // androidx.media.MediaSession2ImplBase, androidx.media.MediaSession2.SupportLibraryImpl
    MediaSession2 createInstance() {
        return new MediaLibraryService2.MediaLibrarySession(this);
    }

    static final class Builder extends MediaSession2ImplBase.BuilderBase<MediaLibraryService2.MediaLibrarySession, MediaLibraryService2.MediaLibrarySession.MediaLibrarySessionCallback> {
        Builder(Context context) {
            super(context);
        }

        @Override // androidx.media.MediaSession2ImplBase.BuilderBase
        @NonNull
        public MediaLibraryService2.MediaLibrarySession build() {
            if (this.mCallbackExecutor == null) {
                this.mCallbackExecutor = new MediaSession2ImplBase.MainHandlerExecutor(this.mContext);
            }
            if (this.mCallback == 0) {
                this.mCallback = new MediaLibraryService2.MediaLibrarySession.MediaLibrarySessionCallback() { // from class: androidx.media.MediaLibrarySessionImplBase.Builder.1
                };
            }
            return new MediaLibraryService2.MediaLibrarySession(new MediaLibrarySessionImplBase(this.mContext, new MediaSessionCompat(this.mContext, this.mId), this.mId, this.mPlayer, this.mPlaylistAgent, this.mVolumeProvider, this.mSessionActivity, this.mCallbackExecutor, this.mCallback));
        }
    }
}
