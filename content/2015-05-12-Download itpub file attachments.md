Title: Download itpub file attachments
Date: 2015-05-12 21:31
Modified: 
Category: Article
Tags: python
Authors: meoow
Summary: 

```python
#!/usr/bin/env python2.7

import re
import sys
import subprocess as subp

thr_ptn = re.compile(r'http://www.itpub.net/thread-1917264-1-1.html')
am_ptn = re.compile(r'^{0}([\w\d]+)&fid=61$'.format(re.escape(r'http://www.itpub.net/attachment.php?aid=')))

for line in sys.stdin:
	line = line.strip()
	if line:
		mat = am_ptn.match(line)
		if mat is not None:
			filelink='http://www.itpub.net/forum.php?mod=attachment&aid={0}==&fid=61'.format(mat.group(1))
			subp.call(['curl', '-JOL', filelink])
```
