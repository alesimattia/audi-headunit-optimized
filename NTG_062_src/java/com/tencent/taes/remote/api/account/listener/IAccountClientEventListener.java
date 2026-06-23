package com.tencent.taes.remote.api.account.listener;

import com.tencent.taes.remote.api.account.bean.TxAccount;
import com.tencent.taes.remote.api.account.bean.WeCarAccount;

/* JADX INFO: loaded from: classes.dex */
public interface IAccountClientEventListener {
    void onAuthChanged(boolean z);

    void onWXAccountBind(TxAccount txAccount);

    void onWXAccountUnbind(TxAccount txAccount);

    void onWXAccountUpdate(TxAccount txAccount, TxAccount txAccount2);

    void onWXTicketUpdate(String str, String str2);

    void onWeCarIdChanged(WeCarAccount weCarAccount, WeCarAccount weCarAccount2);

    void onWeCarIdRegistered(WeCarAccount weCarAccount);
}
