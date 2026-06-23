package com.tencent.taes.exception;

/* JADX INFO: loaded from: classes.dex */
public class TAESLoadOverTimeException extends Exception {
    public TAESLoadOverTimeException() {
        super("Component loading timeout, optimize component initialization process");
    }

    public TAESLoadOverTimeException(String message) {
        super(message);
    }

    public TAESLoadOverTimeException(String message, Throwable cause) {
        super(message, cause);
    }
}
