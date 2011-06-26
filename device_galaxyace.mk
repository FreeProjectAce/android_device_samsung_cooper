# Copyright (C) 2009 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/samsung/galaxyace/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := galaxyaxce
PRODUCT_DEVICE := galaxyaxce
PRODUCT_MODEL := GT-S5830

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    gralloc.galaxyace \
    copybit.galaxyace \
    gps.galaxyace \
    sensors.galaxyace \
    libOmxCore \
    libOmxVidEnc \
    FM \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/samsung/galaxyace/galaxyace-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/samsung/galaxyace/qwerty.kl:system/usr/keylayout/qwerty.kl

# fstab
PRODUCT_COPY_FILES += \
    device/samsung/galaxyace/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/samsung/galaxyace/init.galaxyace.rc:root/init.galaxyace.rc \
    device/samsung/galaxyace/ueventd.galaxyace.rc:root/ueventd.galaxyace.rc

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/galaxyace/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/galaxyace/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/samsung/galaxyace/init.bt.sh:system/etc/init.bt.sh \
    device/samsung/galaxyace/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/galaxyace/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/galaxyace/prebuilt/hostapd:system/bin/hostapd \
    device/samsung/galaxyace/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/samsung/galaxyace/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/galaxyace/prebuilt/cifs.ko:system/lib/modules/2.6.32.9-perf/cifs.ko \
    device/samsung/galaxyace/prebuilt/zram.ko:system/lib/modules/2.6.32.9-perf/zram.ko
    
#Kernel Modules for Recovery (RFS)
PRODUCT_COPY_FILES += \
    device/samsung/galaxyace/prebuilt/modules/recovery/fsr.ko:recovery/root/lib/modules/fsr.ko \
    device/samsung/galaxyace/prebuilt/modules/recovery/fsr_stl.ko:recovery/root/lib/modules/fsr_stl.ko \
    device/samsung/galaxyace/prebuilt/modules/recovery/rfs_fat.ko:recovery/root/lib/modules/rfs_fat.ko \
    device/samsung/galaxyace/prebuilt/modules/recovery/rfs_glue.ko:recovery/root/lib/modules/rfs_glue.ko \
    device/samsung/galaxyace/prebuilt/modules/recovery/sec_param.ko:recovery/root/lib/modules/sec_param.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/samsung/galaxyace/firmware/data.patch.bin:system/wifi/data.patch.bin \
    device/samsung/galaxyace/firmware/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/samsung/galaxyace/firmware/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin

#Media profile
PRODUCT_COPY_FILES += \
    device/samsung/galaxyace/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libsec-ril.so \
    rild.libargs=-d /dev/smd0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.build.baseband_version=P729BB01 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=32m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0
