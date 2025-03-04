################################################################################
#
# kodi20 sv_se language resource
#
################################################################################

KODI20_RESOURCE_LANGUAGE_SV_SE_VERSION = 10.0.64
KODI20_RESOURCE_LANGUAGE_SV_SE_SOURCE = resource.language.sv_se-$(KODI20_RESOURCE_LANGUAGE_SV_SE_VERSION).zip
KODI20_RESOURCE_LANGUAGE_SV_SE_SITE = http://mirrors.kodi.tv/addons/nexus/resource.language.sv_se
KODI20_RESOURCE_LANGUAGE_SV_SE_PLUGINNAME=resource.language.sv_se

KODI20_PLUGIN_TARGET_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI20_RESOURCE_LANGUAGE_SV_SE_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI20_RESOURCE_LANGUAGE_SV_SE_DL_SUBDIR)/$(KODI20_RESOURCE_LANGUAGE_SV_SE_SOURCE) -d $(@D)
endef

define KODI20_RESOURCE_LANGUAGE_SV_SE_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI20_PLUGIN_TARGET_DIR)
	@cp -r $(@D)/$(KODI20_RESOURCE_LANGUAGE_SV_SE_PLUGINNAME) $(KODI20_PLUGIN_TARGET_DIR)
endef

$(eval $(generic-package))
