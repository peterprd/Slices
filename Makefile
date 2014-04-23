THEOS_DEVICE_IP = 192.168.1.5
TARGET := iphone:7.1:2.0
ARCHS := armv6 arm64
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include theos/makefiles/common.mk

TWEAK_NAME = Slices
Slices_FILES = Tweak.xm
Slices_FRAMEWORKS = UIKit
Slices_PRIVATE_FRAMEWORKS = BackBoardServices

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += slicespreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
