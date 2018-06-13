LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

# set SRC_FILES_LIST to all the .c files in $(LOCAL_PATH)/src/
SRC_FILE_LIST := $(wildcard $(LOCAL_PATH)/src/*.c)

# exclude test files $(LOCAL_PATH)/src/t_timer.c t_units.c t_uuid.c
EXCLUD_FILE_LIST := $(wildcard $(LOCAL_PATH)/src/t_*.c)

LOCAL_SRC_FILES := $(filter-out $(EXCLUD_FILE_LIST:$(LOCAL_PATH)/%=%),$(SRC_FILE_LIST:$(LOCAL_PATH)/%=%))
LOCAL_SRC_FILES += android/base64_bio.c

LOCAL_C_INCLUDES :=  \
    $(LOCAL_PATH) \
    $(LOCAL_PATH)/src \
    $(LOCAL_PATH)/android

LOCAL_CFLAGS := -DHAVE_CONFIG_H -O2 -Wall -MT
LDFLAGS="-fPIE -pie -fuse-ld=bfd"

LOCAL_SHARED_LIBRARIES := libcrypto libssl

LOCAL_MODULE:= iperf3

include $(BUILD_EXECUTABLE)
