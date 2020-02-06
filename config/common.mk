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

include vendor/statix/config/BoardConfigCustom.mk

# Boot Animation
include vendor/statix/bootanimation/bootanimation.mk

# Branding
include vendor/statix/config/branding.mk

# Build ID
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID="$(BUILD_ID)-$(TARGET_BUILD_VARIANT)"

# Overlays
DEVICE_PACKAGE_OVERLAYS += vendor/statix/overlay/common
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/statix/overlay
