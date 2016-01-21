# The TARGET variable determines what target system the application is
# compiled for. It either refers to an XN file in the source directories
# or a valid argument for the --target option when compiling

QSPI_FLASH=1

ifeq ($(QSPI_FLASH),1)
FLASH_ARGS = -lquadflash -DQUAD_SPI_FLASH=1
TARGET = xk-audio-216-mc.xn
else
FLASH_ARGS = -lflash
TARGET = STARTKIT
endif

# The APP_NAME variable determines the name of the final .xe file. It should
# not include the .xe postfix. If left blank the name will default to
# the project name
APP_NAME = app_flash_util

# The USED_MODULES variable lists other module used by the application.
USED_MODULES = 


# The flags passed to xcc when building the application
# You can also set the following to override flags for a particular language:
# XCC_XC_FLAGS, XCC_C_FLAGS, XCC_ASM_FLAGS, XCC_CPP_FLAGS
# If the variable XCC_MAP_FLAGS is set it overrides the flags passed to
# xcc for the final link (mapping) stage.
XCC_FLAGS_Debug = -O0 -g $(FLASH_ARGS)
XCC_FLAGS_Release = -O2 -g $(FLASH_ARGS)

# The VERBOSE variable, if set to 1, enables verbose output from the make system.
VERBOSE = 0

XMOS_MAKE_PATH ?= ../..
-include $(XMOS_MAKE_PATH)/xcommon/module_xcommon/build/Makefile.common
