# Versioning of the ROM
PRODUCT_VERSION_MAJOR = 4
PRODUCT_VERSION_MINOR = 3
PRODUCT_VERSION_REVISION = 0

ifdef BUILDTYPE_NIGHTLY
	ROM_BUILDTYPE := NIGHTLY
endif
ifdef BUILDTYPE_AUTOTEST
	ROM_BUILDTYPE := AUTOTEST
endif
ifdef BUILDTYPE_EXPERIMENTAL
	ROM_BUILDTYPE := EXPERIMENTAL
endif
ifdef BUILDTYPE_RELEASE
	ROM_BUILDTYPE := RELEASE
endif

ifndef ROM_BUILDTYPE
	ROM_BUILDTYPE := HOMEMADE
endif

# Build the final version string
ifdef BUILDTYPE_RELEASE
	ROM_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_REVISION)-$(TARGET_PRODUCT)
else
	ROM_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_REVISION)-$(shell date -u +%Y%m%d)-$(TARGET_PRODUCT)-$(ROM_BUILDTYPE)
endif

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=$(ROM_VERSION)
