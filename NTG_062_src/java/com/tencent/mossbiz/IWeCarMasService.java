package com.tencent.mossbiz;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.tencent.mossbiz.IWeCarAudioService;
import com.tencent.mossbiz.IWeCarMasAudioCallback;
import com.tencent.mossbiz.IWeCarMasCallback;
import com.tencent.mossbiz.IWeCarMasServiceCallback;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public interface IWeCarMasService extends IInterface {
    void addCollectionWithAppId(String str) throws RemoteException;

    void addPlayListener(IWeCarMasAudioCallback iWeCarMasAudioCallback) throws RemoteException;

    void addRecentApp(String str) throws RemoteException;

    void addRecentAppWithTime(String str, long j) throws RemoteException;

    void addSearchHistory(String str) throws RemoteException;

    void clearAllAuth() throws RemoteException;

    void clearAuth(String str, String str2, String str3) throws RemoteException;

    void clearRecentAppList() throws RemoteException;

    void clearSearchHistory() throws RemoteException;

    String getAllAuthInfo() throws RemoteException;

    Map getAuth(String str, String str2, String str3) throws RemoteException;

    String getChannelId() throws RemoteException;

    List<String> getCollectedAppIdList() throws RemoteException;

    void getLabelCategory(String str, IWeCarMasCallback iWeCarMasCallback) throws RemoteException;

    void getMossCategoryList(IWeCarMasCallback iWeCarMasCallback) throws RemoteException;

    int getMossContextEnv() throws RemoteException;

    int getMossEvn() throws RemoteException;

    void getNewLabelCategory(IWeCarMasCallback iWeCarMasCallback) throws RemoteException;

    Map getRecentAppAndTimeList() throws RemoteException;

    List<String> getRecentAppList() throws RemoteException;

    List<String> getSearchHistoryList() throws RemoteException;

    boolean hasAuth(String str, String str2, String str3, String str4) throws RemoteException;

    void initAudioListener(IWeCarMasAudioCallback iWeCarMasAudioCallback) throws RemoteException;

    void initAudioService(IWeCarAudioService iWeCarAudioService) throws RemoteException;

    boolean isLogin() throws RemoteException;

    boolean isRecentNeedRefresh() throws RemoteException;

    void loadAllAppsFromNet(IWeCarMasCallback iWeCarMasCallback) throws RemoteException;

    String mossSdkVersion() throws RemoteException;

    String musicInfo() throws RemoteException;

    void onAudioNext() throws RemoteException;

    boolean onAudioPause() throws RemoteException;

    boolean onAudioPlayer(String str) throws RemoteException;

    void onAudioPre() throws RemoteException;

    boolean onAudioState() throws RemoteException;

    boolean onAudioStop() throws RemoteException;

    boolean onPlayer() throws RemoteException;

    void onReport(IWeCarMasCallback iWeCarMasCallback) throws RemoteException;

    boolean openMossApp(String str, String str2) throws RemoteException;

    void playTts(String str) throws RemoteException;

    void registerCallback(IWeCarMasServiceCallback iWeCarMasServiceCallback) throws RemoteException;

    void removeCollectionWithAppId(String str) throws RemoteException;

    boolean removeRecentApp(String str) throws RemoteException;

    void requestLoginQrCode(String str, IWeCarMasCallback iWeCarMasCallback) throws RemoteException;

    void saveRecentAppIdListToDisk() throws RemoteException;

    void searchAppCategoryFromNet(String str, String str2, IWeCarMasCallback iWeCarMasCallback) throws RemoteException;

    void searchAppsFromNet(String str, String str2, String str3, IWeCarMasCallback iWeCarMasCallback) throws RemoteException;

    boolean seekBackgroundAudio(int i) throws RemoteException;

    void setAuth(String str, String str2, String str3, String str4) throws RemoteException;

    void setChannelId(String str) throws RemoteException;

    void setMossContextEnv(int i) throws RemoteException;

    void setMossEvn(int i) throws RemoteException;

    void test(IWeCarMasServiceCallback iWeCarMasServiceCallback) throws RemoteException;

    void unregisterCallback(IWeCarMasServiceCallback iWeCarMasServiceCallback) throws RemoteException;

    public static abstract class Stub extends Binder implements IWeCarMasService {
        private static final String DESCRIPTOR = "com.tencent.mossbiz.IWeCarMasService";
        static final int TRANSACTION_addCollectionWithAppId = 18;
        static final int TRANSACTION_addPlayListener = 41;
        static final int TRANSACTION_addRecentApp = 15;
        static final int TRANSACTION_addRecentAppWithTime = 16;
        static final int TRANSACTION_addSearchHistory = 23;
        static final int TRANSACTION_clearAllAuth = 7;
        static final int TRANSACTION_clearAuth = 6;
        static final int TRANSACTION_clearRecentAppList = 12;
        static final int TRANSACTION_clearSearchHistory = 22;
        static final int TRANSACTION_getAllAuthInfo = 9;
        static final int TRANSACTION_getAuth = 8;
        static final int TRANSACTION_getChannelId = 31;
        static final int TRANSACTION_getCollectedAppIdList = 19;
        static final int TRANSACTION_getLabelCategory = 28;
        static final int TRANSACTION_getMossCategoryList = 27;
        static final int TRANSACTION_getMossContextEnv = 34;
        static final int TRANSACTION_getMossEvn = 32;
        static final int TRANSACTION_getNewLabelCategory = 29;
        static final int TRANSACTION_getRecentAppAndTimeList = 11;
        static final int TRANSACTION_getRecentAppList = 10;
        static final int TRANSACTION_getSearchHistoryList = 21;
        static final int TRANSACTION_hasAuth = 5;
        static final int TRANSACTION_initAudioListener = 53;
        static final int TRANSACTION_initAudioService = 51;
        static final int TRANSACTION_isLogin = 40;
        static final int TRANSACTION_isRecentNeedRefresh = 14;
        static final int TRANSACTION_loadAllAppsFromNet = 24;
        static final int TRANSACTION_mossSdkVersion = 37;
        static final int TRANSACTION_musicInfo = 52;
        static final int TRANSACTION_onAudioNext = 49;
        static final int TRANSACTION_onAudioPause = 44;
        static final int TRANSACTION_onAudioPlayer = 43;
        static final int TRANSACTION_onAudioPre = 50;
        static final int TRANSACTION_onAudioState = 45;
        static final int TRANSACTION_onAudioStop = 46;
        static final int TRANSACTION_onPlayer = 42;
        static final int TRANSACTION_onReport = 48;
        static final int TRANSACTION_openMossApp = 36;
        static final int TRANSACTION_playTts = 38;
        static final int TRANSACTION_registerCallback = 1;
        static final int TRANSACTION_removeCollectionWithAppId = 20;
        static final int TRANSACTION_removeRecentApp = 13;
        static final int TRANSACTION_requestLoginQrCode = 39;
        static final int TRANSACTION_saveRecentAppIdListToDisk = 17;
        static final int TRANSACTION_searchAppCategoryFromNet = 26;
        static final int TRANSACTION_searchAppsFromNet = 25;
        static final int TRANSACTION_seekBackgroundAudio = 47;
        static final int TRANSACTION_setAuth = 4;
        static final int TRANSACTION_setChannelId = 30;
        static final int TRANSACTION_setMossContextEnv = 35;
        static final int TRANSACTION_setMossEvn = 33;
        static final int TRANSACTION_test = 3;
        static final int TRANSACTION_unregisterCallback = 2;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IWeCarMasService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IWeCarMasService)) {
                return (IWeCarMasService) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i == 1598968902) {
                parcel2.writeString(DESCRIPTOR);
                return true;
            }
            switch (i) {
                case 1:
                    parcel.enforceInterface(DESCRIPTOR);
                    registerCallback(IWeCarMasServiceCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    unregisterCallback(IWeCarMasServiceCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    test(IWeCarMasServiceCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    setAuth(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 5:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zHasAuth = hasAuth(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeInt(zHasAuth ? 1 : 0);
                    return true;
                case 6:
                    parcel.enforceInterface(DESCRIPTOR);
                    clearAuth(parcel.readString(), parcel.readString(), parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 7:
                    parcel.enforceInterface(DESCRIPTOR);
                    clearAllAuth();
                    parcel2.writeNoException();
                    return true;
                case 8:
                    parcel.enforceInterface(DESCRIPTOR);
                    Map auth = getAuth(parcel.readString(), parcel.readString(), parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeMap(auth);
                    return true;
                case 9:
                    parcel.enforceInterface(DESCRIPTOR);
                    String allAuthInfo = getAllAuthInfo();
                    parcel2.writeNoException();
                    parcel2.writeString(allAuthInfo);
                    return true;
                case 10:
                    parcel.enforceInterface(DESCRIPTOR);
                    List<String> recentAppList = getRecentAppList();
                    parcel2.writeNoException();
                    parcel2.writeStringList(recentAppList);
                    return true;
                case 11:
                    parcel.enforceInterface(DESCRIPTOR);
                    Map recentAppAndTimeList = getRecentAppAndTimeList();
                    parcel2.writeNoException();
                    parcel2.writeMap(recentAppAndTimeList);
                    return true;
                case 12:
                    parcel.enforceInterface(DESCRIPTOR);
                    clearRecentAppList();
                    parcel2.writeNoException();
                    return true;
                case 13:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zRemoveRecentApp = removeRecentApp(parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeInt(zRemoveRecentApp ? 1 : 0);
                    return true;
                case 14:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsRecentNeedRefresh = isRecentNeedRefresh();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsRecentNeedRefresh ? 1 : 0);
                    return true;
                case 15:
                    parcel.enforceInterface(DESCRIPTOR);
                    addRecentApp(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 16:
                    parcel.enforceInterface(DESCRIPTOR);
                    addRecentAppWithTime(parcel.readString(), parcel.readLong());
                    parcel2.writeNoException();
                    return true;
                case 17:
                    parcel.enforceInterface(DESCRIPTOR);
                    saveRecentAppIdListToDisk();
                    parcel2.writeNoException();
                    return true;
                case 18:
                    parcel.enforceInterface(DESCRIPTOR);
                    addCollectionWithAppId(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 19:
                    parcel.enforceInterface(DESCRIPTOR);
                    List<String> collectedAppIdList = getCollectedAppIdList();
                    parcel2.writeNoException();
                    parcel2.writeStringList(collectedAppIdList);
                    return true;
                case 20:
                    parcel.enforceInterface(DESCRIPTOR);
                    removeCollectionWithAppId(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 21:
                    parcel.enforceInterface(DESCRIPTOR);
                    List<String> searchHistoryList = getSearchHistoryList();
                    parcel2.writeNoException();
                    parcel2.writeStringList(searchHistoryList);
                    return true;
                case 22:
                    parcel.enforceInterface(DESCRIPTOR);
                    clearSearchHistory();
                    parcel2.writeNoException();
                    return true;
                case 23:
                    parcel.enforceInterface(DESCRIPTOR);
                    addSearchHistory(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 24:
                    parcel.enforceInterface(DESCRIPTOR);
                    loadAllAppsFromNet(IWeCarMasCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 25:
                    parcel.enforceInterface(DESCRIPTOR);
                    searchAppsFromNet(parcel.readString(), parcel.readString(), parcel.readString(), IWeCarMasCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 26:
                    parcel.enforceInterface(DESCRIPTOR);
                    searchAppCategoryFromNet(parcel.readString(), parcel.readString(), IWeCarMasCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 27:
                    parcel.enforceInterface(DESCRIPTOR);
                    getMossCategoryList(IWeCarMasCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 28:
                    parcel.enforceInterface(DESCRIPTOR);
                    getLabelCategory(parcel.readString(), IWeCarMasCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 29:
                    parcel.enforceInterface(DESCRIPTOR);
                    getNewLabelCategory(IWeCarMasCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 30:
                    parcel.enforceInterface(DESCRIPTOR);
                    setChannelId(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 31:
                    parcel.enforceInterface(DESCRIPTOR);
                    String channelId = getChannelId();
                    parcel2.writeNoException();
                    parcel2.writeString(channelId);
                    return true;
                case 32:
                    parcel.enforceInterface(DESCRIPTOR);
                    int mossEvn = getMossEvn();
                    parcel2.writeNoException();
                    parcel2.writeInt(mossEvn);
                    return true;
                case 33:
                    parcel.enforceInterface(DESCRIPTOR);
                    setMossEvn(parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 34:
                    parcel.enforceInterface(DESCRIPTOR);
                    int mossContextEnv = getMossContextEnv();
                    parcel2.writeNoException();
                    parcel2.writeInt(mossContextEnv);
                    return true;
                case 35:
                    parcel.enforceInterface(DESCRIPTOR);
                    setMossContextEnv(parcel.readInt());
                    parcel2.writeNoException();
                    return true;
                case 36:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zOpenMossApp = openMossApp(parcel.readString(), parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeInt(zOpenMossApp ? 1 : 0);
                    return true;
                case 37:
                    parcel.enforceInterface(DESCRIPTOR);
                    String strMossSdkVersion = mossSdkVersion();
                    parcel2.writeNoException();
                    parcel2.writeString(strMossSdkVersion);
                    return true;
                case 38:
                    parcel.enforceInterface(DESCRIPTOR);
                    playTts(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 39:
                    parcel.enforceInterface(DESCRIPTOR);
                    requestLoginQrCode(parcel.readString(), IWeCarMasCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 40:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zIsLogin = isLogin();
                    parcel2.writeNoException();
                    parcel2.writeInt(zIsLogin ? 1 : 0);
                    return true;
                case 41:
                    parcel.enforceInterface(DESCRIPTOR);
                    addPlayListener(IWeCarMasAudioCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 42:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zOnPlayer = onPlayer();
                    parcel2.writeNoException();
                    parcel2.writeInt(zOnPlayer ? 1 : 0);
                    return true;
                case 43:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zOnAudioPlayer = onAudioPlayer(parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeInt(zOnAudioPlayer ? 1 : 0);
                    return true;
                case 44:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zOnAudioPause = onAudioPause();
                    parcel2.writeNoException();
                    parcel2.writeInt(zOnAudioPause ? 1 : 0);
                    return true;
                case 45:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zOnAudioState = onAudioState();
                    parcel2.writeNoException();
                    parcel2.writeInt(zOnAudioState ? 1 : 0);
                    return true;
                case 46:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zOnAudioStop = onAudioStop();
                    parcel2.writeNoException();
                    parcel2.writeInt(zOnAudioStop ? 1 : 0);
                    return true;
                case 47:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean zSeekBackgroundAudio = seekBackgroundAudio(parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeInt(zSeekBackgroundAudio ? 1 : 0);
                    return true;
                case 48:
                    parcel.enforceInterface(DESCRIPTOR);
                    onReport(IWeCarMasCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case TRANSACTION_onAudioNext /* 49 */:
                    parcel.enforceInterface(DESCRIPTOR);
                    onAudioNext();
                    parcel2.writeNoException();
                    return true;
                case 50:
                    parcel.enforceInterface(DESCRIPTOR);
                    onAudioPre();
                    parcel2.writeNoException();
                    return true;
                case TRANSACTION_initAudioService /* 51 */:
                    parcel.enforceInterface(DESCRIPTOR);
                    initAudioService(IWeCarAudioService.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case TRANSACTION_musicInfo /* 52 */:
                    parcel.enforceInterface(DESCRIPTOR);
                    String strMusicInfo = musicInfo();
                    parcel2.writeNoException();
                    parcel2.writeString(strMusicInfo);
                    return true;
                case TRANSACTION_initAudioListener /* 53 */:
                    parcel.enforceInterface(DESCRIPTOR);
                    initAudioListener(IWeCarMasAudioCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        private static class Proxy implements IWeCarMasService {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void registerCallback(IWeCarMasServiceCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void unregisterCallback(IWeCarMasServiceCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void test(IWeCarMasServiceCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void setAuth(String userid, String wecarid, String pkgName, String scope) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(userid);
                    _data.writeString(wecarid);
                    _data.writeString(pkgName);
                    _data.writeString(scope);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean hasAuth(String userid, String wecarid, String pkgName, String scope) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(userid);
                    _data.writeString(wecarid);
                    _data.writeString(pkgName);
                    _data.writeString(scope);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void clearAuth(String userid, String wecarid, String pkgName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(userid);
                    _data.writeString(wecarid);
                    _data.writeString(pkgName);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void clearAllAuth() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public Map getAuth(String userid, String wecarid, String pkgName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(userid);
                    _data.writeString(wecarid);
                    _data.writeString(pkgName);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                    ClassLoader cl = getClass().getClassLoader();
                    Map _result = _reply.readHashMap(cl);
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public String getAllAuthInfo() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public List<String> getRecentAppList() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                    List<String> _result = _reply.createStringArrayList();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public Map getRecentAppAndTimeList() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                    ClassLoader cl = getClass().getClassLoader();
                    Map _result = _reply.readHashMap(cl);
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void clearRecentAppList() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(12, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean removeRecentApp(String recentAppId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(recentAppId);
                    this.mRemote.transact(13, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean isRecentNeedRefresh() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(14, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void addRecentApp(String appId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(appId);
                    this.mRemote.transact(15, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void addRecentAppWithTime(String appId, long time) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(appId);
                    _data.writeLong(time);
                    this.mRemote.transact(16, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void saveRecentAppIdListToDisk() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(17, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void addCollectionWithAppId(String appId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(appId);
                    this.mRemote.transact(18, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public List<String> getCollectedAppIdList() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(19, _data, _reply, 0);
                    _reply.readException();
                    List<String> _result = _reply.createStringArrayList();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void removeCollectionWithAppId(String appId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(appId);
                    this.mRemote.transact(20, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public List<String> getSearchHistoryList() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(21, _data, _reply, 0);
                    _reply.readException();
                    List<String> _result = _reply.createStringArrayList();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void clearSearchHistory() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(22, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void addSearchHistory(String searchWords) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(searchWords);
                    this.mRemote.transact(23, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void loadAllAppsFromNet(IWeCarMasCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(24, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void searchAppsFromNet(String keywords, String domain, String intent, IWeCarMasCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(keywords);
                    _data.writeString(domain);
                    _data.writeString(intent);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(25, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void searchAppCategoryFromNet(String keywords, String label, IWeCarMasCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(keywords);
                    _data.writeString(label);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(26, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void getMossCategoryList(IWeCarMasCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(27, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void getLabelCategory(String label, IWeCarMasCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(label);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(28, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void getNewLabelCategory(IWeCarMasCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(29, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void setChannelId(String channelId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(channelId);
                    this.mRemote.transact(30, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public String getChannelId() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(31, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public int getMossEvn() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(32, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void setMossEvn(int evn) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(evn);
                    this.mRemote.transact(33, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public int getMossContextEnv() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(34, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void setMossContextEnv(int env) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(env);
                    this.mRemote.transact(35, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean openMossApp(String appId, String pagePath) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(appId);
                    _data.writeString(pagePath);
                    this.mRemote.transact(36, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public String mossSdkVersion() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(37, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void playTts(String tts) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(tts);
                    this.mRemote.transact(38, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void requestLoginQrCode(String pkgName, IWeCarMasCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(39, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean isLogin() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(40, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void addPlayListener(IWeCarMasAudioCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(41, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean onPlayer() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(42, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean onAudioPlayer(String url) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(url);
                    this.mRemote.transact(43, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean onAudioPause() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(44, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean onAudioState() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(45, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean onAudioStop() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(46, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public boolean seekBackgroundAudio(int position) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(position);
                    this.mRemote.transact(47, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void onReport(IWeCarMasCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(48, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void onAudioNext() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(Stub.TRANSACTION_onAudioNext, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void onAudioPre() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(50, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void initAudioService(IWeCarAudioService callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(Stub.TRANSACTION_initAudioService, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public String musicInfo() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(Stub.TRANSACTION_musicInfo, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.tencent.mossbiz.IWeCarMasService
            public void initAudioListener(IWeCarMasAudioCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(Stub.TRANSACTION_initAudioListener, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
