Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA93C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:19:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2770.1785489595003890293
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kg2pmFtv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 586AC4E41046
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 285056039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A22211C165F5;
	Fri, 31 Jul 2026 11:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785489588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tN6HG7M0Tu2AUjLbCF55BL5UUY7Oj93ybcXI+JXjPms=;
	b=kg2pmFtvXAsLTT2KS0/0VziXy/N0EeH3EA77Rw1Cpj0FcZXCElAJPxejB/IrnFSXnqTV4k
	Fq+XWHltdrvlsBTSGzAXUzVXz4hStNtolLbOwkj0x1/zoNI8OXcBlePY7Oy4GDWH4mgaR1
	H8MeNlCfiJGWTL6tKA5EoHVvls5CXFnx9XlioQpaqZr/OHG3qKrDe2hGJ1kuPC4nWdDaGZ
	N1VofOPXio6qStgSAYR919O0n0vpW6Fzsd41TjG7NXvm8hO2RSbo3+PSgp/irYylk2oEVp
	9PZYssFttXQbWKp+16gDN5lS+qjgXPhebUdFLBGxDe7HwB+FYiCwWJbQqShS0Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 31 Jul 2026 11:19:27 +0200
Subject: [PATCH v2 4/5] sdk-manual: rename the section to remove
 "extensible"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sdk-clarifications-v2-4-b34f797492b1@bootlin.com>
References: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
In-Reply-To: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2709;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HHFCi3rgV3g01U5LPlZ2q5kduOEb/MrAnaEsEqvHeao=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqbGihiatAPJytNd90JUiXTPn0SanvBu/0fXsnp
 HH2x/5uKymJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamxooQAKCRDRgEFAKaOo
 NvQ2D/92lIoRrDMdsOLEkM32kdeCIG1piuw40C+Y/mTJo5h8yDn1Mk4md5VAzULp10M0m+zRk1g
 0kwbpMn8uip8/B/whh+lsIg7felXr6kTpo3yUvWY75a1QqtuW62hQ3pPP5T0nweTSZfO2kWW2Lh
 am5Zj5JKhpIs40WROaLSAgufl1Z74sy0+v0Jx8mrMU+v6anz/mNH4xwDM8yMKUDrAYNHYxBYTC9
 xcCmsh0F9jnD3PojzQtMAgCeMG46jtYOKyo7+qWaK29xlPyiYRvb13rcVQBJsPd6XoMST1Z6N2i
 X3yZwtw4VNKdVodFmLlJwAm4pwaJ5i+Z9yaBK6DMQ4i4a9GSKsNQDxZFhtipwtUBHpdz4dY5MIf
 1X370RW3Me+UO1AoCuWhtuslUmfwAukTLKrMhL1Ul2n+23FG7cW/Sm/flIyOfSsZmFzX0uF1J6a
 a9j7QNbVJqAhGbgdSyGxfIrmIfJHPR1JLThI69haE+Tccfj3+Rfe/nUmHyE+w1yu3HzryiNmuKn
 3hzbYFimvPn2+SrTCb4KeCXbqZ1wbuuV0jCajdmocfutLXf9+HsiRuNI/AN9GSMecn00EaVvMEy
 f3HgzS9xXypFpRs4v5+u/Xx1hCrp8JT6YK5KvcNwGisByqpG/fHfgjlQhl/AzCMVLIrpbbOBdbF
 tmTU/elZK2wIiiA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10210

The SDK manual covers both the standard and extensible SDKs yet the
title does not imply that, so rename the section to "Yocto Project
Application Development and the Software Development Kit (SDK) Manual".

As a consequence, rename the first section title and reword the intro.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/index.rst            | 2 +-
 documentation/sdk-manual/index.rst | 6 +++---
 documentation/sdk-manual/intro.rst | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index afabb6615..24a6802a4 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -67,7 +67,7 @@ infrastructure.
    Linux Kernel Development Manual <kernel-dev/index>
    Security Manual <security-manual/index>
    Profile and Tracing Manual <profile-manual/index>
-   Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
+   Application Development and SDKs Manual <sdk-manual/index>
    Toaster Manual <toaster-manual/index>
    Test Environment Manual <test-manual/index>
    BitBake User Manual <bitbake>
diff --git a/documentation/sdk-manual/index.rst b/documentation/sdk-manual/index.rst
index dc7186b91..a5c35caba 100644
--- a/documentation/sdk-manual/index.rst
+++ b/documentation/sdk-manual/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-========================================================================================
-Yocto Project Application Development and the Extensible Software Development Kit (eSDK)
-========================================================================================
+=====================================================================================
+Yocto Project Application Development and Software Development Kits (SDK/eSDK) Manual
+=====================================================================================
 
 |
 
diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 53246bd9a..b78248d54 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -4,11 +4,11 @@
 Introduction
 ************
 
-eSDK Introduction
-=================
+SDK/eSDK Introduction
+=====================
 
-Welcome to the Yocto Project Application Development and the Extensible
-Software Development Kit (eSDK) manual. This manual
+Welcome to the Yocto Project Application Development and
+Software Development Kits (SDK/eSDK) manual. This manual
 explains how to use both the Yocto Project extensible and standard
 SDKs to develop applications and images.
 

-- 
2.55.0


