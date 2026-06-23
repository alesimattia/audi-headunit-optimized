package com.tencent.taes.remote.api.infodispatcher.listener;

import com.tencent.taes.base.api.bean.infodispatcher.wechat.WeCarWeChatMessage;

/* JADX INFO: loaded from: classes.dex */
public interface OnWeChatMessageListener {
    void onWeChatMessageChanged(WeCarWeChatMessage weCarWeChatMessage);
}
