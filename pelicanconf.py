
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#
import datetime
# Basic information about the site.
SITENAME = 'Community Over Code'
SITEDESC = 'Community Over Code is a website about the people who make up the Apache Software Foundation, and the events that bring them together.'
SITEDOMAIN = 'communityovercode.apache.org'
SITEURL = 'http://communityovercode.apache.org/'
SITELOGO = 'https://www.communityovercode.org/images/logo.png'
SITEREPOSITORY = 'https://github.com/apache/conferences-cc-website/blob/main/content/'
CURRENTYEAR = datetime.date.today().year
TRADEMARKS = 'Apache, the Apache logo are trademarks'
TIMEZONE = 'UTC'
# Theme includes templates and possibly static files
THEME = 'theme/apache'
# Specify location of plugins, and which to use
PLUGIN_PATHS = [ 'plugins',  ]
# If the website uses any *.ezmd files, include the 'gfm' and 'asfreader' plugins (in that order)
PLUGINS = [ 'gfm', 'asfindex', 'consensual_youtube', 'asfgenid', 'asfdata', 'asfrun', 'asfreader',  ]
# All content is located at '.' (aka content/ )
PAGE_PATHS = [ '.' ]
STATIC_PATHS = [ '.',  ]
# Where to place/link generated pages

PATH_METADATA = '(?P<path_no_ext>.*)\\..*'

PAGE_SAVE_AS = '{path_no_ext}.html'
# Don't try to translate
PAGE_TRANSLATION_ID = None
# Disable unused Pelican features
# N.B. These features are currently unsupported, see https://github.com/apache/infrastructure-pelican/issues/49
FEED_ALL_ATOM = None
INDEX_SAVE_AS = ''
TAGS_SAVE_AS = ''
CATEGORIES_SAVE_AS = ''
AUTHORS_SAVE_AS = ''
ARCHIVES_SAVE_AS = ''
# Disable articles by pointing to a (should-be-absent) subdir
ARTICLE_PATHS = [ 'blog' ]
# needed to create blogs page
ARTICLE_URL = 'blog/{slug}.html'
ARTICLE_SAVE_AS = 'blog/{slug}.html'
# Disable all processing of .html files
READERS = { 'html': None, }

# Configure the asfgenid plugin
ASF_GENID = {
 'unsafe_tags': True,
 'metadata': True,
 'elements': True,
 'permalinks': False,
 'tables': True,

 'headings': True,
 'headings_re': '^h[1-1]',


 'toc': True,
 'toc_headers': '^h[1-4]',

 'debug': False,
}



# Configure the asfdata plugin
ASF_DATA = {
 'data': 'asfdata.yaml',
 'metadata': {
 'site_url': SITEURL
 },
 'debug': False,
}


# Configure the asfrun plugin (initialization)
ASF_RUN = [ '/bin/bash get_calendar.sh',  ]


# Configure the asfrun plugin (finalization)
ASF_POSTRUN = [ '/bin/bash pagefind.sh',  ]


# Configure ignore files
# File and directory basenames matching any of these patterns will be ignored by the processor.
IGNORE_FILES = [ 'README.md', 'interviews', 'include', '*.odt',  ]



# Configure the asfindex plugin
ASF_INDEX = {
 'index': '**',
}

