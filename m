Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2732C61D85
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 18:33:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.101513.1700764402733526497
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 10:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oGZIwfV/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F99740006;
	Thu, 23 Nov 2023 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700764400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TYtHuA7hFVto5FI+q90NtUCjls0b6aSZnr7M+FZknz8=;
	b=oGZIwfV/twnk2uZjYC78OwxHp/RzYr+I1tU8CrThVFdRLB0zqrAQqjpY8UgJ3kihL6YQcp
	aKQTiu5jM6IqdwvdkbaXbMpWRenBPthH7tz8z8JEHwTpPEN34CXfJO76e8L/6Yqnz0VDMZ
	v2h0GIEBNTm3Mi5H2OroOOLVhs1a5fXPLbpxJnfDFQqLqMDyaoB927XlkTuOBAlF/7xaPE
	EYVe87glVzaqw+loUpC5xlmTVwRkJGpCSCRJtRPwa210cBeQ+M52ci6r6zgKe4Q7bRqy69
	648vl7eIV/3UjSyFA5KbxCTBcQ+107j4g32PdE3PNUwYT5Dmo3JwlsaPpQi9qw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] contributor-guide: fix command option
Date: Thu, 23 Nov 2023 19:33:17 +0100
Message-Id: <20231123183317.63938-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Nov 2023 18:33:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4646

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

"--subject-prefix" applies to "git format-patch", not "git send-email"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 53daaf901a..5a6136c8c8 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -460,7 +460,7 @@ or any layer other than :oe_git:`openembedded-core </openembedded-core/>`,
 please add the appropriate prefix so that it is clear which layer the patch is intended
 to be applied to::
 
-   git send-email --subject-prefix="meta-oe][PATCH" ...
+   git format-patch --subject-prefix="meta-oe][PATCH" ...
 
 .. note::
 
-- 
2.34.1


