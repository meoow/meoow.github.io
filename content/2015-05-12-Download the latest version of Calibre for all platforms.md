Title: Download the latest version of Calibre for all platforms
Date: 2015-05-12 21:32
Modified: 
Category: Article
Tags: Python,Linux,OS X
Authors: meoow
Summary: 

It is also downloading in parallel.

```python
#!/usr/bin/env python2.7

import HTMLParser
import urllib2
from contextlib import closing
import shutil
import urlparse
import os.path
import threading

class CalibreVersionParser(HTMLParser.HTMLParser):
	__in_href = False
	__version = ''

	def handle_starttag(self, tag, attrs):
		if tag == 'a':
			for k, v in attrs:
				if k == 'title' and v.startswith('Release'):
					self.__in_href = True
					break
	def handle_data(self, data):
		if self.__in_href:
			if not self.__version:
				self.__version = data.strip()
	def handle_endtag(self, tag):
		if tag == 'a':
			self.__in_href = False
	
	def getversion(self):
		return self.__version

def download(url, filename):
	with closing(urllib2.urlopen(url)) as resp:
		with open(filename, 'wb') as w:
			shutil.copyfileobj(resp, w, 102400)


resp = urllib2.urlopen('http://download.calibre-ebook.com/2.html')

parser = CalibreVersionParser()
parser.feed(resp.read())

calibreVer = parser.getversion()

if not calibreVer:
	raise SystemExit("Can not get calibre version")

downroot = 'http://download.calibre-ebook.com/{0}/calibre-'.format(calibreVer)

downlist = [
		'{0}{1}.dmg'.format(downroot, calibreVer), 
		'{0}{1}-x86_64.txz'.format(downroot, calibreVer), 
		'{0}64bit-{1}.msi'.format(downroot, calibreVer)
		]

t = [ threading.Thread(
			target=download, 
			args=(d, os.path.basename(urlparse.urlparse(d).path))) 
		for d in downlist ]

for w in t: w.start()
for w in t: w.join()
```

