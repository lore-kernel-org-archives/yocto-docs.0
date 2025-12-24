Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D325CE776C5
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:24:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123074.1766593487320622673
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0/nWls4B;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 24C9D1A23E6
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F17086073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62ED310AB1362;
	Wed, 24 Dec 2025 17:24:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593484; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y2Ed8/m/uZMw1hx7aH/9YMBJmA2IYx4EQXAj3D15/wI=;
	b=0/nWls4BXD1H9Qb+gN+1GCFC+6awdEmsQYrzpM/ma8fXx6KaFpKiW8LZ9pVfm7p3qJNSk0
	afGtMh3+Q7IOT0eXWYFue1VQ9RcEu6MIBP8JHG/qTtEVE3GEFzOVh7jWWH1yBmi3X2Qr6I
	Z+OnGIyyP6snid86Gagj5gPXEG7VHTxC6HhSLEIZPGvLiBH1Y/soetLdQoI/vMCaippRJG
	IaIkf1ImcJWk5dqvwX0NlcBmA4Rxqw4fLCAsnhfxgjAlsvCOufBcfglP0+IZuyd3EV6jvN
	tMmQbEW6U4fymecdQGU7T+GdOcvCZ58f08pINuCorgRY9RBR0xczCYsx/scLDQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:24:20 +0100
Subject: [PATCH 5/5] ref-manual/terms.rst: refresh the OpenEmbedded build
 system definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-terms-refresh-v1-5-691329fd038f@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
In-Reply-To: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=etSqCmaPWhbWIIrU1ukekyJcBuMkQlVdxTfl0wz8WQo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBPIYH6vmOp+iov9ai5W4SkyFe6BjJNSxhUX0
 H3Tp+kq9JOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwTyAAKCRDRgEFAKaOo
 NgMOEACn78cxRs1xKC9NeJr6hxFUrcO/mtACoGLcnaNvwlzU/v1OwhdLjX8JbpNBvDLpzg6naKi
 ULhGp8ecqfgqGmDv6kQGjK0elcDAvWd5ld9PN8SkGJk+DVUfcvQbODGVJimrsgFhWeDs8T6jelT
 Lwgh4VHlPfN7wrmf4yLJbcFB1dkld8rLvNZkLVQ/9XMzU/H7Up0wfzfECebq7aJrOJqBa3r/1X7
 Zqk4OVfyGkIavPihiQCeZat/B+8mliYyOAIYM3gBgBXRpGA+gP1uUz7fP2Z+5UN4RPAlBq/8DSR
 lY216dDosHDVQJqjh83JMDSpRNn59Cgh3/6AnzCzvbuMfSVCC2pxoB6aIkEmgAc6djds/39eaqL
 cxLCml83jS7PsmHNqdzJuRLPk67TnlaXg1P3XlM6VefjhuzTMMz8klhWw31ODIx3od+kf61Q1ej
 YKuGlBiwRceNzEhyaU1LjyfdLLSnc6QZYaOYr/nNe7jXIxFqqc/urcuecebUej1ezG6xqpVCnqC
 2L8hikuAUBR+uwd8hJ/57IJ+XdzyjYuXvGjovoM5J90hWAeX8PLbOedbM8OBRCce0LPWKo2+qEz
 2SwMq8JvX93qZUEVPmeKzLzcgvdl+XDBIxZAbytJizPFiBA/dvsW7QtNAgIs3wshcSjdoyT5vaU
 CC+iuGWKaAqu5QQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8328

Remove the mention of Poky containing BitBake, just mention BitBake.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 21e30de96..ea674eff6 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -403,7 +403,7 @@ universal, the list includes them just in case:
    :term:`OpenEmbedded Build System`
       The build system specific to the Yocto
       Project. The OpenEmbedded build system is based on another project
-      known as "Poky", which uses :term:`BitBake` as the task
+      known as :term:`BitBake` which is the task
       executor. Throughout the Yocto Project documentation set, the
       OpenEmbedded build system is sometimes referred to simply as "the
       build system". If other build systems, such as a host or target build

-- 
2.51.0


