#!/bin/sh
# Copyright 2014, uncorp.net
# Based on example source by The Chromium Authors
# http://src.chromium.org/viewvc/chrome/trunk/src/chrome/common/extensions/docs/examples/api/nativeMessaging/
# All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

# WEB UNINSTALL COMMAND:
# curl -s https://raw.githubusercontent.com/uncorp/openwithphotoshop/master/host/uninstall.sh | sh

curl -Os https://raw.githubusercontent.com/uncorp/openwithphotoshop/master/host/host_uninstall.sh

chmod 755 host_uninstall.sh
./host_uninstall.sh

rm host_uninstall.sh

echo "ALL DONE!"