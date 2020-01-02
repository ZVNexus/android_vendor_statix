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

BUILD_DATE := $(shell date +%Y%m%d)
BUILD_TIME := $(shell date +%H%M)

# Versioning System
# Use signing keys for only official builds.
ifeq ($(STATIX_BUILD_TYPE),OFFICIAL)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := ./.keys/releasekey
endif

ifndef STATIX_BUILD_TYPE
    STATIX_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions.
STATIX_BASE_VERSION := v3.0
STATIX_PLATFORM_VERSION := 10
STATIX_VERSION := $(TARGET_PRODUCT)-$(BUILD_DATE)-$(BUILD_TIME)-$(STATIX_PLATFORM_VERSION)-$(STATIX_BASE_VERSION)-$(STATIX_BUILD_TYPE)
ROM_FINGERPRINT := StatiXOS/$(PLATFORM_VERSION)/$(STATIX_BUILD_TYPE)/$(BUILD_DATE)$(BUILD_TIME)

# Declare it's a StatiXOS build.
STATIX_BUILD := true
