$(call inherit-product, device/samsung/maguro/full_maguro.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, vendor/gfreed/config/common.mk)
$(call inherit-product, vendor/gfreed/config/gsm.mk)

PRODUCT_NAME  := gfreed_maguro
PRODUCT_BRAND := Android
PRODUCT_MODEL := Gfreed on Maguro
PRODUCT_DEVICE := maguro
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES := \
  PRODUCT_NAME=yakju \
  BUILD_FINGERPRINT=google/yakju/maguro:4.3/JWR66Y/776638:user/release-keys \
  PRIVATE_BUILD_DESC="yakju-user 4.3 JWR66Y 776638 release-keys"

