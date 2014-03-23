$(call inherit-product, device/samsung/maguro/full_maguro.mk)
$(call inherit-product, vendor/gfreed/config/common.mk)
$(call inherit-product, vendor/gfreed/config/gsm.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_NAME  := gfreed_maguro
PRODUCT_BRAND := Android
PRODUCT_MODEL := Gfreed on Maguro
PRODUCT_DEVICE := maguro
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_PROPERTY_OVERRIDES += \
  ro.bq.gpu_to_cpu_unsupported=1 \
  ro.zygote.disable_gl_preload=true

PRODUCT_BUILD_PROP_OVERRIDES := \
  PRODUCT_NAME=yakju \
  BUILD_FINGERPRINT=google/yakju/maguro:4.3/JWR66Y/776638:user/release-keys \
  PRIVATE_BUILD_DESC="yakju-user 4.3 JWR66Y 776638 release-keys"

