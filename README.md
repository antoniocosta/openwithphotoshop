# Open with Photoshop (for Chrome)

###Open images with Adobe Photoshop directly from Chrome, with a quick right mouse button click.

![screenshot](http://lh4.googleusercontent.com/Hie1Uyl-8a_XnM_5Rp_6msPXzoCsSsRLEWuRNFoM6MtIR7CENXEvEvpFV4BEhVtyaEojel2tdDU=s1280-h800-e365-)

Handy for designers and inspired by the [Firefox plugin](https://addons.mozilla.org/en-US/firefox/addon/open-with-photoshop/) with the same name.

[Extension](http://goo.gl/Fy982M) uses native [Chrome's messaging API](https://developer.chrome.com/extensions/messaging), so in order for it to work (and besides said [extension](http://goo.gl/Fy982M)), you must ALSO install a native messaging host. Tested and working on **Mac OS X only**. 

To install host:

	curl -s https://raw.githubusercontent.com/uncorp/openwithphotoshop/master/host/install.sh | sh

To uninstall host:

	curl -s https://raw.githubusercontent.com/uncorp/openwithphotoshop/master/host/install.sh | sh

[Full source on github](http://goo.gl/tb0ZIz).

---

**Untested and most likely broken** on Windows:

- You need to have python installed.
- Download the file [net.uncorp.openwithphotoshop-win.json](https://raw.githubusercontent.com/uncorp/openwithphotoshop/master/host/net.uncorp.openwithphotoshop-win.json)

- Add registry key

 `HKEY_LOCAL_MACHINE\SOFTWARE\Google\Chrome\NativeMessagingHosts\net.uncorp.openwithphotoshop`
 
  or
  
  `HKEY_CURRENT_USER\SOFTWARE\Google\Chrome\NativeMessagingHosts\net.uncorp.openwithphotoshop`
  
  and set its default value to the full path to the file [net.uncorp.openwithphotoshop-win.json](https://raw.githubusercontent.com/uncorp/openwithphotoshop/master/host/net.uncorp.openwithphotoshop-win.json) you downloaded.
  
Reverse the steps above to uninstall.

---

Largely based on [sample source](http://src.chromium.org/viewvc/chrome/trunk/src/chrome/common/extensions/docs/examples/api/nativeMessaging/) by The Chromium Authors. Photoshop copyrighted and trademarked by Adobe.