Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724F1C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 16:22:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.17823.1685722960052895012
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 09:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FAZDYjcv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685722957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9SnTBnaPKKKEWmkgn6QkK5sIM+RQLzAg9ngWq/MUPJw=;
	b=FAZDYjcvq+3KcgZ+OA/4Dpi7LyWSDF2+Pja1VL/v7GogIXSgBRNXhxyCTnOQnVoZWWKG0d
	ZP4dEN98r3E6E+7U6XMnNBufnfcx15sx/WDyGEcOK/AYmiRCnmn87mCrxAyjij4LTASsmq
	A/BpWnSBnL3vLBEs8TQZc/A8jeRr9JnneAGG18W4jkZDEPAN0V2Fk7x672MakFkzyj0EIG
	aSGgK+FOuI94adL3WxClZ91Ckj7iDO3g2YD4p8N2EvcPaGZNb02TH0YFPmbQAB895V+Hb7
	F2JLfoj5xJ5N2/JrytMQtKZNyHQQ32w7WQ8RBnh71hI8X2XLnH69VO2WP57TrA==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7180EFF80C;
	Fri,  2 Jun 2023 16:22:37 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: release-notes-4.3: update documentation notes
Date: Fri,  2 Jun 2023 18:22:35 +0200
Message-Id: <20230602162235.2497009-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Jun 2023 16:22:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3985

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.3.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 1cae8f19b5..d782a5917d 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -59,6 +59,15 @@ New Features / Enhancements in 4.3
 
 -  Prominent documentation updates:
 
+   -  Long due documentation for the :ref:`ref-classes-devicetree` class.
+
+   -  New :ref:`summary about available init systems
+      <dev-manual/init-manager:summary>`.
+
+   -  New documentation for the :ref:`ref-classes-uboot-sign` class and
+      its variables and for the :ref:`ref-classes-kernel-devicetree` class
+      variables.
+
 -  Miscellaneous changes:
 
    -  Git based recipes in OE-Core which used the git protocol have been
-- 
2.34.1


