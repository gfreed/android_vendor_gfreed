$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, vendor/gfreed/config/common.mk)

PRODUCT_NAME  := gfreed_arm
PRODUCT_BRAND := Android
PRODUCT_MODEL := GfreeD on ARM Emulator
PRODUCT_DEVICE := gfreed-emulator

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libargs=-d /dev/ttyS0 \
  rild.libpath=/system/lib/libreference-ril.so \
  ro.config.nocheckin=yes

