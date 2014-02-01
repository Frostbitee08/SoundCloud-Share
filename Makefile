include theos/makefiles/common.mk

TWEAK_NAME = SoundCloudShare
SoundCloudShare_FILES = Tweak.xm
SoundCloudShare_FRAMEWORKS = UIKit
TARGET := iphone:7.0:2.0
ARCHS := armv6 arm64

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += scsettings
include $(THEOS_MAKE_PATH)/aggregate.mk
