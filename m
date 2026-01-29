Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CF6D61037
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17089.1769700249915393089
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tTu/dGQo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 651FD1A2B0D
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AFC7606FD;
	Thu, 29 Jan 2026 15:24:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86F75119A868E;
	Thu, 29 Jan 2026 16:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KrGSLod6/pF3KhZZTNTuzimytOCaLoIcbvZ9NCgkBj4=;
	b=tTu/dGQo6Yam21y8CUQnwd6oE0+jPmRVaOqsU+/5RZYl9rjmFV/ssBzO0lYBl/aTQzdZQm
	ymnSMZ9m9KhX7tZyOylCPtuYaX2ZCFOs9T8h0RqS3YpzkcDPpgXtZd6ThiiAV5QNOCwTYf
	vnlu204CFElHLBtvPEqvHAofjyzOy/z21i9z3jiNl4YgeLaeni8FLrXFLhTY/iVg1ayBx+
	7FvBXuSpSHeYm4JxOBCL0OrfzOXN7z1BZTTP43o418+pH5lusIcx3+5VDVWMvbvmKgSKBG
	MYE5xl0b3oeqhvK7mh0UawBGfpQoJL64t8p5V7Ud6uWzdamSZRulnK9eTNc7aQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:22:58 +0100
Subject: [PATCH v3 07/57] dev-manual/building.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-7-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4753;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ryvQVG/eyTh6kzdj/GUta8S5C90K1sgHkpde0Vbck1U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uKbFz9xjEiQ/STYaJ6oF2Aay4zRfJT/FENi
 VpCM3yhDBOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7igAKCRDRgEFAKaOo
 NvtQEACymHY91ClrjXVD7qnEyiWrCQFmLiWe8qwWOkk1Nzr39ghAITpVQ6FoioYOoOUVTtl2a68
 rGi8MNQmQYP0AeqQ7Rp3Mb1zhNfPPhNFqBf54g4hLM0KVrwJjddhKkZJ4TY2ssbz/8Zs8/lqnib
 x0BXQ00oLWPummKjdc/5MBwPEg3XmZ+iQz8zO5HUZGSJFm9y1ST7AyYgKrOGSDJ84W9TmWBM1kO
 erb8pIzHDd/4WGoA2L6l+t0/5zTTk9wodPa8LcpAa4I05tD79vSnxPcj0oaqH/wS5S3x+YRSeGC
 DAf61N2UNx+ubhSTAmwdPbsTs8P8eDNbddQvCQlOU4JQbGV8PPiLPyBmi10P36AdupvJ2iw036x
 rIYgtrRII2EL395Zfp/jW8xzdTITq0XBfmockLk4CnALyJ8UbaJA6uhAVRDrHsCYqdz/McjLLXx
 mmTrvkxHDKK4ANM1RByEiZA8IKg9YYEcA+7CnSgqrBFUYUmcj5A2fASORq/mgBS6bz7ENI1DMeA
 luwgVD2/4QeIdfVNFym9TnSUdzXg96kh/oAApCcuqfsCYFlMr0kUyuHGfet6phuAEddTR7al6Vq
 cBHeEXzqqWL09V2Kejyb0pHbrcgM1BUguC8h35RWyU6DZS8O0ttFUNrVfngCR0A7M2DO+QL2kHP
 Qe8pDA1vPiKC5hg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8793

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/building.rst  | 40 +++++++---------------------------
 documentation/ref-manual/fragments.rst |  2 ++
 2 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 60ad11f52..c153eb9de 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -51,32 +51,9 @@ The following figure and list overviews the build process:
    Yocto Project*: See the ":doc:`/dev-manual/start`" section for options on how to get a
    build host ready to use the Yocto Project.
 
-#. *Initialize the Build Environment:* Initialize the build environment
-   by sourcing the build environment script (i.e.
-   :ref:`structure-core-script`)::
-
-      $ source oe-init-build-env [build_dir]
-
-   When you use the initialization script, the OpenEmbedded build system
-   uses ``build`` as the default :term:`Build Directory` in your current work
-   directory. You can use a `build_dir` argument with the script to
-   specify a different :term:`Build Directory`.
-
-   .. note::
-
-      A common practice is to use a different :term:`Build Directory` for
-      different targets; for example, ``~/build/x86`` for a ``qemux86``
-      target, and ``~/build/arm`` for a ``qemuarm`` target. In any
-      event, it's typically cleaner to locate the :term:`Build Directory`
-      somewhere outside of your source directory.
-
-#. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
-   ``conf/local.conf`` configuration file, which is found in the
-   :term:`Build Directory`, is set up how you want it. This file defines many
-   aspects of the build environment including the target machine architecture
-   through the :term:`MACHINE` variable, the packaging format used during
-   the build (:term:`PACKAGE_CLASSES`), and a centralized tarball download
-   directory through the :term:`DL_DIR` variable.
+#. *Make Sure Your Configuration is Correct*: Use :ref:`bitbake-config-build <ref-bitbake-config-build-qf>` to
+   define the :term:`MACHINE` or :term:`DISTRO`, and open your
+   :ref:`structure-build-conf-site.conf` file to set site-specific settings.
 
 #. *Build the Image:* Build the image using the ``bitbake`` command::
 
@@ -88,8 +65,8 @@ The following figure and list overviews the build process:
 
    The target is the name of the recipe you want to build. Common
    targets are the images in ``meta/recipes-core/images``,
-   ``meta/recipes-sato/images``, and so forth all found in the
-   :term:`Source Directory`. Alternatively, the target
+   ``meta/recipes-sato/images``, and so forth all found in
+   :term:`OpenEmbedded-Core (OE-Core)`. Alternatively, the target
    can be the name of a recipe for a specific piece of software such as
    BusyBox. For more details about the images the OpenEmbedded build
    system supports, see the
@@ -127,7 +104,7 @@ Follow these steps to create an :term:`Initramfs` image:
 
 #. *Create the Initramfs Image Recipe:* You can reference the
    ``core-image-minimal-initramfs.bb`` recipe found in the
-   ``meta/recipes-core`` directory of the :term:`Source Directory`
+   ``meta/recipes-core`` directory in :term:`OpenEmbedded-Core (OE-Core)`
    as an example from which to work. The ``core-image-minimal-initramfs`` recipe
    is based on the :ref:`initramfs-framework <dev-manual/building:Customizing an
    Initramfs using \`\`initramfs-framework\`\`>` recipe described below.
@@ -366,9 +343,8 @@ memory used for decompressing the kernel and for the ``__init__``
 functions.
 
 To help you see where you currently are with kernel and root filesystem
-sizes, you can use two tools found in the :term:`Source Directory`
-in the
-``scripts/tiny/`` directory:
+sizes, you can use two tools found in :term:`OpenEmbedded-Core (OE-Core)`
+in the ``scripts/tiny/`` directory:
 
 -  ``ksize.py``: Reports component sizes for the kernel build objects.
 
diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index 42fba41e9..9449f4648 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -22,6 +22,8 @@ System` core repositories.
    :doc:`/dev-manual/creating-fragments` section of the Yocto Project Development
    Tasks Manual.
 
+.. _ref-bitbake-config-build-qf:
+
 ``bitbake-config-build`` Quick Reference
 ========================================
 

-- 
2.52.0


