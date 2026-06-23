package com.tencent.taes.exception;

/* JADX INFO: loaded from: classes.dex */
public class TAESServiceNotFoundException extends Exception {
    public TAESServiceNotFoundException() {
        super("This service was not found. Please check if the service exists.");
    }

    public TAESServiceNotFoundException(String message) {
        super(message);
    }

    public TAESServiceNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}
