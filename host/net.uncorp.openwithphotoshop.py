#!/usr/bin/env python
# Copyright 2014, uncorp.net
# Based on example source by The Chromium Authors
# http://src.chromium.org/viewvc/chrome/trunk/src/chrome/common/extensions/docs/examples/api/nativeMessaging/
# All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import struct
import sys
import subprocess
import simplejson
import urllib
import os

text_length_bytes = sys.stdin.read(4) # Read the message length (first 4 bytes)
if len(text_length_bytes) == 0:
	sys.exit(0)

text_length = struct.unpack('i', text_length_bytes)[0] # Unpack message length as 4 byte integer
json = simplejson.loads( sys.stdin.read(text_length).decode('utf-8') ) # Read msg into JSON object
url = json['srcUrl'] # The remote URL
basename = os.path.basename(url) # The image base name
dirname = '/var/tmp' # Path where to save images (without trailing backslash!)

local_filename, headers = urllib.urlretrieve(json['srcUrl'], dirname+'/'+basename) # Download image to a predefined folder
local_ext = os.path.splitext(local_filename)[1][1:] # Extension of local image file 
mime_ext = subprocess.check_output('file --brief "'+local_filename+'"', shell=True).split(" ")[0].lower() # Extension (MIME) acocrding to 'file' shell command, lowercase and without the dot

if mime_ext == "jpeg": # Prefer jpg to jpeg
	mime_ext = "jpg"

if local_ext != mime_ext: # Add extension to file if it doesn't match the mime one
    local_filename = dirname+'/'+basename+'.'+mime_ext
    os.rename(dirname+'/'+basename, local_filename)

os.system('open -b "com.adobe.Photoshop" "'+local_filename+'"') # Open image in Photoshop

# DEBUG stuff:

'''
#message='{"url": "'+url+'"}' # Send a message back
message='{"echo": "foo"}' # Send a message back
sys.stdout.write(struct.pack('I', len(message))) # Write message size
sys.stdout.write(message) # Write the message itself
sys.stdout.flush()

f = open(dirname+'/openwithphotoshop.log','w') # Log to a file
f.write(url)
f.close()
'''
