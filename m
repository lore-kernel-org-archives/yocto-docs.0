Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E39EC44501
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:35:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91296.1783078513021659357
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jMBX9hqm;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 149A7C49F4B
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:35:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E68C60300
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:35:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58B55104C958E;
	Fri,  3 Jul 2026 13:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783078510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dcaENyUF3pivt1gmWP6eKmQOUYGoCfy3J3FGjBt472o=;
	b=jMBX9hqmlsPDh4EnHRRdCM73Zg8p82jXPwE8pdi8U/AHhrCd5VvZYfCnRYckqbeBYPxseH
	0gd/oyZkaE7TmE+MN2myUVtdHlzBxnKC20qm1CRvdP0rpSb7Mv/4kSXalikG9BCNL8zNth
	9uEnL93nowp1MkZSjBkAGNN4fgRUFV8+hSKP3DVIu5hjHo3QQ6+4xjEJhxHbkwdEoiUptV
	EB7oYZnNuhO7YMixaNdpj9ikvACwZ179slxXCWm3sNL9D3t/Wly0yP8trKuSjEHBFPSY/k
	UHo+muaJdtDIU3gNkKqCmiwNIdcDjGWkRjJNCWyz55KFu/yNtdA+RP5coWwa5A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Jul 2026 13:31:24 +0200
Subject: [PATCH v2 1/3] tools/check-glossaries: return 1 in case of failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-pre-commit-v2-1-a9a391299c28@bootlin.com>
References: <20260703-pre-commit-v2-0-a9a391299c28@bootlin.com>
In-Reply-To: <20260703-pre-commit-v2-0-a9a391299c28@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cv1k31EOHlqOhqa+0eOZTnogp1sflX53BHRVYheT0Is=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqR55tNgiAY7ih7hPVK0caKdsCiFuay1EuW+Fl2
 GGgTz8DE3CJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakeebQAKCRDRgEFAKaOo
 NmzpD/4vGQ+EdYE3pmCa+9JT2L4fQm2yu/aH6kBDl6kQMaeWRoZbxJ78Cl6LvKX1fYmzZLJoyLZ
 Cl78ruVezmvxbpZc9kMn6JRgwhQoLd48iWMMgr0kI0uabfLTGSPFzFvaIeBLqz6qskk04NHcjF9
 U+5Gh9Ko7ogNUuKFCVRe9FatUzd1VGAcQqqNiC+qUTVdF4EzG5jVju4+9xUXr+wWs8e/XBHlZ9H
 7L/aRcxq898EB5BRcTKhRuMKGmte5EhVfC22OwspbnpqKHFZV0km2crx4FTo2ZkeQCRUDgGrtMR
 fiWjY54tQd2pD02xcJu2hobW7gS9SIqVVjV87rH057EQFvEGSLLgJTpw8ZMj3inrt8NZkeEX5cQ
 TV3Y5md6M91d1FTxZQqHeUjhkGydjf2HM8RfKhWYFCu4DLvLgskb0/cQoMninin4R1GzAzZPstP
 LU2fW98sD3Av40Ce+QhCbL8pykaP22godrqWQJW94icfzMcB+Ztrda5mo/Nsj0FHCD74ak8W0Ac
 VKjpsKaepQ5cZAjwZIBP/lihIsotRfYyKFSi6UjPmYTXsI3Wf1DMPr01QkyiqErOcZV60Zc6GRO
 W7vHN6pLcGtTKwvpijFmJC58fhkjGUfkz1OUODNVE3rG6dhyTyg1hha7bzwRpajXWOwMKYpQIhH
 MUrs5Ef3vWY7UyA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10016

Exit with 1 in case there's an issue with the glossaries. This will be
used for pre-commit support.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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


