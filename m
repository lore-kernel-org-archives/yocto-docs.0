Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAA2CCD1A3
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:55:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3671.1760604894756641880
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ojhsk6T9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 723351A140D
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 486CB6062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6BF1102F22F1;
	Thu, 16 Oct 2025 10:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k1E/64RdfzbQTrue2lECj9MTQpW3o3LWEBJobaGnbFk=;
	b=Ojhsk6T9TEm7X3rM9fBzKOVk8pqcGV4+HrqadYiaz4IEYVolB9U/Fti+GNK6pk8l2sYcAv
	rHB1d67ya/CY36a9bYZEdoFFMtyeEd6E9rSGv7JNXqldzigvI4qcFWb5ip4ylnnDqEJEJq
	uA+mAKeEjYmNgoD1XaA9D1n39Spq1YOo4YM9tnGRjyWAwAAW6taSj4+mIbK+cc30tgxFFj
	o1ijBD5Ul6Ru/JAfVcoNyEo9AmeCyR/NcHy22XO182368+i0hqbqtT1g+s21BPZdfXOSjM
	8Jrzo3ieIu6oacl4FLKHb/uIK4npFPXarzDUMZUCbOJzPD05lsk1I53yEN7jEg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:54:06 +0200
Subject: [PATCH 16/17] ref-manual: document UBOOT_MAKE_OPTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-16-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iJguPptUAtIsGk6J6clV8xpA3h0cxUlXDWPxNcSmLPM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLRL1SdScb6zBaxl3+JDBJI72yAhR3A+sVjJ
 OaSJFe2NqiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0QAKCRDRgEFAKaOo
 Nt1oD/42pE/qyXqb2hXFjTL0m/+B2d+VEamThQpwdldCFP4beApWHPkBMAeRxPcL8uwv5qEZC7S
 KisUxHGLZ1Uls3HIhEiOZP1BTdjTMxM+M2t5gnvzCw58W5g0y16IfNriVhFRBqcYSFwA/e/9OZv
 lJ/wxbHjbxIMlOLnoad7eDKg78FPZToV4wmqT0pSfpgknwbLSYkHXUMjy8onQW3rZ541K5GTRDw
 bXkZrPGXlfNhDnlNTuTGglod+35BoHd9psSR97EfqDMRiV36hLGc+5JeZ7xKIgi5hXEUus6yIhk
 4XLIs0oAlI0yRCd7uFQk6ADL5p81/b9692FPRZGYE3JqltojQPsAZRuBGwFBkLFP4nFoQo5MI+w
 W8OsBu6YCybBqOr1wG0aqt/SX+MGOipvwxcY+RpVy7r+8HVT3iPLby0CL/Bq6P2tXkwO33ru85/
 CCTeXzp6YHiwCANxTxDOkib8yR6sagSIqwyW05x1lTEczBc6i3Wkd/OFGVXtAaAqzJJL2qLVEFL
 bPCSFu+RJ1fWLZCUAdxy3qAwNBSsSLbnC5wTygQpxR7VKdkFW+93E3TMFTHCirIKyGDzbojsazh
 m0B5zDy2iG2pdenXwHmajkfsThwJyj9OHhhTbrWhQe16PVtF5iw4Tp4iNqxv7l7Nl0qCJpbd7UE
 HsXm92trIFUI2EA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7726

This variable was added by commit 3338330e0c46 ("u-boot: Add specifying
make options as part the config looping") in OE-Core. Document how to
use the option in UBOOT_CONFIG.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 9 +++++++--
 documentation/ref-manual/variables.rst | 4 ++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 4d74563e1..c22d3b712 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3233,8 +3233,8 @@ The :ref:`ref-classes-uboot-config` class provides support for U-Boot configurat
 a machine. Specify the machine in your recipe with configuration entries::
 
    UBOOT_CONFIG ??= "foo bar"
-   UBOOT_CONFIG[foo] = "config,images,binary"
-   UBOOT_CONFIG[bar] = "config2,images2,binary2"
+   UBOOT_CONFIG[foo] = "config,images,binary,makeopts"
+   UBOOT_CONFIG[bar] = "config2,images2,binary2,makeopts2"
 
 The above options correspond to:
 
@@ -3266,6 +3266,11 @@ The above options correspond to:
    This option is not mandatory, but the value of :term:`UBOOT_BINARY` is used
    instead and should be set.
 
+-  ``makeopts``: the additional options passed to ``make`` when compiling U-boot
+   for this configuration entry. This does not replace the original value of
+   :term:`UBOOT_MAKE_OPTS`. The options in this entry are added as additional
+   options after :term:`UBOOT_MAKE_OPTS`.
+
 You can also specify the defconfig used during the build using this method::
 
    UBOOT_MACHINE = "config"
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 140be47a9..709cc5726 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10894,6 +10894,10 @@ system and gives an overview of their function and contents.
       Please see the "Selection of Processor Architecture and Board Type"
       section in the U-Boot README for valid values for this variable.
 
+   :term:`UBOOT_MAKE_OPTS`
+      The :term:`UBOOT_MAKE_OPTS` variable can be used to pass extra options to
+      ``make`` when U-boot is compiled.
+
    :term:`UBOOT_MAKE_TARGET`
       Specifies the target called in the ``Makefile``. The default target
       is "all".

-- 
2.51.0


