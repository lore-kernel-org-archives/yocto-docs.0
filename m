Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6606ACCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 10:05:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.5239.1761127510652571340
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 03:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CDl1H9b2;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4B45FC0B8B3;
	Wed, 22 Oct 2025 10:04:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BD2D606DC;
	Wed, 22 Oct 2025 10:05:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97E8C102F242A;
	Wed, 22 Oct 2025 12:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127508; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=sTWwMtGCrSwLWywiJdEonR7JvdsuSRgiIoQI1lJqQH4=;
	b=CDl1H9b2a/7c19PFpp4e2aPuUdmVgD7fu7wEmcCUP0kMQpgVRF+mV4iG1q7YM2huCPB7Zv
	GFe8gvvheYjNU333MWwcId9E0/IseZwBJnezXYNer36LMk1sLrzhmkaK1WuCFXuP6/j0UR
	HTljVDzPPtvvr3AHL8URRsbYCVLD7EANLXBXllIEiXhexnGxfO9oPmCVFR9gSVacpdjzqN
	AsAkaEkUSnwYdL7OyP0TZvxtyOmiUhucXUvqL4NvKolVzRLZMOvzQQeYFFJ7i54d6z4by6
	IQ+heQ2fUgd2fRqFcJcXPqc5yznY2B1G5UOIWjTPR/WsMiTzEzwwS/pGzWFgqw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Oct 2025 12:05:00 +0200
Subject: [PATCH v2] ref-manual/classes.rst: uboot-config: improve
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-improve-uboot-config-class-v2-1-914788ce5888@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEys+GgC/42NQQ6CMBBFr0K6dgxTrFpW3sOwKHWASaAlLTYaw
 t0tnMDle/l5fxWRAlMUdbGKQIkje5dBngphB+N6An5lFrKUCku8AE9z8Ing3Xq/gPWu4x7saGK
 EUrZKy6ozd61FDsyBOv4c8WeTeeC4+PA9vhLu9q9sQkDQeK2IDCqlbo99M7I7Wz+JZtu2H2Yqt
 lPGAAAA
X-Change-ID: 20251014-improve-uboot-config-class-02b5923fa899
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3881;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nApw8dZRFE5y6wsGMuqAW38cOTo4bavtB2y3IUC6r1Y=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+KxTivucp72ChyFvzX+3VA7O+rbbKr/X+R5Pu
 A5OIkoThfCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPisUwAKCRDRgEFAKaOo
 Nlz6EAClHe5H6hFj5NOXj/pyzUZiv10hAzqaxw2aHIQIdE4CMO44/6tt9uSxF0Oc+d4zjpTrVoV
 Gl6WahIsihFtJSJItqg22I+MpMR39f16uyLuxMqhroi8y+b3pjc7MZuQ+WifSyrkVt+7WC5GTk8
 UuXdnrUUeOL9YKTmdZHZ1aOm7rFHRta1zVugs2KdLAmaOM7jRSMvMN+V9/slmQGg8elH5OGXyQx
 WQfGGHPfBZzJ3l/Wrf1SHu6jgB9TylTnfnwtM6zjivFY5m/o0ntLJB/SF9Ty/XReOWRAjCS5sLL
 7Uiwn+18hsKzWVEqoVORoJOJqhJZFtvSxfbvozhsAH6GJ59x8pZj+gy+zEGZPOmT7/fCfc4mYZm
 cRUA+iYpqNIhEy5iCuIQJPU/9n7B9P5lpAy98zdW+az30ov5MY6C8axP9livFp/bp3uwIeBCA4Z
 tmsAeLJc4Z12232Ki1W0jY3qTu/T6WNNR/UWWQICCcqez/9o28p1UrbUJHvZ0oR2by+An51awgw
 YutGQQssWWeHxHwI4+iSxj8FvfxZ63YmP6rZpSJj5RJfMrrndwKO6UOIUUQ/rud3DmTWii0QV5R
 OIEvkUes0mOHv46gzS5dOq9bu4uV5nOAGFsfvGfeDqpLyrGtq8lbf6f7W/gB1p3zYVs7Mosp8VB
 yb2qA31A6syIT4g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 10:05:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7768

Improve the documentation of the uboot-config class. It was not
explaining any of its entry in UBOOT_CONFIG. Mention that using
UBOOT_CONFIG and UBOOT_MACHINE at the same time is not possible.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Suggestions from Quentin (thanks!):
  - Restructure uboot-config class in two parts.
  - Use "build configurations" to design UBOOT_CONFIG's flags (instead
    of "entry").
  - Rewordings and typos.
- Link to v1: https://lore.kernel.org/r/20251014-improve-uboot-config-class-v1-1-9163eea15557@bootlin.com
---
 documentation/ref-manual/classes.rst | 58 ++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 662121ed9..1dc3c3b0f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3169,15 +3169,61 @@ variable using the "type" varflag. Here is an example::
 ``uboot-config``
 ================
 
-The :ref:`ref-classes-uboot-config` class provides support for U-Boot configuration for
-a machine. Specify the machine in your recipe as follows::
+The :ref:`ref-classes-uboot-config` class provides support for configuring one
+or more U-Boot build configurations.
 
-   UBOOT_CONFIG ??= <default>
-   UBOOT_CONFIG[foo] = "config,images,binary"
+There are two ways to configure the recipe for your machine:
 
-You can also specify the machine using this method::
+-  Using :term:`UBOOT_CONFIG` variable. For example::
 
-   UBOOT_MACHINE = "config"
+      UBOOT_CONFIG ??= "foo bar"
+      UBOOT_CONFIG[foo] = "config,images,binary"
+      UBOOT_CONFIG[bar] = "config2,images2,binary2"
+
+   In this example, all possible configurations are selected (``foo`` and
+   ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
+   changing the value of :term:`UBOOT_CONFIG` to include either one or the
+   other.
+
+   Each build configuration is associated to a variable flag definition of
+   :term:`UBOOT_CONFIG`, that can take up to three comma-separated options
+   (``config,images,binary``):
+
+   -  ``config``: defconfig file selected for this build configuration.
+      These files are found in the source tree's ``configs`` folder of U-Boot.
+
+      *This option is mandatory.*
+
+   -  ``images``: image types to append to the :term:`IMAGE_FSTYPES` variable
+      for image generation for this build configuration.
+
+      This can allow building an extra image format that uses the binary
+      generated by this build configuration.
+
+      This option is not mandatory and can be left empty.
+
+   -  ``binary``: binary to select as the one to deploy in
+      :term:`DEPLOY_DIR_IMAGE`. The output of a U-Boot build may be more than
+      one binary, for example::
+
+         u-boot.bin
+         u-boot-with-spl.bin
+
+      Setting the ``binary`` value to ``u-boot-with-spl.bin`` will make this
+      binary the one deployed in :term:`DEPLOY_DIR_IMAGE`. It is renamed to
+      include the build configuration name in the process (``foo`` or ``bar`` in
+      the above example).
+
+      This option defaults to :term:`UBOOT_BINARY` if unset.
+
+-  Or, using the :term:`UBOOT_MACHINE` variable (and its companion variable
+   :term:`UBOOT_BINARY`). For example::
+
+      UBOOT_MACHINE = "config"
+      UBOOT_BINARY = "u-boot.bin"
+
+Using :term:`UBOOT_MACHINE` and :term:`UBOOT_CONFIG` at the same time is not
+possible.
 
 See the :term:`UBOOT_CONFIG` and :term:`UBOOT_MACHINE` variables for additional
 information.

---
base-commit: 8b85245490ae0b19a9c3880ec31e55b42e19d094
change-id: 20251014-improve-uboot-config-class-02b5923fa899

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


