Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7AFF9EDE0
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:22:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83812.1776867776001104413
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ANJ0bSxv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A2F9C5C3CD
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C68B75FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C4E210460ABF;
	Wed, 22 Apr 2026 16:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867773; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kvnDyrIrXzYTdsaJgy0EhORq6GAR2bWx6yG5g617lMc=;
	b=ANJ0bSxvjrDBwd/MR92y59U/NI9rzhCxMrnHnpLI55frolBsgQiX4EH0f6EaX2ybd/nbTx
	3csEjGXPSAhix+ovxFBIWTpVuYDKvyySYewfZ/lU3epGPqDxaRLX5svryZYPl1a2o6pMGO
	CjYqv0+HmfrsGyE5OYrBy4jNwdOt1Jn3jSaf/PEplF+G9JTazb6xZwfCFvOhjUEX8DFQee
	lMZPXz6kXqRMYBWcpY+ZWwgkMS81/5Uc56j3WhdynbHk2mBdQXOkK+BFvisM9vrQz/yM2m
	KmedOoIIxMHiuxeCX/pmT6deBRdpUrLumyRpNE97lU/nO/2CD5jQ/X/qgW4iDQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:35 +0200
Subject: [PATCH 02/16] migration-guides/release-notes-6.0.rst: add known
 KVM issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-2-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=shYmkMqZYzh8kLKEJCRJxNFJODFY7BWNFo/XpDnqV+8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm3z3P04mt2yfM/rkQDzZQM6IDFUdhmJ8lTu
 h0M2t6GzkiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZtwAKCRDRgEFAKaOo
 NgixD/99mf0qDZ0O1Bqn2wL+JMnGu5i8n0uYc1Ld61JiulUHQuYiITmvA1UsNC06Zr88bPs9rxO
 DoXmiMyrFuGBLoG9Q0LbCfXxpKlrxyIrSSa6idhT4Qi8TThrdmddtzZ3EBhvoYSj4gHAlplNJ44
 T/2Q1qJKXET7o9WyA8iAxtfAc/+K7WrZiqBuJsH72LMo1Jv43W4mvuV2mskNoWoY/0AdlW5h+ja
 bEmnFwBQ6neMFiE8fczFg5vGnNYga4CQJcpGnpp1F0tHDJ2VyjyNo6611e2rf+fLXdOIl0ZbVO9
 oprpLsLbcxaxvAYhdMKAjqcOcAx16Z9Zei5AnLS4zfVumxY4Wb8ihGF2Z7r0a4PtnprNEFa2itW
 f+bUrXxWSYnqAFvC9VRe6Qi8JE5+fY4kM+sdHhnNSRnDPH0qG7dae5H6jscO/CC6Vb5B0cFY3tm
 0aOpS59Fg0eo7aA2fmhgoG/hQFJ4yfAJ4gPXGTooY2PCOteCFR/dKFOT0A5FD4PBJQgNx0anQ7r
 6Ay14JvVzJ0zsceBNSnB7pNPZoGtIb+my/TjRCZEofbZ14TPcnpYC6jO37ymKvVRk6ED3ufYiXZ
 NyoZafijBY+AIWwpKp8oqlg2iAiQ91Ymd+rPpFgZNty68vwbjKePlySmbeR4F1BY4wJbNaEjWjP
 LKNz80ou27ef9ZA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9309

And link to the bug in question on Bugzilla.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-6.0.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index a4fd7a169..2ae182c8c 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -739,6 +739,10 @@ New Features / Enhancements in |yocto-ver|
 Known Issues in |yocto-ver|
 ---------------------------
 
+-  A known bug is affecting :term:`build hosts <Build Host>` that have Intel
+   Ultra 7 CPUs and breaks :term:`OpenEmbedded-Core (OE-Core)` tests that
+   involve KVM. See bug :yocto_bug:`16074` for more information.
+
 Recipe License changes in |yocto-ver|
 -------------------------------------
 

-- 
2.53.0


