package com.tencent.taes.exception;

/* JADX INFO: loaded from: classes.dex */
public class TAESApiNotSupportException extends Exception {
    public TAESApiNotSupportException() {
        super("This api not support. please check it a little.");
    }

    public TAESApiNotSupportException(String message) {
        super(message);
    }

    public TAESApiNotSupportException(String message, Throwable cause) {
        super(message, cause);
    }
}
