TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, vendor/gofree/config/common.mk)
$(call inherit-product, device/generic/mini-emulator-armv7-a-neon/BoardConfig.mk)

PRODUCT_NAME  := gofree_arm
PRODUCT_BRAND := Android
PRODUCT_MODEL := GoFree on ARM Emulator
PRODUCT_DEVICE := armv7-a-neon
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true

PRODUCT_PROPERTY_OVERRIDES += \
  ro.sf.lcd_density=240

