Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C304AC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 10:55:24 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.41685.1702896915245509396
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 02:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XFJlrcdp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E578C0006;
	Mon, 18 Dec 2023 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702896912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PXecpkpvE015KAx7LiCzBihJYRRbp1uduzGl3ayNut4=;
	b=XFJlrcdpe9mfhW0epk9Q0ySffqvUyB3SuX8bQ4xCWlkYja59Su7QkfVF45klSDHYan3Y6Y
	ZicarRRir4CNiDLGvatLHq/5PGEmREKgsbkbQc30iMjuvdV8/0jFhAkOLXiIPzXl+YGRK9
	OQbvhrI2n7GYO08wydL+oiWpxUybAxeCHijq39oT602PI/o8+7twI8+bF591QChc3DhzCb
	Zv+L8aDpaQ18ESeSGBKSeJJ/5YIRerl9G6eMMF6mBbJv8Qvk2gdFzkK9VDKO5L5FZ+mzEA
	fJM2b/XoEUzQOhYs2jGYnE9GCIQqTIctZs9QoVwThdVbw+NLcjnrqgFdq4xflg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] contributor-guide: use "apt" instead of "aptitude"
Date: Mon, 18 Dec 2023 11:55:10 +0100
Message-Id: <20231218105510.114907-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 10:55:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4684

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As used in the rest of the manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 5a6136c8c8..95728c25c6 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -57,7 +57,7 @@ Set up Git
 The first thing to do is to install Git packages. Here is an example
 on Debian and Ubuntu::
 
-   sudo aptitude install git-core git-email
+   sudo apt install git-core git-email
 
 Then, you need to set a name and e-mail address that Git will
 use to identify your commits::
-- 
2.34.1


