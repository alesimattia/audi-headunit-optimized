package com.tencent.taes.local.api.moss;

import android.support.annotation.Keep;
import com.tencent.taes.base.api.AbstractApi;
import com.tencent.taes.local.api.moss.bean.MessageInfo;
import com.tencent.taes.local.api.moss.bean.MossAppInfo;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
@Keep
public interface IMossApi extends AbstractApi {

    public interface SpeechCallback {
        void closeMiniProgram();

        void openMiniProgram(String str, String str2, String str3, int i);

        void passRaw(String str, String str2, String str3);
    }

    public interface WokeUpCallback {
        void mossWakeUpSceneCallback(long j, String str, String str2);
    }

    void addCollection(String str);

    List<String> getCollectedAppIdList();

    List<String> getRecentAppList();

    boolean isEnableSpeechText();

    boolean isInputIsTextView();

    boolean isMossAppAvailable(String str);

    boolean isMossDebugEvn();

    boolean isShowWakeUpWord();

    String mossRegisterWakeUpSceneByMap(HashMap<String, Set<String>> map);

    void mossUnregisterWakeUpScene();

    boolean openMossApp(String str, String str2);

    void register(WokeUpCallback wokeUpCallback);

    void registerAppSkills(String str, Set<String> set);

    void removeCollection(String str);

    void requestMessageList(IMossRequestCallback<MessageInfo> iMossRequestCallback);

    void requestMossAppList(IMossRequestCallback<MossAppInfo> iMossRequestCallback);

    void setAppChannel(String str);

    void setEnableSpeechText(boolean z);

    void setInputIsTextView(boolean z);

    void setMossDebugEvn(boolean z);

    void setMossUiModel(boolean z);

    void setShowWakeUpWord(boolean z);

    void speechRegister(SpeechCallback speechCallback);

    void speechUnregister(SpeechCallback speechCallback);

    void unregister(WokeUpCallback wokeUpCallback);
}
