SUPERUSER_EMBEDDED := true

PRODUCT_BRAND ?= GfreeD

PRODUCT_PROPERTY_OVERRIDES += \
  keyguard.no_require_sim=true \
  ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
  ro.com.google.clientidbase=android \
  ro.setupwizard.enterprise_mode=1 \
  ro.com.android.dateformat=dd-MM-yyyy \
  ro.com.android.dataroaming=false \
  persist.sys.root_access=3 \
  ro.boot.selinux=disabled \
  debug.sf.nobootanimation=1 \
  persist.sys.dalvik.vm.lib=libart.so

PRODUCT_COPY_FILES += \
  vendor/gfreed/prebuilt/bin/sysinit:system/bin/sysinit \
  vendor/gfreed/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
  vendor/gfreed/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
  vendor/gfreed/prebuilt/etc/init.local.rc:root/init.gfreed.rc \
  vendor/gfreed/prebuilt/system/org.mozilla.firefox/distribution/preferences.json:system/org.mozilla.firefox/distribution/preferences.json \
  vendor/gfreed/prebuilt/system/org.mozilla.firefox/distribution/searchplugins/common/duckduckgo.xml:system/org.mozilla.firefox/distribution/searchplugins/common/duckduckgo.xml \
  vendor/gfreed/prebuilt/system/org.mozilla.firefox/distribution/searchplugins/common/list.txt:system/org.mozilla.firefox/distribution/searchplugins/common/list.txt \
  vendor/gfreed/prebuilt/system/org.mozilla.firefox/distribution/extensions/jid1-JcGokIiQyjoBAQ@jetpack.xpi:system/org.mozilla.firefox/distribution/extensions/jid1-JcGokIiQyjoBAQ@jetpack.xpi \
  vendor/gfreed/prebuilt/system/org.mozilla.firefox/distribution/extensions/https-everywhere@eff.org.xpi:system/org.mozilla.firefox/distribution/extensions/https-everywhere@eff.org.xpi \
  vendor/gfreed/prebuilt/system/org.mozilla.firefox/distribution/extensions/jid1-C86cNe1crgj9bw@jetpack.xpi:system/org.mozilla.firefox/distribution/extensions/jid1-C86cNe1crgj9bw@jetpack.xpi \
  vendor/gfreed/prebuilt/system/org.mozilla.firefox/distribution/extensions/youtube-o2i@jetpack.xpi:system/org.mozilla.firefox/distribution/extensions/youtube-o2i@jetpack.xpi \
  vendor/gfreed/prebuilt/system/org.mozilla.firefox/distribution/extensions/{fe272bd1-5f76-4ea4-8501-a05d35d823fc}.xpi:system/org.mozilla.firefox/distribution/extensions/{fe272bd1-5f76-4ea4-8501-a05d35d823fc}.xpi \
  vendor/gfreed/prebuilt/system/org.mozilla.firefox/distribution/extensions/setduckduckgo@measite.de.xpi:system/org.mozilla.firefox/distribution/extensions/setduckduckgo@measite.de.xpi

PRODUCT_PACKAGE_OVERLAYS += vendor/gfreed/overlay/common

ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

-include vendor/gfreed/config/packages.mk

-include vendor/gfreed/config/version.mk
