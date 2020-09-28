#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/TipSplitrAppStore.mobileprovision ./.github/secrets/TipSplitrAppStore.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/TipSplitrAppStoreDistribution.p12 ./.github/secrets/TipSplitrAppStoreDistribution.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/TipSplitrAppStore.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/TipSplitrAppStore.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/TipSplitrAppStoreDistribution.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
