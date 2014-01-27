$(call inherit-product, device/generic/mini-emulator-armv7-a-neon/BoardConfig.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, vendor/gofree/config/common.mk)

PRODUCT_NAME  := gofree_arm
PRODUCT_BRAND := Android
PRODUCT_MODEL := GoFree on ARM Emulator
PRODUCT_DEVICE := armv7-a-neon

PRODUCT_PROPERTY_OVERRIDES += \
  ro.sf.lcd_density=240

