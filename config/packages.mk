PRODUCT_PACKAGES += \
  bash \
  e2fsck \
  fsck.exfat \
  htop \
  lsof \
  mke2fs \
  mkfs.exfat \
  mount.exfat \
  nano \
  openvpn \
  powertop \
  su \
  tune2fs \
  vim \
  CMFileManager \
  OmniTorch \
  OpenDelta \
  Apollo \
  Superuser \
  NetworkLocation \
  GSMLocation \
  com.google.android.maps \
  com.google.android.maps.xml \
  FusedLocation \
  F-Droid

# libmemtrack is needed e.g. by foursquare
# looks like it's available on all devices
PRODUCT_PACKAGES += libmemtrack

-include vendor/gfreed/config/fetched_packages.mk

