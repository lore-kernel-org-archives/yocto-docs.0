Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33193E776CC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123717.1766593912833050633
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1UdLTDhK;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4283D1A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 199106073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7915210AB136F;
	Wed, 24 Dec 2025 17:31:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JJfWGA8BpMiqUIl2g/x/ZXWO8TM6zTiWa8ImoSd1QX0=;
	b=1UdLTDhKFGj5Q6be6x72LCJGubIxCT8Vv3KGrdtuTIOjngBZ3IxWXEpjeECV0glsjMYH3e
	WRahYXg6gVbR+AyTpRZiL4jhTCLH+8rfIwUjUzAp93S1TI0RA0azcaVBEZOP/oFdhPoEVB
	X22rzTXrhT7ppvE0giUkUrQboip24BBscz/kj1ZVT5Y30v65nJzk92/51g9dmHxDLuJ2Js
	AYhpwW0edar02aQw4pHymB+70Pwaz1rYqj0uPMUmunehNtILTTWmWt6OSp+JGJDj85w05H
	7hxlBAXrztTfMFTjFGo6k57dLZxvRepnr/dDUOt12yAQ3eYmGoGDTlqR3tSACQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:33 +0100
Subject: [PATCH 07/53] dev-manual/building.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-7-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4697;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wXWyQuikG9ztPn0xZgLvEornbB0Um9+rD0vKEdE3LHI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVnYSz4DPv/j10QQy3NKJbvm/OQHOIOwlHHM
 llu59JehYiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVZwAKCRDRgEFAKaOo
 NkOkD/4qqmPG/fP4MjfrUajPxCKRyxKfkVl055RupV18QAhq33iLUFK88ou2e5fLFOPq0M50iWx
 fKY5cuRajZUWNrB9NtIy82r5yAaV4qUiOb7OU00QW9Estef7cj9JD2a9E8GT56lXX9Wcaa0K2kg
 VbSSO3GZHn8uKaLVYvcOZi9hub6+JFQjlcktA2pZo42oj8F4XWPLv89ml1TMr8HxYRep4wQ58Uv
 CKH6mHn8qDGhfYBg7yb+eEeE2Xd2HBstilhhQurVOUbnUdg1mqQlmcgc1iLoO8q/iAtXYfRC0bg
 G/brIU5B3VRVc4Ilk9Z5t55E+KYa3960Pge1JNTQsYpcb54d3cdS2BbYktaMejD7LcO5zJkOGoz
 +N5wU/B8kNo/SEVF1tJ2yLjgE68JAC2zlg+efEYWxI+70wQFXqDyKfAk6vCJYIq8beNnHpUVaaH
 UkalQfxpfufoXovgws8pNOVi7zvJdzXWv6IqELYAfQflfwhDTaWmTfJfoNLtXXmMej/XO9RlTtm
 ZPdofDE0Xso47nm2NFObUmwPnhuKNV5lb64OM5275s9/awWDAsKzgNDFg8eIE6oNepOF4kU+nb/
 JS/ctuCfNtIFCUgInhrwICx7S1OcdW3Qf85oQrEpyi4+quU/RlL3y4rvdTr8Jcdx0iitLKB6SwY
 +D+4ETHisLJp8Nw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8336

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases.

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
2.51.0


