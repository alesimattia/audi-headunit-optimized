package com.spd.xhsntg;

import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import android.view.Surface;
import androidx.annotation.NonNull;
import com.spd.dvr.aidl.IDVRService;
import com.spd.dvr.aidl.IDVRServiceCallback;
import com.spd.dvr.entity.aidl.FileInfo;
import com.spd.dvr.entity.aidl.SettingInfo;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class DvrHelper {
    private static final int CALL_BACK_EVENT_DVR_STATE_CHANGED = 103;
    private static final int CALL_BACK_EVENT_FILE_INFO_CHANGED = 104;
    private static final int CALL_BACK_EVENT_SERVICE_CONNECTED = 101;
    private static final int CALL_BACK_EVENT_SERVICE_DISCONNECTED = 102;
    public static final int DVR_LIST_MASK_ALL = 0;
    public static final int DVR_LIST_MASK_FRONT = 65536;
    public static final int DVR_LIST_TYPE_PHOTO = 1;
    public static final int DVR_LIST_TYPE_VIDEO = 0;
    public static final int DVR_SEEKTO_CMD = 1010;
    private static DvrHelper m_helper;
    private IDVRService mDvrService;
    private Context m_context;
    private String m_name = "com.spd.spddvr";
    private String TAG = "DvrHelper";
    private boolean m_bind_flag = false;
    private boolean m_bind_request_flag = false;
    private boolean m_temp_service_init_flag = false;
    public ServiceConnection mServiceConnection = new ServiceConnection() { // from class: com.spd.xhsntg.DvrHelper.1
        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            Log.d(DvrHelper.this.TAG, "onServiceConnected:");
            DvrHelper.this.mDvrService = IDVRService.Stub.asInterface(service);
            String thread = Thread.currentThread().getName();
            Log.d(DvrHelper.this.TAG, "Thread name1:" + thread);
            try {
                DvrHelper.this.mDvrService.asBinder().linkToDeath(DvrHelper.this.mDeath, 0);
                Log.d(DvrHelper.this.TAG, "onServiceConnected: registerCallback");
                DvrHelper.this.mDvrService.registerDVRServiceCallback(DvrHelper.this.m_name, DvrHelper.this.mCallback);
                DvrHelper.this.m_bind_flag = true;
                DvrHelper.this.m_call_back_handler.sendEmptyMessage(101);
            } catch (RemoteException e) {
                Log.d(DvrHelper.this.TAG, "ERROR:" + e.toString());
            }
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName name) {
            Log.d(DvrHelper.this.TAG, "onServiceDisconnected");
            DvrHelper.this.m_bind_flag = false;
            DvrHelper.this.m_bind_request_flag = false;
            DvrHelper.this.m_call_back_handler.sendEmptyMessage(102);
            DvrHelper.this.bindService(null);
        }
    };
    private IBinder.DeathRecipient mDeath = new IBinder.DeathRecipient() { // from class: com.spd.xhsntg.DvrHelper.2
        @Override // android.os.IBinder.DeathRecipient
        public void binderDied() {
            Log.d(DvrHelper.this.TAG, "service binderDied");
            DvrHelper.this.m_bind_flag = false;
            DvrHelper.this.m_bind_request_flag = false;
            if (DvrHelper.this.mDvrService != null) {
                DvrHelper.this.mDvrService.asBinder().unlinkToDeath(this, 0);
                DvrHelper.this.mDvrService = null;
            }
            DvrHelper.this.m_call_back_handler.sendEmptyMessage(102);
            DvrHelper.this.bindService(null);
        }
    };
    public IDVRServiceCallback mCallback = new IDVRServiceCallback.Stub() { // from class: com.spd.xhsntg.DvrHelper.3
        @Override // com.spd.dvr.aidl.IDVRServiceCallback
        public void onDvrStateChanged(int i, int i1) throws RemoteException {
            Log.d(DvrHelper.this.TAG, "onDvrStateChanged: " + i + " " + i1);
            Message c_msg = new Message();
            c_msg.what = 103;
            c_msg.arg1 = i;
            c_msg.arg2 = i1;
            DvrHelper.this.m_call_back_handler.sendMessage(c_msg);
        }

        @Override // com.spd.dvr.aidl.IDVRServiceCallback
        public void onFileInfoChanged(int i, int i1) throws RemoteException {
            Log.d(DvrHelper.this.TAG, "onFileInfoChanged: " + i + " " + i1);
            Message c_msg = new Message();
            c_msg.what = 104;
            c_msg.arg1 = i;
            c_msg.arg2 = i1;
            DvrHelper.this.m_call_back_handler.sendMessage(c_msg);
        }
    };

    @SuppressLint({"HandlerLeak"})
    private Handler m_call_back_handler = new Handler() { // from class: com.spd.xhsntg.DvrHelper.4
        @Override // android.os.Handler
        public void handleMessage(@NonNull Message msg) {
            super.handleMessage(msg);
            if (DvrHelper.this.m_dvr_ui_call_back != null) {
                switch (msg.what) {
                    case 101:
                        if (msg.obj == null) {
                            for (DvrHelperCallBack c_call_back : DvrHelper.this.m_dvr_ui_call_back) {
                                c_call_back.onServiceConnected();
                            }
                        } else {
                            DvrHelperCallBack c_call_back2 = (DvrHelperCallBack) msg.obj;
                            c_call_back2.onServiceConnected();
                        }
                        break;
                    case 102:
                        for (DvrHelperCallBack c_call_back3 : DvrHelper.this.m_dvr_ui_call_back) {
                            c_call_back3.onServiceDisconnected();
                        }
                        break;
                    case 103:
                        int type = msg.arg1;
                        int arg2 = msg.arg2;
                        for (DvrHelperCallBack c_call_back4 : DvrHelper.this.m_dvr_ui_call_back) {
                            c_call_back4.onDvrStateChanged(type, arg2);
                        }
                        break;
                    case 104:
                        int type2 = msg.arg1;
                        int count = msg.arg2;
                        DvrHelper.this.checkListChanged(type2, count);
                        break;
                }
            }
        }
    };
    private List<DvrHelperCallBack> m_dvr_ui_call_back = new ArrayList();
    private HashMap<Integer, DvrListCallBackRegister> m_list_register_map = new HashMap<>();
    private HashMap<Integer, FileInfo> m_demo_file_info = new HashMap<>();
    private boolean m_demo_mode = false;

    public interface DvrHelperCallBack {
        void onDvrStateChanged(int i, int i2);

        void onFileInfoChanged(int i, int i2);

        void onServiceConnected();

        void onServiceDisconnected();
    }

    public static DvrHelper get() {
        if (m_helper == null) {
            m_helper = new DvrHelper();
        }
        return m_helper;
    }

    public void initDvrHelper(Context context) {
        Log.d(this.TAG, "initDvrHelper: ");
        if (!this.m_temp_service_init_flag) {
            this.m_context = context;
            this.m_temp_service_init_flag = true;
            Intent intent = new Intent("com.spd.service.dvrservice");
            intent.setPackage("com.spd.dvr");
            this.m_context.startService(intent);
        }
    }

    public boolean regsiterCallBack(DvrHelperCallBack c_callback) {
        Log.d(this.TAG, "regsiterCallBack: " + c_callback + " call_back.size" + this.m_dvr_ui_call_back.size());
        boolean c_result = false;
        if (this.m_dvr_ui_call_back.indexOf(c_callback) < 0) {
            this.m_dvr_ui_call_back.add(0, c_callback);
            c_result = true;
        }
        bindService(c_callback);
        return c_result;
    }

    public boolean unregsiterCallBack(DvrHelperCallBack c_callback) {
        Log.d(this.TAG, "unregsiterCallBack: " + c_callback + " call_back.size" + this.m_dvr_ui_call_back.size());
        boolean c_result = false;
        if (this.m_dvr_ui_call_back.indexOf(c_callback) >= 0) {
            this.m_dvr_ui_call_back.remove(c_callback);
            c_result = true;
        }
        if (this.m_dvr_ui_call_back.size() == 0) {
            unbindService();
        }
        return c_result;
    }

    public boolean enterSource(String c_app_name, int c_device_id, int list_type) {
        Log.d(this.TAG, "enterSource: " + c_device_id + " " + list_type + " " + this.m_bind_flag);
        if (this.m_bind_flag && this.mDvrService != null) {
            try {
                Log.d(this.TAG, "enterSource: real");
                this.mDvrService.enterSource(c_app_name);
            } catch (RemoteException e) {
                this.m_bind_flag = false;
                this.m_bind_request_flag = false;
                e.printStackTrace();
            }
        }
        return this.m_bind_flag;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void bindService(DvrHelperCallBack c_callback) {
        Log.d(this.TAG, "bindService: " + c_callback + " " + this.m_bind_flag + " " + this.m_bind_request_flag + " " + this.m_dvr_ui_call_back.size());
        if (this.m_dvr_ui_call_back.size() > 0) {
            Log.d(this.TAG, "bindService: ==0==");
            if (!this.m_bind_flag) {
                Log.d(this.TAG, "bindService: ==1==");
                if (!this.m_bind_request_flag) {
                    Log.d(this.TAG, "bindService: ==2==");
                    this.m_bind_request_flag = true;
                    Intent intent = new Intent("com.spd.service.dvrservice");
                    intent.setPackage("com.spd.dvr");
                    Log.d(this.TAG, "bindService: ");
                    this.m_context.bindService(intent, this.mServiceConnection, 1);
                    return;
                }
                return;
            }
            if (!this.m_call_back_handler.hasMessages(101)) {
                Message c_msg = new Message();
                c_msg.what = 101;
                c_msg.obj = c_callback;
                this.m_call_back_handler.sendMessage(c_msg);
            }
        }
    }

    private void unbindService() {
        Log.d(this.TAG, "unbindService:");
        if (this.m_bind_flag) {
            if (this.mDvrService != null) {
                try {
                    this.mDvrService.unRegisterDVRCallback(this.m_name);
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
                this.m_context.unbindService(this.mServiceConnection);
                this.mDvrService = null;
            }
            this.m_bind_flag = false;
            this.m_bind_request_flag = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkListChanged(int type, int count) {
        Log.d(this.TAG, "checkListChanged: ");
        DvrListCallBackRegister c_list_register = getDvrListRegister(type);
        c_list_register.m_file_item_list.clear();
        c_list_register.m_file_list_count = count;
        for (DvrHelperCallBack c_call_back : this.m_dvr_ui_call_back) {
            c_call_back.onFileInfoChanged(type, count);
        }
    }

    public void refreshFileInfo(int type) {
        Log.d(this.TAG, "refreshFileInfo: " + type);
        if (this.m_demo_mode) {
            for (DvrHelperCallBack c_call_back : this.m_dvr_ui_call_back) {
                c_call_back.onFileInfoChanged(type, 10);
            }
            return;
        }
        if (this.mDvrService != null) {
            DvrListCallBackRegister c_list_register = getDvrListRegister(type);
            c_list_register.refreshList();
        }
    }

    private class DvrListCallBackRegister {
        private int m_current_list_type;
        private HashMap<Integer, FileInfo> m_file_item_list;
        private int m_file_list_count;

        private DvrListCallBackRegister(int listType) {
            this.m_current_list_type = -1;
            this.m_file_list_count = -1;
            this.m_file_item_list = new HashMap<>();
            this.m_current_list_type = listType;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void refreshList() {
            if (DvrHelper.this.mDvrService != null) {
                try {
                    this.m_file_list_count = -1;
                    this.m_file_item_list.clear();
                    for (DvrHelperCallBack c_call_back : DvrHelper.this.m_dvr_ui_call_back) {
                        c_call_back.onFileInfoChanged(this.m_current_list_type, 0);
                    }
                    Log.d(DvrHelper.this.TAG, "DvrListCallBackRegister refreshList: " + this.m_current_list_type);
                    DvrHelper.this.mDvrService.refreshFileInfo(this.m_current_list_type);
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private DvrListCallBackRegister getDvrListRegister(int listType) {
        if (this.m_list_register_map.containsKey(Integer.valueOf(listType))) {
            return this.m_list_register_map.get(Integer.valueOf(listType));
        }
        DvrListCallBackRegister c_result = new DvrListCallBackRegister(listType);
        this.m_list_register_map.put(Integer.valueOf(listType), c_result);
        return c_result;
    }

    private FileInfo getDemoFileInfo(int listType, int c_position) {
        if (this.m_demo_file_info.containsKey(Integer.valueOf(c_position))) {
            return this.m_demo_file_info.get(Integer.valueOf(c_position));
        }
        FileInfo c_result = new FileInfo();
        c_result.setLock(c_position % 2);
        c_result.setType(listType & 1);
        c_result.setFileName("DemoFile" + c_position);
        this.m_demo_file_info.put(Integer.valueOf(c_position), c_result);
        return c_result;
    }

    public FileInfo getFileInfos(int listType, int c_index) {
        if (this.m_demo_mode) {
            FileInfo c_result = getDemoFileInfo(listType, c_index);
            return c_result;
        }
        DvrListCallBackRegister c_list_register = getDvrListRegister(listType);
        if (c_index >= 0 && c_index < c_list_register.m_file_list_count) {
            if (c_list_register.m_file_item_list.containsKey(Integer.valueOf(c_index))) {
                FileInfo c_result2 = (FileInfo) c_list_register.m_file_item_list.get(Integer.valueOf(c_index));
                return c_result2;
            }
            int c_min_position = c_index - 1;
            while (c_min_position >= 0 && c_index - c_min_position <= 5 && !c_list_register.m_file_item_list.containsKey(Integer.valueOf(c_min_position))) {
                c_min_position--;
            }
            int c_min_position2 = c_min_position + 1;
            int c_max_position = c_index + 1;
            while (c_max_position < c_list_register.m_file_list_count && c_max_position - c_index <= 5 && !c_list_register.m_file_item_list.containsKey(Integer.valueOf(c_max_position))) {
                c_max_position++;
            }
            int c_check_count = ((c_max_position - 1) - c_min_position2) + 1;
            try {
                List<FileInfo> c_music_list = this.mDvrService.getFileInfos(listType, c_min_position2, c_check_count);
                if (c_music_list != null) {
                    for (int i = 0; i < c_music_list.size(); i++) {
                        FileInfo c_child_music = c_music_list.get(i);
                        c_list_register.m_file_item_list.put(Integer.valueOf(c_min_position2 + i), c_child_music);
                    }
                }
                FileInfo c_result3 = (FileInfo) c_list_register.m_file_item_list.get(Integer.valueOf(c_index));
                return c_result3;
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    public void seekVideo(int c_time) {
        if (this.mDvrService != null) {
            try {
                this.mDvrService.dvrControlCmd(1010, c_time, 0);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    public void dvrControlCmd(int cmd, int arg0, int arg1) {
        Log.d(this.TAG, "dvrControlCmd: =0=");
        if (this.mDvrService != null) {
            try {
                Log.d(this.TAG, "dvrControlCmd: =1=" + cmd + " " + arg0 + " " + arg1);
                this.mDvrService.dvrControlCmd(cmd, arg0, arg1);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    public void startPreviewByChannel(int channel, Surface surface) {
        Log.d(this.TAG, "startPreviewByChannel: =0=" + this.mDvrService);
        if (!this.m_demo_mode && this.mDvrService != null) {
            try {
                Log.d(this.TAG, "startPreviewByChannel: " + channel + " " + surface);
                this.mDvrService.startPreviewByChannel(channel, surface);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    public void setPlaybackSurface(Surface surface) {
        Log.d(this.TAG, "setPlaybackSurface: ");
        if (!this.m_demo_mode && this.mDvrService != null) {
            try {
                Log.d(this.TAG, "Helper setPlaybackSurface ==0==");
                this.mDvrService.setPlaybackSurface(surface);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    public int getDvtState(int msg) {
        Log.d(this.TAG, "getDvtState: ");
        if (this.mDvrService == null) {
            return -1;
        }
        try {
            int c_result = this.mDvrService.getDvrState(msg);
            return c_result;
        } catch (RemoteException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public SettingInfo getSettingInfo() {
        Log.d(this.TAG, "getSettingInfo: ");
        if (this.mDvrService == null) {
            return null;
        }
        try {
            SettingInfo c_result = this.mDvrService.getSettingInfo();
            return c_result;
        } catch (RemoteException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void setSettingInfo(SettingInfo c_settings) {
        Log.d(this.TAG, "setSettingInfo: ");
        if (this.mDvrService != null) {
            try {
                this.mDvrService.setSettingInfo(c_settings);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    public void operationFileList(int type, int[] indexs, int c_arg) {
        Log.d(this.TAG, "operationFileList: " + type + " " + c_arg);
        if (indexs != null) {
            for (int c_test : indexs) {
                Log.d(this.TAG, "operationFileList: =0= " + c_test);
            }
        }
        if (this.m_demo_mode) {
            for (int c_i : indexs) {
                FileInfo c_file_info = this.m_demo_file_info.get(Integer.valueOf(c_i));
                if (c_arg != 0) {
                    if (c_arg == 1) {
                        c_file_info.setLock(1);
                    } else if (c_arg == 2) {
                        c_file_info.setLock(0);
                    }
                }
            }
            for (DvrHelperCallBack c_call_back : this.m_dvr_ui_call_back) {
                c_call_back.onFileInfoChanged(type, 10);
            }
            return;
        }
        if (this.mDvrService != null) {
            try {
                this.mDvrService.operationFileList(type, indexs, c_arg);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }
}
