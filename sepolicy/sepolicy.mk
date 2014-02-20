BOARD_SEPOLICY_DIRS += \
  vendor/gfreed/sepolicy

BOARD_SEPOLICY_UNION += \
  file_contexts \
  file.te \
  genfs_contexts \
  installd.te \
  mac_permissions.xml \
  vold.te
