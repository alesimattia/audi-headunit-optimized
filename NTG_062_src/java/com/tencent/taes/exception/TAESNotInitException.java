package com.tencent.taes.exception;

/* JADX INFO: loaded from: classes.dex */
public class TAESNotInitException extends Exception {
    public TAESNotInitException() {
        super("Not initialized, please check it a little.");
    }

    public TAESNotInitException(String message) {
        super(message);
    }

    public TAESNotInitException(String message, Throwable cause) {
        super(message, cause);
    }
}
