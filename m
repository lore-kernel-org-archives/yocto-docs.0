Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C8EC54F52
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8049.1785319368666502683
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 03:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sRXgbyb2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F3C884E40FDB
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA7596039A
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08A1611C14BDA;
	Wed, 29 Jul 2026 12:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785319366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vGuXV59lWzV6p6J0AziOVh5A8KbDeSiOim+M4pWEKos=;
	b=sRXgbyb2Cm4XFuK2o+SUIfI9E+5pzsoKfPMMi25hPZaHj/wPysLhPIb7aYftJZV7oLceru
	oyR5Tkof2Okg35bDGxM14cGOInf++Qg0X7I2+9PsGoGjFPnuOHs96Si5zEKV3x6ZwT6Cw3
	yFk3VY28XcabAMaQ56Az5iufT424VfYqwot5iAsMAetgdbxlEpnT4bSyBJJlTJqDvDp+/Q
	382x0/gSf1eLwegYccJTfGnDUfm5MVb1jFXRlSSV1ZoDW5WqE3YoWW7e0ACWU4tbM9pGjn
	w87Y32S3A8vGhXfS/63ZjlohSwvZ/yJ6KHOv9axl2Lb2WESHFdDOxLeVHONTJw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 29 Jul 2026 12:02:26 +0200
Subject: [PATCH 3/5] sdk-manual/intro.rst: link to sysroot term
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sdk-clarifications-v1-3-661e65201bc7@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
In-Reply-To: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=8++KtHnHNtvLeYQ2/fGK2AHgMqb2ahUeRUoqLHwvdGk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqac+3ivxadIaVyhV4G997BK3Rx5tcSxmuOOH1p
 kM/DMEee1uJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamnPtwAKCRDRgEFAKaOo
 NqSyEACrbWV5TwSsWmiEN6kMGuZsDIjFF9EXu6wemf+GKnCQ7hDkBztssXHk3Z5bXMGqYFq3QX5
 D8ij0o7CxcMY9VKznmkDwIh1y5TP5gepUVbIZjQaV4HfhOs5auaaM3ikESYFvqKp45hnQ5fEtt8
 pfzvenyrzPYeblcwtHj10Dj0cHuI7FlkEijDvwEHdTHuwVPhCI//hB/QTAYA7YHDJzkq3IbxWnL
 vHpzx1H6Ft0Q+mim6vnEXzF1dcGAxbnbpRuScKuaEce0MFsqxdNIWgLssyrDSO7LI5uxXSsUo82
 opo4kk5vQzXSTcTyZUU7KSDjAVYL3utv0EQyTSdSxSEsp2j1WvsFFlvx59R2LME2KPgPSxiJT7X
 +uHYpdnAD1DqUg7bdNTAFbSkWl12VmgrRhmi6c7SDCy006CdmYCVVVg+KeC1d3naYZpJFMg1Oik
 m7F01+fQUeuiBXGoZYbDrVUyZfF8/kLuGfqe3GlXFz9+jiCv6IUoKvCeWgGeUgvhbTutDkVexxT
 5zAp6guN0irhubwzchf0xbWW+jz/b+O9Ub4H/uHF16X9QVKi/oMzJOScDu87oFeEF+6YDm5d21Q
 WFK0hdh1/m5o8Wr6thQ/jPDOQRP+MgnMc2LSnao0ENkAqKTO6aV/X/2e6hcMs8Tq2SugU92Jm76
 e6lXEYf7l6RzFuQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10188

Link to the definition of a sysroot (from our glossary) when it is first
introduced and later in the "Sysroots" section.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 3e78219fc..53246bd9a 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -45,7 +45,7 @@ environment script and contained in variables such as
 :term:`CC` and
 :term:`LD`. This reduces the space needed
 for the tools. Understand, however, that every target still needs its own
-sysroot because those binaries are target-specific.
+:term:`sysroot` because those binaries are target-specific.
 
 The SDK development environment consists of the following:
 
@@ -117,7 +117,7 @@ cross-toolchain works with a matching target sysroot.
 Sysroots
 --------
 
-The native and target sysroots contain needed headers and libraries for
+The native and target :term:`sysroots <Sysroot>` contain needed headers and libraries for
 generating binaries that run on the target architecture. The target
 sysroot is based on the target root filesystem image that is built by
 the OpenEmbedded build system and uses the same metadata configuration

-- 
2.55.0


