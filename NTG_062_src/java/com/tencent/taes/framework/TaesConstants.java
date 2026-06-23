package com.tencent.taes.framework;

import androidx.core.app.NotificationManagerCompat;

/* JADX INFO: loaded from: classes.dex */
public interface TaesConstants {

    public enum CompLoadState {
        IDLE(-2, "无效状态"),
        LOADING(-1, "加载中"),
        SUCCESS(0, "加载成功"),
        ERROR_NO_INIT(NotificationManagerCompat.IMPORTANCE_UNSPECIFIED, "框架未初始化"),
        ERROR_NO_FOUND(-1001, "组件未找到"),
        ERROR_LOAD_OVER_TIME(-1002, "组件加载超时"),
        ERROR_SMS_NO_FOUND(-2000, "SMS 服务未找到"),
        ERROR_SMS_BIND_FAIL(-2001, "SMS 服务绑定失败"),
        ERROR_SERVER_COMP_LOAD_FAIL(-2002, "服务组件加载失败: "),
        ERROR_LOCAL_COMP_LOAD_FAIL(-2003, "本地组件加载失败: "),
        ERROR_COMP_LOAD_FAIL(-2004, "组件加载失败: ");

        public int code;
        public String message;

        CompLoadState(int code, String message) {
            this.code = code;
            this.message = message;
        }

        public int getCode() {
            return this.code;
        }

        public String getMessage() {
            return this.message;
        }

        @Override // java.lang.Enum
        public String toString() {
            return "State{message='" + this.message + "'}";
        }
    }
}
