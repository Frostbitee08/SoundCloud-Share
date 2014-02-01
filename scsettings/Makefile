include theos/makefiles/common.mk

BUNDLE_NAME = scsettings
scsettings_FILES = scsettings.mm
scsettings_INSTALL_PATH = /Library/PreferenceBundles
scsettings_FRAMEWORKS = UIKit
scsettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/scsettings.plist$(ECHO_END)
