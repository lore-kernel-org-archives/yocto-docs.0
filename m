Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40116EE14D9
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 09:42:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.9272.1694079767159692661
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 02:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CVDAPRBS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48F554002A;
	Thu,  7 Sep 2023 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694079765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X6jnEpejstdIhSLx4dkjpoDpB470+5puxgcsiX4i0k4=;
	b=CVDAPRBSVWFYm78S2WdJY+0+GbELwSK2y64tfLrqSP8/piraQmiqGYIcv3Sw4Sq+6GlXVb
	tZvbp7x4C5o/4du745bGed1IQ7bRnTNt/ej0RXkC3p/mOJMjyxcrVcRNu8rhvyObdn57Xr
	2wCwnliVdlrwIUdplDIpFxioxpHcYcnAG2YF6JbxA6W4QMyarGX10gnUcH84MvbKViuL3/
	KxAjm3FxuImqevR3Fgb7dv3EPmvk8eNEzTgg0BJ/fy9EUJ3E1+laFPpCETxqj/RvheF6iJ
	zIxfxZgAS8fs6nnWcO5dk5PhZBIMSPtOG8axwbq2JQ8JlUhcSfoXN30hWH8Lyw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [dunfell][PATCH] README: update with version on master
Date: Thu,  7 Sep 2023 11:42:38 +0200
Message-Id: <20230907094238.198341-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Sep 2023 09:42:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4203

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 README | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/README b/README
index 6a7f3abe63..88d7fc5530 100644
--- a/README
+++ b/README
@@ -2,22 +2,30 @@ Yocto Project Documentation
 ===========================
 
 This repository contains documentation materials for a variety of the Yocto
-Project components. In particular see the README under documentation/.
+Project components. In particular see the README file under documentation/.
 
 An online version of the documentation can be found at:
-    http://yoctoproject.org/documentation
+    https://docs.yoctoproject.org
 
-Where to Send Patches
-=====================
+Contributing
+============
 
-When sending single patches, please using something like:
-'git send-email -1 --to docs@lists.yoctoproject.org
+Please refer to our contributor guide here: https://docs.yoctoproject.org/contributor-guide/
+for full details on how to submit changes.
 
-The To header can be set as default for this repository:
+As a quick guide, patches should be sent to docs@lists.yoctoproject.org
+The git command to do that would be:
 
-$ git config sendemail.to docs@lists.yoctoproject.org
+     git send-email -M -1 --to docs@lists.yoctoproject.org
 
-Now you can just do 'git send-email origin/master' to send all local patches.
+The 'To' header can be set as default for this repository:
 
-Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
+     git config sendemail.to docs@lists.yoctoproject.org
+
+Now you can just do 'git send-email origin/master..' to send all local patches.
+
+Read the documentation/README and documentation/standards.md files
+for rules to follow when contributing to the documentation.
+
+Git repository: https://git.yoctoproject.org/yocto-docs
 Mailing list: docs@lists.yoctoproject.org
-- 
2.34.1


