#
# This is a fully-automated makefile that builds complete sdcard image
# with bootloader, linux kernel, conic-server and libconic
#
# Roman Luitko, 2021
#

V ?= @

WGET		:= wget
TAR		:= tar
RM		:= rm -rf
ECHO		:= @ printf "[%s]\t%s\n"

# Don't print 'make[1]: Entering directory ...' lines
MAKEFLAGS	+= --no-print-directory

br-version	:= 2021.02
br-downloads	:= https://buildroot.org/downloads/
br-archive	:= buildroot-$(br-version).tar.gz
br-bundle	:= buildroot-$(br-version)

# We cache downloads here to speedup builds
cache-dir	:= .cache

# Buildroot uses this env var to found our out-of-tree stuff
export BR2_EXTERNAL := $(shell pwd)

# Construct list of defconfigs presented in configs/ dir
config-list	:= $(notdir $(shell find configs -name "*_defconfig"))

# First target in this makefile. Usually it is 'all', but here we want a
# different name to not interfere with buildroot's 'all' target
default-target: all

$(br-archive):
	$(ECHO) "WGET" "$@"
	$(V)$(WGET) $(br-downloads)$(br-archive)

$(br-bundle): $(br-archive)
	$(ECHO) "TAR" "$@"
	$(V)$(TAR) xf $<

br-commands := all defconfig menuconfig savedefconfig clean linux-menuconfig
$(config-list) $(br-commands): $(br-bundle)
	$(ECHO) "BR" "$@"
	$(V) $(MAKE) -C $< $@

br-clean:
	$(ECHO) "RM" "$(br-bundle)"
	$(V)$(RM) $(br-bundle)

to-cleanup := $(br-archive) $(cache-dir)
full-clean: br-clean
	$(ECHO) "RM" "$(to-cleanup)"
	$(V)$(RM) $(to-cleanup)

.PHONY: default-target full-clean $(br-commands)
