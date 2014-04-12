Open with Photoshop for Chrome
Open images with Adobe Photoshop with a quick right mouse button click.
Copyright 2014, uncorp.net
Based on example source by The Chromium Authors
http://src.chromium.org/viewvc/chrome/trunk/src/chrome/common/extensions/docs/examples/api/nativeMessaging/
All rights reserved.

This extension uses native Chrome's messaging API that allows to communicate with a native application.
In order for this to work you must first install the native messaging host.

To install the host:

On Windows (UNTESTED!):
  Add registry key
  HKEY_LOCAL_MACHINE\SOFTWARE\Google\Chrome\NativeMessagingHosts\net.uncorp.openwithphotoshop
  or
  HKEY_CURRENT_USER\SOFTWARE\Google\Chrome\NativeMessagingHosts\net.uncorp.openwithphotoshop
  and set its default value to the full path to
  net.uncorp.openwithphotoshop-win.json . Note that you need to have python installed.

On Mac and Linux:
  Run install_host.sh script:
    ./host_install.sh
  By default the host is installed only for the user who runs the script, but if
  you run it with admin privileges (i.e. 'sudo ./host_install.sh'), then the
  host will be installed for all users. You can later use ./host_uninstall.sh
  to uninstall the host.
  