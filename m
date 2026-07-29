Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A56C54FD1
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7965.1785319370908253505
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 03:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aCzpKKKY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 40E724E40FD9
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 169F36039A
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 130A411C14BD0;
	Wed, 29 Jul 2026 12:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785319368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y+0FJBjpcMdb7Vq2SWaki3pUzgNp82hQbteQor0dulE=;
	b=aCzpKKKYoXRI5WyZnkH5Qmomzt6vKPT0s6abyBneoGXe0WWR0ySnTRMW5Yoyl74xFlDIdH
	m+box+rhmdI2ghrLjAraxh7i3+Pj62xTOKP2cVZZ2qzOYdsbFTz/+E6ebcrpQ1l/egRrEC
	BXK+1cdlfw2MDUEZGGAc8r+tdwX7IGXJcCDCDqTtFEvR5Dg4Xbf0weYE8fYV8uhT8D7Wi6
	TGpR1wqFzxP98ZiI61MfajJP+ykoZhMHEISEPTvPrvd5goomV3nU9B2FGXPbxtHUEjeEB6
	9fy4xG/dgEqToqwm1Gj5SEpmi3C4v1yM7xghpbUNvq3ee+CvyxhngR+YPtd3rQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 29 Jul 2026 12:02:28 +0200
Subject: [PATCH 5/5] sdk-manual/intro.rst: detail differences between
 standard and extensible sysroots
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sdk-clarifications-v1-5-661e65201bc7@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
In-Reply-To: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=diKMm6iX7Oxm2IEAphWOKQ+osD8ynEaBF0UcAiLsRSE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqac+3KfkSQpEbnQgpvdnaPx85PYlFiAT6f2ST1
 JbNUmddr9GJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamnPtwAKCRDRgEFAKaOo
 NjDnD/4raDpkFav1SrwwIAxOTv3E3tUqC4zdLwwVAKbhbWUGNwm83BgSSN5iPR02BLdy7qqV8mQ
 8KTNn9Ruv+VQN9xPq9MZSf+pEc2Wxp9jdNT69kW8yeBqLUD8Y7WbEDAyUtqq5u3oNMleq6h/8qZ
 h7w5IZupYFckSswkTcHK2wbsCm/Gcu4wilE/wCVQcPfJ6BWQsKO2bisnOiPi6T/Ri+10mu4xAi2
 j2xu+5dqLwC+HQbGiD16gS/n7T98N9bkjVWkmDV4qJmgdrq/WweHNfjVMhcL2M/hNqIETFt8Yaf
 KWJbCkPOatO/1wa0fNuO9FIs/ueFiZRgZnu6Jlc8WTCeOdVRrFyjnOmBILBc4PdnU8oojKEfXNw
 KjNXv7m68+WFFYuj7cfKLSO0lo/Jm46OI9OpN/pQi6lP+jbD2k/qFO/4fM5QuEAkWz8HUjYCAw4
 bPKkyalF15p4UdZyF+VYV81vi1Q2RPPlDluwnDoIrCQksvbUVhqSo45QzHh18KyMfgHtdSmupQQ
 M7c6sUyIiMp+WxTIAGcs7K+s9fw62H47Dlzyv1j+sGZ6Ikb0Jk5W6wbgNr6lz+AGFLC6EtRzuLi
 dO0x5DiT3GWG685qbKZGlvVDSrrTdvCfudhw70yGqkxA/NhmdNDnRMiXKFNJURY+u6YmbzzX+bT
 P675K7+ccioZb8A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10190

The sysroot in the standard and the extensible SDKs are managed
differently. Detail this in the Sysroots section.

[YOCTO #14830]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 8ccbcfa20..2e5f73f0b 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -123,6 +123,21 @@ sysroot is based on the target root filesystem image that is built by
 the OpenEmbedded build system and uses the same metadata configuration
 used to build the cross-toolchain.
 
+However, the extensible and standard SDKs sysroot differ in content:
+
+-  The standard SDK sysroot only contains libraries and headers for the packages
+   found in the :term:`TOOLCHAIN_TARGET_TASK` and :term:`TOOLCHAIN_HOST_TASK`
+   definitions, for the target and native sysroots respectively.
+
+   See :doc:`/sdk-manual/appendix-customizing-standard` to learn how to
+   customize it.
+
+-  The extensible SDK sysroot is completely managed by the ``devtool``
+   command-line tool, and its content is the same as the sysroot of the image
+   recipe for which the SDK was built.
+
+   See :doc:`/sdk-manual/appendix-customizing` to learn how to customize it.
+
 The QEMU Emulator
 -----------------
 

-- 
2.55.0


