Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA26C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 17:06:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.17681.1707498387850538434
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 09:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ecrbjbZD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B772460002;
	Fri,  9 Feb 2024 17:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707498385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M6T7YjxbF4UuLrqm5XevvNS4lsOCUF7uSBIN6FnOtPY=;
	b=ecrbjbZDBBq9EVbA0oCy9oboOlhnVs+hXeQnJ+2im97Px6O6srzmtqPxTaORYhCq4LWJfh
	8y71TE4U+Wb/xaJLjaUBnCBL+ZlJmfV3KzENwwC+Uhw8CQ9ZUAFqGlz2z+87pl4l+t8CvP
	Djy+32LSj8LRM01yoH76ysB20zfD3Xc3IfktSOjJxWRgo/SB0VbcdapmKy/7tTE4KkfKJq
	SNh6pFDgBVO0q1AM3sd6hrZaCdC7/HYLKCqAI2pGqghrq/DiYUrHigeo75Z0qRDC5Vmu2K
	7tVVtJZ3rhso0DhJqAH6zB9dTJe/lfo8YPVCPKqSzxIZTiD4l4VxFaI8+WRGvg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: release-process: grammar fix
Date: Fri,  9 Feb 2024 18:06:23 +0100
Message-Id: <20240209170623.2637520-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Feb 2024 17:06:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4828

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index c861feaa9d..9c4144fd2c 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -175,7 +175,7 @@ consists of the following pieces:
    piece of software. The test allows the packages to be run within a
    target image.
 
--  ``oe-selftest``: Tests combination BitBake invocations. These tests
+-  ``oe-selftest``: Tests combinations of BitBake invocations. These tests
    operate outside the OpenEmbedded build system itself. The
    ``oe-selftest`` can run all tests by default or can run selected
    tests or test suites.
-- 
2.34.1


