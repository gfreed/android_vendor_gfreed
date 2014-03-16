#!/bin/bash

function fetch {
  export URL=$1
  export LOCATION=$2
  if [ "$2" == "" ] ; then
    export LOCATION=data
  fi
  export FILE=$(echo $URL | sed 's:.*/::')
  export NAME=$(echo $FILE | sed 's:[.]apk::')
  (
    cd prebuilt/apps
    if ! [ -f "$FILE" ]; then
      wget "$URL"
    fi
  )
  cat >> prebuilt/apps/Android.mk << EOF

include \$(CLEAR_VARS)
LOCAL_MODULE := $NAME
LOCAL_MODULE_OWNER := gfreed
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
EOF

  case "$LOCATION" in
    data) echo "LOCAL_MODULE_PATH := \$(TARGET_OUT_DATA_APPS)" >> prebuilt/apps/Android.mk ;;
    vendor) echo "LOCAL_PROPRIETARY_MODULE := true" >> prebuilt/apps/Android.mk ;;
    system) echo "LOCAL_MODULE_PATH := \$(TARGET_OUT_APPS)" >> prebuilt/apps/Android.mk ;;
    priv) echo "LOCAL_PRIVILEGED_MODULE := true" >> prebuilt/apps/Android.mk ;;
  esac

  echo "include \$(BUILD_PREBUILT)" >> prebuilt/apps/Android.mk

  echo -e -n " \\\\\n  $NAME" >> config/fetched_packages.mk
}

echo LOCAL_PATH := \$\(call my-dir\) > prebuilt/apps/Android.mk
echo -n PRODUCT_PACKAGES += > config/fetched_packages.mk


# fetch 'https://f-droid.org/FDroid.apk' 'system'
fetch 'https://f-droid.org/repo/org.ntpsync_11.apk'
fetch 'https://ftp.mozilla.org/pub/mozilla.org/mobile/releases/latest/android/multi/fennec-27.0.multi.android-arm.apk'
fetch 'https://f-droid.org/repo/com.google.zxing.client.android_97.apk'
fetch 'https://f-droid.org/repo/net.androgames.level_33.apk'
fetch 'https://f-droid.org/repo/de.schildbach.wallet_160.apk'
fetch 'https://f-droid.org/repo/org.videolan.vlc_1304.apk'
fetch 'https://f-droid.org/repo/org.connectbot_365.apk'
fetch 'https://f-droid.org/repo/de.schaeuffelhut.android.openvpn_39.apk'
fetch 'https://f-droid.org/repo/com.owncloud.android_105004.apk'
fetch 'https://f-droid.org/repo/de.luhmer.owncloudnewsreader_39.apk'
fetch 'https://f-droid.org/repo/org.jfedor.frozenbubble_23.apk'
fetch 'https://f-droid.org/repo/org.sufficientlysecure.keychain_23100.apk'
fetch 'https://f-droid.org/repo/com.kmagic.solitaire_450.apk'
fetch 'https://f-droid.org/repo/cz.romario.opensudoku_1105.apk'
fetch 'https://f-droid.org/repo/com.replica.replicaisland_14.apk'
fetch 'https://guardianproject.info/releases/chatsecure-latest.apk'
fetch 'https://guardianproject.info/releases/orbot-latest.apk'
fetch 'https://guardianproject.info/releases/orweb-latest.apk'
fetch 'http://nightlies.csipsimple.com/armeabi-v7a/CSipSimple-latest-armeabi-v7a.apk'
fetch 'http://downloads.buddycloud.com/packages/android/buddycloud-latest.apk'
fetch 'https://f-droid.org/repo/net.osmand.plus_145.apk'
fetch 'https://f-droid.org/repo/com.menny.android.anysoftkeyboard_111.apk'
fetch 'https://f-droid.org/repo/org.adaway_48.apk'
fetch 'https://f-droid.org/repo/org.sufficientlysecure.localcalendar_6.apk'
fetch 'https://f-droid.org/repo/nl.mpcjanssen.simpletask_1075.apk'
fetch 'http://fbreader.org/files/android/FBReaderJ_ice-cream-sandwich.apk'
fetch 'https://f-droid.org/repo/net.nurik.roman.muzei_1008.apk'
fetch 'https://f-droid.org/repo/org.birthdayadapter_18.apk'
fetch 'https://f-droid.org/repo/com.axelby.podax_56.apk'
fetch 'https://f-droid.org/repo/at.bitfire.davdroid_30.apk'

echo >> config/fetched_packages.mk
