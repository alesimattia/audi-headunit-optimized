package com.tencent.taes.remote.impl.account;

import android.os.IBinder;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.account.IAccountApi;
import com.tencent.taes.remote.api.account.IAccountService;
import com.tencent.taes.remote.api.account.bean.TxAccount;
import com.tencent.taes.remote.api.account.bean.WeCarAccount;
import com.tencent.taes.remote.api.account.bean.WeCarContract;
import com.tencent.taes.remote.api.account.listener.AccountListener;
import com.tencent.taes.remote.api.account.listener.IAccountClientEventListener;
import com.tencent.taes.remote.api.account.listener.IAccountEventListener;
import com.tencent.taes.remote.api.account.listener.IAccountListener;
import com.tencent.taes.remote.api.account.listener.IMossCallBack;
import com.tencent.taes.remote.api.account.listener.ITAIUserInfo;
import com.tencent.taes.remote.impl.BaseRemoteApi;
import com.tencent.taes.util.ContextHolder;
import com.tencent.taes.util.GsonUtils;
import com.tencent.taes.util.PackageUtils;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class AccountRemoteApi extends BaseRemoteApi implements IAccountApi {
    public static final int LOGIN_TYPE_QQ = 1;
    public static final int LOGIN_TYPE_WX = 0;
    private static final String TAG = AccountRemoteApi.class.getSimpleName();
    private static final Object sClientListLock = new Object();
    private final String LOCAL_SERVER_NOT_START;
    private final String SERVER_ERROR;
    private IAccountEventListener mAccountEventListener;
    private CopyOnWriteArrayList<IAccountClientEventListener> mAccountEventReceiverListener;
    private IAccountService mAccountService;
    private String mClientId;

    private AccountRemoteApi(IBinder binder, IBinder smsbinder) {
        super(binder, smsbinder);
        this.LOCAL_SERVER_NOT_START = "{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}";
        this.SERVER_ERROR = "{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}";
        this.mAccountEventReceiverListener = new CopyOnWriteArrayList<>();
        this.mAccountEventListener = new IAccountEventListener.Stub() { // from class: com.tencent.taes.remote.impl.account.AccountRemoteApi.1
            @Override // com.tencent.taes.remote.api.account.listener.IAccountEventListener
            public void onEventReceiver(int code, String newResult, String oldResult) throws RemoteException {
                Log.d(AccountRemoteApi.TAG, "onEventReceiver code = " + code + " -newResult:" + newResult + "oldResult is" + oldResult + " Thread:" + Thread.currentThread().getName());
                String str = AccountRemoteApi.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onEventReceiver mAccountEventReceiverListener = ");
                sb.append(AccountRemoteApi.this.mAccountEventReceiverListener);
                Log.d(str, sb.toString());
                synchronized (AccountRemoteApi.sClientListLock) {
                    for (IAccountClientEventListener listener : AccountRemoteApi.this.mAccountEventReceiverListener) {
                        switch (code) {
                            case 10:
                                listener.onWeCarIdRegistered((WeCarAccount) GsonUtils.fromJson(newResult, WeCarAccount.class));
                                continue;
                            case 11:
                                listener.onWeCarIdChanged((WeCarAccount) GsonUtils.fromJson(oldResult, WeCarAccount.class), (WeCarAccount) GsonUtils.fromJson(newResult, WeCarAccount.class));
                                continue;
                            default:
                                switch (code) {
                                    case 20:
                                        listener.onAuthChanged(!"false".equals(newResult));
                                        continue;
                                    case 21:
                                        listener.onWXAccountBind((TxAccount) GsonUtils.fromJson(newResult, TxAccount.class));
                                        continue;
                                    case 22:
                                        listener.onWXAccountUnbind((TxAccount) GsonUtils.fromJson(newResult, TxAccount.class));
                                        continue;
                                    case 23:
                                        try {
                                            listener.onWXAccountUpdate((TxAccount) GsonUtils.fromJson(oldResult, TxAccount.class), (TxAccount) GsonUtils.fromJson(newResult, TxAccount.class));
                                            continue;
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                        break;
                                }
                                break;
                        }
                    }
                }
            }
        };
        this.mAccountService = IAccountService.Stub.asInterface(binder);
        this.mClientId = toString() + "/" + PackageUtils.getProcessName(ContextHolder.getContext());
        Log.d(TAG, "AccountRemoteApi  string is:" + this.mClientId);
        registerClient();
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public Pair<String, String> subscribeModuleBinder() {
        return new Pair<>(ServerCompConstant.ACCOUNT, IAccountService.Stub.class.getName());
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderConnect(IBinder binder) {
        this.mAccountService = IAccountService.Stub.asInterface(binder);
        this.mClientId = toString() + "/" + PackageUtils.getProcessName(ContextHolder.getContext());
        Log.d(TAG, "AccountRemoteApi  string is:" + this.mClientId);
        registerClient();
        super.binderConnect(binder);
    }

    @Override // com.tencent.taes.remote.impl.BaseRemoteApi
    public void binderDisConnect() {
        super.binderDisConnect();
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void registerAccountEventReceiverListener(IAccountClientEventListener listener) {
        Log.d(TAG, "registerAccountEventReceiverListener, mAccountEventReceiverListener = " + this.mAccountEventReceiverListener + ", listener = " + listener);
        if (this.mAccountEventReceiverListener == null || listener == null) {
            return;
        }
        synchronized (sClientListLock) {
            if (!this.mAccountEventReceiverListener.contains(listener)) {
                this.mAccountEventReceiverListener.add(listener);
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void unregisterAccountEventReceiverListener(IAccountClientEventListener listener) {
        Log.d(TAG, "unregisterAccountEventReceiverListener,mAccountEventReceiverListener = " + this.mAccountEventReceiverListener + ", listener = " + listener);
        if (this.mAccountEventReceiverListener == null || listener == null) {
            return;
        }
        synchronized (sClientListLock) {
            this.mAccountEventReceiverListener.remove(listener);
        }
    }

    private void registerClient() {
        try {
            if (this.mAccountService != null) {
                this.mAccountService.registerClient(this.mClientId, null, this.mAccountEventListener);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
            Log.d(TAG, "registerClient sync, e = " + e.toString());
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public WeCarAccount getWeCarAccount() {
        Log.d(TAG, "mAccountService = " + this.mAccountService);
        try {
            if (this.mAccountService != null) {
                return this.mAccountService.getWeCarAccountSync();
            }
            return null;
        } catch (RemoteException e) {
            e.printStackTrace();
            Log.d(TAG, "getWeCarAccount sync, e = " + e.toString());
            return null;
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getWeCarAccount(AccountListener listener) {
        getWeCarAccount(listener == null ? null : listener.getInnerListener());
    }

    private void getWeCarAccount(IAccountListener IListener) {
        Log.d(TAG, "mAccountService = " + this.mAccountService + ", listener = " + IListener);
        try {
            if (this.mAccountService == null) {
                if (IListener != null) {
                    IListener.onError(0);
                }
            } else {
                this.mAccountService.getWeCarAccount(IListener);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
            Log.e(TAG, "getWeCarAccount exception. " + e.toString());
        }
    }

    private boolean removeBindAccount(TxAccount account) {
        if (account == null || TextUtils.isEmpty(account.getId())) {
            return false;
        }
        try {
            if (this.mAccountService != null) {
                Log.w(TAG, "removeBindAccount : uid=" + account.getUserId() + " id=" + account.getId());
                return this.mAccountService.removeTXAccount(account);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
            e.printStackTrace();
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public boolean removeBindAccount(String tag, TxAccount account) {
        Log.w(TAG, "Remove account from " + tag + " targetAccount=" + account);
        return !TextUtils.isEmpty(tag) && removeBindAccount(account);
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void updateSessionKey(String sKey, long nonce) {
        try {
            if (this.mAccountService != null) {
                this.mAccountService.updateSessionKey(sKey, nonce);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
            Log.e(TAG, "account manager is not initialed.");
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public String getSessionKey() {
        WeCarAccount account = getWeCarAccount();
        if (account != null) {
            return account.getSessionKey();
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public long getNonce() {
        try {
            if (this.mAccountService != null) {
                return this.mAccountService.getNonce();
            }
            return -1L;
        } catch (RemoteException e) {
            e.printStackTrace();
            Log.e(TAG, "account manager is not initialed.");
            return -1L;
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public boolean removeWeCarAccount() {
        try {
            if (this.mAccountService != null) {
                Log.w(TAG, "removeWeCarAccount : ");
                return this.mAccountService.removeWeCarAccount();
            }
            return false;
        } catch (RemoteException e) {
            e.printStackTrace();
            Log.e(TAG, "account manager is not initialed.");
            return false;
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public boolean isTAIAuthOk() {
        try {
            if (this.mAccountService != null) {
                return this.mAccountService.isTAIAuthOk();
            }
            Log.e(TAG, "isTAIAuthOk, account manager is not initialed, default return true.");
            return true;
        } catch (RemoteException e) {
            Log.e(TAG, "isTAIAuthOk,error is :" + e.getMessage() + "  return true!");
            e.printStackTrace();
            return true;
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void appletLogin(String request, IMossCallBack iMossCallBack) {
        if (iMossCallBack != null) {
            try {
                if (this.mAccountService != null) {
                    this.mAccountService.appletLogin(request, iMossCallBack);
                } else {
                    Log.e(TAG, "loginWX, account manager is not initialed.");
                    iMossCallBack.onResult("{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}");
                }
            } catch (Exception e) {
                Log.e(TAG, "loginWX, account manager is error:" + e.getMessage());
                try {
                    iMossCallBack.onResult("{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}");
                } catch (RemoteException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void checkAppletSession(String request, IMossCallBack iMossCallBack) {
        if (iMossCallBack != null) {
            try {
                if (this.mAccountService != null) {
                    this.mAccountService.checkAppletSession(request, iMossCallBack);
                } else {
                    Log.e(TAG, "checkAppletSession, account manager is not initialed.");
                    iMossCallBack.onResult("{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}");
                }
            } catch (Exception e) {
                Log.e(TAG, "checkAppletSession, account manager is error:" + e.getMessage());
                try {
                    iMossCallBack.onResult("{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}");
                } catch (RemoteException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getPhoneNumber(String request, IMossCallBack iMossCallBack) {
        if (iMossCallBack != null) {
            try {
                if (this.mAccountService != null) {
                    this.mAccountService.getPhoneNumber(request, iMossCallBack);
                } else {
                    Log.e(TAG, "getPhoneNumber, account manager is not initialed.");
                    iMossCallBack.onResult("{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}");
                }
            } catch (Exception e) {
                Log.e(TAG, "getPhoneNumber, account manager is error:" + e.getMessage());
                try {
                    iMossCallBack.onResult("{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}");
                } catch (RemoteException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getAppletUserInfo(String request, IMossCallBack iMossCallBack) {
        if (iMossCallBack != null) {
            try {
                if (this.mAccountService != null) {
                    this.mAccountService.getAppletUserInfo(request, iMossCallBack);
                } else {
                    Log.e(TAG, "getAppletUserInfo, account manager is not initialed.");
                    iMossCallBack.onResult("{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}");
                }
            } catch (Exception e) {
                Log.e(TAG, "getAppletUserInfo, account manager is error:" + e.getMessage());
                try {
                    iMossCallBack.onResult("{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}");
                } catch (RemoteException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void appletAuth(String request, IMossCallBack iMossCallBack) {
        if (iMossCallBack != null) {
            try {
                if (this.mAccountService != null) {
                    this.mAccountService.AppletAuth(request, iMossCallBack);
                } else {
                    Log.e(TAG, "AppletAuth, account manager is not initialed.");
                    iMossCallBack.onResult("{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}");
                }
            } catch (Exception e) {
                Log.e(TAG, "AppletAuth, account manager is error:" + e.getMessage());
                try {
                    iMossCallBack.onResult("{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}");
                } catch (RemoteException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getAppletAuthStatus(String request, IMossCallBack iMossCallBack) {
        if (iMossCallBack != null) {
            try {
                if (this.mAccountService != null) {
                    this.mAccountService.getAuthStatus(request, iMossCallBack);
                } else {
                    Log.e(TAG, "getAppletAuthStatus, account manager is not initialed.");
                    iMossCallBack.onResult("{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}");
                }
            } catch (Exception e) {
                Log.e(TAG, "getAppletAuthStatus, account manager is error:" + e.getMessage());
                try {
                    iMossCallBack.onResult("{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}");
                } catch (RemoteException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getAppletBaseCarInfo(String request, IMossCallBack iMossCallBack) {
        if (iMossCallBack != null) {
            try {
                if (this.mAccountService != null) {
                    this.mAccountService.getBaseCarInfo(request, iMossCallBack);
                } else {
                    Log.e(TAG, "getAppletBaseCarInfo, account manager is not initialed.");
                    iMossCallBack.onResult("{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}");
                }
            } catch (Exception e) {
                Log.e(TAG, "getAppletBaseCarInfo, account manager is error:" + e.getMessage());
                try {
                    iMossCallBack.onResult("{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}");
                } catch (RemoteException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getTaiAccountInfo(int requestType, Map<String, Object> external, ITAIUserInfo iTAIUserInfo, String packageName) {
        if (iTAIUserInfo != null) {
            try {
                if (this.mAccountService != null) {
                    this.mAccountService.getTaiAccountInfo(requestType, external, packageName, iTAIUserInfo);
                } else {
                    Log.e(TAG, "getTaiAccountInfo, account manager is not initialed.");
                    iTAIUserInfo.onResult("{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}");
                }
            } catch (Exception e) {
                Log.e(TAG, "getTaiAccountInfo, account manager is error:" + e.getMessage());
                try {
                    iTAIUserInfo.onResult("{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}");
                } catch (RemoteException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void logoutTaiAccount(int requestType, Map<String, Object> external, String wecarid, String userid, ITAIUserInfo iTAIUserInfo, String packageName) {
        if (iTAIUserInfo != null) {
            try {
                if (this.mAccountService != null) {
                    this.mAccountService.logoutTaiAccount(requestType, external, packageName, wecarid, userid, iTAIUserInfo);
                } else {
                    Log.e(TAG, "getTaiAccountInfo, account manager is not initialed.");
                    iTAIUserInfo.onResult("{\n    \"err\":-2,\n    \"info\": \"Local Server not start!\"\n}");
                }
            } catch (Exception e) {
                Log.e(TAG, "getTaiAccountInfo, account manager is error:" + e.getMessage());
                try {
                    iTAIUserInfo.onResult("{\n    \"err\":-3,\n    \"info\": \"Local Server error!\"\n}");
                } catch (RemoteException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public WeCarContract getContract(int serviceType) {
        if (this.mAccountService != null) {
            try {
                return this.mAccountService.checkContract(serviceType);
            } catch (RemoteException e) {
                e.printStackTrace();
                Log.e(TAG, "Get contract failed: ", e);
                return null;
            }
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public String getAccountDebugInfo() {
        if (this.mAccountService != null) {
            try {
                return this.mAccountService.getAccountDebugInfo();
            } catch (RemoteException e) {
                e.printStackTrace();
                Log.e(TAG, "getAccountDebugInfo failed: ", e);
                return null;
            }
        }
        return null;
    }
}
