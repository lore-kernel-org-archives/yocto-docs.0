Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A53FC43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 08:56:33 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.9242.1656492984813233310
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jun 2022 01:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PXGBT+I2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C20C7E0006;
	Wed, 29 Jun 2022 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656492982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PvOafNBz9X79XKuTtno/IuOCH1KkXWbcZy+O9REXjcc=;
	b=PXGBT+I2emesLVya7rDTGepQrHrHE2qDOX0+d65T39FmNA4B20dXEkwLB/2nyQxv4Cic2n
	9u6wVSH6598axb05ZUvOo+oCUv71roiMHNrFH+VuZbxIBmkF62P7Dt5TJshNV8e085bc9i
	rxn5QC2lFnQjgyIW8n5Qog/cJX2/HFzqI+1oiVSA+2ELlckWeHRnXZVQvY7dc+yQS1r1KV
	RjU7KAt3B2sxqot7HfahNaWFxDfI16D+vtnPa+Ayi/5LKWF9/Nyrl/P9+cT5nnXxCYMMqs
	Q5zvbWRuBfw3We2YJ6cIXihVBXQDIAA5tRpTMbWEwsb5tcT6Ru0B7EFYOl94cw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: README: improve contribution guidelines
Date: Wed, 29 Jun 2022 10:56:20 +0200
Message-Id: <20220629085620.3362348-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jun 2022 08:56:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3044

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Properly refer to the guidelines for configuring git
and preparing patches, plus minor improvements and updates.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 README | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/README b/README
index 4f95342042..31119905e7 100644
--- a/README
+++ b/README
@@ -2,7 +2,7 @@ Yocto Project Documentation
 ===========================
 
 This repository contains documentation materials for a variety of the Yocto
-Project components. In particular see the README under documentation/.
+Project components. In particular see the README file under documentation/.
 
 An online version of the documentation can be found at:
     https://docs.yoctoproject.org
@@ -10,8 +10,11 @@ An online version of the documentation can be found at:
 Contributing
 ============
 
-Read the documentation/standards.md file which specifies some rules
-to follow when contributing to the documentation.
+See https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
+for generic guidelines for configuring Git and preparing patches.
+
+Read the documentation/README and documentation/standards.md files
+for rules to follow when contributing to the documentation.
 
 Where to Send Patches
 =====================
@@ -19,11 +22,11 @@ Where to Send Patches
 When sending single patches, please using something like:
 'git send-email -1 --to docs@lists.yoctoproject.org
 
-The To header can be set as default for this repository:
+The 'To' header can be set as default for this repository:
 
 $ git config sendemail.to docs@lists.yoctoproject.org
 
 Now you can just do 'git send-email origin/master..' to send all local patches.
 
-Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
+Git repository: https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
 Mailing list: docs@lists.yoctoproject.org
-- 
2.34.1


