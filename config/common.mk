SUPERUSER_EMBEDDED := true

PRODUCT_BRAND ?= GoFree

PRODUCT_PROPERTY_OVERRIDES += \
  keyguard.no_require_sim=true \
  ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
  ro.com.google.clientidbase=android \
  ro.setupwizard.enterprise_mode=1 \
  ro.com.android.dateformat=dd-MM-yyyy \
  persist.sys.root_access=1 \
  ro.com.android.dataroaming=false \
  persist.sys.root_access=3 \
  ro.boot.selinux=disabled

PRODUCT_COPY_FILES += \
  vendor/gofree/prebuilt/bin/sysinit:system/bin/sysinit \
  vendor/gofree/prebuilt/etc/init.local.rc:root/init.gofree.rc

BUILD_PREBUILT += \
  $(shell ls vendor/gofree/prebuilt/apps/\(*.apk\))

PRODUCT_PACKAGE_OVERLAYS += vendor/gofree/overlay/common

ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

-include vendor/gofree/config/packages.mk

-include vendor/gofree/config/version.mk
