THEOS_PACKAGE_DIR_NAME = debs
TARGET =: clang
ARCHS = arm64 armv7 armv7s

DEBUG = 0
GO_EASY_ON_ME = 1
LDFLAGS += -Wl,-segalign,0x4000
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ccFixer
ccFixer_FILES = Tweak.xm
ccFixer_FRAMEWORKS = UIKit Foundation

ccFixer_CFLAGS += -DVERBOSE
ccFixer_LDFLAGS += -lAccessibility
ccFixer_CFLAGS += -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

sync: stage
	rsync -e "ssh -p 2222" -avz _/Library/MobileSubstrate/DynamicLibraries/* root@127.0.0.1:/Library/MobileSubstrate/DynamicLibraries/
	ssh root@127.0.0.1 -p 2222 killall SpringBoard