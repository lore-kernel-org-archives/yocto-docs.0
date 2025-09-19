Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A414CAC5AA
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:19:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.14825.1758284343846392141
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 05:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BcviPnKq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7FB014E40D68
	for <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 12:19:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5709B606A8;
	Fri, 19 Sep 2025 12:19:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CEB1102F1D66;
	Fri, 19 Sep 2025 14:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758284341; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TTAbhvQklCh/f8yfrvZzay/MJr4bqbcHaEJLpVYc1uw=;
	b=BcviPnKqar1aw3bcI/THQW1bTDpv+K988JiV79M4sFGvJ3enjs7IBVXQAiRZxNEQChJzIU
	0XErg/QRHmGKHkRN8nLTe9iEcJajvFzGjF8eFRPqRXcycyYqr229u6f7LUnLlBCNDt1r3T
	6ScVuLg34AeSbqj2fg1z/0QpNcoTIsUyjAATa6rA+I1H7cE4Xo/P+Pub0PXMf87ko5Qpfx
	yHdb/arXL9yMh+tx1BZLNV6JlA7HkuoN1fCpXVKGvQCtiQA9PDFhfe6Pq6TkgIWojBBbnz
	ixEovj+T8AJb0WLScARbQ/UxvUWeaIX/GGgagjHEYVyJiy3nnpRRfYxAXMWadA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 19 Sep 2025 14:18:44 +0200
Subject: [PATCH v2 2/2] test-manual/yocto-project-compatible.rst: fix a
 typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-update-compatible-doc-v2-2-c428da260487@bootlin.com>
References: <20250919-update-compatible-doc-v2-0-c428da260487@bootlin.com>
In-Reply-To: <20250919-update-compatible-doc-v2-0-c428da260487@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=h7YgUnQMEjzpiupdkOtmsDaRp9RVceNjVxN+7anBqKw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBozUoxy9duZd0U0ncayXiKuEGoTgrsDE4owEgUi
 l0bFrn2es2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaM1KMQAKCRDRgEFAKaOo
 NmXUEACpcbo2ncFrCgivvcRb9GdW6KdWXWKALZW5+b69+Re4A7bVaSPGDXnkTCGro8Pn9h+I8CR
 K+9zZj5E3D9/v99aM9FVajux+qv1iX1dH6Ad457dGFfAgwErE8+evdDanMVcqTy1gYrXpgE1qsj
 Kd6vMbovlm76tosRVb9HrtSGnflx0T6NmrzkPkSy5XC/BAzDp7FmAIRuE/g+GFfPnsMA9CI1aLl
 H1vpCOiTjRtxFDLrEprv9IR58wKJ1y7n3I0jlLBaP86+0aD513o5hu99WH0+jH0Ok1JH2NXhdDg
 OspRrv9WU2R/jSH1/Lnno/8RFHMLgRyYpG5lDZvgLP03CE7z8r/UoZ3kluoGbtUbKzzaYX0WA5R
 ML+MLKraY8ENR3i98DQcRpCUwSTn0V+QH7vEoJJOZS4fY4EF90PKXg3qoHiv6MksX9k1tqC8JM3
 W98oC1JliFrT1bKFZ8wig+MfV/+Z91WQ8OkNKG7sUogwKN2Whya0Ij2z2T5XWW/FM0FAbS8KNzE
 EJq9/RG1MsFHicZRxUQPrJkKIN8Fde+EPS6IpQ68bkF0dj++3efjvvKDj5d6DGP+ccbLvGHLF4j
 VWmTdZHta/+tn1F50iYB1x4X2jmFNPnF/F2+O2878dVbuTxdiRG6jAiS3alqSPlbMrnvM3Nre7s
 nDZCSRqMshKYgow==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 12:19:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7563

Fix a typo in yocto-project-compatible.rst.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/yocto-project-compatible.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/test-manual/yocto-project-compatible.rst b/documentation/test-manual/yocto-project-compatible.rst
index 65d924fad9..7a2e00a99e 100644
--- a/documentation/test-manual/yocto-project-compatible.rst
+++ b/documentation/test-manual/yocto-project-compatible.rst
@@ -38,7 +38,7 @@ Benefits
 and flexible: it gives users the ultimate power to change pretty much any
 aspect of the system but as with most things, power comes with responsibility.
 The Yocto Project would like to see people able to mix and match BSPs with
-distro configs or software stacks and be able to merge succesfully.
+distro configs or software stacks and be able to merge successfully.
 Over time, the project identified characteristics in layers that allow them
 to operate well together. "anti-patterns" were also found, preventing layers
 from working well together.

-- 
2.51.0


