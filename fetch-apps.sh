#!/bin/bash

function fetch {
  export URL=$1
  export FILE=$(echo $URL | sed 's:.*/::')
  ( cd prebuilt/apps ; [ -f "$FILE" ] || wget "$URL" )
}

fetch 'https://f-droid.org/FDroid.apk'
fetch 'https://ftp.mozilla.org/pub/mozilla.org/mobile/releases/latest/android/multi/fennec-26.0.1.multi.android-arm.apk'

echo LOCAL_PATH := \$\(call my-dir\) > prebuilt/apps/Android.mk
echo -n PRODUCT_PACKAGES += > config/fetched_packages.mk

ls prebuilt/apps/*.apk | while read FILE ; do
  APK=$(echo $FILE | sed 's:.*/::')
  NAME=$(echo $APK | sed 's:[.]apk::')
  echo -e -n " \\\\\n  $NAME" >> config/fetched_packages.mk
  cat >> prebuilt/apps/Android.mk << EOF

include \$(CLEAR_VARS)
LOCAL_MODULE := $NAME
LOCAL_MODULE_OWNER := gofree
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_TAGS := tests
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
include \$(BUILD_PREBUILT)
EOF
done

echo >> config/fetched_packages.mk
