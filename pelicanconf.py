#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'meoow'
SITENAME = u'meoow'
SITEURL = 'http://meoow.github.io'

#TIMEZONE = 'Asia/Beijing'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
DEFAULT_CATEGORY = 'Article'
LOCALE = 'C'
# Blogroll
# LINKS =  (('Pelican', 'http://getpelican.com/'),
#           ('Python.org', 'http://python.org/'),
#           ('Jinja2', 'http://jinja.pocoo.org/'),
#           ('You can modify those links in your config file', '#'),)

# Social widget
# SOCIAL = (('You can add links in your config file', '#'),
#           ('Another social link', '#'),)

DEFAULT_PAGINATION = 20

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

STATIC_PATHS = [ 'img' ]
PYGMENTS_RST_OPTIONS = {'linenos':'table'}
THEME = '/Volumes/m/fuckingground/__githuber__/pelican-themes/blueidea'
