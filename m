Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFFCCAC5BE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:54:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.12285.1758873283699992407
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 00:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XBItcYel;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA1F81A0FD1;
	Fri, 26 Sep 2025 07:54:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B140F606B5;
	Fri, 26 Sep 2025 07:54:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0B09102F186F;
	Fri, 26 Sep 2025 09:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758873281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=svCgeziz2jEwnJe4PajzAEbLhcFxap9WOYyuU1FKvFw=;
	b=XBItcYelJx8yK7vkmUTBzCDq5x5eV3jX9Z+/22mRzAfwAMO6z3Q8vc44cyZeLh05FnF8sg
	WAXxhMwFdNLCc4Bokg/SWyxDjI1N2jr+Vsoe8+HktesIOqbI+kUSGR+A5Qy8u2BvIRpnW/
	cYIygxHCq/dvimrstwWzjcRyb1pX8iNYBLU1pPJRPdR6iT05yG3kp/nfaoQjPu0lUg+gPI
	BcKmc//keQl9wuSYnToOd+wOL4EFcWPWOtuUq6MXIQRaR9MxUYf69+6v1pY0ojZx3XxxxF
	6660WAKX5+pU6qjJDKnt0ZTAL0EBOoHfl10a6QdGR+y/PAbRU6rmcmZNUFW2bw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/3] Update yocto-check-layer documentation
Date: Fri, 26 Sep 2025 09:54:22 +0200
Message-Id: <20250926-update-compatible-doc-v3-0-3740c44e49b2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK5G1mgC/42Nyw6CMBQFf4V0bU1fILjyP4yLPi5So5S0pdEQ/
 t0WV650OcmcOQsK4C0EdKwW5CHZYN2Yge8qpAc5XgFbkxkxwmrS0Q7Pk5ERsHaPSUar7oCN07i
 pqQGlZGt6ifJ28tDb59Y9Xz4cZnUDHUusGIMN0fnXdpxo8X59JIoJ7rnkgndU1ISflHPxbsd9F
 lF5SeyvDssdLVhrJGuIaA/fnXVd3yPnavoWAQAA
X-Change-ID: 20250919-update-compatible-doc-651debba8dfa
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=D+fBRSNOH/yqHKLP/lEI9O3MFAlC5PV3brE0eeyp45w=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo1ka6P4/bOSGqH3ZvzMcGV/Sw8+LDSnz/+5PzN
 SbKzu0ah0+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaNZGugAKCRDRgEFAKaOo
 NvklD/90lD5KOwC97GintL2LT2JVacRum163+wHOzVZFRx4YmP8ejRl9429hJbd+xeBinyX9Gm0
 qyjfkFTixh/UBfJnZaAdOrdRn770Tl8AhbA/zUOJOHx0PNrLd+wSKuBLpyWSeBcHFbvTSq9Qm5f
 LRpLw0I+h8b/QV4FAQrAs1zyAXXYxKc3l1oL8WDkSCRSUpNajQBUZRCXj58SLY1m76Q32kcbjj1
 VnLcPFBRHiwLeCT+n1jzKdHbhDqQii0zBdgDrBJ+fAZldbDuFMIzPZNcezfHIIyYEoQa6kk/UB0
 0vHOX/OaQxwYoD0uXvaXz51BS0dEqPKv+oMHkqCi1g3TvRuA165ULhz9dQeq5X8wW0RaKEEsqGl
 XlfkYYqmjfxr9R2c/NvaO/BmzxzooCLhG2dHN63HEol6To2uwJ1JFJRSMXI1PnmV2Fg/4jcA0+I
 GbxUV8VfgUQvRmp0SAkc5Dl9nCOinF0TRDUE6wEM7W4y+wd5c3TCNjcRfFrF97elEh+2t5LVCaS
 qF4mvvcneIc0ZCW9BWXa6kCqEYTmbI/ISm6aPkM92EtnNJXIFXZqr+qIgB/iu1tPQED3FVY/iSs
 v00SMrmEjHI70zMM4cZUwyWufNowJgOliYUjciySMRbwYIrK2H2Hxhh1DViZ1LWIpL1pNHlxdMe
 /q92Z1KROlFNA7g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7606

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- A third patch to update the list of tests.
- Move the --dependency flag before the --machines flag to avoid
  confusion.
- Thanks Quentin for the above suggestions. :)
- Link to v2: https://lore.kernel.org/r/20250919-update-compatible-doc-v2-0-c428da260487@bootlin.com

Changes in v2:
- Mention --dependency
- Pass layer dir as last argument after --
- Link to v1: https://lore.kernel.org/r/20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com

---
Antonin Godard (3):
      dev-manual/layers.rst: yocto-check-layer: mention --machines and --dependency
      test-manual/yocto-project-compatible.rst: fix a typo
      dev-manual/layers.rst: yocto-check-layer: update list of test

 documentation/dev-manual/layers.rst                | 35 ++++++++++++++++++++--
 .../test-manual/yocto-project-compatible.rst       |  2 +-
 2 files changed, 34 insertions(+), 3 deletions(-)
---
base-commit: e77139b5c616e6e5ad436eb91416fd804389425f
change-id: 20250919-update-compatible-doc-651debba8dfa

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


