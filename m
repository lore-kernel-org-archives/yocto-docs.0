Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E98AC61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:47:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31336.1787816840602798401
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 00:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JsQN7tuk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B0071A185C
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F5A5602B8
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F62211C78383;
	Thu, 27 Aug 2026 09:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787816833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fnKMcGcHrE8bEQiN91xn1iujaPZ4LU1qsl1jXCx4V+I=;
	b=JsQN7tukasemBCasg9CWq5buqJ+gZmpr+YMjtsUxzbyndvuiUHEEyNd3A6MDj2wDvG8wya
	sK/BU6vswlYCUB0kol/QwmEt8xNAbCXrPmo6x/YhgfPU85BcEuU/SWHjYQFvidE0IqKZlA
	sPgIyfLDITwlhdkdzozN8Cn+rfpXsijArJRMC9jMxPZwo3sRlDOqAQYYmns7XkVS4DcN5G
	tcgbRE0n5RdmZh0lqmmR3iBVZPe1clR1cKOzVe1H0HeEsILHUug7oJ3x7KbbEbt/sq2px5
	rGpZleV9WJ6Y7aIwVcZfDBuV7B6mocdgJZ9fHNRyCaAxSHClSRLyIrL7qEvnDg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/4] New script to detect obsolete variables
Date: Thu, 27 Aug 2026 09:46:56 +0200
Message-Id: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWZcEiKLtVZouAEcc06JhWtOEc
 HdpXb7F/xkYEyHDrcmQcCemNVaoSwN+tjGgoLEatNRGDlqJFzFTDGK3iax7Igtvutb10l3N2EL
 ttoQTff/P++M0f9yC/v0bQSkHWcn+InUAAAA=
X-Change-ID: 20260821-missing-variables-c654b70b96d4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=r6AAmJi8ikk5uMHO1rKU6KY9ue+dhNAZC7DAXPWC8G0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqj+t+tjZZWEW3Jtmax1sv41VpF31rwdHwvUxh+
 dLYOJjcKWCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCao/rfgAKCRDRgEFAKaOo
 Nne/D/46um5Firm0TGxfw3fMDyhaJcr1Cws0BcbCpQRg2ii61l0t/1JKGBdHC29ENuG+uWvOA7X
 XKdhw8bEhJ2x/9OSTnSqEF1XZlEls9l7bxCSW9H8as71ZYgXxfi0Qv83Qn17pD6agKQOWZH3piv
 pYqMC85cLE6HCb0uEL57X90r2paIkjglxMjectrEkPccwYG69BLR6p3PYYkl5hgOCAwxe4GhO9z
 32Lgv9FRbPdig+1DkQpctEvOZzs8t/U/bHrEcK9mkMTEjUmUKapWxQ9KsDSUK/fe2pQ9sFKMkw7
 wjGJuoepqSdJzcL9gwBLG29mGU53dYSADY48psXgrJCIqLt8nMn1eQTLMzerKkfn+i+hYPBdzdT
 zVZidDH7RupEbEYwsAJI0XL7YKOX7ta7FHEbZJQ5qzDLrxlxXBN1nYleL6jgG4caRRLtMFm7jCX
 FnsVQX0scKeKTtWRG99Fo5y96aDrR/VqQdmhiSPLNnP6mZNNrKYEh99bUtU81GnyoejOkknkvws
 nlsRPKMrxW67TZpkQ1prAp2yB3/QReXcDcBMtsnm2wqyu9cUbGe6zaJ4d/Gd4oVsxSQ4kVOKRlD
 H6oltoCtt5bONuz1fMv/3PGBrFrqeDSStMOSuoY8Df2m2D/xx2RYj/wD7djjihIfK7DQr3V+LSO
 BA/UWp8qJmEdSZg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10372

First patch of this series proposes a new script that tries to detect
variables missing from OE-Core, meta-yocto, and bitbake. It is simple in
design as it just uses 'git grep' for that, plus a few exceptions.

The remaining patches remove variables that have been detected by the
script.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (4):
      tools/obsolete-variables: add script
      docs-wide: fix USERMOD_PARAMS -> USERMOD_PARAM
      ref-manual/variables.rst: remove CVSDIR
      ref-manual/variables.rst: drop documentation for FIT_KERNEL_COMP_ALG_EXTENSION

 documentation/migration-guides/migration-6.1.rst   |   4 +-
 .../migration-guides/release-notes-6.1.rst         |   2 +-
 documentation/ref-manual/variables.rst             |  16 +--
 documentation/tools/obsolete-variables             | 142 +++++++++++++++++++++
 4 files changed, 147 insertions(+), 17 deletions(-)
---
base-commit: 9955b0f099b6b42a9750f0d544944a2d8e5a39b2
change-id: 20260821-missing-variables-c654b70b96d4


