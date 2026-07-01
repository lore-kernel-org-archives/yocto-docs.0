Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B711C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 11:43:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42795.1782906184684509069
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 04:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZrdWjtt0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C31B4E40B64
	for <docs@lists.yoctoproject.org>; Wed,  1 Jul 2026 11:43:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 403E760288
	for <docs@lists.yoctoproject.org>; Wed,  1 Jul 2026 11:43:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AB2B104C8349;
	Wed,  1 Jul 2026 13:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782906181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Cwe8iQdLzXVxO4k03r3SH5ZYE+B0VwTRB19yEidpePY=;
	b=ZrdWjtt0wn1NKUdebDxSiyKYxR68mBL/f7TG+ZLluKetWNwzCGbMn+AqJDz1texdNeau3j
	anhyBCQRV1UCeGCViy0R6joifuNwH3eq01/4qBxlJwCyOA+/qFrfqkhn80UXHE7Jw+nNtM
	GojnI49N4nbZ8vl/1QRIJRYkLHZv+R2GVtYYKdFKe2ZYtrp5GGTMbFe360joCtKyJIO1Wr
	fqeZMZPW2fMt77YFzmSpBp+iC6z+yWNJCWOY4kH9SGQu4pDtvOMF0oQs6AQ8ute42uwZTn
	yVhmH6M8HEd2kr09VHw3N80oy3602d+6aZpDwKsAsO4gGh1AcL1IcGEHG/sJcg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 01 Jul 2026 13:42:50 +0200
Subject: [PATCH] tools/update-documentation-conf: remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-drop-update-documentation-conf-v1-1-23e88cea8808@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywrCMBCF4Vcps3YgvWjQVxEX6cxURzAJuYhQ+
 u6muvwW5z8rZEkqGS7dCknemjX4hv7QAT2cvwsqN8NghpOxpkdOIWKN7IogB6ov8cWVtkIKfsF
 pHtmMR3t2ZKFFYpJFP7+D6+3vXOenUNmrsG1fpigk24IAAAA=
X-Change-ID: 20260701-drop-update-documentation-conf-4b3d03579ac7
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6597;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lY73ITQOGC66rA7PCkYSLPwKsxxN4LKSqOCbBpsv6kk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqRP1De2RYqUO1WBJDrWmFtzSF6OoYZgystesRz
 Qz8ICsZenWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakT9QwAKCRDRgEFAKaOo
 NpaKEAC0SOlRwk8RKZyd3Hp0WvlWFSrSBQFTKh8oFaTanSmiecfncIFU533Oq8QODqGcjV3wwWR
 jGR1GzCCHzacwYIHR9bGViygmh2yMZ3omD2++Oe3TkerA1FZFEVnDePyoNBPecKC1J2BK5TMz0H
 lm6uiMKKKfBvbz81wzsTKDlbP2Z0gSit+lfRgTnZ2TBCVV2OIqAwWUPKnC0RFdCNqH+QsswHcTE
 m5cIPqaLNZKEVEP9PlFcYyRY5mu5PqJdgH85J2mRQUkKhG8OIvCw7L9V6+e0Bh4T+MkMOi0E/Vh
 pmxmxVcVMo/oLjHNL4weEAgnXohIOE+99aAepARQa5QjH13W7rxh+Vbq1QPhmNrboF/e8meiZle
 xHj8UvDN/UFL3/l0QehWcPuK8kC5QUOQnJw8NI+EVykshy+hXi+JCbFR1EBiEc87viDT+1EDxmi
 /32tlZBkhngazSv1ZxwKoEaQ0h38/RxPkgY7Owh1Tb+gejkGgLO5wSAkR3qTSlFiJ8kvLPIYYW3
 ZrkyCyy9QznvsLvGwQap9kbbhFnigl2BgYdDPyxc463JH0Tn9X8b614M/kURrUkbIl4zaGtpeck
 2fMcy3Tenn5dZEecpviSBge8707g72t/Oiq+J+OVn90OVxGSydY3PQvXdWnhf6PG06YFl+qSakE
 DClGDs+M9J1ZA+Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Jul 2026 11:43:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9990

This script was previously used to update the documenation.conf file in
openembedded-core, but this was based on the Docbook documentation. This
script does not work anymore with Sphinx. Remove it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/update-documentation-conf | 158 --------------------------
 1 file changed, 158 deletions(-)

diff --git a/documentation/tools/update-documentation-conf b/documentation/tools/update-documentation-conf
deleted file mode 100644
index adfca3ca5..000000000
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

---
base-commit: 4562ba19f36e54099bcae82cec8a70deb1c23aa7
change-id: 20260701-drop-update-documentation-conf-4b3d03579ac7


