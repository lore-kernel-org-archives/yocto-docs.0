Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC3BCD8C81
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8006.1780665981708246893
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V6NP6z2B;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DEF05C58478
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36E9D5FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61AF9106A20FD;
	Fri,  5 Jun 2026 15:26:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=41Cy/FedLO0VHCf5Od7Tv0srRsir34LfZMSp3OvVuEk=;
	b=V6NP6z2BaQDiCg+IrrogaafsQxC7FLdOXzucMqpQ3cxb3WoWiza7RtNiqiJCIYUYazqo5g
	jBeMo2kJnMs8J8lz4syWYU+HnUPIY2makQsjSGQGt3fRYYrv/UQfNOCsicIxd9ctS8P5SG
	wsVOYHPSGX8vJg9fAF5gelPviPYfgfzCtSGQ6B5IG87vRSdLifYIkgc8MixFoxImXRJuFy
	HGHJE9Q/592lrMM7U/M4hjYy5XualwwRRkkSmbg07y26Tnv7JC1i4DLdOGMNLi6PMBeFlF
	9i6jcwtqfzXyLhoVK6B5EhzRg7IA67LGFPAsVJhMOySYuFpqgR3oxYuL0s55Uw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/10] overview-manual: convert PNGs to SVGs
Date: Fri, 05 Jun 2026 15:26:04 +0200
Message-Id: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBCF4auYWTsJaCW2VzFdIIw6LpQw0JgY7
 15sVy/f4v0nCEUmgVd1QqQPC+9bga4rcIvdZkL2xdCoxiijHph9sIlwz8mX9ThHGxZ2gpr6/tk
 63Y3GQLmHSBMfv/Tw/lvyuJJLdw+u6wubpuWRfAAAAA==
X-Change-ID: 20260604-udpate-outdated-graphics-1e8893c15b66
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2858;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SeqWtR1h3xnQeC1cSyG9e+jciQgO5Zj28WY6mxAzT/A=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs544tizP/RufbFzxaynqDHsExIjWU4WFdCxu
 Ls/ir8xxCKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOeAAKCRDRgEFAKaOo
 NgW7EACUCRBUr6+Pdq8cfbewvoG0zmKRD8lax6zraoXIRmIuJSLdMJAsjEdFdTPmkSfuc6I6zAG
 wLQiAXAFiZw4L3CPnP7SfYUJcH4iyO8nOqkqTOwQTE+MISe2E47ZpyiOlX6nhQGgQ4gA3bfF7rW
 DUWCf6+vq///TbZyR0OvfAcCFODmFSJ0A5xprbEWJvhqIxFYHvcX/ETDrXHVsDBtA3TutTz0iMY
 XjA6rnbVeAWfCALhoszHblX/0B6pu3raHzugGy/ck9e8q6Vjyfd9gYZq+/8ZrKi81Jl1WNubvYz
 xsyLE9jDL7tGSpKyR/ASYxzIAyxDiiaY/LYjQk1OOqmOD8Q1DCUyAi4mg+ZZiw3H76AG8i5XxzJ
 c/0+krHa6runSyehmlvIGnLKITnYecwiF+XgnPX23kES/g+I1nenISADy9gT/UoYiLJ9SjWwnma
 zG4llbKGUcoOO1e3dLS7dI/TG3Ugz9/CGANxXhkEsYOGcAZvDQWEMtnNollIJoR91NrHwnJJTEO
 /WcAzuPi5mMIqMn3zOiK7hb0NYssx3N6mWFFBRTO68auyG4Q6EnpLztp9ub6geibFDvuudamypi
 a2vLCCl28uPSUCX99ZWBm3CPeXPnS2RW/X2Hdat5uSFAJaDX4uuGIomEVVJjLt4WNKt98VNfOkw
 O/67JyCTBuVWVmA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9590

Finally, I took the time to do some more conversions. It takes some time
but probably worth it in the end, for maintenance. Some of the figures
also contained obsolete variable names and reference to the poky
repository, so change that.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (10):
      overview-manual/concepts: image-generation.png: convert to SVG
      overview-manual/concepts: sdk-generation.png: convert to SVG
      overview-manual/concepts: images.png: convert to SVG
      overview-manual/concepts: sdk.png: convert to SVG
      overview-manual/concepts: cross-development-toolchains.png: convert to SVG
      overview-manual/concepts: user-configuration.png: convert to SVG
      overview-manual/concepts: layer-input.png: convert to SVG
      overview-manual/concepts: source-input.png: convert to SVG
      overview-manual/concepts: package-feeds.png: convert to SVG
      overview-manual/svg: remove white backgrounds

 documentation/overview-manual/concepts.rst         |   23 +-
 .../figures/cross-development-toolchains.png       |  Bin 82633 -> 0 bytes
 .../overview-manual/figures/image-generation.png   |  Bin 123348 -> 0 bytes
 documentation/overview-manual/figures/images.png   |  Bin 32674 -> 0 bytes
 .../overview-manual/figures/layer-input.png        |  Bin 62330 -> 0 bytes
 .../overview-manual/figures/package-feeds.png      |  Bin 42239 -> 0 bytes
 .../overview-manual/figures/sdk-generation.png     |  Bin 60574 -> 0 bytes
 documentation/overview-manual/figures/sdk.png      |  Bin 49804 -> 0 bytes
 .../overview-manual/figures/source-input.png       |  Bin 51170 -> 0 bytes
 .../overview-manual/figures/user-configuration.png |  Bin 51171 -> 0 bytes
 .../svg/analysis-for-package-splitting.svg         |   19 +-
 .../svg/configuration-compile-autoreconf.svg       |   21 +-
 .../svg/cross-development-toolchains.svg           | 2136 ++++++++++++++++++++
 .../overview-manual/svg/image-generation.svg       | 1820 +++++++++++++++++
 documentation/overview-manual/svg/images.svg       | 1346 ++++++++++++
 documentation/overview-manual/svg/layer-input.svg  | 1375 +++++++++++++
 .../overview-manual/svg/package-feeds.svg          | 1257 ++++++++++++
 documentation/overview-manual/svg/patching.svg     |   19 +-
 .../overview-manual/svg/sdk-generation.svg         | 2020 ++++++++++++++++++
 documentation/overview-manual/svg/sdk.svg          | 1461 +++++++++++++
 .../overview-manual/svg/source-fetching.svg        |   21 +-
 documentation/overview-manual/svg/source-input.svg | 1751 ++++++++++++++++
 .../overview-manual/svg/user-configuration.svg     | 1162 +++++++++++
 23 files changed, 14365 insertions(+), 66 deletions(-)
---
base-commit: d7376cca64a0784e59d4fd60b9baefb4da2ce289
change-id: 20260604-udpate-outdated-graphics-1e8893c15b66


