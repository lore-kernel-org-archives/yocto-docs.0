Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEC0EE14D6
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 09:40:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9240.1694079610616096068
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 02:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e/O2J3wH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 191721BF20D;
	Thu,  7 Sep 2023 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694079609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ijLOYM2/ncHgpnYpf3rrGRYvZcl2dBCxQ/CttQ85t70=;
	b=e/O2J3wHya9b+7QMEgnd5wr2roedrTn5vcyKUf5/nb0R1nzWEufmJ1obze/H4pXNPKQtQw
	uKgRkUZDnzkcmWZEAZEViLWYvDYoHX9Ur+JlzXzZuTWjpXWpYrIX75q1++vxQfjQ1AsYOj
	+trwYvxtiRkSgPJyA+SVskGBe/uZHr4N0NNiNZgu6mPmWlCmo+hN8F3dMEEb8snfOCNAHj
	zSW//p4hETC59uenkMdUU6afnStJ3nT+eJf/Z0Lj9vvsCD5zLXoz/zdf1N7UYP3PMKw49z
	ABiE5hR4CfwDYxChHulvCA0qrYxVbwtttnDBoavJUQMc2NwJjks28cfpCgZaZA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH] README: update with version on master
Date: Thu,  7 Sep 2023 11:40:06 +0200
Message-Id: <20230907094006.197905-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Sep 2023 09:40:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4202

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 README | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/README b/README
index 4f95342042..88d7fc5530 100644
--- a/README
+++ b/README
@@ -2,7 +2,7 @@ Yocto Project Documentation
 ===========================
 
 This repository contains documentation materials for a variety of the Yocto
-Project components. In particular see the README under documentation/.
+Project components. In particular see the README file under documentation/.
 
 An online version of the documentation can be found at:
     https://docs.yoctoproject.org
@@ -10,20 +10,22 @@ An online version of the documentation can be found at:
 Contributing
 ============
 
-Read the documentation/standards.md file which specifies some rules
-to follow when contributing to the documentation.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/contributor-guide/
+for full details on how to submit changes.
 
-Where to Send Patches
-=====================
+As a quick guide, patches should be sent to docs@lists.yoctoproject.org
+The git command to do that would be:
 
-When sending single patches, please using something like:
-'git send-email -1 --to docs@lists.yoctoproject.org
+     git send-email -M -1 --to docs@lists.yoctoproject.org
 
-The To header can be set as default for this repository:
+The 'To' header can be set as default for this repository:
 
-$ git config sendemail.to docs@lists.yoctoproject.org
+     git config sendemail.to docs@lists.yoctoproject.org
 
 Now you can just do 'git send-email origin/master..' to send all local patches.
 
-Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
+Read the documentation/README and documentation/standards.md files
+for rules to follow when contributing to the documentation.
+
+Git repository: https://git.yoctoproject.org/yocto-docs
 Mailing list: docs@lists.yoctoproject.org
-- 
2.34.1


