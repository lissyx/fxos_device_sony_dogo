# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from the proprietary version
-include vendor/sony/dogo/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/dogo/include

# Recovery Assert
TARGET_OTA_ASSERT_DEVICE := C5502,C5503,C5506,dogo

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_BOARD_PLATFORM := msm8960
BOARD_VENDOR_PLATFORM := fusion3

# Architecture
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := krait

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/apq8064
TARGET_KERNEL_CONFIG := cm_fusion3_dogo_defconfig

# Kernel information
BOARD_KERNEL_BASE     := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
TARGET_LS_USE_ALS_NODE := true

# Bluetooth
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/dogo/bluetooth

# Display
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
BOARD_EGL_CFG := device/sony/dogo/rootdir/system/lib/egl/egl.cfg

# Custom boot
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/dogo/custombootimg/custombootimg.mk
TARGET_RECOVERY_FSTAB := device/sony/dogo/rootdir/fstab.qcom
RECOVERY_FSTAB_VERSION := 2

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50001
TARGET_NO_RPC := true

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 26
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi Config
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

# SELinux sepolicy
BOARD_SEPOLICY_DIRS += \
    device/sony/dogo/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    te_macros \
    bluetooth_loader.te \
    bridge.te \
    camera.te \
    device.te \
    dhcp.te \
    domain.te \
    drmserver.te \
    file.te \
    kickstart.te \
    init.te \
    mac_update.te \
    mediaserver.te \
    mpdecision.te \
    netmgrd.te \
    qmux.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    tee.te \
    thermald.te \
    ueventd.te \
    wpa_supplicant.te

# inherit from Sony common
-include device/sony/common/BoardConfigCommon.mk
