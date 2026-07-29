Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB4EC54FCD
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7962.1785319363457498445
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 03:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=P9L7ksxK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C2E494E40FD9
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 989376039A
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C724911C14BD9;
	Wed, 29 Jul 2026 12:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785319357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QDtpdLHTh52W+9g2/AWNoVmmecANC89AKjXILMlqFmA=;
	b=P9L7ksxKZj0vQ8RUmCFllsSOc+hobZyncC1oRwJBXJxdzHlt/oHMiLfC8Dp8N2E7yrXzZR
	q0p5Orqcgf5A8cFuW87444I9jfHZQCSJrR1ycqFezHuA4WpAhmJpfjyNERyoS1d5KWK41f
	GISntHLAFUTnX8gTOW4Qj7idWBDkSe+CDpEspeCPa32cCL8/6g4qqhxcW2xgo7GsT3sfMT
	1XV4d3EoiW24/TVZBDhz+m4Xtg/SQ7MfZuBkgGhNZCHFLg+cN4gtD71vYCjc14p92GX4aT
	+KxsB2Oqoy/wVYMDMuKrOeRyu6GgZ62tjgjx52NUgjCnR/ORdTIGBdYeM+o0yQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 29 Jul 2026 12:02:24 +0200
Subject: [PATCH 1/5] sdk-manual/appendix-customizing-standard.rst: use code
 block for bitbake assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sdk-clarifications-v1-1-661e65201bc7@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
In-Reply-To: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=2EKq4AqLt9dzEWSjFE3TeoULEdp5ju9U1AxmRg0rHDM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqac+2Aso8p3FcDUWDmQlfIUu6U3+zNXPqO58ZR
 iNcOgQXh5eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamnPtgAKCRDRgEFAKaOo
 NjotD/sF3DbO9lt4hc9bOZizgwwTOfgAFU/OFy+UJxNerXENU5fO83OOqbkO2dsE8s3Te1bVzSz
 7LpmC6fRjHuqJ/mqTcK1UyyPRMIiBfljZW+owMupz515VYzK4iovIutXkqsSpddBRz6aPQnxVmH
 U2f+af32m4A43oIynBTlmNRhvJivn8Ju3/fmDQM94KRV+ntrHSBveV0wDYDpcE4Zk+hMwYLZlEu
 Xeuia9j1Nes775W48SrmQLNtBmqTHGVKt2MtdzGPs2VA29M+2KefgOFBiYRRZ71xJDW9a+e3hxK
 nUhJZIc6yar/PE/ITy4d75KPxIOBVLwjqPYYN7herVsQzLBiMACUJ50JNxv4LRrwoFt2rJSi+cY
 KTBu1D7DdI3hIxVPtsft1pzD++XithKwX54vPGUyKcVzFP8IjAMGvsRtuDD7RaebSr4XAuFVnJQ
 SLrVPdcVopGEfXG+8etpk5S0dyhsLyyN3QRSkAjE1o1NFBOqIr7M3kC2CaOuZ23jKSeAEPFykNN
 /JHfVW4rlYypqCHatFz02Sqi4k0FfFp3PkRO14TDV0ebrbTZJZK8e4zakB2HBL6t6sZSE+hGslV
 YfywdaufqviW+IubpjIipA9q0V/JFgkMZeq70ZSJ2Tg34JhWhgyH/xxa3LLbuAcOe5iLO8Xrnr7
 9wAP53I0DuSfpbg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10186

Use a code block for the DISTRO_FEATURES assignment instead of how it
appears as regular text currently.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/appendix-customizing-standard.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing-standard.rst b/documentation/sdk-manual/appendix-customizing-standard.rst
index c619c15e4..90b73dc20 100644
--- a/documentation/sdk-manual/appendix-customizing-standard.rst
+++ b/documentation/sdk-manual/appendix-customizing-standard.rst
@@ -27,8 +27,9 @@ Adding API Documentation to the Standard SDK
 
 You can include API documentation as well as any other documentation
 provided by recipes with the standard SDK by adding "api-documentation"
-to the
-:term:`DISTRO_FEATURES`
-variable: DISTRO_FEATURES:append = " api-documentation" Setting this
-variable as shown here causes the OpenEmbedded build system to build the
-documentation and then include it in the standard SDK.
+to the :term:`DISTRO_FEATURES` variable::
+
+   DISTRO_FEATURES:append = " api-documentation"
+
+Setting this variable as shown here causes the OpenEmbedded build system to
+build the documentation and then include it in the standard SDK.

-- 
2.55.0


