Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F27E93713
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:05:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.25999.1696536304864439496
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BDvqDlRD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 340711C000C;
	Thu,  5 Oct 2023 20:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BV8unj2mtAKrhg0bNHxTMXIJFZqg4GZs3Ulv9x1Ag4c=;
	b=BDvqDlRDhf8gpT7ieUNhNK3WBpdjgU7LrHCI4ki810I3dxOL8EjBXi/45dIm3naVchCtqu
	YN17c93D447B/hQFzpr33XSEoSR18mMRnIzVm8TwULKiigE+dSwZSFhsEwPWCez/xlNB9w
	EAVvmbTXw9cIuTDcFkNWVJA6A1B58gMIXQ+DclAVk4IsrdUPnZgjPOtWwERe+JmpVYH7tr
	tnQiU2tttu0wuqChlNc5fqaQF1CM+Oz2CqEHiBF+Je5yqbPw1fp5xulMtyPDzLBD6ZtX1D
	xsMp3F55Xz7STTEbfcin3Ip5xRf0rtzf3wHZEkLxFBxURgNulhnD6q8+0SOKRA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [mickledore][PATCH 5/9] contributor-guide: recipe-style-guide: add more patch tagging examples
Date: Thu,  5 Oct 2023 22:04:49 +0200
Message-Id: <20231005200453.2873299-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005200453.2873299-1-michael.opdenacker@bootlin.com>
References: <20231005200453.2873299-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4323

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Roland Hieber <rhi@pengutronix.de>

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/recipe-style-guide.rst  | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index b63172bd77..7906e5e5d9 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -336,7 +336,10 @@ the status should be changed to ``Submitted [where]``, and an additional
 ``Signed-off-by:`` line should be added to the patch by the person claiming
 responsibility for upstreaming.
 
-For example, if the patch has been submitted upstream::
+Examples
+--------
+
+Here's an example of a patch that has been submitted upstream::
 
    rpm: Adjusted the foo setting in bar
 
@@ -351,3 +354,19 @@ For example, if the patch has been submitted upstream::
 
 A future update can change the value to ``Accepted`` or ``Denied`` as
 appropriate.
+
+Another example of a patch that is specific to OpenEmbedded::
+
+   Do not treat warnings as errors
+
+   There are additional warnings found with musl which are
+   treated as errors and fails the build, we have more combinations
+   than upstream supports to handle.
+
+   Upstream-Status: Inappropriate [oe specific]
+
+Here's a patch that has been backported from an upstream commit::
+
+   include missing sys/file.h for LOCK_EX
+
+   Upstream-Status: Backport [https://github.com/systemd/systemd/commit/ac8db36cbc26694ee94beecc8dca208ec4b5fd45]
-- 
2.34.1


