#!/bin/bash

set -eo pipefail

xcodebuild -project TipSplitr.xcodeproj \
            -scheme TipSplitr \
            -destination platform="iOS Simulator,OS=14.0,name=iPhone SE (2nd generation)" \
            clean test | xcpretty
