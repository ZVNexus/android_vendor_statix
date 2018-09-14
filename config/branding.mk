# Copyright (C) 2020 StatiXOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DATE := $(shell date +%Y%m%d)
TIME := $(shell date +%H%M)

# Versioning
# Use signing keys for only official.
ifeq ($(STATIX_BUILD_TYPE),OFFICIAL)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := ../.keys/releasekey
endif

ifndef STATIX_BUILD_TYPE
    STATIX_BUILD_TYPE := UNOFFICIAL
endif

TARGET_PRODUCT_SHORT := $(subst statix_,,$(STATIX_BUILD_TYPE))

# Set all versions
STATIX_BASE_VERSION := v3.0
STATIX_VERSION := $(TARGET_PRODUCT)-$(DATE)-$(TIME)-9-$(STATIX_BASE_VERSION)-$(STATIX_BUILD_TYPE)
ROM_FINGERPRINT := StatiXOS/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(DATE)

# Declare it's a StatiX build
STATIX_BUILD := true

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.statix.version=v2.0-$(STATIX_BUILD_TYPE)-$(DATE)-$(TIME) \
    ro.mod.version=$(BUILD_ID)-$(DATE)-$(STATIX_BASE_VERSION) \
    ro.statix.fingerprint=$(ROM_FINGERPRINT)
