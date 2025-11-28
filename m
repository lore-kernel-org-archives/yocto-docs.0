Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2051CD116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18695.1764344116102441769
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=osXUxHZC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 975F61A1E0A
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E76660706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA48E10B02064;
	Fri, 28 Nov 2025 16:35:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x3D28sV2c+6adJ0t5FYkRMGozNSFISPIL7bFddHGZoo=;
	b=osXUxHZCai55FPkSreDVflGAuo3gSjSVkV/A+XfVDJ7Ut9rfTwEnYgY13ZaGctRkpaUzO0
	Ka8dPJgj+ldI/WlYfiaFW0XQX2+86rkaciBSHXpP1dh3JvqrMhUOn4HbIR/Xuln3f6JG2D
	vxz9cLh/Un/vbtVVA5ZyXXDBG7N0+csYuL2VmFV6uP6jb8kSMbKUWvAA5JHi9uXJeyHxuc
	Yio6WGkkr3EuHb8JLrDfP6ixqyqIbrJy7xKyMXfjy3wgwCSYhgPxXEVq0oqQH7ErjGZ/EL
	nAwp8ezjoBgCQGXQQSJIoAVQOkjjiSQwyeWKMhpZiPqDTymMzc0cwMwhfCuIJA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Nov 2025 16:35:00 +0100
Subject: [PATCH 3/9] ref-manual/variables.rst: document
 WESTON_USER/WESTON_USER_HOME variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-release-note-5-3-updates-v1-3-6ef679198e80@bootlin.com>
References: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
In-Reply-To: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=X7FjR6NBvhAulsg3KukjTi5tzd3Wr9Pk5z6mPJwPu1E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEtujJbFcGHe5vaYaeB4j17XNQXynrmQVN4N
 Vb6utXcrDiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLQAKCRDRgEFAKaOo
 NtbMD/9oYqur4BC/OSJBoPTqIlICiaUwQwpsEtokk9YCkAln0Cm/CGNZ5BdvSyeFS+TdO7NCkdR
 Ukms+b2GXpWjAK055gOm0TKJFcBLJ6SV5jjg0LqegWag6i8HAEBNibdp8jXsdTE+Z2LapMekXDo
 NbGr0yuFkVI8D1w+EQcQg2VLOXkYNC5+EsRLrmkKTwDsDoWZLHGjXTdTRmY+FGA2pVkIPM5o8S5
 KT3T0VLi6Mr5KsXp/6a+uuh8+MldbpUTfuY06so0ZH68fLWBbSm+m4JtDybydtEgLTFGoVEurwE
 O62//EsOgJUNqTGBONtAp9rqgMnjr3XSUwSmuXkljasWIXT65bpsuR2mJg1UV6Ov8RmmxAUzBwJ
 Q/PVEVRwIW/NeJwsUFcrcwejEX+XB/GuVLrsIUHWUhbuZhHSBkzH15IrOFYvNvAV2TpMpab9edD
 2SG4kHFg2qxsk4GUypLOkddn5yR3baNZ8wFnB+aSwB/YbYHMBbez0Yhak0tm+PHeeNNYoM5M0Bz
 JKSdX7q/DT+7dAMSQXPl8AYlu/1+9YB2lWEXsk7A6wz4wpAmiErF2RBlPDaNIYIC/cy3ineR8OS
 3GpJiqHfkZrdsgZAXRK8XyznJ74DTe3kF1mJ0i9W9VClMq18rP0v45THkLUxaAvEL7+iT97it/1
 4Rnke/vgl/fFJ0g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8167

Added by commit 079cf188adae ("weston-init: Allow weston user to be
specified") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 55ecb4ebc..576995355 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11457,6 +11457,14 @@ system and gives an overview of their function and contents.
       Specifies the timeout in seconds used by the ``watchdog-config`` recipe
       and also by ``systemd`` during reboot. The default is 60 seconds.
 
+   :term:`WESTON_USER`
+      The :term:`WESTON_USER` variable defines the username for the `Weston`
+      user.
+
+   :term:`WESTON_USER_HOME`
+      The :term:`WESTON_USER` variable defines the path to the home directory
+      for the `Weston` user.
+
    :term:`WIC_CREATE_EXTRA_ARGS`
       If the :term:`IMAGE_FSTYPES` variable contains "wic", the build
       will generate a

-- 
2.51.0


