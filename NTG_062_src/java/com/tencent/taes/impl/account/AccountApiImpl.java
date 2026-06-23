package com.tencent.taes.impl.account;

import android.util.Log;
import com.tencent.taes.api.account.IAccountApi;
import com.tencent.taes.framework.APIResult;
import com.tencent.taes.framework.BuildConfig;
import com.tencent.taes.framework.TAESFrameworkManager;
import com.tencent.taes.framework.listener.TAESCommonListener;
import com.tencent.taes.impl.base.AbstractApi;
import com.tencent.taes.remote.ServerCompConstant;
import com.tencent.taes.remote.api.account.bean.TxAccount;
import com.tencent.taes.remote.api.account.bean.WeCarAccount;
import com.tencent.taes.remote.api.account.bean.WeCarContract;
import com.tencent.taes.remote.api.account.listener.AccountListener;
import com.tencent.taes.remote.api.account.listener.IAccountClientEventListener;
import com.tencent.taes.remote.api.account.listener.IMossCallBack;
import com.tencent.taes.remote.api.account.listener.ITAIUserInfo;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class AccountApiImpl extends AbstractApi implements IAccountApi {
    private static final String TAG = AccountApiImpl.class.getSimpleName();
    private com.tencent.taes.remote.api.account.IAccountApi mAccountApi = null;

    public AccountApiImpl() {
        TAESFrameworkManager.getInstance().registerCompLoadListener(ServerCompConstant.ACCOUNT, new TAESCommonListener() { // from class: com.tencent.taes.impl.account.AccountApiImpl.1
            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onSuccess() {
                AccountApiImpl.this.getAccountApi();
            }

            @Override // com.tencent.taes.framework.listener.TAESCommonListener
            public void onFail(int i, String s) {
                Log.e(AccountApiImpl.TAG, "AccountloadFail：errorCode = " + i + ", msg = " + s);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public com.tencent.taes.remote.api.account.IAccountApi getAccountApi() {
        if (this.mAccountApi == null) {
            APIResult<com.tencent.taes.remote.api.account.IAccountApi> apiAPIResult = TAESFrameworkManager.getInstance().getApi(ServerCompConstant.ACCOUNT, com.tencent.taes.remote.api.account.IAccountApi.class, null);
            if (apiAPIResult.isSuccess()) {
                this.mAccountApi = apiAPIResult.data;
            } else {
                Log.d(TAG, "getApi Fail:" + apiAPIResult.codeDescription());
            }
        }
        return this.mAccountApi;
    }

    @Override // com.tencent.taes.api.base.BaseApi
    public String getApiVersion() {
        return BuildConfig.VERSION_NAME;
    }

    @Override // com.tencent.taes.impl.base.AbstractApi
    public void dispose() {
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public WeCarAccount getWeCarAccount() {
        if (getAccountApi() != null && this.mAccountApi != null) {
            return this.mAccountApi.getWeCarAccount();
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getWeCarAccount(AccountListener listener) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.getWeCarAccount(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void registerAccountEventReceiverListener(IAccountClientEventListener listener) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.registerAccountEventReceiverListener(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void unregisterAccountEventReceiverListener(IAccountClientEventListener listener) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.unregisterAccountEventReceiverListener(listener);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public boolean removeBindAccount(String tag, TxAccount account) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            return this.mAccountApi.removeBindAccount(tag, account);
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void updateSessionKey(String sKey, long nonce) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.updateSessionKey(sKey, nonce);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public String getSessionKey() {
        if (getAccountApi() != null && this.mAccountApi != null) {
            return this.mAccountApi.getSessionKey();
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public long getNonce() {
        if (getAccountApi() != null && this.mAccountApi != null) {
            return this.mAccountApi.getNonce();
        }
        return 0L;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public boolean removeWeCarAccount() {
        if (getAccountApi() != null && this.mAccountApi != null) {
            return this.mAccountApi.removeWeCarAccount();
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public boolean isTAIAuthOk() {
        if (getAccountApi() != null && this.mAccountApi != null) {
            return this.mAccountApi.isTAIAuthOk();
        }
        return false;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void appletLogin(String request, IMossCallBack iMossCallBack) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.appletLogin(request, iMossCallBack);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void checkAppletSession(String request, IMossCallBack iMossCallBack) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.checkAppletSession(request, iMossCallBack);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getPhoneNumber(String request, IMossCallBack iMossCallBack) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.getPhoneNumber(request, iMossCallBack);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getAppletUserInfo(String request, IMossCallBack iMossCallBack) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.getAppletUserInfo(request, iMossCallBack);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void appletAuth(String request, IMossCallBack iMossCallBack) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.appletAuth(request, iMossCallBack);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getAppletAuthStatus(String request, IMossCallBack iMossCallBack) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.getAppletAuthStatus(request, iMossCallBack);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getAppletBaseCarInfo(String request, IMossCallBack iMossCallBack) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.getAppletBaseCarInfo(request, iMossCallBack);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void getTaiAccountInfo(int requestType, Map<String, Object> external, ITAIUserInfo iTAIUserInfo, String packageName) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.getTaiAccountInfo(requestType, external, iTAIUserInfo, packageName);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public void logoutTaiAccount(int requestType, Map<String, Object> external, String weCarId, String userId, ITAIUserInfo iTAIUserInfo, String packageName) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            this.mAccountApi.logoutTaiAccount(requestType, external, weCarId, userId, iTAIUserInfo, packageName);
        }
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public WeCarContract getContract(int serviceType) {
        if (getAccountApi() != null && this.mAccountApi != null) {
            return this.mAccountApi.getContract(serviceType);
        }
        return null;
    }

    @Override // com.tencent.taes.remote.api.account.IAccountApi
    public String getAccountDebugInfo() {
        if (getAccountApi() != null && this.mAccountApi != null) {
            return this.mAccountApi.getAccountDebugInfo();
        }
        return null;
    }
}
