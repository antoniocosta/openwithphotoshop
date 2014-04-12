#!/bin/sh
# Copyright 2014, uncorp.net
# Based on example source by The Chromium Authors
# http://src.chromium.org/viewvc/chrome/trunk/src/chrome/common/extensions/docs/examples/api/nativeMessaging/
# All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

# WEB INSTALL COMMAND:
# wget http://uncorp.net/openwithphotoshop/install.sh -O - | sh

wget http://uncorp.net/openwithphotoshop/host_install.sh
wget http://uncorp.net/openwithphotoshop/net.uncorp.openwithphotoshop.json
wget http://uncorp.net/openwithphotoshop/net.uncorp.openwithphotoshop.py
chmod 755 host_install.sh
./host_install.sh
rm host_install.sh
rm net.uncorp.openwithphotoshop.json
rm net.uncorp.openwithphotoshop.py
echo "INSTALL COMPLETE!"