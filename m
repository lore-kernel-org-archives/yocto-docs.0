Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD45C54EFC
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:44:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26357.1785138238087202596
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 00:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gYLGj68Z;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ACBEE4E40F92
	for <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 07:43:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A995601BE
	for <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 07:43:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33D7511C12196;
	Mon, 27 Jul 2026 09:43:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785138234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=NRjoeRBhkKco76RPWLuo4f6U6tzqLetc0uSn9kyA+xg=;
	b=gYLGj68Z47GHKN2AjEsKYNcar4GgYunI08VHPMqgmrxa74zs1/yE0hbRIbXUa/vlj5byyo
	dAYiOD5McyoZOW6ymtivZMTOSidCVlVavMBA3DuR2WMocOF8j2QeItL0vxG0+j9olEkJVX
	Z3Th2JR6abUA1ixFTP5dApa1Frd0PZ2R38mb6b8mYE0FiVAQyzn5LW+v8Cel67gMHH/5h3
	otnPHegOQqV1yDkSjbdJTW/Pj1r96Bs9MHosvgqskex3yf49txZ6dFBYldXqtEMS4hzl8E
	OaMIim/XVIL3bt4osUjLAAnivwC3JwzrrIANfxslpUlA/714HfRAcf0oH9f0Xw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Jul 2026 09:43:47 +0200
Subject: [PATCH] tools/gen-cve-release-notes: add argparse support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-argparse-gen-cve-release-notes-v1-1-22e7ad7e9d06@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCQAxG4auUrA1MB7HUq4iLdPw7RmRaklqE0
 rs76vLbvLeRwxRO52Yjw6quU6loDw2lu5QM1ls1xRBP4RhbFsuzmIMzCqcVbHhCqsu0wDmFGKX
 r+mHshWpkNoz6/g0u17/9NTyQlm+V9v0DFmDqT4IAAAA=
X-Change-ID: 20260421-argparse-gen-cve-release-notes-c022a779bf9a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=L+RaehDpIOP8OUZcfON0MoTDu78Jmlr+RjdYWsg78C4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqZww4wRV6pPb+CKEnPk5xni+X8/Vf54cvEaFu1
 NMVQXxKSp6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamcMOAAKCRDRgEFAKaOo
 NukQD/9xF9Y2OP7dq+L6FvX2q/dyyFBSRLJQzUgQHJzIi8BOHw6dYavdVdtgOfd4RTNAP3DmxZR
 x89ddPD7Dg9ebrxYPCCpVhQdupBjpI4nvll6uB2N9w5NzbgK3X7bj20/iHMhZdChCVtwk1WPuMd
 wnOa8iILUai1vkYYFU3dkbRYO25evZHVrVkJCcYLvCqikz6Vs3PyC3fgy/wfRvCbuheZt87th7J
 4ME0AZL8VxIlSC07CkblqgR4ORF5IucPar1F8ruwZ35zd1yNaWhN5IMsI1TiITy6sTbhTos9ExZ
 MQMNgoMxQZeN8MY+XpDN0cQQt6ijFyXUVSsZiqkOwS/ccZ83Nqbwxabi2PcGn+cdAUql9yI5OZ1
 3pjmG+sXB3bVrFUPPeXrcEVratoo5E/1Qq0QE8kl67Cq/aSODeHTXwYBLXYO/RBGh9/XKKWGphe
 /waicilioOcmZ6jilEuaIbSvoEOtURQbuWXDQh26w1On1ogbh9gCjIS17//ewnuyelaVx3WCqqI
 T+B/SPVl1uOn57KMe8iicyAvFH124RvWEr2aIclR/kI3R6J8j5MWGYTF57NunPXr+eni+VYlWZ0
 DVQx9T3o5V5WM/VNDM74gZe/PDIEV+wYsqxnLEcndhJg68HSs/sGGIVPBGzZnB5+hETDNAp0mky
 fEYBe+nkpB7DUmA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 07:44:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10142

No behavior changes, just the addition of argparse to have a
user-friendly interface.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/gen-cve-release-notes | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/documentation/tools/gen-cve-release-notes b/documentation/tools/gen-cve-release-notes
index 71d8fe502..84ac1a758 100755
--- a/documentation/tools/gen-cve-release-notes
+++ b/documentation/tools/gen-cve-release-notes
@@ -7,17 +7,22 @@
 # - the CVE status changes from Unpatched to Patched in the new report.
 # - the Unpatched CVE is unlisted in the new report.
 #
-# Reports can be found here: https://valkyrie.yocto.io/pub/non-release/?type=metrics
+# Reports can be found here: https://git.yoctoproject.org/yocto-metrics/plain/cve-check/
 
+import argparse
 import sys
 import json
 
-json_prev_path = sys.argv[1]
-json_next_path = sys.argv[2]
+parser = argparse.ArgumentParser(
+    description="Compare CVE reports between releases and output docs-formatted array"
+)
+parser.add_argument("json_prev_path", help="Path to the CVE report for the previous release")
+parser.add_argument("json_next_path", help="Path to the CVE report for the next release")
+args = parser.parse_args()
 
 data_prev, data_next = None, None
 
-with open(json_prev_path, 'r') as fd_prev, open(json_prev_path, 'r') as fd_next:
+with open(args.json_prev_path, 'r') as fd_prev, open(args.json_prev_path, 'r') as fd_next:
     data_prev = json.load(fd_prev)["package"]
     data_next = json.load(fd_next)["package"]
 

---
base-commit: 358519ca6406a89fee42c45dcaf63a37a374f33c
change-id: 20260421-argparse-gen-cve-release-notes-c022a779bf9a


