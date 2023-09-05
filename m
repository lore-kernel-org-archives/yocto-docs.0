Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B439CA1003
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 19:10:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.30915.1693941042333282780
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 12:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iShO8xm3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89667C0003;
	Tue,  5 Sep 2023 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693941039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=68zhpeazWizPLXynzT3jO5f2/X9D2pse7fY4c9TTkf8=;
	b=iShO8xm3GTrdzGzyY4jbcPLuKwVSbTIVpCYUNzdISFyl0/OTzSBwKSgwkf0+mrKUnn6HxK
	t4WmnHcx7RqukcVvycG+7Swcq8BG7g2eBOKzzzUCeyTqJBKkuyWdCaXV7jAio8icY5ewhd
	oeEHb8e8nGAdm1U5bbbAxElVW9ZoX80By7h+Z6DokM2NF5v9L9dDwKGK4oDFqe1bNKk8fm
	ls48qqxMDhpCCuDKHA9fsAEhJrfPriTEmSw4Pv06Iihp4jJK3hmdTZeaHuT5z54SwFunyO
	DVhYmcZTsW62LUz5ZKs0cb6y4OMj3tJqtfeBxIAYgtay1/CZuwWTqIOP8nAEQA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [mickledore][PATCH] dev-manual: remove unsupported :term: markup inside markup
Date: Tue,  5 Sep 2023 21:10:33 +0200
Message-Id: <20230905191033.124218-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Sep 2023 19:10:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4193

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Yoann Congal <yoann.congal@smile.fr>

":term:`Initramfs`" in bold text appears verbatim (no link is created).

The term link is present elsewhere in the text so remove the extra
markup.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/building.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 1f1642e846..a395793493 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -273,12 +273,12 @@ loading modules needed to locate and mount the final root filesystem.
 
 Follow these steps to create an :term:`Initramfs` image:
 
-#. *Create the :term:`Initramfs` Image Recipe:* You can reference the
+#. *Create the Initramfs Image Recipe:* You can reference the
    ``core-image-minimal-initramfs.bb`` recipe found in the
    ``meta/recipes-core`` directory of the :term:`Source Directory`
    as an example from which to work.
 
-#. *Decide if You Need to Bundle the :term:`Initramfs` Image Into the Kernel
+#. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
    Image:* If you want the :term:`Initramfs` image that is built to be bundled
    in with the kernel image, set the :term:`INITRAMFS_IMAGE_BUNDLE`
    variable to ``"1"`` in your ``local.conf`` configuration file and set the
-- 
2.34.1


