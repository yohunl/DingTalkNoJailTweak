THEOS_DEVICE_IP = 10.0.45.93

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DingTalkTweak
DingTalkTweak_FILES = Tweak.xm DingTalkRedEnvelop.m

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 DingTalk"
