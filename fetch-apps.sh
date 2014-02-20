#!/bin/bash

function fetch {
  export URL=$1
  export FILE=$(echo $URL | sed 's:.*/::')
  (
    cd prebuilt/apps
    if ! [ -f "$FILE" ]; then
      wget "$URL"
      if which advzip && [ -f "$FILE" ] ; then advzip -z4 "$FILE" ; fi
    fi
  )
}

fetch 'https://f-droid.org/FDroid.apk'
fetch 'https://ftp.mozilla.org/pub/mozilla.org/mobile/releases/latest/android/multi/fennec-27.0.multi.android-arm.apk'
fetch 'https://f-droid.org/repo/com.google.zxing.client.android_95.apk'
fetch 'https://f-droid.org/repo/net.androgames.level_33.apk'
fetch 'https://f-droid.org/repo/de.schildbach.wallet_149.apk'
fetch 'https://f-droid.org/repo/org.videolan.vlc_1304.apk'
fetch 'https://f-droid.org/repo/org.connectbot_365.apk'
fetch 'https://f-droid.org/repo/de.schaeuffelhut.android.openvpn_39.apk'
fetch 'https://f-droid.org/repo/com.owncloud.android_105002.apk'
fetch 'https://f-droid.org/repo/de.luhmer.owncloudnewsreader_39.apk'
fetch 'https://f-droid.org/repo/org.jfedor.frozenbubble_23.apk'
fetch 'https://f-droid.org/repo/org.sufficientlysecure.keychain_22000.apk'
fetch 'https://guardianproject.info/releases/chatsecure-latest.apk'
fetch 'https://guardianproject.info/releases/orbot-latest.apk'
fetch 'https://guardianproject.info/releases/orweb-latest.apk'
fetch 'http://nightlies.csipsimple.com/armeabi-v7a/CSipSimple-latest-armeabi-v7a.apk'
fetch 'http://downloads.buddycloud.com/packages/android/buddycloud-latest.apk'
fetch 'https://f-droid.org/repo/net.osmand.plus_145.apk'
fetch 'https://f-droid.org/repo/com.menny.android.anysoftkeyboard_111.apk'
fetch 'https://f-droid.org/repo/org.adaway_47.apk'
fetch 'https://f-droid.org/repo/org.sufficientlysecure.localcalendar_6.apk'

echo LOCAL_PATH := \$\(call my-dir\) > prebuilt/apps/Android.mk
echo -n PRODUCT_PACKAGES += > config/fetched_packages.mk

ls prebuilt/apps/*.apk | while read FILE ; do
  APK=$(echo $FILE | sed 's:.*/::')
  NAME=$(echo $APK | sed 's:[.]apk::')
  echo -e -n " \\\\\n  $NAME" >> config/fetched_packages.mk
  cat >> prebuilt/apps/Android.mk << EOF

include \$(CLEAR_VARS)
LOCAL_MODULE := $NAME
LOCAL_MODULE_OWNER := gfreed
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
# LOCAL_MODULE_TAGS := tests
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
include \$(BUILD_PREBUILT)
EOF
done

echo >> config/fetched_packages.mk
