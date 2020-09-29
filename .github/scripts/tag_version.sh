# Find command for git
git=$(sh /etc/profile; which git)

# Get the current MARKETING_VERSION from the project for the app
current_marketing_version=$(xcodebuild -showBuildSettings | grep MARKETING_VERSION | tr -d 'MARKETING_VERSION =')

# Get all tags from the repository
"$git" fetch --all --tags

# Get the most recently created version tag
last_tag=$("$git" tag | grep "$current_marketing_version" | sort | tail -1)

# Parse the last number in the tag (delimiter = period) into the current build number
current_build_number=`echo "$last_tag" | cut -d "." -f 4`

# Compute the next build number = current build number + 1
next_build_number=$((current_build_number+1))

# Create a new tag using the current marketing version followed by the next build number
"$git" tag -f "$current_marketing_version.$next_build_number"

# Push the newly created version tag to the repository
"$git" push --tags -f

echo "Added git tag for version: $current_marketing_version.$next_build_number"

# Update the new build number into the project for the app
xcrun agvtool new-version -all "$next_build_number"
echo "Updated product version to: $current_marketing_version.$next_build_number"
