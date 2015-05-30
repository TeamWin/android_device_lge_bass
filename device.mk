$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/lge/bass/bass-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/bass/overlay

LOCAL_PATH := device/lge/bass
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.bass:root/fstab.bass \
    $(LOCAL_PATH)/init.recovery.bass.rc:root/init.recovery.bass.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_bass
PRODUCT_DEVICE := bass
