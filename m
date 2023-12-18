Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0881C46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2926.1702935250408470826
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gHVGnjfU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 666811C0003;
	Mon, 18 Dec 2023 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3w0FyFnQZJrcecXE3JbqX+SoH5M7BxK1zNxcEy/fOQA=;
	b=gHVGnjfUiaGBw4b1eLC4W4bO9lp89YPBEvQkHWkDjqcYJSV0li/TiMUFCtwR3H3MBwDDbB
	CMVm0rGARExbays8L7r41hcNafeDLUBc5+3WTfW0k62HIXibukatFbMCCk+vS2dMkb/LG2
	vD0nVKvIzT+dt1OpgWqqN3cCckMwl9U6X/xianWKOWUZYzbaYze754XoRrw4BGCPMu09mO
	AzDrcmkYS5fF14PNCm/b1ztbcbi9HOR8T+4mMYIMG/smomDiXcM71MLjm0i58BCmBmzroh
	qfzcDfLfzjmzqaaU/tkOsLu2/lOnpC6lqSCEuhecvnmx7PTiLcdaNQupLMrMpg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Justin Bronder <jsbronder@cold-front.org>
Subject: [nanbield][PATCH 03/20] contributor-guide: add License-Update tag
Date: Mon, 18 Dec 2023 22:33:17 +0100
Message-Id: <20231218213334.146370-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4689

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Justin Bronder <jsbronder@cold-front.org>

Porting from the old wiki
https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935#Describing_license_changes

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/recipe-style-guide.rst         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index a005aa3247..08d8fb4259 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -250,6 +250,18 @@ Recipes need to define both the :term:`LICENSE` and
    correct string that you can substitute into the recipe file for a
    subsequent build.
 
+License Updates
+~~~~~~~~~~~~~~~
+
+When you change the :term:`LICENSE` or :term:`LIC_FILES_CHKSUM` in the recipe
+you need to briefly explain the reason for the change via a ``License-Update:``
+tag.  Often it's quite trivial, such as::
+
+    License-Update: copyright years refreshed
+
+Less often, the actual licensing terms themselves will have changed.  If so, do
+try to link to upstream making/justifying that decision.
+
 Tips and Guidelines for Writing Recipes
 ---------------------------------------
 
-- 
2.34.1


