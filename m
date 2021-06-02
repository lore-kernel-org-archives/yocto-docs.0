Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.14417.1622646054693907119
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 08:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id D9363240017;
	Wed,  2 Jun 2021 15:00:52 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] yocto-docs: remove obsolete documentation/tools/update-documentation-conf
Date: Wed,  2 Jun 2021 17:00:41 +0200
Message-Id: <20210602150041.586679-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This script references old documentation files that no longer exist

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/tools/update-documentation-conf | 158 ------------------
 1 file changed, 158 deletions(-)
 delete mode 100644 documentation/tools/update-documentation-conf

diff --git a/documentation/tools/update-documentation-conf b/documentation/tools/update-documentation-conf
deleted file mode 100644
index adfca3ca50..0000000000
--- a/documentation/tools/update-documentation-conf
+++ /dev/null
@@ -1,158 +0,0 @@
-#!/usr/bin/env python
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# documentation.conf update script
-#
-# Author: Paul Eggleton <paul.eggleton@linux.intel.com>
-#
-# Copyright (C) 2015 Intel Corporation
-#
-
-
-import sys
-import os
-import argparse
-import re
-from lxml import etree
-import logging
-
-def logger_create(name):
-    logger = logging.getLogger(name)
-    loggerhandler = logging.StreamHandler()
-    loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
-    logger.addHandler(loggerhandler)
-    logger.setLevel(logging.INFO)
-    return logger
-logger = logger_create('docconfupdater')
-
-def main():
-    parser = argparse.ArgumentParser(description="documentation.conf updater")
-    parser.add_argument('basepath', help='Path to OE-Core base directory')
-    parser.add_argument('-q', '--quiet', help='Print only warnings/errors', action='store_true')
-
-    args = parser.parse_args()
-
-    if args.quiet:
-        logger.setLevel(logging.WARN)
-
-    if not os.path.isdir(args.basepath):
-        logger.error('Specified base path %s not found')
-        return 1
-
-    doc_conf = os.path.join(args.basepath, 'meta', 'conf', 'documentation.conf')
-    if not os.path.exists(doc_conf):
-        logger.error('Unable to find %s' % doc_conf)
-        return 1
-
-    allowed_flags = ['doc']
-    flag_re = re.compile(r'\[(.+?)\]')
-
-    infos = {}
-    tree = etree.parse('ref-manual/ref-variables.xml')
-    root = tree.getroot()
-    for glossary in root.findall('glossary'):
-        for glossdiv in glossary.findall('glossdiv'):
-            for glossentry in glossdiv.findall('glossentry'):
-                info = glossentry.find('info')
-                if info is not None:
-                    infoline = ' '.join(info.text.split())
-                    infolinesplit = infoline.split('=', 1)
-                    if len(infoline) < 2:
-                        logger.warn('Invalid info line (no = character), ignoring: %s' % infoline)
-                        continue
-                    flags = flag_re.findall(infolinesplit[0])
-                    if not flags:
-                        logger.warn('Invalid info line (no varflag), ignoring: %s' % infoline)
-                        continue
-                    for flag in flags:
-                        if flag not in allowed_flags:
-                            logger.warn('Invalid info line (varflag %s not in allowed list), ignoring: %s' % (flag, infoline))
-                            continue
-                    infos[infolinesplit[0].rstrip()] = infolinesplit[1].lstrip()
-
-    if not infos:
-        logger.error('ERROR: Unable to find any info tags in the glossary')
-        return 1
-
-    def sortkey(key):
-        # Underscores sort undesirably, so replace them
-        return key.split('[')[0].replace('_', '-')
-
-    changed = False
-    lines = []
-    invars = False
-    lastletter = None
-    added = []
-    with open(doc_conf, 'r') as dcf:
-        for line in dcf:
-            if not invars:
-                if line.startswith('#') and 'DESCRIPTIONS FOR VARIABLES' in line:
-                    invars = True
-            elif not line.startswith('#'):
-                linesplit = line.split('=', 1)
-                if len(linesplit) > 1:
-                    key = linesplit[0].rstrip()
-                    lastletter = key[0]
-                    # Find anything in the dict that should come before the current key
-                    for dkey in sorted(infos.keys()):
-                        if sortkey(dkey) < sortkey(key):
-                            lines.append('%s = %s\n' % (dkey, infos[dkey]))
-                            added.append(dkey)
-                            del infos[dkey]
-                            changed = True
-                    newvalue = infos.get(key, None)
-                    if newvalue:
-                        del infos[key]
-                        if newvalue != linesplit[1].strip():
-                            lines.append('%s = %s\n' % (key, newvalue))
-                            changed = True
-                            continue
-                    elif key in added:
-                        # We already added a new value for this key, so skip it
-                        continue
-                elif lastletter:
-                    # Ensure we write out anything anything left over for this letter
-                    for dkey in sorted(infos.keys()):
-                        if dkey[0] == lastletter:
-                            lines.append('%s = %s\n' % (dkey, infos[dkey]))
-                            del infos[dkey]
-                            changed = True
-                        elif dkey[0] > lastletter:
-                            # List is sorted, so we're done
-                            break
-                    lastletter = None
-            lines.append(line)
-
-    if not invars:
-        logger.error('ERROR: Unable to find variables section in documentation.conf')
-        return 1
-
-    if infos:
-        changed = True
-        # Write out anything left over
-        lines.append('\n\n')
-        for key in sorted(infos.keys()):
-            lines.append('%s = %s\n' % (key, infos[key]))
-
-    if changed:
-        logger.info('Updating %s' % doc_conf)
-        with open(doc_conf, 'w') as dcf:
-            for line in lines:
-                dcf.write(line)
-    else:
-        logger.info('No changes required')
-
-    return 0
-
-
-if __name__ == "__main__":
-    try:
-        ret = main()
-    except Exception:
-        ret = 1
-        import traceback
-        traceback.print_exc(5)
-    sys.exit(ret)
-
-
-- 
2.25.1

