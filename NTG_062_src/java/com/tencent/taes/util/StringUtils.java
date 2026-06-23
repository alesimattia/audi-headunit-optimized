package com.tencent.taes.util;

import android.text.TextPaint;
import android.text.TextUtils;
import android.widget.TextView;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class StringUtils {
    public static final String EMPTY_STRING = "";
    public static final String PRICE_FORMAT = "%.2f";
    public static final Pattern mPassPattern = Pattern.compile("^[a-zA-Z_0-9][a-zA-Z_0-9]{5,16}$");
    public static final Pattern mMailPattern = Pattern.compile("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+", 2);
    public static final Pattern mPhonePattern = Pattern.compile("^((13[0-9])|(14[0-9])|(15[[0-9]])|(16[[0-9]])|(17[[0-9]])|(18[[0-9]])|(19[[0-9]]))\\d{8}$");
    public static final String[] unitDistArray = {"m", "km", "米", "公里"};

    private StringUtils() {
        throw new AssertionError();
    }

    public static boolean isHttpUrl(String str) {
        if (str == null || str.trim().length() == 0) {
            return false;
        }
        return str.startsWith("http://") || str.startsWith("https://") || str.startsWith("mailto:");
    }

    public static boolean isMailAndTelUrl(String str) {
        if (str == null || str.trim().length() == 0) {
            return false;
        }
        if (!str.startsWith("mailto:") && !str.startsWith("tel:")) {
            return false;
        }
        return true;
    }

    public static boolean isBlank(String str) {
        return str == null || str.trim().length() == 0;
    }

    public static boolean isEmpty(CharSequence str) {
        return str == null || str.length() == 0;
    }

    public static String capitalizeFirstLetter(String str) {
        if (isEmpty(str)) {
            return str;
        }
        char c = str.charAt(0);
        if (!Character.isLetter(c) || Character.isUpperCase(c)) {
            return str;
        }
        StringBuilder sb = new StringBuilder(str.length());
        sb.append(Character.toUpperCase(c));
        sb.append(str.substring(1));
        return sb.toString();
    }

    public static String utf8Encode(String str) {
        if (!isEmpty(str) && str.getBytes().length != str.length()) {
            try {
                return URLEncoder.encode(str, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException("UnsupportedEncodingException occurred. ", e);
            }
        }
        return str;
    }

    public static String utf8Encode(String str, String defultReturn) {
        if (!isEmpty(str) && str.getBytes().length != str.length()) {
            try {
                return URLEncoder.encode(str, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                return defultReturn;
            }
        }
        return str;
    }

    public static String getHrefInnerHtml(String href) {
        if (isEmpty(href)) {
            return "";
        }
        Pattern hrefPattern = Pattern.compile(".*<[\\s]*a[\\s]*.*>(.+?)<[\\s]*/a[\\s]*>.*", 2);
        Matcher hrefMatcher = hrefPattern.matcher(href);
        if (hrefMatcher.matches()) {
            return hrefMatcher.group(1);
        }
        return href;
    }

    public static String htmlEscapeCharsToString(String source) {
        return isEmpty(source) ? source : source.replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&amp;", "&").replaceAll("&quot;", "\"");
    }

    public static String fullWidthToHalfWidth(String s) {
        if (isEmpty(s)) {
            return s;
        }
        char[] source = s.toCharArray();
        for (int i = 0; i < source.length; i++) {
            if (source[i] == 12288) {
                source[i] = ' ';
            } else if (source[i] >= 65281 && source[i] <= 65374) {
                source[i] = (char) (source[i] - 65248);
            } else {
                source[i] = source[i];
            }
        }
        return new String(source);
    }

    public static String halfWidthToFullWidth(String s) {
        if (isEmpty(s)) {
            return s;
        }
        char[] source = s.toCharArray();
        for (int i = 0; i < source.length; i++) {
            if (source[i] == ' ') {
                source[i] = 12288;
            } else if (source[i] >= '!' && source[i] <= '~') {
                source[i] = (char) (source[i] + 65248);
            } else {
                source[i] = source[i];
            }
        }
        return new String(source);
    }

    public static String formatPrice(float price) {
        return String.format(PRICE_FORMAT, Float.valueOf(price));
    }

    public static String formatPrice(double price) {
        return String.format(PRICE_FORMAT, Double.valueOf(price));
    }

    public static boolean checkMail(String strMail) {
        return !isBlank(strMail) && mMailPattern.matcher(strMail).matches();
    }

    public static boolean checkPhone(String strPhone) {
        return !isBlank(strPhone) && mPhonePattern.matcher(strPhone).matches();
    }

    public static boolean checkPass(String strPass) {
        return !isBlank(strPass) && mPassPattern.matcher(strPass).matches();
    }

    public static String getMailPrefix(String email) {
        if (email == null || email.length() == 0) {
            return "";
        }
        int index = email.indexOf("@");
        if (index <= 0) {
            return email;
        }
        return email.substring(0, index);
    }

    public static int calculateStringLength(String inputStr) {
        int orignLen = inputStr.length();
        int resultLen = 0;
        for (int i = 0; i < orignLen; i++) {
            String temp = inputStr.substring(i, i + 1);
            try {
                if (temp.getBytes("utf-8").length == 3) {
                    resultLen += 2;
                } else {
                    resultLen++;
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return resultLen;
    }

    public static String getStringLimitLength(String inputStr, int limitLength) {
        int orignLen = inputStr.length();
        int resultLen = 0;
        for (int resultLen2 = 0; resultLen2 < orignLen; resultLen2++) {
            String temp = inputStr.substring(resultLen2, resultLen2 + 1);
            try {
                if (temp.getBytes("utf-8").length == 3) {
                    resultLen += 2;
                } else {
                    resultLen++;
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            if (resultLen >= limitLength) {
                return inputStr.substring(0, resultLen2);
            }
        }
        return null;
    }

    public static float getStringWidth(TextView textView, String text) {
        if (isBlank(text)) {
            return 0.0f;
        }
        TextPaint paint = textView.getPaint();
        return paint.measureText(text);
    }

    public static String getStringLimitWidth(TextView textView, String text, int pixelWidth) {
        if (isBlank(text)) {
            return "";
        }
        float stringWidth = getStringWidth(textView, text);
        float diff = stringWidth - pixelWidth;
        if (diff >= 0.0f) {
            int length = calculateStringLength(text);
            float perWidth = (stringWidth / length) + 1.0f;
            int newLength = ((int) (pixelWidth / perWidth)) - 4;
            return getStringLimitLength(text, newLength) + "…";
        }
        return text;
    }

    public static boolean isInteger(String str) {
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        return pattern.matcher(str).matches();
    }

    public static String getMD5(String val) throws NoSuchAlgorithmException {
        if (TextUtils.isEmpty(val)) {
            return null;
        }
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        if (md5 == null) {
            throw new NoSuchAlgorithmException();
        }
        md5.update(val.getBytes());
        byte[] m = md5.digest();
        StringBuilder hexString = new StringBuilder();
        for (byte aMessageDigest : m) {
            String h = Integer.toHexString(255 & aMessageDigest);
            while (h.length() < 2) {
                h = "0" + h;
            }
            hexString.append(h);
        }
        return hexString.toString();
    }

    public static String json2str(Object obj) throws JSONException {
        if (obj == null) {
            return "";
        }
        StringBuilder body = new StringBuilder();
        int i = 0;
        if (obj instanceof JSONArray) {
            JSONArray jsonArray = (JSONArray) obj;
            while (i < jsonArray.length()) {
                try {
                    body.append(json2str(jsonArray.get(i)));
                    if (i != jsonArray.length() - 1) {
                        body.append(ListUtils.DEFAULT_JOIN_SEPARATOR);
                    }
                    i++;
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
            return "[" + ((Object) body) + "]";
        }
        if (obj instanceof JSONObject) {
            JSONObject jsonObject = (JSONObject) obj;
            Iterator<String> itKeys = jsonObject.keys();
            List<String> keys = new ArrayList<>();
            while (itKeys.hasNext()) {
                keys.add(itKeys.next().toString());
            }
            Collections.sort(keys);
            while (i < keys.size()) {
                String key = keys.get(i);
                body.append(json2str(key));
                body.append(":");
                Object val = null;
                try {
                    val = jsonObject.get(key);
                } catch (JSONException e2) {
                    e2.printStackTrace();
                }
                body.append(json2str(val));
                if (i != keys.size() - 1) {
                    body.append(ListUtils.DEFAULT_JOIN_SEPARATOR);
                }
                i++;
            }
            return "{" + ((Object) body) + "}";
        }
        if (obj instanceof String) {
            return "\"" + obj + "\"";
        }
        return "" + obj;
    }

    public enum UnitLangEnum {
        EN(0),
        ZH(1);

        private int nUnit;

        UnitLangEnum(int nUnit) {
            this.nUnit = nUnit;
        }

        public int getUnit() {
            return this.nUnit;
        }
    }

    public static String[] formatDistance(int nDist, UnitLangEnum langEnum) {
        String distFormat;
        new StringBuffer();
        String[] result = new String[2];
        boolean bNoZero = false;
        int nUnit = langEnum.getUnit();
        if (nUnit != 0) {
            nUnit++;
        }
        if (nDist >= 1000) {
            if (nDist % 1000 < 50 || nDist % 1000 >= 950) {
                bNoZero = true;
            }
            if (bNoZero) {
                distFormat = "%.0f";
            } else {
                distFormat = "%.1f";
            }
            int km = nDist / 1000;
            if (km >= 100) {
                result[0] = String.format("%d", Integer.valueOf(km));
            } else {
                result[0] = String.format(distFormat, Double.valueOf(((double) nDist) / 1000.0d));
            }
            result[1] = unitDistArray[nUnit + 1];
        } else {
            result[0] = String.format("%d", Integer.valueOf(nDist));
            result[1] = unitDistArray[nUnit + 0];
        }
        return result;
    }
}
