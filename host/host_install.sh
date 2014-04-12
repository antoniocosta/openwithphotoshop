#!/bin/sh
# Copyright 2014, uncorp.net
# Based on example source by The Chromium Authors
# http://src.chromium.org/viewvc/chrome/trunk/src/chrome/common/extensions/docs/examples/api/nativeMessaging/
# All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

set -e

DIR="$( cd "$( dirname "$0" )" && pwd )"

if [ $(uname -s) == 'Darwin' ]; then
  if [ "$(whoami)" == "root" ]; then
    TARGET_DIR="/Library/Google/Chrome/NativeMessagingHosts"
  else
    TARGET_DIR="$HOME/Library/Application Support/Google/Chrome/NativeMessagingHosts"
  fi
else
  if [ "$(whoami)" == "root" ]; then
    TARGET_DIR="/etc/opt/chrome/native-messaging-hosts"
  else
    TARGET_DIR="$HOME/.config/google-chrome/NativeMessagingHosts"
  fi
fi

HOST_NAME=net.uncorp.openwithphotoshop

# Create directory to store native messaging host.
mkdir -p "$TARGET_DIR"

# Copy native messaging host manifest and python file
cp "$DIR/$HOST_NAME.json" "$TARGET_DIR"
cp "$DIR/$HOST_NAME.py" "$TARGET_DIR"

# Update host path in the manifest.
#HOST_PATH="$DIR/net.uncorp.openwithphotoshop.py"
HOST_PATH="$TARGET_DIR/$HOST_NAME.py"

ESCAPED_HOST_PATH=${HOST_PATH////\\/}
sed -i '' -e "s/HOST_PATH/$ESCAPED_HOST_PATH/" "$TARGET_DIR/$HOST_NAME.json"

# Set permissions for the manifest so that all users can read it.
chmod o+r "$TARGET_DIR/$HOST_NAME.json"
# Set permissions for the host python so that it can run.
chmod 755 "$TARGET_DIR/$HOST_NAME.py"

echo $HOST_NAME has been installed.