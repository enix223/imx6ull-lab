LVGL_APP_SITE = $(BR2_EXTERNAL_IMX6ULL_APP_PATH)/package/lvgl-app/source
LVGL_APP_SITE_METHOD = local
LVGL_APP_DEPENDENCIES = host-pkgconf host-cmake
LVGL_APP_VERSION = 1.0.0

LVGL_APP_LICENSE = MIT
LVGL_APP_LICENSE_FILES = LICENSE

LVGL_APP_SUBDIR = .
LVGL_APP_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr

# Prevent installing anything from CMake
define LVGL_APP_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/lvgl-app $(TARGET_DIR)/usr/bin/lvgl-app
endef

define LVGL_APP_INSTALL_STAGING_CMDS
    # Empty if no need for staging
endef

$(eval $(cmake-package))
