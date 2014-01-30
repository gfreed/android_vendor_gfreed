$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, vendor/gofree/config/common.mk)

PRODUCT_NAME  := gofree_arm
PRODUCT_BRAND := Android
PRODUCT_MODEL := GoFree on ARM Emulator
PRODUCT_DEVICE := gofree-emulator

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libargs=-d /dev/ttyS0 \
  rild.libpath=/system/lib/libreference-ril.so \
  ro.config.nocheckin=yes

