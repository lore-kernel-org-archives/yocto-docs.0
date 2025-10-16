Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B675CCD1A2
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3663.1760604885806995502
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dtlLliTj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C1541A1416
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 534696062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6097102F22F8;
	Thu, 16 Oct 2025 10:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6voGyaJN/YeY8El1xAdqRUFFM9Lnh0L+oqVNNHh0qMs=;
	b=dtlLliTjsD+JeEC6k5B66UpgeBN85maq4HFPAUNZ7ErLDdhLbsQmKUFymBTkrRy726VS1R
	h0oPHDhuNM3R+AHxjOpwGNAbfDktj4A1YWriNov70AW0rj3ODINS1Rj5xXRlC+HmRLjAO2
	Gc0XVUKdIrXGg4z46V+J00ixzKUF8xAnfq6hBRKtC+UxOTka9QqDJZKtPhWfG02+1DUVi2
	QyJS10kFymWTFna1R2S+pQucIH0P4M8s1I1GH61GP0/6mGXsaLt2FYkt0i0dMjY8nJ7sp0
	c7UtjQyCHoRdO5Sd6s1f8yaRnSQxuyeHk8KywImEz4JzaZWh8mfyrBiU8SrRiQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:53:52 +0200
Subject: [PATCH 02/17] ref-manual/features.rst: add new opencl feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-2-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yDNxX+4ehw15khYPY9eUZN4jWu/nb6H+BTWzhYFQ/cI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLOCyHocItlaWJ8xw8oXRjOjSRyLwuSKjdyZ
 zXcEWYxXkKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCyzgAKCRDRgEFAKaOo
 Nu0LEACjcbhhU7M9Q3Ue2KRT4kKh5kdUkljQ4SVXVTdJY9EvgQf809Ck1WbVCFsMjH8mia06BMR
 qcW6i/2qcZ7GFHzyHxqzv1lB/gujFzsGSFtRYYNYmbQ8KnRcdxpk/hlitqPE5sDMVygC4ljJjur
 BWKjCuStganf/x/AtSrOUNW/aSRYGXn9t7cnWgoG99T6yjbgog0/DifTQgBCoCUfpgfPD6AzzpZ
 Dh8CPj+/I4v+9bHOG1loKiCQqwyrZHA97wVrP31ElpzPNRyKvjI0DZbsYcEZeH+3QGZObg/eA+d
 OXIjN1Nhub12RM4HZgbJVsDi2jwRO7//C6C3ddJSzSSr85fYU62xivzd/qpJUPSyan+ThpE03hU
 jfxnXM9ceyk/tnRCqk2+zOf61EYs1Ee909WmCqPNwA3WYuVxQDFz3vaXxzneWQxavwh/cGXFAc8
 OEwcxOdoFSup3geoF43rPCqC4jKZz0aySAwbiHyKdE0gfxA4aLOJsYJ98en2+xdpQaSzPP7DpTM
 WpVFaYYGbDtKKhB27qs6HXB+iMHqJBOi6gKNz9EhplwpcdXkJmlmYat4/KmFj4Q5W+tvI8Bj20s
 Ca8vRAG9hGXnHe8r2hh5JUtO8KZkL5mntfexOOUyceCttfG7xkerM1fWOtEtBde2cyXbVHVBWw/
 hj3lfLvpHaNw4MA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7711

Added by commit 3061d6061e74 ("mesa: add opencl DISTRO_FEATURE") in
OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 2c074ab9c..0d2f2ab0d 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -180,6 +180,9 @@ metadata, as extra layers can define their own:
 
 -  *nls:* Include National Language Support (NLS).
 
+-  *opencl:* Include support for the :wikipedia:`Open Machine Language (OpenCL)
+   <OpenCL>` framework.
+
 -  *opengl:* Include the Open Graphics Library, which is a
    cross-language, multi-platform application programming interface used
    for rendering two and three-dimensional graphics.

-- 
2.51.0


