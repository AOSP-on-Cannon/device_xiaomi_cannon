#
# Copyright (C) 2021 StatiXOS
# Copyright (C) 2021 Vaisakh Murali
#
# SPDX-License-Identifer: GPL-2.0-only

#
# Build specifications
#

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/cannon/cannon-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_PACKAGES += \
    fastbootd

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.common-util \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.soundtrigger@2.3-impl

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3-service.clearkey \
    android.hardware.drm@1.3-service.widevine

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.composer@2.1-resources \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
    android.hardware.health@2.0-impl-2.1

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/configs/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-goodix.idc \
    $(LOCAL_PATH)/configs/keylayouts/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl \
    $(LOCAL_PATH)/configs/keylayouts/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayouts/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# Rootdir
PRODUCT_PACKAGES += \
    capture.sh \
    capture_headsetmic.sh \
    install-recovery.sh \
    mishow.sh \
    playback.sh \
    playback_headset.sh \
    setup_headsetmic2headphone.sh \
    setup_headsetmic2rcv.sh \
    setup_mainmic2headphone.sh \
    setup_rcv2mainmic.sh \
    setup_rcv2topmic.sh \
    setup_topmic2headphone.sh \
    teardown_loopback.sh \
    tp_data_collect.sh \
    tp_selftest.sh \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.ago.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6853.rc \
    init.mt6853.usb.rc \
    init.project.rc \
    init.sensor_2_0.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    multi_init.rc \
    fstab.mt6853 \
    ramdisk-fstab.mt6853 \
    ueventd.mtk.rc