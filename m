Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2308C4725D
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:53:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12413.1705078419942985478
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Re9Q8xti;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FDECFF805;
	Fri, 12 Jan 2024 16:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2njVLYMTXhS1daEWrF2s0nK68VIV2tKUlwozvNQAVIE=;
	b=Re9Q8xtiikiztKJRiSPSqGycM56dY5CAwIVE98J+Hd4KZgqwEG45KsXOa5PUYkTKdzfpx0
	a45jhWFQqrh4yQjEpNHmKna52p47ib1L2mWVDAQ6bFGHGaZeSp3xXipRZbZKvdZcxSX1Hw
	eeg/LReyckRDsytop1jcJND2l9QF0qJUgWHkOUwDwsDkC8oCq2Uts+VJWGjtjZGzgHQeaQ
	JBdzV7jceLJB72b3fcHYvxoq5kB15MGOhbtmFgfP8HeFOJL9MYuw7TIF/KDp2/lddltM7/
	8W4p1VilI15Fp39BLzt3vLfTNaNWu2x/05jlOe1Ld4j/DIa46TB1dWRt4BdyLA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 6/6] documentation: Add UBOOT_BINARY, extend UBOOT_CONFIG
Date: Fri, 12 Jan 2024 17:53:11 +0100
Message-Id: <20240112165311.3554201-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
References: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:53:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4779

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Jörg Sommer <joerg.sommer@navimatix.de>

UBOOT_CONFIG accepts a third parameter for the UBOOT_BINARY that isn't
documented. To show its usage another example from the meta-freescale layer
was picked.

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst   |  2 +-
 documentation/ref-manual/variables.rst | 39 +++++++++++++++-----------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 0677157b3b..216b236e33 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3131,7 +3131,7 @@ The :ref:`ref-classes-uboot-config` class provides support for U-Boot configurat
 a machine. Specify the machine in your recipe as follows::
 
    UBOOT_CONFIG ??= <default>
-   UBOOT_CONFIG[foo] = "config,images"
+   UBOOT_CONFIG[foo] = "config,images,binary"
 
 You can also specify the machine using this method::
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fe0b993bd8..ae14c450dd 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8932,23 +8932,30 @@ system and gives an overview of their function and contents.
       See the machine include files in the :term:`Source Directory`
       for these features.
 
+   :term:`UBOOT_BINARY`
+      Specifies the name of the binary build by U-Boot.
+
    :term:`UBOOT_CONFIG`
-      Configures the :term:`UBOOT_MACHINE` and can
-      also define :term:`IMAGE_FSTYPES` for individual
-      cases.
-
-      Following is an example from the ``meta-fsl-arm`` layer. ::
-
-         UBOOT_CONFIG ??= "sd"
-         UBOOT_CONFIG[sd] = "mx6qsabreauto_config,sdcard"
-         UBOOT_CONFIG[eimnor] = "mx6qsabreauto_eimnor_config"
-         UBOOT_CONFIG[nand] = "mx6qsabreauto_nand_config,ubifs"
-         UBOOT_CONFIG[spinor] = "mx6qsabreauto_spinor_config"
-
-      In this example, "sd" is selected as the configuration of the possible four for the
-      :term:`UBOOT_MACHINE`. The "sd" configuration defines
-      "mx6qsabreauto_config" as the value for :term:`UBOOT_MACHINE`, while the
-      "sdcard" specifies the :term:`IMAGE_FSTYPES` to use for the U-Boot image.
+      Configures one or more U-Boot configurations to build. Each
+      configuration can define the :term:`UBOOT_MACHINE` and optionally the
+      :term:`IMAGE_FSTYPES` and the :term:`UBOOT_BINARY`.
+
+      Following is an example from the ``meta-freescale`` layer. ::
+
+         UBOOT_CONFIG ??= "sdcard-ifc-secure-boot sdcard-ifc sdcard-qspi lpuart qspi secure-boot nor"
+         UBOOT_CONFIG[nor] = "ls1021atwr_nor_defconfig"
+         UBOOT_CONFIG[sdcard-ifc] = "ls1021atwr_sdcard_ifc_defconfig,,u-boot-with-spl-pbl.bin"
+         UBOOT_CONFIG[sdcard-qspi] = "ls1021atwr_sdcard_qspi_defconfig,,u-boot-with-spl-pbl.bin"
+         UBOOT_CONFIG[lpuart] = "ls1021atwr_nor_lpuart_defconfig"
+         UBOOT_CONFIG[qspi] = "ls1021atwr_qspi_defconfig"
+         UBOOT_CONFIG[secure-boot] = "ls1021atwr_nor_SECURE_BOOT_defconfig"
+         UBOOT_CONFIG[sdcard-ifc-secure-boot] = "ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig,,u-boot-with-spl-pbl.bin"
+
+      In this example, all possible seven configurations are selected. Each
+      configuration specifies "..._defconfig" as :term:`UBOOT_MACHINE`, and
+      the "sd..." configurations define an individual name for
+      :term:`UBOOT_BINARY`. No configuration defines a second parameter for
+      :term:`IMAGE_FSTYPES` to use for the U-Boot image.
 
       For more information on how the :term:`UBOOT_CONFIG` is handled, see the
       :ref:`uboot-config <ref-classes-uboot-config>`
-- 
2.34.1


