#!/bin/bash

project_file="TipSplitr.xcodeproj"
marketing_version=$1

sed -i '' -e 's/MARKETING_VERSION \= [^\;]*\;/MARKETING_VERSION = '$marketing_version';/' "$project_file/project.pbxproj"
