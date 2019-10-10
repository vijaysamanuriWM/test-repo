#!/bin/bash
set -e

BUCKET_NAME=${1:-"downloads.hyscale.io"}
#TODO Replacing with code pom version.

DEFAULT_HYSCALE_VERSION=latest
HYSCALE_TOOL_VERSION=${DEFAULT_HYSCALE_VERSION}

if [ -n "$VERSION" ]; then
	HYSCALE_TOOL_VERSION=$VERSION
fi

USER_LOCAL_BIN=/usr/local/bin
HYSCALE=hyscale
HYSCALE_BUCKET_URL="https://s3-us-west-2.amazonaws.com/$BUCKET_NAME/$HYSCALE/release"

echo "Downloading $HYSCALE to $USER_LOCAL_BIN..." 
curl --create-dirs $HYSCALE_BUCKET_URL/$HYSCALE_TOOL_VERSION/$HYSCALE -o $USER_LOCAL_BIN/$HYSCALE
echo -e "Download successful\n"
chmod +x $USER_LOCAL_BIN/$HYSCALE
$USER_LOCAL_BIN/$HYSCALE

echo -e "\nSetup complete. Open a new terminal to use $HYSCALE \n\n"
