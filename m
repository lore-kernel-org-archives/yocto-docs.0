Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A787D74EE3
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 14:58:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69574.1769180307432056386
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 06:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Fl/BNRl1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF7191A2A37
	for <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C67306070A;
	Fri, 23 Jan 2026 14:58:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DCE7F119A87BC;
	Fri, 23 Jan 2026 15:58:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769180305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9pif0IfN9QpMiKlAVSdS2NNlTe9rlrwEPQ7pWL32SSo=;
	b=Fl/BNRl1rNW+mUZLc4SJzFbfMf6mN8i1N6G4fNgNGUv5mOVThknA1CMcRuGzBcwl52AaIv
	k5AswqZxjoVoZUCFrt9Kk7FUrp9qY60m9UeKtTvA3xN3/sXZ6LWRNXBf2cYnKdKtTp6rae
	qCsWmlbrlwG8oNX1MGpxG5R/xuapbkoqJ/GBEOWrSCgTuiah1Y1pQz5zmO55BqGpaZdDjA
	snZBCvoQQKRf5nZNnTqI313q8b2QeynK1WD5vjeV2XI+QVSjeLosOrzfxiU0G86uBrMfXa
	xvovIfWVrDalnlLlnWlXZS7uf0tvebTPbX0T13MRHLBIr6l6JzTN7fiSLdOUeA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 23 Jan 2026 15:58:14 +0100
Subject: [PATCH v3 4/5] dev-manual/poky-manual-setup.rst: mention the
 Source Directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-terms-refresh-v3-4-41c35f0a6a13@bootlin.com>
References: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
In-Reply-To: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xZ6P3pz27eY22XlriTdrCFyYnXYE4aDCs4F/JmCiWR8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpc4yMFjNh01Ppq8sR1ASqUF+VtSdfm3CLb60eV
 8L0F+qeo2OJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXOMjAAKCRDRgEFAKaOo
 NvOYD/4t+/1AUPDLnIJH0S93FKbWo4/iIPUzA62kCsRXEjMsYKs0gUihZTbsZQsOlZ7cX3yNgwS
 iI7Hu/N85mRatKB/TZ+J5daV4f9c0ZvPr7ME9RQ1SPOY2qD0TU3eiqQ7wzp9M6+XtrpQxEeglyG
 BacarRywfjzh+967KLtbIstiMYPbEbidiBKdXI5z/fF+5LDlxABHEjso6H6KQePaApPjJFRg80n
 m6rPdHc/GNmg0UvofGw/besqJhokZOhgUKwh20+XSo7w0ob3Bt3njcq53nKn5PBKm1tzw5QovzU
 J9Ia6TbSqy5dvkl8wJYE4TjmfL7h9+jv4IYOA2mWvqsn4ZSw94iS+QAC+na6fsqGBWlOKxerMZQ
 okUGryIGuYK6tQiR+oF804Y/SrDIiLpQx53YlwPTG0TotLuRT2XjQ+I59PWbCQ3qj2Rg5mHRXs7
 E2P975OEC6UVkHaT7rmqxO/y7BsDmILv/5itqx0jpvH47oKwQgyqmnwpszfBB1K5Jf5suCXUdrF
 yyhrK2F3Lg1cQ7orVfPs11k4xdb6a/h0tSI+6lRzHc6ybych/dayO3gMLEkrvYsvuaLiiStTTws
 ivVT1+RZkvK0fj3DiIkybnmDve4LHZpDOKI0nIh4bEPz7ryahLlaUbRg2wxV9EVOdR4NU+RtVPv
 U94y7lHsmnpa5MA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8644

After switching to the new definition of "Source Directory", i.e. the
base directory for your project (which used to be poky), mention it in
this document on manually setting up the layers for a project. As stated
in terms.rst, use "project" for the directory name.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/poky-manual-setup.rst | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index bcda9d7e7..4bc9b97b6 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -22,7 +22,16 @@ release or a Long Term Support release.
 
 Once you complete the setup instructions for your machine (see the
 :doc:`/ref-manual/system-requirements` section of the Yocto Project Reference
-Manual), you need to get a copy of the different :term:`layers <Layer>` needed
+Manual), create a :term:`Source Directory`: the base directory for your project.
+Throughout the documentation, we will use ``bitbake-builds`` as the name of the
+:term:`Source Directory`. Here's how to create it:
+
+.. code-block:: console
+
+   $ mkdir bitbake-builds
+   $ cd bitbake-builds
+
+You need to get a copy of the different :term:`layers <Layer>` needed
 to setup the :term:`Poky` reference distribution on your build host. Use the
 following commands:
 

-- 
2.52.0


