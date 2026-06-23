package com.tencent.taes.remote.api.media;

import android.os.Bundle;
import com.tencent.taes.remote.api.media.bean.MediaBean;
import com.tencent.taes.remote.api.media.listener.IAudioFocusListener;
import com.tencent.taes.remote.api.media.listener.IPlayListListener;
import com.tencent.taes.remote.api.media.listener.IPlayModeListener;
import com.tencent.taes.remote.api.media.listener.IPlayerListener;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface IMediaApi {
    void addAudioFocusListener(IAudioFocusListener iAudioFocusListener);

    void addPlayListListener(IPlayListListener iPlayListListener);

    void addPlayModeListener(IPlayModeListener iPlayModeListener);

    void decreaseVolume();

    void destroy();

    int getAudioFocus();

    long getCurrentPosition();

    long getDuration();

    int getFirst();

    int getNextWhenComplete(int i);

    int getPlayIndex();

    List<MediaBean> getPlayList();

    List<MediaBean> getPlayListBatch(int i);

    int getPlayListSize();

    int getPlayMode();

    long getUploadPosition();

    boolean hasAudioFocus();

    void init(Bundle bundle);

    void initTTSPlayer();

    boolean isBuffering();

    boolean isPlaying();

    boolean isSeekable();

    boolean isSupportShuffleMode();

    void likeItem(String str, int i, boolean z);

    int next(int i);

    void pause(boolean z);

    void play(boolean z);

    int pre(int i);

    void removePlayModeListener(IPlayModeListener iPlayModeListener);

    void resumeVolume();

    void seekTo(long j);

    void setDeviceId(String str);

    void setPlayIndex(String str, int i);

    void setPlayList(String str, List<MediaBean> list);

    void setPlayListBatch(String str, List<MediaBean> list, int i, int i2);

    void setPlayListener(IPlayerListener iPlayerListener);

    void setPlayMode(String str, int i);

    void setRecommendMode(String str, int i);

    void stop();

    void switchPlayMode(String str);

    void updateListItem(String str, int i, MediaBean mediaBean);
}
