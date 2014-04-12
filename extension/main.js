// Copyright 2014, uncorp.net
// Based on example source by The Chromium Authors
// http://src.chromium.org/viewvc/chrome/trunk/src/chrome/common/extensions/docs/examples/api/nativeMessaging/
// All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

function onClick(info, tab) {
	// DEBUG stuff:
	//console.log("item " + info.menuItemId + " was clicked");
	//console.log("info: " + JSON.stringify(info));
	//console.log("tab: " + JSON.stringify(tab));

	chrome.runtime.sendNativeMessage('net.uncorp.openwithphotoshop', { srcUrl: info.srcUrl }
	/*
	// DEBUG stuff:
	,
		function(response) {
			console.log("Received " + JSON.stringify(response));
			console.log(chrome.runtime.lastError);
		}
	*/
	);
}

chrome.contextMenus.create({"title": "Open with Photoshop", "contexts":["image"], "onclick": onClick});
