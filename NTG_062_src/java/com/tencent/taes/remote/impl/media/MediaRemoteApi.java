package com.tencent.taes.remote.impl.media;

import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.remote.api.media.IMediaApi;
import com.tencent.taes.remote.api.media.IPlayerService;
import com.tencent.taes.remote.api.media.bean.MediaBean;
import com.tencent.taes.remote.api.media.listener.IAudioFocusListener;
import com.tencent.taes.remote.api.media.listener.IPlayListListener;
import com.tencent.taes.remote.api.media.listener.IPlayModeListener;
import com.tencent.taes.remote.api.media.listener.IPlayerListener;
import com.tencent.taes.remote.impl.BaseRemoteApi;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class MediaRemoteApi extends BaseRemoteApi implements IMediaApi {
    private IPlayerService mService;

    private MediaRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.mService = IPlayerService.Stub.asInterface(binder);
        log("construct");
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void init(Bundle bundle) {
        log("init");
        if (this.mService != null) {
            try {
                this.mService.init(bundle);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void play(boolean flag) {
        log("play");
        if (this.mService != null) {
            try {
                this.mService.play(flag);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void pause(boolean flag) {
        log("pause");
        if (this.mService != null) {
            try {
                this.mService.pause(flag);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void stop() {
        log("stop");
        if (this.mService != null) {
            try {
                this.mService.stop();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void destroy() {
        log("destroy");
        if (this.mService != null) {
            try {
                this.mService.destroy();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public boolean hasAudioFocus() {
        log("hasAudioFocus");
        if (this.mService != null) {
            try {
                return this.mService.hasAudioFocus();
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public long getDuration() {
        log("getDuration");
        if (this.mService != null) {
            try {
                return this.mService.getDuration();
            } catch (RemoteException e) {
                e.printStackTrace();
                return 0L;
            }
        }
        return 0L;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public long getUploadPosition() {
        log("getUploadPosition");
        if (this.mService != null) {
            try {
                return this.mService.getUploadPosition();
            } catch (RemoteException e) {
                e.printStackTrace();
                return 0L;
            }
        }
        return 0L;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public long getCurrentPosition() {
        log("getCurrentPosition");
        if (this.mService != null) {
            try {
                return this.mService.getCurrentPosition();
            } catch (RemoteException e) {
                e.printStackTrace();
                return 0L;
            }
        }
        return 0L;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void seekTo(long position) {
        log("seekTo");
        if (this.mService != null) {
            try {
                this.mService.seekTo(position);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public boolean isPlaying() {
        log("isPlaying");
        if (this.mService != null) {
            try {
                return this.mService.isPlaying();
            } catch (RemoteException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void resumeVolume() {
        log("resumeVolume");
        if (this.mService != null) {
            try {
                this.mService.resumeVolume();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void decreaseVolume() {
        log("decreaseVolume");
        if (this.mService != null) {
            try {
                this.mService.decreaseVolume();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void setPlayListener(IPlayerListener listener) {
        log("setPlayListener");
        if (this.mService != null) {
            try {
                this.mService.setPlayListener(listener);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void setPlayList(String pkgName, List<MediaBean> list) {
        log("setPlayList");
        if (this.mService != null) {
            try {
                this.mService.setPlayList(pkgName, list);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void setPlayListBatch(String pkgName, List<MediaBean> list, int page, int totalPage) {
        log("setPlayListBatch pkgName: " + pkgName + ", page: " + page + ", total: " + totalPage);
        if (this.mService != null) {
            try {
                this.mService.setPlayListBatch(pkgName, list, page, totalPage);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public List<MediaBean> getPlayList() {
        log("getPlayList");
        if (this.mService != null) {
            try {
                return this.mService.getPlayList();
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public List<MediaBean> getPlayListBatch(int page) {
        log("getPlayListBatch page: " + page);
        if (this.mService != null) {
            try {
                return this.mService.getPlayListBatch(page);
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public int getPlayListSize() {
        log("getPlayListSize");
        if (this.mService == null) {
            return 0;
        }
        try {
            int size = this.mService.getPlayListSize();
            return size;
        } catch (RemoteException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void addPlayListListener(IPlayListListener listener) {
        log("addPlayListListener");
        if (this.mService != null) {
            try {
                this.mService.addPlayListListener(listener);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void setPlayIndex(String pkgName, int index) {
        log("setPlayIndex");
        if (this.mService != null) {
            try {
                this.mService.setPlayIndex(pkgName, index);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public int getPlayIndex() {
        log("getPlayIndex");
        if (this.mService != null) {
            try {
                return this.mService.getPlayIndex();
            } catch (RemoteException e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public int getFirst() {
        log("getFirst");
        if (this.mService != null) {
            try {
                return this.mService.getFirst();
            } catch (RemoteException e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public int pre(int current) {
        log("pre");
        if (this.mService != null) {
            try {
                return this.mService.pre(current);
            } catch (RemoteException e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public int next(int current) {
        log("next");
        if (this.mService != null) {
            try {
                return this.mService.next(current);
            } catch (RemoteException e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public int getNextWhenComplete(int current) {
        log("getNextWhenComplete");
        if (this.mService != null) {
            try {
                return this.mService.getNextWhenComplete(current);
            } catch (RemoteException e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void setRecommendMode(String pkgName, int mode) {
        log("setRecommendMode");
        if (this.mService != null) {
            try {
                this.mService.setRecommendMode(pkgName, mode);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void setPlayMode(String pkgName, int mode) {
        log("setPlayMode");
        if (this.mService != null) {
            try {
                this.mService.setPlayMode(pkgName, mode);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void switchPlayMode(String pkgName) {
        log("switchPlayMode");
        if (this.mService != null) {
            try {
                this.mService.switchPlayMode(pkgName);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void addPlayModeListener(IPlayModeListener listener) {
        log("addPlayModeListener");
        if (this.mService != null) {
            try {
                this.mService.addPlayModeListener(listener);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void removePlayModeListener(IPlayModeListener listener) {
        log("removePlayModeListener");
        if (this.mService != null) {
            try {
                this.mService.removePlayModeListener(listener);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public int getPlayMode() {
        log("getPlayMode");
        try {
            if (this.mService != null) {
                return this.mService.getPlayMode();
            }
            return 0;
        } catch (RemoteException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void initTTSPlayer() {
        log("initTTSPlayer");
        try {
            if (this.mService != null) {
                this.mService.initTTSPlayer();
            }
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void setDeviceId(String deviceId) {
        log("setDeviceId");
        try {
            if (this.mService != null) {
                this.mService.setDeviceId(deviceId);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public int getAudioFocus() {
        log("getAudioFocus");
        try {
            if (this.mService != null) {
                return this.mService.getAudioFocus();
            }
            return 0;
        } catch (RemoteException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>("Media", IPlayerService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        log("reBindBinder");
        this.mService = IPlayerService.Stub.asInterface(binder);
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public boolean isBuffering() {
        log("isBuffering");
        try {
            if (this.mService != null) {
                return this.mService.isBuffering();
            }
            return false;
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public boolean isSeekable() {
        log("isSeekable");
        try {
            if (this.mService != null) {
                return this.mService.isSeekable();
            }
            return false;
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public boolean isSupportShuffleMode() {
        log("isSupportShuffleMode");
        try {
            if (this.mService != null) {
                return this.mService.isSupportShuffleMode();
            }
            return false;
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    private void log(String method) {
        StringBuilder sb = new StringBuilder();
        sb.append(method);
        sb.append(", mService ");
        sb.append(this.mService == null);
        Log.d("MediaRemoteApi", sb.toString());
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void updateListItem(String pkgName, int index, MediaBean bean) {
        try {
            if (this.mService != null) {
                this.mService.updateListItem(pkgName, index, bean);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void likeItem(String pkgName, int index, boolean like) {
        try {
            if (this.mService != null) {
                this.mService.likeItem(pkgName, index, like);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    @Override // com.tencent.taes.remote.api.media.IMediaApi
    public void addAudioFocusListener(IAudioFocusListener listener) {
        try {
            if (this.mService != null) {
                this.mService.addAudioFocusListener(listener);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }
}
