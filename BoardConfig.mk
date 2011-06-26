# Copyright (C) 2007 The Android Open Source Project
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

# config.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

TARGET_NO_BOOTLOADER := true

TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/galaxyace/recovery_kernel
TARGET_RECOVERY_INITRC := device/samsung/galaxyace/recovery.rc

#BOARD_KERNEL_CMDLINE := androidboot.hardware=blade console=null g_android.product_id=0x1354 g_android.serial_number=Blade-CM7

TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi

TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := galaxyace

BOARD_HAVE_BLUETOOTH := true

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := si4708

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME     := ar6000

WITH_JIT := true
ENABLE_JSC_JIT := true

TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true

JS_ENGINE := v8

# OpenGL drivers config file path
BOARD_EGL_CFG := device/samsung/galaxyace/egl.cfg

# No fallback font by default (space savings)
#NO_FALLBACK_FONT:=true

BOARD_GPS_LIBRARIES := libloc_api

BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := blade
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

BOARD_KERNEL_BASE := 0x13600000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_PROVIDES_LIBRIL := true
TARGET_PROVIDES_LIBAUDIO := true

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun

BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00480000 00020000 "recovery"
# mtd1: 00480000 00020000 "boot"
# mtd2: 00180000 00020000 "splash"
# mtd3: 00060000 00020000 "misc"
# mtd4: 02940000 00020000 "cache"
# mtd5: 0cf80000 00020000 "system"
# mtd6: 0d020000 00020000 "userdata"
# mtd7: 00180000 00020000 "persist"

#todo ext4 filesystem

BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00480000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00780000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0cf80000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0d020000
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BML_BOOT_PARTION := "/dev/block/bml8"
BOARD_BML_RECOVERY_PARTION := "/dev/block/bml9"
BOARD_USE_GR_FLIP_32 := true
BOARD_FB_FORCE_24_BPP := true
BOARD_FB_SINGLE_BUFFERED := true


BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/samsung/galaxyace/recovery/recovery_ui.c