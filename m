Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7114FC48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:24:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.64000.1707143088242415795
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 06:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ft3Q7pCN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 627B2FF80C;
	Mon,  5 Feb 2024 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707143086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rh7UoIP0YO3wEyAdzRcK1Niz3gTnVb+1OHAkaERDRF0=;
	b=Ft3Q7pCNfkaqWexoM9o3eUA4Bw//ftjZRFYOQX1IY1o89rEqG5W1mEGt5DcaidwOAvOZoV
	lA4BlCcjqQ20rW+zPdfmP4Sw0iSn7SQcoKzXiJUSFW/U3cN2c5gd9ExVRKd+9h6MMz4z7k
	SPU9x/pv2OLVnpYuGnIrFkro3pLKDE5WDBIlWfCkX16cfRB7E355+/CtPwSChMFdB34q3d
	MA7L4Gyp75dcir3Yo/aVqa1ryDKU6/ANZnuIqEJ6e52ish1vNmLRJhQaonhM8w908IN2Fg
	uKnDe5gWLqa6o+oRMyNTPtrqjDLyHDYsR1OctP7mel8m1pnRajoe974JAgG5TA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] release-notes-4.3: fix spacing
Date: Mon,  5 Feb 2024 15:24:32 +0100
Message-Id: <20240205142432.158346-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Feb 2024 14:24:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4811

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This fixes an ugly formatting issue in the HTML output

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.3.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 85180dfc3c..0e175067da 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -94,7 +94,7 @@ New Features / Enhancements in 4.3
       API to access the kernel tracefs directory (from meta-openembedded)
 
    -  `libxmlb <https://github.com/hughsie/libxmlb>`__: A library to help create
-       and query binary XML blobs (from meta-oe)
+      and query binary XML blobs (from meta-oe)
 
    -  ``musl-legacy-error``: glibc ``error()`` API implementation still needed
       by a few packages.
-- 
2.34.1


