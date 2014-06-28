#!/bin/bash

function fetch {
  export URL=$1
  export NAME=$2
  export LOCATION=$3
  if [ "$3" == "" ] ; then
    export LOCATION=data
  fi
  export FILE=$(echo $URL | sed 's:.*/::')
  if [ "$NAME" == "" ]; then
    export NAME=$(echo $FILE | sed 's:[.]apk$::' | sed 's:_[0-9]*$::')
  fi
  export FILE="$NAME.apk"
  (
    cd prebuilt/apps
    if ! [ -f "$FILE" ]; then
      wget "$URL" -O "${NAME}.apk"
    fi
  )
  cat >> prebuilt/apps/Android.mk << EOF

include \$(CLEAR_VARS)
LOCAL_MODULE := ${NAME}-gfreed
LOCAL_MODULE_OWNER := gfreed
LOCAL_SRC_FILES := ${NAME}.apk
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

  echo -e -n " \\\\\n  ${NAME}-gfreed" >> config/fetched_packages.mk
}

echo LOCAL_PATH := \$\(call my-dir\) > prebuilt/apps/Android.mk
echo -n PRODUCT_PACKAGES += > config/fetched_packages.mk

VERSION=6
if ! grep "$VERSION" prebuilt/apps/version &> /dev/null ; then
  echo
  echo "Version mismatch, deleting old APKs"
  rm prebuilt/apps/*.apk
  echo "$VERSION" > prebuilt/apps/version
fi


fetch 'https://f-droid.org/FDroid.apk' 'fdroid' 'priv'
fetch 'https://f-droid.org/repo/org.ntpsync_11.apk'
fetch 'https://f-droid.org/repo/fennec-30.0.multi.android-arm.apk' 'fennec'
fetch 'https://f-droid.org/repo/com.google.zxing.client.android_100.apk'
fetch 'https://f-droid.org/repo/net.androgames.level_33.apk'
fetch 'https://f-droid.org/repo/de.schildbach.wallet_167.apk'
fetch 'https://f-droid.org/repo/org.videolan.vlc_9604.apk'
fetch 'https://f-droid.org/repo/org.connectbot_365.apk'
fetch 'https://f-droid.org/repo/de.schaeuffelhut.android.openvpn_39.apk'
fetch 'https://f-droid.org/repo/com.owncloud.android_105007.apk'
fetch 'https://f-droid.org/repo/org.aykit.MyOwnNotes_3.apk'
fetch 'https://f-droid.org/repo/de.luhmer.owncloudnewsreader_46.apk'
fetch 'https://f-droid.org/repo/org.jfedor.frozenbubble_36.apk'
fetch 'https://f-droid.org/repo/org.sufficientlysecure.keychain_27000.apk'
fetch 'https://f-droid.org/repo/com.kmagic.solitaire_450.apk'
fetch 'https://f-droid.org/repo/cz.romario.opensudoku_1105.apk'
fetch 'https://f-droid.org/repo/com.replica.replicaisland_14.apk'
fetch 'http://nightlies.csipsimple.com/armeabi-v7a/CSipSimple-latest-armeabi-v7a.apk'
fetch 'http://downloads.buddycloud.com/packages/android/buddycloud-latest.apk'
fetch 'https://f-droid.org/repo/net.osmand.plus_145.apk'
fetch 'https://f-droid.org/repo/com.menny.android.anysoftkeyboard_111.apk'
fetch 'https://f-droid.org/repo/org.adaway_48.apk'
fetch 'https://f-droid.org/repo/org.sufficientlysecure.localcalendar_6.apk'
fetch 'https://f-droid.org/repo/nl.mpcjanssen.simpletask_1091.apk'
fetch 'http://fbreader.org/files/android/FBReaderJ_ice-cream-sandwich.apk'
fetch 'https://f-droid.org/repo/net.nurik.roman.muzei_1008.apk'
fetch 'https://f-droid.org/repo/org.birthdayadapter_18.apk'
fetch 'https://f-droid.org/repo/at.bitfire.davdroid_37.apk'
fetch 'https://f-droid.org/repo/de.danoeh.antennapod_38.apk'
fetch 'https://f-droid.org/repo/org.torproject.android_107.apk'
fetch 'https://f-droid.org/repo/info.guardianproject.browser_26.apk'
fetch 'https://f-droid.org/repo/eu.siacs.conversations_16.apk'
fetch 'https://f-droid.org/repo/org.sufficientlysecure.viewer_2500.apk'
fetch 'http://dev-builds.libreoffice.org/daily/master/Android-ARM@24-Bytemark-Hosting/current/master~2014-06-28_05.28.09_LibreOffice4Android-debug.apk'

echo >> config/fetched_packages.mk
