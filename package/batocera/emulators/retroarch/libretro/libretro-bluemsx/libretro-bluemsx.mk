################################################################################
#
# BLUEMSX
#
################################################################################
# Version.: Commits on Jan 13, 2021
LIBRETRO_BLUEMSX_VERSION = 55eb95f5ff2fbb4a5b1cc5bf7ab9237639f05faf
LIBRETRO_BLUEMSX_SITE = $(call github,libretro,blueMSX-libretro,$(LIBRETRO_BLUEMSX_VERSION))
LIBRETRO_BLUEMSX_LICENSE = GPLv2

LIBRETRO_BLUEMSX_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3),y)
	LIBRETRO_BLUEMSX_PLATFORM = rpi3
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODROIDGOA),y)
	LIBRETRO_BLUEMSX_PLATFORM = classic_armv8_a35
endif

define LIBRETRO_BLUEMSX_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro platform="$(LIBRETRO_BLUEMSX_PLATFORM)"
endef

define LIBRETRO_BLUEMSX_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/bluemsx_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/bluemsx_libretro.so

	cp -pr $(@D)/system/bluemsx/ \
		$(TARGET_DIR)/usr/share/batocera/datainit/bios
endef

$(eval $(generic-package))
