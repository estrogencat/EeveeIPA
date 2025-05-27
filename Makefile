TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = Spotify
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = EeveeSpotify

EeveeSpotify_FILES = $(shell find Sources/EeveeSpotify -name '*.swift') $(shell find Sources/EeveeSpotifyC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
EeveeSpotify_SWIFTFLAGS = -ISources/EeveeSpotifyC/include -Osize
EeveeSpotify_EXTRA_FRAMEWORKS = SwiftProtobuf
EeveeSpotify_CFLAGS = -fobjc-arc -ISources/EeveeSpotifyC/include -Os

include $(THEOS_MAKE_PATH)/tweak.mk

copy-swiftprotobuf:
	mkdir -p swiftprotobuf && cd swiftprotobuf ;\
	curl -OL https://github.com/whoeevee/EeveeSpotify/releases/download/swift2.0/org.swift.protobuf.swiftprotobuf_1.26.0_iphoneos-arm.deb ;\
	ar -x org.swift.protobuf.swiftprotobuf_1.26.0_iphoneos-arm.deb ;\
	tar -xvf data.tar.lzma ;\
	cp -r Library/Frameworks/SwiftProtobuf.framework "${THEOS}/lib" ;\
