Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB29C43327
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:59:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70282.1783000766934160269
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 06:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kkUIozQ+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 328104E40C36
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 13:59:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 004345FF03
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 13:59:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 694F3104C957F;
	Thu,  2 Jul 2026 15:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783000764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bQvfZAMIlyAKUxIGKWQ3ipFIKi1k1lfF8HD0uNXqMiA=;
	b=kkUIozQ+tIbsYa/HrTnCrXpEN7DoBiEFPtf0tiBmTTCGJOChJtdOvjEXFkFT4Fig58192U
	mlhwgU4LZT6qSPymO0X/a9suf+65ZN1vI2BvuUIN7+Px59y/1ctwPaZrXOoDH8220QYGlA
	rWBnP3kshZWUlZ58Wb3QPjkgTghCeN1Kj/7oO4pFkYYwcI/hvBoCWkMNnwtroamSAlBFek
	hnS2T3jhBadp25Kih4+ruPG7E/FJ3za0hY8VF4RWtoa5B2mKvedcN4vaL6z0FH1CZs6urE
	jkeV/7uQMy0iNTbFkEPGJNVYr7KGOzL/9fMMF+KUKpaJe+U8mJ3FfxE87PLD3w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 02 Jul 2026 15:59:10 +0200
Subject: [PATCH 1/3] tools/check-glossaries: return 1 in case of failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-pre-commit-v1-1-0ebd211b5d5e@bootlin.com>
References: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
In-Reply-To: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JeVElhmeoEA5sJ9tVKTrRWrnjUPOCYyUJ/7agfWBzSA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqRm6691sHb+w7pU1enaiGUvDsENPPrN3og7522
 xeF6/WoshGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakZuugAKCRDRgEFAKaOo
 Ng/ED/4nq2CcFuLhOxQTi70u9c/bu0rmLrtykKl3NIRWWaBnZnkswtTqn/BrDjmS9XtJ28LOo9N
 VO0gXdKiPxePpuMYPYQXueTFnCefvyH+6Z4KDHAqOUsBBmqQC0/galAhn8bIKP47CykHgAhgctQ
 pzn/3IsJ3dErNRp8lvvDj/rZLuir32tqhODMPrWAqOCIYcGJRRBcuxHTE33LqPltwSELjuuGqV5
 IacZ82HxnCmoDOvleq/b/jFKZ5101W4Fn+fwNpETmHWJZZcbd0nt6GDyIIBmjYWZCAIUDMVVgzn
 5niV2im+4VE+Sd/By+UHwHdnk/Gkbvb5Qsym2HfSIfOL+ZiIfieOEkx0LOkPYHPfA0iJCkRt2Yc
 YDf4DHLXsRHcf1iIyvXRsPCRn7I0Q/LgU0iAjsyjsC+MOHYYd1jcxQu1d2GlUj4qs996b8iGyMl
 Si3t9alFEw9+HIvYp5pYOF7C8sbPO0iMRIrwgHVnxWcyTi6Z1/wbFTvd6Uj1Yh+7t2TjXfGFfOf
 w3vY19jVNi5vM33lXgCF4rxXR91LK7fQppLQuNOU2yLNn794eKFeOzy+GNQxThaFdoEHSp4zddu
 prMxQFcxLkPVeVLeAdQyT+fpZ4CUQr6zC7DgnSOr/aoVcpTTuNB0BDwH5M8KnfQwV2d+untEhJl
 APkefwgpFVd9MjA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jul 2026 13:59:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10002

Exit with 1 in case there's an issue with the glossaries. This will be
used in the next commit.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/check-glossaries | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/tools/check-glossaries b/documentation/tools/check-glossaries
index b5dfe834e..9f1a47126 100755
--- a/documentation/tools/check-glossaries
+++ b/documentation/tools/check-glossaries
@@ -4,6 +4,7 @@ import argparse
 import difflib
 import os
 import re
+import sys
 
 from pathlib import Path
 
@@ -33,6 +34,7 @@ def main():
     # :term:`A <ABIEXTENSION>` :term:`B` :term:`C <CACHE>`
     glossary_re = re.compile(r":term:`(?P<letter>[A-Z]{1})( <(?P<varname>[A-Z_]+)>)?`")
     entry_re = re.compile(r"^   :term:`(?P<entry>.+)`\s*$")
+    exit_code = 0
 
     for rst in glossaries:
 
@@ -74,6 +76,7 @@ def main():
         if diffs:
             print(f"WARNING: {rst}: entries are not properly sorted:")
             print('\n'.join(diffs))
+            exit_code = 1
 
         for letter in glossary:
             try:
@@ -81,9 +84,13 @@ def main():
             except ValueError:
                 print(f"WARNING: {rst}: variable "
                       f"{glossary[letter]} in glossary does not exist")
+                exit_code = 1
             if index > 0 and entries[index - 1].startswith(letter[0]):
                 print(f"WARNING: {rst}: The variable {glossary[letter]} shouldn't be in "
                      "the glossary.")
+                exit_code = 1
+
+    sys.exit(exit_code)
 
 
 if __name__ == "__main__":

-- 
2.54.0


