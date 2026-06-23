package androidx.media;

import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.RatingCompat;
import androidx.media.MediaItem2;
import androidx.media.MediaMetadata2;
import androidx.media.MediaSession2;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
class MediaUtils2 {
    static final String TAG = "MediaUtils2";

    private MediaUtils2() {
    }

    static MediaBrowserCompat.MediaItem createMediaItem(MediaItem2 item2) {
        MediaDescriptionCompat descCompat;
        if (item2 == null) {
            return null;
        }
        MediaMetadata2 metadata = item2.getMetadata();
        if (metadata == null) {
            descCompat = new MediaDescriptionCompat.Builder().setMediaId(item2.getMediaId()).build();
        } else {
            MediaDescriptionCompat.Builder builder = new MediaDescriptionCompat.Builder().setMediaId(item2.getMediaId()).setSubtitle(metadata.getText("android.media.metadata.DISPLAY_SUBTITLE")).setDescription(metadata.getText("android.media.metadata.DISPLAY_DESCRIPTION")).setIconBitmap(metadata.getBitmap("android.media.metadata.DISPLAY_ICON")).setExtras(metadata.getExtras());
            String title = metadata.getString("android.media.metadata.TITLE");
            if (title != null) {
                builder.setTitle(title);
            } else {
                builder.setTitle(metadata.getString("android.media.metadata.DISPLAY_TITLE"));
            }
            String displayIconUri = metadata.getString("android.media.metadata.DISPLAY_ICON_URI");
            if (displayIconUri != null) {
                builder.setIconUri(Uri.parse(displayIconUri));
            }
            String mediaUri = metadata.getString("android.media.metadata.MEDIA_URI");
            if (mediaUri != null) {
                builder.setMediaUri(Uri.parse(mediaUri));
            }
            descCompat = builder.build();
        }
        return new MediaBrowserCompat.MediaItem(descCompat, item2.getFlags());
    }

    static MediaItem2 createMediaItem2(MediaBrowserCompat.MediaItem item) {
        if (item == null || item.getMediaId() == null) {
            return null;
        }
        MediaMetadata2 metadata2 = createMediaMetadata2(item.getDescription());
        return new MediaItem2.Builder(item.getFlags()).setMediaId(item.getMediaId()).setMetadata(metadata2).build();
    }

    static List<MediaBrowserCompat.MediaItem> fromMediaItem2List(List<MediaItem2> items) {
        if (items == null) {
            return null;
        }
        List<MediaBrowserCompat.MediaItem> result = new ArrayList<>();
        for (int i = 0; i < items.size(); i++) {
            result.add(createMediaItem(items.get(i)));
        }
        return result;
    }

    static List<MediaItem2> toMediaItem2List(List<MediaBrowserCompat.MediaItem> items) {
        if (items == null) {
            return null;
        }
        List<MediaItem2> result = new ArrayList<>();
        for (int i = 0; i < items.size(); i++) {
            result.add(createMediaItem2(items.get(i)));
        }
        return result;
    }

    static MediaMetadata2 createMediaMetadata2(MediaDescriptionCompat descCompat) {
        if (descCompat == null) {
            return null;
        }
        MediaMetadata2.Builder metadata2Builder = new MediaMetadata2.Builder();
        metadata2Builder.putString("android.media.metadata.MEDIA_ID", descCompat.getMediaId());
        CharSequence title = descCompat.getTitle();
        if (title != null) {
            metadata2Builder.putText("android.media.metadata.DISPLAY_TITLE", title);
        }
        CharSequence description = descCompat.getDescription();
        if (description != null) {
            metadata2Builder.putText("android.media.metadata.DISPLAY_DESCRIPTION", descCompat.getDescription());
        }
        CharSequence subtitle = descCompat.getSubtitle();
        if (subtitle != null) {
            metadata2Builder.putText("android.media.metadata.DISPLAY_SUBTITLE", subtitle);
        }
        Bitmap icon = descCompat.getIconBitmap();
        if (icon != null) {
            metadata2Builder.putBitmap("android.media.metadata.DISPLAY_ICON", icon);
        }
        Uri iconUri = descCompat.getIconUri();
        if (iconUri != null) {
            metadata2Builder.putText("android.media.metadata.DISPLAY_ICON_URI", iconUri.toString());
        }
        Bundle bundle = descCompat.getExtras();
        if (bundle != null) {
            metadata2Builder.setExtras(descCompat.getExtras());
        }
        Uri mediaUri = descCompat.getMediaUri();
        if (mediaUri != null) {
            metadata2Builder.putText("android.media.metadata.MEDIA_URI", mediaUri.toString());
        }
        return metadata2Builder.build();
    }

    MediaMetadata2 createMediaMetadata2(MediaMetadataCompat metadataCompat) {
        if (metadataCompat == null) {
            return null;
        }
        return new MediaMetadata2(metadataCompat.getBundle());
    }

    MediaMetadataCompat createMediaMetadataCompat(MediaMetadata2 metadata2) {
        if (metadata2 == null) {
            return null;
        }
        MediaMetadataCompat.Builder builder = new MediaMetadataCompat.Builder();
        List<String> skippedKeys = new ArrayList<>();
        Bundle bundle = metadata2.toBundle();
        for (String key : bundle.keySet()) {
            Object value = bundle.get(key);
            if (value instanceof CharSequence) {
                builder.putText(key, (CharSequence) value);
            } else if (value instanceof Rating2) {
                builder.putRating(key, createRatingCompat((Rating2) value));
            } else if (value instanceof Bitmap) {
                builder.putBitmap(key, (Bitmap) value);
            } else if (value instanceof Long) {
                builder.putLong(key, ((Long) value).longValue());
            } else {
                skippedKeys.add(key);
            }
        }
        MediaMetadataCompat result = builder.build();
        for (String key2 : skippedKeys) {
            Object value2 = bundle.get(key2);
            if (value2 instanceof Float) {
                result.getBundle().putFloat(key2, ((Float) value2).floatValue());
            } else if (MediaMetadata2.METADATA_KEY_EXTRAS.equals(value2)) {
                result.getBundle().putBundle(key2, (Bundle) value2);
            }
        }
        return result;
    }

    Rating2 createRating2(RatingCompat ratingCompat) {
        if (ratingCompat == null) {
            return null;
        }
        if (!ratingCompat.isRated()) {
            return Rating2.newUnratedRating(ratingCompat.getRatingStyle());
        }
        switch (ratingCompat.getRatingStyle()) {
            case 1:
                return Rating2.newHeartRating(ratingCompat.hasHeart());
            case 2:
                return Rating2.newThumbRating(ratingCompat.isThumbUp());
            case 3:
            case 4:
            case 5:
                return Rating2.newStarRating(ratingCompat.getRatingStyle(), ratingCompat.getStarRating());
            case 6:
                return Rating2.newPercentageRating(ratingCompat.getPercentRating());
            default:
                return null;
        }
    }

    RatingCompat createRatingCompat(Rating2 rating2) {
        if (rating2 == null) {
            return null;
        }
        if (!rating2.isRated()) {
            return RatingCompat.newUnratedRating(rating2.getRatingStyle());
        }
        switch (rating2.getRatingStyle()) {
            case 1:
                return RatingCompat.newHeartRating(rating2.hasHeart());
            case 2:
                return RatingCompat.newThumbRating(rating2.isThumbUp());
            case 3:
            case 4:
            case 5:
                return RatingCompat.newStarRating(rating2.getRatingStyle(), rating2.getStarRating());
            case 6:
                return RatingCompat.newPercentageRating(rating2.getPercentRating());
            default:
                return null;
        }
    }

    static Parcelable[] toMediaItem2ParcelableArray(List<MediaItem2> playlist) {
        Parcelable itemBundle;
        if (playlist == null) {
            return null;
        }
        List<Parcelable> parcelableList = new ArrayList<>();
        for (int i = 0; i < playlist.size(); i++) {
            MediaItem2 item = playlist.get(i);
            if (item != null && (itemBundle = item.toBundle()) != null) {
                parcelableList.add(itemBundle);
            }
        }
        return (Parcelable[]) parcelableList.toArray(new Parcelable[0]);
    }

    static List<MediaItem2> fromMediaItem2ParcelableArray(Parcelable[] itemParcelableList) {
        MediaItem2 item;
        List<MediaItem2> playlist = new ArrayList<>();
        if (itemParcelableList != null) {
            for (int i = 0; i < itemParcelableList.length; i++) {
                if ((itemParcelableList[i] instanceof Bundle) && (item = MediaItem2.fromBundle((Bundle) itemParcelableList[i])) != null) {
                    playlist.add(item);
                }
            }
        }
        return playlist;
    }

    static Parcelable[] toCommandButtonParcelableArray(List<MediaSession2.CommandButton> layout) {
        if (layout == null) {
            return null;
        }
        List<Bundle> layoutBundles = new ArrayList<>();
        for (int i = 0; i < layout.size(); i++) {
            Bundle bundle = layout.get(i).toBundle();
            if (bundle != null) {
                layoutBundles.add(bundle);
            }
        }
        return (Parcelable[]) layoutBundles.toArray(new Parcelable[0]);
    }

    static List<MediaSession2.CommandButton> fromCommandButtonParcelableArray(Parcelable[] list) {
        MediaSession2.CommandButton button;
        List<MediaSession2.CommandButton> layout = new ArrayList<>();
        for (int i = 0; i < list.length; i++) {
            if ((list[i] instanceof Bundle) && (button = MediaSession2.CommandButton.fromBundle((Bundle) list[i])) != null) {
                layout.add(button);
            }
        }
        return layout;
    }

    static List<Bundle> toBundleList(Parcelable[] array) {
        if (array == null) {
            return null;
        }
        List<Bundle> bundleList = new ArrayList<>();
        for (Parcelable p : array) {
            bundleList.add((Bundle) p);
        }
        return bundleList;
    }

    static int createPlaybackStateCompatState(int playerState, int bufferingState) {
        switch (playerState) {
            case 2:
                if (bufferingState != 2) {
                }
                break;
        }
        return 7;
    }

    static int toPlayerState(int playbackStateCompatState) {
        switch (playbackStateCompatState) {
        }
        return 3;
    }

    static boolean isDefaultLibraryRootHint(Bundle bundle) {
        return bundle != null && bundle.getBoolean("androidx.media.root_default_root", false);
    }

    static Bundle createBundle(Bundle bundle) {
        return bundle == null ? new Bundle() : new Bundle(bundle);
    }
}
