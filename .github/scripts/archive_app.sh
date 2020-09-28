#!/bin/bash

set -eo pipefail

xcodebuild -project TipSplitr.xcodeproj \
            -scheme TipSplitr \
            -sdk iphoneos14.0 \
            -archivePath $PWD/build/TipSplitr.xcarchive \
            clean archive | xcpretty
