Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CFAC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7964.1785319370042709885
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 03:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Kn3JRgql;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5F02B4E40FDC
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34FE16039A
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A59A611C14BDD;
	Wed, 29 Jul 2026 12:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785319367; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iJnBtd5Mj+/mQc5x4s3kCxmguRnWXcbeU2qtGQq2fdk=;
	b=Kn3JRgql5l+gvO9jCCnmO+/21z2Mnq0VamqelYi3KWTpI7qRPRW7FP8YlXR0mmo0V0+wRS
	neOZ7RryJzQ+iUZIPJ/8qm/wEuQnx2WC5i3eaIPD/ZYM9r1ZxM4aM0NoV4+K6lne/5StBl
	xdiGhIGJBdhzrIjI12kfXBoC/fPStPfxHFwjuPI5YlzwRc5IpFdEIRGyIxsQDHvgjliukF
	0XT+RWHmUlcP2Xt+urvM39e45ZSBwPqa5n+7CM/A4veOO/qwDlVZKlpuHCdr7poTPDrcf0
	ATTUTHxbqAWjiNemRw5cjVrj7l9MBWAUvRLS+bAT04423y2lqbNdeCNNqK+JvA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 29 Jul 2026 12:02:27 +0200
Subject: [PATCH 4/5] sdk-manual: rename the section to remove "extensible"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sdk-clarifications-v1-4-661e65201bc7@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
In-Reply-To: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2690;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vTMNnQm93ELOyAe3uLJ4eJYq4CeNw8j06FnhIlkv/+k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqac+3B+PC8SC/LoEqFk5IlefthShQi9B4BrSyb
 nAiWwS8PjaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamnPtwAKCRDRgEFAKaOo
 NpqhD/9RmFNIdjMwFLVpWNQKlO+wBgsJtPexeeF4O8IYJPM8BE3NZUfqik6xwBYwy3z/Qf8KP2t
 IxC8+wqdK6mGett4DRxWcR0fouV2ni5MSu1hERplN/v0qj+uwJbrvYtR4jNwBcVVMFS5NxD8jXX
 gzwxbrtN8PSbVAcv1UxHft6es6BAQ6a2iHDqe9q3ZqZTaTmcWKiLe2RAJNIFrx/R7oJVx9lSba3
 7j96bvDFl6SqzMriVZJnmuXCjS1Vl+UesO2XW03m7l8eMhIp6W1mpb0hQVCaSroi1OWqPL0dwHp
 v51XGzPTuvctz0EJ+Dmrf0k91UgVZ/DX+45ZqOE3RDEuXKhX4yPpVMKqcAt06IM8YuN8FvQMJWk
 B6ngsdNSBm19tjBDJ+iXrp06h0cwJlZhBVsu4vhV8C4GoTghuG7sIb1Zxd+gEffcGFlmbs3R9IM
 h+xO6I1MqRfAXSM7D2MyfwoMi4uJzi84HFpMK+ZD0sGkYXlRz736m4/EY+T1ckCaCsvpRcadABa
 47SocONMyoPT00Ar4/711fdK0ySOXZTIaI8UeHKp/6rF2uH64WEgRYKyVbT42YpkvPNuUJk7UPE
 R6l/CF9xSQ98cpwkzzf2/Z1V6sEE51JgN9PKgaL1u0d6QCgfMb+YE77n2wye/UMwaAHtV5DzXep
 wtNM8re9WEDVv3A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10189

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
index afabb6615..d8603c2f5 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -67,7 +67,7 @@ infrastructure.
    Linux Kernel Development Manual <kernel-dev/index>
    Security Manual <security-manual/index>
    Profile and Tracing Manual <profile-manual/index>
-   Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
+   Application Development and SDK Manual <sdk-manual/index>
    Toaster Manual <toaster-manual/index>
    Test Environment Manual <test-manual/index>
    BitBake User Manual <bitbake>
diff --git a/documentation/sdk-manual/index.rst b/documentation/sdk-manual/index.rst
index dc7186b91..477274ab9 100644
--- a/documentation/sdk-manual/index.rst
+++ b/documentation/sdk-manual/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-========================================================================================
-Yocto Project Application Development and the Extensible Software Development Kit (eSDK)
-========================================================================================
+===================================================================================
+Yocto Project Application Development and the Software Development Kit (SDK) Manual
+===================================================================================
 
 |
 
diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 53246bd9a..8ccbcfa20 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -4,11 +4,11 @@
 Introduction
 ************
 
-eSDK Introduction
-=================
+SDK Introduction
+================
 
-Welcome to the Yocto Project Application Development and the Extensible
-Software Development Kit (eSDK) manual. This manual
+Welcome to the Yocto Project Application Development and the
+Software Development Kit (SDK) manual. This manual
 explains how to use both the Yocto Project extensible and standard
 SDKs to develop applications and images.
 

-- 
2.55.0


