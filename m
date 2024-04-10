Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2141CCD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 14:23:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.1022.1712758973069095180
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 07:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FtkaSpZ9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DF1A20025;
	Wed, 10 Apr 2024 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712758971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N+uJKwV/fFC3n2wPPKdxu8ZR8On9WQoQQFlWp2Es9Lw=;
	b=FtkaSpZ9YUw0zg2FkmyqQrVeXNCRHVQBOv1C65/pHY5wZs0FVBmARoe6fT9euufAxWvCE5
	i2KG3/LKl6PJB2lcKd2C0sFGYeRBm2Nf2Mwki4PXcWIKRmRw9A1zRWcPtFVg4TLeR14zsg
	ntyFNl3LG2VZjSP2y9aMoWc+2RI0gGpyQIKJaPV+vjRrdFTfCqyQk0jSuR4RbNtrs5+kKs
	vNUmEPFrEVSrSSg+pqXzGtn1PRwCJfszr+pbQ/ETfDrW3zkH5KDSoFNzf2BHTHX+xLv+Ml
	SMZu0F2Y943N3pXTfQ2Rfe1ROHO0TTX0fsqlaTf1iatLk/cXPwKjqsNxESj7PA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] release-notes-5.0: documentation highlights
Date: Wed, 10 Apr 2024 16:22:43 +0200
Message-Id: <20240410142243.2982513-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 14:23:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5107

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 1898b537af..d67569096d 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -189,6 +189,17 @@ New Features / Enhancements in 5.0
 
 -  Prominent documentation updates:
 
+   -  Documentation for using the new ``devtool ide-sdk`` command and features.
+      See :ref:`using_devtool` for details.
+
+   -  New ``make stylecheck`` command to run `Vale <https://vale.sh>`__,
+      to perform text style checks and comply with text writing standards in
+      the industry.
+
+   -  New ``make sphinx-lint`` command to run `sphinx-lint
+      <https://github.com/sphinx-contrib/sphinx-lint>`__. After customization,
+      this will allow us to enforce Sphinx syntax style choices.
+
 -  Miscellaneous changes:
 
    -  Systemd's following :term:`PACKAGECONFIG` options were added:
-- 
2.34.1


