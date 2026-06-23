package com.tencent.taes.exception;

/* JADX INFO: loaded from: classes.dex */
public class TAESServiceNotConnectException extends Exception {
    public TAESServiceNotConnectException() {
        super("The service is not connected. Please try again later！");
    }

    public TAESServiceNotConnectException(String message) {
        super(message);
    }

    public TAESServiceNotConnectException(String message, Throwable cause) {
        super(message, cause);
    }
}
