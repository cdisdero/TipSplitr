#!/bin/bash

set -eo pipefail

xcodebuild -project TipSplitr.xcodeproj \
            -scheme TipSplitr \
            -sdk iphoneos \
            -archivePath $PWD/build/TipSplitr.xcarchive \
            clean archive | xcpretty
