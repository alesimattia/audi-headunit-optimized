package com.tencent.taes.base.api.bean.infodispatcher.wechat;

import com.tencent.taes.base.api.bean.infodispatcher.base.WeCarBaseBean;

/* JADX INFO: loaded from: classes.dex */
public class WeCarWeChatMessage extends WeCarBaseBean {
    public int msgState;
    public int msgType;
    public String richInfo;
    public String userIcon;
    public String userName;

    public static class MsgState {
        public static final int STATE_CALLING = 8;
        public static final int STATE_CALL_END = 9;
        public static final int STATE_CANCEL = 10;
        public static final int STATE_CONNECTIONG = 4;
        public static final int STATE_PLAY = 1;
        public static final int STATE_PLAY_COMPLETED = 2;
        public static final int STATE_RECORDING = 5;
        public static final int STATE_REPLAY = 3;
        public static final int STATE_SEND_FAIL = 7;
        public static final int STATE_SEND_SUCCESS = 6;
        public static final int STATE_START = 0;
    }

    public static class MsgType {
        public static final int MSG_OTHER = 3;
        public static final int MSG_POI = 2;
        public static final int MSG_TEXT = 0;
        public static final int MSG_VOIP = 1;
    }

    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("userName = ");
        buffer.append(this.userName);
        buffer.append("  msgType = ");
        buffer.append(this.msgType);
        buffer.append("  msgState = ");
        buffer.append(this.msgState);
        buffer.append("  richInfo = ");
        buffer.append(this.richInfo);
        return buffer.toString();
    }
}
