# config.mk
#
# Product-specific compile-time definitions
#

include device/qcom/common/BoardConfigCommon.mk

TARGET_BOARD_PLATFORM := msm8996

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_USES_OVERLAY := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096

-include $(QCPATH)/common/msm8996/BoardConfigVendor.mk

# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_USES_WIPOWER := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oneplus/oneplus3/bluetooth

USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3154116608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 59165356032
BOARD_FLASH_BLOCK_SIZE := 262144

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_QCOM_BSP := true

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=32M@0-0xffffffff

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x02000000
BOARD_RAMDISK_OFFSET     := 0x01000000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := false

BOARD_MKBOOTIMG_ARGS := --tags_offset 0x00000100
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8996
TARGET_KERNEL_CONFIG := cm_oneplus3_defconfig

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_NO_RPC := true

TARGET_PLATFORM_DEVICE_BASE := /devices/soc/
TARGET_INIT_VENDOR_LIB := libinit_msm

#Enable Peripheral Manager
TARGET_PER_MGR_ENABLED := true

#Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION := true

#Enable SW based full disk encryption
TARGET_SWV8_DISK_ENCRYPTION := false

#Enable PD locater/notifier
TARGET_PD_SERVICE_ENABLED := true

BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_BOOTIMG_SIGNED := true

# Enable dex pre-opt to speed up initial boot
ifeq ($(HOST_OS),linux)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_PIC := true
      ifneq ($(TARGET_BUILD_VARIANT),user)
        # Retain classes.dex in APK's for non-user builds
        DEX_PREOPT_DEFAULT := nostripping
      endif
    endif
endif

# Enable sensor multi HAL
USE_SENSOR_MULTI_HAL := true

TARGET_LDPRELOAD := libNimsWrap.so

TARGET_COMPILE_WITH_MSM_KERNEL := true

TARGET_KERNEL_APPEND_DTB := true
# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := false

TARGET_CRYPTFS_HW_PATH := device/qcom/common/cryptfs_hw

#Add support for firmare upgrade on 8996
HAVE_SYNAPTICS_DSX_FW_UPGRADE := true

# Enable MDTP (Mobile Device Theft Protection)
TARGET_USE_MDTP := true

TARGET_RECOVERY_FSTAB = device/oneplus/oneplus3/rootdir/etc/fstab.qcom

TARGET_USES_64_BIT_BINDER := true

USE_CUSTOM_AUDIO_POLICY := 1

TARGET_SPECIFIC_HEADER_PATH := device/oneplus/oneplus3/include
