#________________________________________
#
#

include				$(MAKE_PATH)/common.mk

BUILD_ARTIFACT			= $(TARGET_BUILD_PATH)/.libs/$(TARGET_NAME).a
CONFIGURE_ARTIFACT		= $(TARGET_BUILD_PATH)/Makefile
DEFAULT_TERMINFO_DIR		= /usr/share/terminfo
EXTRACT_ARTIFACT		= $(CONFIGURE_ARTIFACT).in
INSTALL_ARTIFACT		= $(INSTALL_LIB_PATH)/$(TARGET_NAME).a
TARGET_BUILD_PATH		= $(BUILD_PATH)/$(TARGET_NAME_VERSION)
TARGET_NAME			= ncurses
TARGET_NAME_VERSION		= $(TARGET_NAME)-$(TARGET_VERSION)
TARGET_TARBALL_NAME		= $(TARGET_NAME_VERSION).tar.gz
TARGET_TARBALL_PATH		= $(SOURCE_PATH)/$(TARGET_TARBALL_NAME)
TARGET_VERSION			= 5.9
TERMINFO_DIRS			= /etc/terminfo:/lib/terminfo:/usr/share/terminfo

#________________________________________
#
#

$(TARGET_NAME): $(INSTALL_ARTIFACT)

$(EXTRACT_ARTIFACT): $(TARGET_TARBALL_PATH)
	tar zxf $< -C $(BUILD_PATH)

$(CONFIGURE_ARTIFACT): $(EXTRACT_ARTIFACT)
	cd $(TARGET_BUILD_PATH) ; \
	patch < $(TOP_PATH)/patches/ncurses/5.9/00_replace_fgrep.diff ; \
	./configure \
	  --enable-static \
	  --prefix=$(INSTALL_PATH) \
          --with-default-terminfo-dir='$(DEFAULT_TERMINFO_DIR)' \
          --with-terminfo-dirs='$(TERMINFO_DIRS)' \
	  --with-termlib \
	  ;

$(BUILD_ARTIFACT): $(CONFIGURE_ARTIFACT)
	cd $(TARGET_BUILD_PATH); make

$(INSTALL_ARTIFACT): $(BUILD_ARTIFACT)
	cd $(TARGET_BUILD_PATH); make install

clean:
	-rm -rf $(TARGET_BUILD_PATH)

#
#
#

