$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

$(call inherit-product, vendor/gofree/config/common.mk)

PRODUCT_NAME  := gofree_arm
PRODUCT_BRAND := Android
PRODUCT_MODEL := GoFree on ARM Emulator

PRODUCT_PROPERTY_OVERRIDES += \
  ro.sf.lcd_density=240
