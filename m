Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD844CE79B3
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:08:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.32059.1695197292385625255
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H5NNpgL0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA95EC0004;
	Wed, 20 Sep 2023 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkEwKPLsyYMzcnrYRfjE6Wdd+9C1/WmDuD+buGGJ6Rw=;
	b=H5NNpgL02e8zQFisRpE8aInEXK0V9tYE0AaLK1Wvv+7146Yygkz8BLsIqVPzupKDHmRQ4P
	bQUZaqy1c8/mFOp1L+0MByltPGCD7+0jCDMCC89f3qf0DLTJkpJRyfKVE4AcuNxjKZJer4
	+gFQjrbqAQ9LqnNCaj/S9mWuov1OeG24EEK4R48lubjMCPayxxw/9pSJiPamusXUi0x1Wc
	Cgl47vIf7EifRasyo5WKn5v5LGXPv7x32sjXKGs0Q9w6LitmXn25r/6CuFtbzTA75QfgS0
	SdZZKuL9TL4RlWM0/B91yOGxD7zUSmqWFGE5pTtNIRCmUeQVWXF6yXPci1BUjw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [mickledore][PATCH 7/7] ref-manual: point outdated link to the new location
Date: Wed, 20 Sep 2023 10:07:54 +0200
Message-Id: <20230920080754.1225508-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
References: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4246

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Roland Hieber <rhi@pengutronix.de>

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/qa-checks.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 6fdb0fbde9..4a02e7206a 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -754,7 +754,7 @@ Errors and Warnings
 
 - ``Missing Upstream-Status in patch <patchfile> Please add according to <url> [patch-status-core/patch-status-noncore]``
 
-    The Upstream-Status value is missing in the specified patch file's header.
+    The ``Upstream-Status`` value is missing in the specified patch file's header.
     This value is intended to track whether or not the patch has been sent
     upstream, whether or not it has been merged, etc.
 
@@ -762,13 +762,13 @@ Errors and Warnings
     recipes in OE-Core) and ``patch-status-noncore`` (for recipes in any other
     layer).
 
-    For more information on setting Upstream-Status see:
-    https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
-
+    For more information, see the
+    ":ref:`contributor-guide/recipe-style-guide:patch upstream status`"
+    section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 - ``Malformed Upstream-Status in patch <patchfile> Please correct according to <url> [patch-status-core/patch-status-noncore]``
 
-    The Upstream-Status value in the specified patch file's header is invalid -
+    The ``Upstream-Status`` value in the specified patch file's header is invalid -
     it must be a specific format. See the "Missing Upstream-Status" entry above
     for more information.
 
-- 
2.34.1


