Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5E9CA6CAF
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5820.1769501991563215736
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KLYFmwfI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0CF474E422CA;
	Tue, 27 Jan 2026 08:19:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D7F0A606F5;
	Tue, 27 Jan 2026 08:19:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16C8F119A867E;
	Tue, 27 Jan 2026 09:19:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NP5wtYW3GOOeLJCnGPEvh+HZe334NHxcZaiTHgqDEAw=;
	b=KLYFmwfIj/kGOX6311sQlaRRq/NYWuKlx/+2Ee3Ivk4io27+HPcbmuWJx+b29cwlf8vpjN
	1ITFx+BH0U8/3rPC5yvORbWQcs+TLsjk5tg1e9KJvHCT4qz4v9aJkNT23dFln05Dryo0BS
	IxQpHKflVLMD5y+oJBIW+joeJsuDT7/L+uweVoTEbNMMNebonlkAY8ZrCuzcObv7Ob/0fI
	tEDspb3vvm3eP0C7NtVhb4YlyULR6QKOVP1rVdqVSMYmLP5QJ47TuO+5Y8kP8z5AsaKL+l
	xWXNxSkYiejkfYlXmiXGJkxWoE6JpM0UcfKFiNHGPjLbE7jZ0GAO+FhAG6YptQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:35 +0100
Subject: [PATCH v2 40/56] dev-manual/licenses.rst: instruct to use
 git-archive instead of removing .git
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-40-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RvzBOHf1wOecdmTFzVG6QU5n8wPoLUgljQd+ivVU1ZM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUEyX3xn9dvNiQbLko4mG3h7gau5WqiWXeJH
 /6lLaoYGlqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BAAKCRDRgEFAKaOo
 Nn1rD/4ums9HP+dqApVeX4dhGVkPsPkssJ7fdmNrV2JncOEynTwXcDeqU191bXPCPwM09lnohDZ
 DmMAU53h5NimMdMgiushvzqIqSZ/w49eVR8Yh+vShXDMlUczLZ7GIqvBxxD5WklYwaGOHIdSLbd
 BHFeKHB5fHg1NIIG9BP8vzq/4l+jFNyuAireVHco2jkoOGwaS3CZnXwlgcckQyIjDSX9ncTJQKa
 ts7dty+n8DX2WA2KmwPMGlCJ3X/4XTYWzOx8aUZA+uTZk1HQ62AGdLa6HJI3RR69JAwmctYUop5
 vVPGP/2FnwGOOfPvgtAgHSI8uRvILqQ3XRM5sioANV7/80IqiU9590kOWYa1gWj/N521IK41oXm
 Zyh35xKrseq6Vak9Cm4E5QqSUu0uKcHzcc4jIu2aL5mNEOhHfhHTZgI5TkN4g8UTXtYt8ATjoTY
 GD/yASmV91aLj6U6FSPSB2VLZFMBVaJsIx0dRaT64irRP9jEwf0djswY0PUtqpe0OTHrU4RwC1v
 L+4nn5Ruse2ZmrF2Lji1n+wvLaV/wKvYqQrf6nStHQ7iSrRsC+Z9YjIZVfUvd90oF0UmYdg1SFQ
 2BAS3mK3nZizLXJvGHqC5GO3K8CUWsxFQ/iISL2Tj8RLD5l0jKGQDhWg6O/wAtbaoNYK9Z0sFo+
 aF0vd5NMU+3KPKg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8701

Removing .git directories is destructive. Instruct to use git archive
instead.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/licenses.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 1887e8e35..3d0167e75 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -465,12 +465,8 @@ layers are used to patch, compile, package, or modify (in any way)
 any open source software included in your released images, you might be
 required to release those layers under section 3 of GPLv2 or section 1
 of GPLv3. One way of doing that is with a clean checkout of the version
-of the Yocto Project and layers used during your build. Removing the Git
-objects can be done like so:
-
-.. code-block:: console
-
-   $ find . -name ".git" -type d -exec rm -rf {} \;
+of the Yocto Project and layers used during your build. Archiving a Git
+repository can be done with the :manpage:`git-archive <git-archive(1)>` command.
 
 One thing a development organization might want to consider for end-user
 convenience is to modify

-- 
2.52.0


