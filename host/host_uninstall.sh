#!/bin/sh
# Copyright 2014, uncorp.net
# Based on example source by The Chromium Authors
# http://src.chromium.org/viewvc/chrome/trunk/src/chrome/common/extensions/docs/examples/api/nativeMessaging/
# All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

set -e

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
    TARGET_DIR='$HOME/.config/google-chrome/NativeMessagingHosts'
  fi
fi

HOST_NAME=net.uncorp.openwithphotoshop
rm "$TARGET_DIR/net.uncorp.openwithphotoshop.json"
rm "$TARGET_DIR/net.uncorp.openwithphotoshop.py"
echo $HOST_NAME has been uninstalled.