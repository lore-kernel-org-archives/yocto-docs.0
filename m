Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E964CA6C9C
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6058.1769501981836833507
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hRCLcEoB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B33C1A2A69
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32DF2606F5;
	Tue, 27 Jan 2026 08:19:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D799119A8694;
	Tue, 27 Jan 2026 09:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501979; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gen7EeYXcilSpgYmTb6X4TomYS9sEn6doy0kRbHqf+0=;
	b=hRCLcEoBbWhZe+fTXyknjX70DG2kwcFftTmPmqABCFRpnkZQUhdwQRmmniP4DcZR8sfJEV
	Y24cWhzeDsEToKgBJ2MUWRyrbyxFNGvTKFs1frDQJ26aS5VnOEwKRSE+xDK7c0LPo9aPZN
	0MDwxNdWTRDtJGEDChp+FmdUQw2wdlWlPKbr1ystGPaCcbHZwxtkuKCHEYqb+UWrQc1nSR
	9NtnZr2zuC+BrClxOhCxdy4vAxxl2Gwmre5bmILdFqcHW/Z7EYIB70p6jt3DQgsCqOT8eX
	npJYK0TBaXcFU6Zy5dfx8DTNoSh10vgOR06FZ553fr7bWQ1bjFKAIk2bgwZv4w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:22 +0100
Subject: [PATCH v2 27/56] ref-manual/tasks.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-27-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qzmUkb+8vZsVUXeMt/+kgXll/EqB55yZ399IFQSunTA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUC8LhWH3RdTVeW56rNAk8EsDcLwXmGJ3Hfq
 a5Zo6Sexb6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AgAKCRDRgEFAKaOo
 NvH2D/9pcshHiscGoiJvDEMqR+BZrWDOV2vife+ePYvEEw2ikb2U9LIJ215jfjR/VUdneGWB0Bw
 CWFLGoQ1tj7vorXyj8YVlDpHT+zvldt3w+4Kfr5wrhTr1FmNQxKxaDD2KN/6uiuRsKBZS1Smb9s
 l92sJpBfipc19/hLXycPHLdjcyDTV1xXLUjS6jefiYkoc0JCNw59lW8CYZOdQrAopGfxTDRvTvS
 w+CekfbNed0jYX9pL7P2n1LO6nWw+dIv55UD+q9NHqfWg4AXmu4YUKrpyKRXRuPD1XGFIcYdSA/
 FOYxgo333U5T47yWsWvYDIS56Afca2NI2TQlyn+nq1IK3ZsvM6XlHhkAqYxxBXEbD1ItlpvyXxQ
 SLGjs9AHVl0ZbRMxeXE362ZSpAsZ016uJnvf/PErIZd4hSNB/OBzpsYFkKLFchfa4xLVQIvsV+z
 WmT8Umy4AT4ApDYriRTZMpl9urVmVv5myyddyVoNR1oCBSVN28cnRaspsYavlzdiD0QsAUsFmsB
 cnTw3X2GCxq4FixDFJU9uB+7YwvoGSZAQJbBzQixKIwl1RJgm4KNXV4KUAWEY1cZjIk0UKSlrEr
 Dnq7qL/KkYttvVW2lRJOt5+8EkEdJ7G/QOrQquulUOD6cwStuZbrTKEtM+eZDPueekZqu1+iMFc
 oO90WNN/Myu9ctQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8688

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 8651f219f..e6301e708 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -191,7 +191,7 @@ that either directly or indirectly depend on the installed files (e.g.
 
    -  The ``tar`` command with the ``--no-same-owner`` option. See the
       ``bin_package.bbclass`` file in the ``meta/classes-recipe``
-      subdirectory of the :term:`Source Directory` for an example.
+      subdirectory of :term:`OpenEmbedded-Core (OE-Core)` for an example.
 
 .. _ref-tasks-install_ptest_base:
 
@@ -288,14 +288,14 @@ to locate and apply patch files to the source code.
 Patch files, by default, are ``*.patch`` and ``*.diff`` files created
 and kept in a subdirectory of the directory holding the recipe file. For
 example, consider the
-:yocto_git:`bluez5 </poky/tree/meta/recipes-connectivity/bluez5>`
-recipe from the OE-Core layer (i.e. ``poky/meta``)::
+:oe_git:`bluez5 </openembedded-core/tree/meta/recipes-connectivity/bluez5>`
+recipe from the :term:`OpenEmbedded-Core (OE-Core)` layer::
 
-   poky/meta/recipes-connectivity/bluez5
+   meta/recipes-connectivity/bluez5
 
 This recipe has two patch files located here::
 
-   poky/meta/recipes-connectivity/bluez5/bluez5
+   meta/recipes-connectivity/bluez5/bluez5
 
 In the ``bluez5`` recipe, the :term:`SRC_URI` statements point to the source
 and patch files needed to build the package.

-- 
2.52.0


