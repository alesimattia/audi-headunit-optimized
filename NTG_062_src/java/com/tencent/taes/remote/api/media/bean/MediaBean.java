package com.tencent.taes.remote.api.media.bean;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class MediaBean implements Parcelable {
    public static final Parcelable.Creator<MediaBean> CREATOR = new Parcelable.Creator<MediaBean>() { // from class: com.tencent.taes.remote.api.media.bean.MediaBean.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public MediaBean createFromParcel(Parcel in) {
            return new MediaBean(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public MediaBean[] newArray(int size) {
            return new MediaBean[size];
        }
    };
    public static final String KEY_HOT = "hot";
    public static final String TYPE_BOOK = "book";
    public static final String TYPE_NEWS = "news";
    public static final String TYPE_RADIO = "radio";
    public static final String TYPE_SONG = "song";
    private Bundle extras;
    private String itemAuthor;
    private String itemContainerId;
    private String itemContainerTitle;
    private String itemContent;
    private String itemId;
    private String itemImageUrl;
    private int itemIndex;
    private int itemOffset;
    private int itemPlayDirect;
    private String itemTitle;
    private int itemTotal;
    private String itemType;
    private String itemUrl;

    public MediaBean() {
    }

    public String getItemType() {
        return this.itemType;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }

    public String getItemTitle() {
        return this.itemTitle;
    }

    public void setItemTitle(String itemTitle) {
        this.itemTitle = itemTitle;
    }

    public String getItemAuthor() {
        return this.itemAuthor;
    }

    public void setItemAuthor(String itemAuthor) {
        this.itemAuthor = itemAuthor;
    }

    public String getItemId() {
        return this.itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public int getItemIndex() {
        return this.itemIndex;
    }

    public void setItemIndex(int itemIndex) {
        this.itemIndex = itemIndex;
    }

    public String getItemImageUrl() {
        return this.itemImageUrl;
    }

    public void setItemImageUrl(String itemImageUrl) {
        this.itemImageUrl = itemImageUrl;
    }

    public String getItemContent() {
        return this.itemContent;
    }

    public void setItemContent(String itemContent) {
        this.itemContent = itemContent;
    }

    public boolean isItemPlayDirect() {
        return this.itemPlayDirect == 1;
    }

    public void setItemPlayDirect(int itemPlayDirect) {
        this.itemPlayDirect = itemPlayDirect;
    }

    public String getItemUrl() {
        return this.itemUrl;
    }

    public void setItemUrl(String itemUrl) {
        this.itemUrl = itemUrl;
    }

    public int getItemTotal() {
        return this.itemTotal;
    }

    public void setItemTotal(int itemTotal) {
        this.itemTotal = itemTotal;
    }

    public int getItemOffset() {
        return this.itemOffset;
    }

    public void setItemOffset(int itemOffset) {
        this.itemOffset = itemOffset;
    }

    public String getItemContainerId() {
        return this.itemContainerId;
    }

    public void setItemContainerId(String itemContainerId) {
        this.itemContainerId = itemContainerId;
    }

    public String getItemContainerTitle() {
        return this.itemContainerTitle;
    }

    public void setItemContainerTitle(String itemContainerTitle) {
        this.itemContainerTitle = itemContainerTitle;
    }

    public Bundle getExtras() {
        return this.extras;
    }

    public void setExtras(Bundle extras) {
        this.extras = extras;
    }

    protected MediaBean(Parcel in) {
        this.itemType = in.readString();
        this.itemTitle = in.readString();
        this.itemAuthor = in.readString();
        this.itemId = in.readString();
        this.itemIndex = in.readInt();
        this.itemImageUrl = in.readString();
        this.itemContent = in.readString();
        this.itemPlayDirect = in.readInt();
        this.itemUrl = in.readString();
        this.itemTotal = in.readInt();
        this.itemOffset = in.readInt();
        this.itemContainerId = in.readString();
        this.itemContainerTitle = in.readString();
        this.extras = in.readBundle();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.itemType);
        dest.writeString(this.itemTitle);
        dest.writeString(this.itemAuthor);
        dest.writeString(this.itemId);
        dest.writeInt(this.itemIndex);
        dest.writeString(this.itemImageUrl);
        dest.writeString(this.itemContent);
        dest.writeInt(this.itemPlayDirect);
        dest.writeString(this.itemUrl);
        dest.writeInt(this.itemTotal);
        dest.writeInt(this.itemOffset);
        dest.writeString(this.itemContainerId);
        dest.writeString(this.itemContainerTitle);
        dest.writeBundle(this.extras);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }
}
