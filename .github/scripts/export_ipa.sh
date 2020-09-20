#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/TipSplitr.xcarchive \
            -exportOptionsPlist TipSplitr/TipSplitr/ExportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
