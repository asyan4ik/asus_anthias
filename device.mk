$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/asus/anthias/anthias-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/anthias/overlay

LOCAL_PATH := device/asus/anthias
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.anthias:root/fstab.anthias \
    $(LOCAL_PATH)/init.recovery.anthias.rc:root/init.recovery.anthias.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_anthias
PRODUCT_DEVICE := anthias
