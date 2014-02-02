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
  vendor/gofree/prebuilt/etc/init.local.rc:root/init.gofree.rc \
  vendor/gofree/prebuilt/system/org.mozilla.firefox/distribution/preferences.json:system/org.mozilla.firefox/distribution/preferences.json \
  vendor/gofree/prebuilt/system/org.mozilla.firefox/distribution/searchplugins/common/duckduckgo.xml:system/org.mozilla.firefox/distribution/searchplugins/common/duckduckgo.xml \
  vendor/gofree/prebuilt/system/org.mozilla.firefox/distribution/extensions/jid1-JcGokIiQyjoBAQ@jetpack.xpi:system/org.mozilla.firefox/distribution/extensions/jid1-JcGokIiQyjoBAQ@jetpack.xpi \
  vendor/gofree/prebuilt/system/org.mozilla.firefox/distribution/extensions/https-everywhere@eff.org.xpi:system/org.mozilla.firefox/distribution/extensions/https-everywhere@eff.org.xpi \
  vendor/gofree/prebuilt/system/org.mozilla.firefox/distribution/extensions/jid1-C86cNe1crgj9bw@jetpack.xpi:system/org.mozilla.firefox/distribution/extensions/jid1-C86cNe1crgj9bw@jetpack.xpi \
  vendor/gofree/prebuilt/system/org.mozilla.firefox/distribution/extensions/youtube-o2i@jetpack.xpi:system/org.mozilla.firefox/distribution/extensions/youtube-o2i@jetpack.xpi \
  vendor/gofree/prebuilt/system/org.mozilla.firefox/distribution/extensions/{fe272bd1-5f76-4ea4-8501-a05d35d823fc}.xpi:system/org.mozilla.firefox/distribution/extensions/{fe272bd1-5f76-4ea4-8501-a05d35d823fc}.xpi

PRODUCT_PACKAGE_OVERLAYS += vendor/gofree/overlay/common

ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

-include vendor/gofree/config/packages.mk

-include vendor/gofree/config/version.mk
