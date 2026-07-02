Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1516EC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:59:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69783.1783000766487012808
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 06:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pbLZEmXb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B4FB34E40C30
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 13:59:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8670B5FF03
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 13:59:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C118104C9588;
	Thu,  2 Jul 2026 15:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783000764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4L+naH1EaFWyBBKvfuWm5wbr/yQ5Asb+I7s2QFc7GXY=;
	b=pbLZEmXbBOfL4dc2fWu8Mf6qvadaKkBauKe+ERuXPfEtsPKcYqYfp7Opqaw/BGIVEVp1uK
	KuBttjW4I4shE/VMcfrKwAkNoZr/g2Cu0HjIobyxv3wrW27Dp+Tpr8+Ajj+vggstAH0PLv
	g5QSckNl4oRVwPHAVabDkn0fpR2F4UXDeiTeF1lRTTCBEec5E5ido5HA6qqmCAcFY11Hrx
	u6urHQgomsIRPPSzvjptqLmKnq/jldZW04xQZnEWOaaKgOcq7Wa3v0l3nPFI5YVhKZ7juz
	/IqRRf1WywN3oN+To1UhXr8NnFFcQ4wzbFGmgn1BrI0aUBPaceRVzgS0q1w89g==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Add pre-commit support
Date: Thu, 02 Jul 2026 15:59:09 +0200
Message-Id: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBNUpKCrRAudxpqgDK0Iortnt
 fx4vP+CRJEpQVNcEOngxGHJUGUBONplIMF9NmipK1lLLdZIAsM88yY8mV6hrZ1DA/mQJ8/nF2u
 732l3E+H2FuC+H9RnmyduAAAA
X-Change-ID: 20260702-pre-commit-fe4d1ca7bbc4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=570;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=F/wAkN2wYadVhl17JwEQtDvZFWrQyCf6yOl7kYLZRTg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqRm65d8D+0zsfnd2LcgKshOrw8eKy1emhCw+Or
 6ClXLENyc2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakZuuQAKCRDRgEFAKaOo
 NiOmEACmJ5dxqM7BoTpTpg8M9kwRSKnIU4Eu8PJUe5KWbgWr/v5dIcpcdDMtQ+DsY5Zq7FwWvZO
 EzHjo96V28U5DjkNj6+2603nT5fXv8cphV3i2XxuwhcJTvCm1SuZeHBhi5h2OpLlVS1wGf6or/Q
 6ezsPwKoS5qZ23smwpnpT8BcRsc056uLSSgS6uI0aCJM7DAQ7lMvCowqxpXZhBClqMf+7asrgsA
 1YZzuud/Q1yXw/u1gBEMVra2t1e0gyta6/52l2tnPJZx6CGwTuVKB/XXTuM90wS1mFBsqUSmID3
 INItSbwqw2jAGITjiyTphAjGRQCJnmwO7iHKvV64my0mk1ZayY8mMQZAxvi4QQ/SeVajTVR5YpP
 hhFpY/WUkXiPXzGJaPgw5YZUBd2wxh5gbPOPCV8M2j4hksmHZjD6roTjDHh+0eV9FCBcPtbnY8o
 we86DRGoyTz9kp4yhouX/icHDfusXl+UjnCFCxSkM6/v4zOL5J/bx6fYDiuGazGWiSp60ab8PHK
 ef4LG3A8qtClT6lRTqV0prTpwDmhOns6CxMMws0JlP1QZa3hojWQSEN4psAUzc4g8DBypSff1Sf
 0BkrwP3UBDEOQgVyMMK3d8neDUKIpiLzRLW0cCt2th3eowu1g6VY8bW4kJOgEDJjawE0+350z4K
 uBde8UegxCDFndw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jul 2026 13:59:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10000

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      tools/check-glossaries: return 1 in case of failure
      tools/check-glossaries: fix default doc path
      Add a pre-commit hook to check the glossaries

 .pre-commit-config.yaml              |  8 ++++++++
 documentation/README                 | 10 ++++++++++
 documentation/tools/check-glossaries |  9 ++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)
---
base-commit: c518622d49c50844df230c8c2a8e08312104b7ad
change-id: 20260702-pre-commit-fe4d1ca7bbc4


