# Copyright (C) 2014 The CyanogenMod Project
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

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
$(call inherit-product, vendor/cm/config/telephony.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/flounder/aosp_flounder64.mk)

# Symlink /vendor partition to /system/vendor
BOARD_NEEDS_VENDORIMAGE_SYMLINK := true

# Inline kernel building
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/htc/flounder
TARGET_KERNEL_CONFIG := cyanogenmod_flounder_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := androidboot.selinux=enforcing

# Assert for recovery compatibility
TARGET_OTA_ASSERT_DEVICE := flounder,flounder_lte

# Extra Packages
PRODUCT_PACKAGES += \
	com.android.nfc_extras

# CM Overlays
DEVICE_PACKAGE_OVERLAYS += \
	device/htc/flounder/overlay-cm

# Inherrit LTE config
$(call inherit-product, device/htc/flounder/device-lte.mk)
$(call inherit-product-if-exists, vendor/htc/flounder_lte/device-vendor.mk)

# LTE Overlays
DEVICE_PACKAGE_OVERLAYS += \
	device/htc/flounder/lte_only_overlay

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flounder_lte \
    BUILD_FINGERPRINT=google/volantisg/flounder_lte:6.0.1/MOB31E/3142026:user/release-keys \
    PRIVATE_BUILD_DESC="volantisg-user 6.0.1 MOB31E 3142026 release-keys" \
    BUILD_ID=MOB31E

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_flounder_lte
PRODUCT_DEVICE := flounder_lte
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 9
