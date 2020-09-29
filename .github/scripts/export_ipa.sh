#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/TipSplitr.xcarchive \
            -exportOptionsPlist TipSplitr/ExportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
