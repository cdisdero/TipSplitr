git=$(sh /etc/profile; which git)
current_marketing_version=$(xcodebuild -showBuildSettings | grep MARKETING_VERSION | tr -d 'MARKETING_VERSION =')
"$git" fetch --all --tags
tag_count=$("$git" tag | grep "$current_marketing_version" | wc -l)
next_build_number=$((tag_count+1))
"$git" tag -f "$current_marketing_version.$next_build_number"
"$git" push --tags -f
echo "Added git tag for version: $current_marketing_version.$next_build_number"
xcrun agvtool new-version -all "$next_build_number"
echo "Updated product version to: $current_marketing_version.$next_build_number"
