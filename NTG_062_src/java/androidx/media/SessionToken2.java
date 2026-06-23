package androidx.media;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.support.v4.media.session.MediaSessionCompat;
import android.text.TextUtils;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RestrictTo;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class SessionToken2 {
    private static final String KEY_ID = "android.media.token.id";
    private static final String KEY_PACKAGE_NAME = "android.media.token.package_name";
    private static final String KEY_SERVICE_NAME = "android.media.token.service_name";
    private static final String KEY_SESSION_TOKEN = "android.media.token.session_token";
    private static final String KEY_TYPE = "android.media.token.type";
    private static final String KEY_UID = "android.media.token.uid";
    public static final int TYPE_LIBRARY_SERVICE = 2;
    public static final int TYPE_SESSION = 0;
    public static final int TYPE_SESSION_SERVICE = 1;
    private static final int UID_UNKNOWN = -1;
    private final ComponentName mComponentName;
    private final String mId;
    private final String mPackageName;
    private final String mServiceName;
    private final MediaSessionCompat.Token mSessionCompatToken;
    private final int mType;
    private final int mUid;

    @Retention(RetentionPolicy.SOURCE)
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public @interface TokenType {
    }

    public SessionToken2(@NonNull Context context, @NonNull ComponentName serviceComponent) {
        this(context, serviceComponent, -1);
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public SessionToken2(@NonNull Context context, @NonNull ComponentName serviceComponent, int uid) {
        if (serviceComponent == null) {
            throw new IllegalArgumentException("serviceComponent shouldn't be null");
        }
        this.mComponentName = serviceComponent;
        this.mPackageName = serviceComponent.getPackageName();
        this.mServiceName = serviceComponent.getClassName();
        PackageManager manager = context.getPackageManager();
        if (uid < 0) {
            try {
                uid = manager.getApplicationInfo(this.mPackageName, 0).uid;
            } catch (PackageManager.NameNotFoundException e) {
                throw new IllegalArgumentException("Cannot find package " + this.mPackageName);
            }
        }
        this.mUid = uid;
        String id = getSessionIdFromService(manager, MediaLibraryService2.SERVICE_INTERFACE, serviceComponent);
        if (id != null) {
            this.mId = id;
            this.mType = 2;
        } else {
            this.mId = getSessionIdFromService(manager, MediaSessionService2.SERVICE_INTERFACE, serviceComponent);
            this.mType = 1;
        }
        if (this.mId == null) {
            throw new IllegalArgumentException("service " + this.mServiceName + " doesn't implement session service nor library service. Use service's full name.");
        }
        this.mSessionCompatToken = null;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    SessionToken2(int uid, int type, String packageName, String serviceName, String id, MediaSessionCompat.Token sessionCompatToken) {
        this.mUid = uid;
        this.mType = type;
        this.mPackageName = packageName;
        this.mServiceName = serviceName;
        this.mComponentName = this.mType == 0 ? null : new ComponentName(packageName, serviceName);
        this.mId = id;
        this.mSessionCompatToken = sessionCompatToken;
    }

    public int hashCode() {
        return this.mType + (31 * (this.mUid + ((this.mPackageName.hashCode() + ((this.mId.hashCode() + ((this.mServiceName != null ? this.mServiceName.hashCode() : 0) * 31)) * 31)) * 31)));
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof SessionToken2)) {
            return false;
        }
        SessionToken2 other = (SessionToken2) obj;
        return this.mUid == other.mUid && TextUtils.equals(this.mPackageName, other.mPackageName) && TextUtils.equals(this.mServiceName, other.mServiceName) && TextUtils.equals(this.mId, other.mId) && this.mType == other.mType;
    }

    public String toString() {
        return "SessionToken {pkg=" + this.mPackageName + " id=" + this.mId + " type=" + this.mType + " service=" + this.mServiceName + " sessionCompatToken=" + this.mSessionCompatToken + "}";
    }

    public int getUid() {
        return this.mUid;
    }

    @NonNull
    public String getPackageName() {
        return this.mPackageName;
    }

    @Nullable
    public String getServiceName() {
        return this.mServiceName;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public ComponentName getComponentName() {
        return this.mComponentName;
    }

    public String getId() {
        return this.mId;
    }

    public int getType() {
        return this.mType;
    }

    public static SessionToken2 fromBundle(@NonNull Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        int uid = bundle.getInt(KEY_UID);
        int type = bundle.getInt(KEY_TYPE, -1);
        String packageName = bundle.getString(KEY_PACKAGE_NAME);
        String serviceName = bundle.getString(KEY_SERVICE_NAME);
        String id = bundle.getString(KEY_ID);
        MediaSessionCompat.Token token = (MediaSessionCompat.Token) bundle.getParcelable(KEY_SESSION_TOKEN);
        switch (type) {
            case 0:
                if (token == null) {
                    throw new IllegalArgumentException("Unexpected token for session, SessionCompat.Token=" + token);
                }
                break;
            case 1:
            case 2:
                if (TextUtils.isEmpty(serviceName)) {
                    throw new IllegalArgumentException("Session service needs service name");
                }
                break;
            default:
                throw new IllegalArgumentException("Invalid type");
        }
        if (TextUtils.isEmpty(packageName) || id == null) {
            throw new IllegalArgumentException("Package name nor ID cannot be null.");
        }
        return new SessionToken2(uid, type, packageName, serviceName, id, token);
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putInt(KEY_UID, this.mUid);
        bundle.putString(KEY_PACKAGE_NAME, this.mPackageName);
        bundle.putString(KEY_SERVICE_NAME, this.mServiceName);
        bundle.putString(KEY_ID, this.mId);
        bundle.putInt(KEY_TYPE, this.mType);
        bundle.putParcelable(KEY_SESSION_TOKEN, this.mSessionCompatToken);
        return bundle;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public static String getSessionId(ResolveInfo resolveInfo) {
        if (resolveInfo == null || resolveInfo.serviceInfo == null) {
            return null;
        }
        if (resolveInfo.serviceInfo.metaData == null) {
            return "";
        }
        return resolveInfo.serviceInfo.metaData.getString(MediaSessionService2.SERVICE_META_DATA, "");
    }

    MediaSessionCompat.Token getSessionCompatToken() {
        return this.mSessionCompatToken;
    }

    private static String getSessionIdFromService(PackageManager manager, String serviceInterface, ComponentName serviceComponent) {
        Intent serviceIntent = new Intent(serviceInterface);
        serviceIntent.setPackage(serviceComponent.getPackageName());
        List<ResolveInfo> list = manager.queryIntentServices(serviceIntent, 128);
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                ResolveInfo resolveInfo = list.get(i);
                if (resolveInfo != null && resolveInfo.serviceInfo != null && TextUtils.equals(resolveInfo.serviceInfo.name, serviceComponent.getClassName())) {
                    return getSessionId(resolveInfo);
                }
            }
            return null;
        }
        return null;
    }
}
