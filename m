Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC08C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 12:07:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.5199.1698408453019094840
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 05:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fVq8CrpK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3793AFF809;
	Fri, 27 Oct 2023 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698408450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WHlC06KzKP/jw2p5NEgWztocuoNbzLUg8D4wSEjyx0w=;
	b=fVq8CrpK+wU2I22jRUUXSpp95J8SjIxvDfDMx6PFVyFMNZy3pdI+jEEHe20EzbASvbV+zK
	5jsjkBFAY5xQvHcT7MGi5KN/a4As0jVl5MIvlkMy0wcz+01BktBacx6u7cXBsBWdj6LJee
	X0GzVTDeHXt/kpw4jWOcPFNxCqzfJ0yBiEZe6ogbnxsF93YcxFiFnXTbGIS83zNrnm0raD
	nUICI9YJMg/lVZgvcO9ZegDDcUQpcS9XZfGL4g+kChFzE48h0puAYfGnYoR5SSQoMjNhkl
	e51bt+14DV/+YxyHO+T1mYP8HiDdntUwe7IFHdu6608cIpcQmgOudy1PZsXbiA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Paul Eggleton <bluelightning@bluelightning.org>
Subject: [PATCH] migration-guides: updates for 4.3
Date: Fri, 27 Oct 2023 14:07:27 +0200
Message-Id: <20231027120727.1616739-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 12:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4510

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/migration-4.3.rst        |  6 ++++
 .../migration-guides/release-notes-4.3.rst    | 30 +++++++++++++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documentation/migration-guides/migration-4.3.rst
index 79cf907708..c47d09a1ae 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -108,6 +108,12 @@ The following classes have been removed in this release:
 
 .. _migration-4.3-misc-changes:
 
+QA check changes
+~~~~~~~~~~~~~~~~
+
+- The fetcher in ``lib/bb/tests/fetch.py`` now uses the ``https`` protocol
+  instead of ``git``, whenever possible.
+
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 87cd622743..4916ee5706 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -6,7 +6,7 @@ Release notes for 4.3 (nandbield)
 New Features / Enhancements in 4.3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  Linux kernel 6.x, glibc 2.xx and ~xxx other recipe upgrades
+-  Linux kernel 6.5 and 6.1, gcc 13, glibc 2.38 and other recipe upgrades
 
 -  New variables:
 
@@ -22,6 +22,10 @@ New Features / Enhancements in 4.3
    -  :term:`LICENSE_FLAGS_DETAILS`: add extra details about a recipe license
       in case it is not allowed by :term:`LICENSE_FLAGS_ACCEPTED`.
 
+   -  :term:`FILE_LAYERNAME`: bitbake now sets this to the name of the layer containing the recipe.
+
+   -  :term:`KERNEL_LOCALVERSION`: to add a string to the kernel version information.
+
 - Layername functionality available through overrides
 
   Code can now know which layer a recipe is coming from through the newly added :term:`FILE_LAYERNAME`
@@ -34,6 +38,11 @@ New Features / Enhancements in 4.3
 
 -  Architecture-specific enhancements:
 
+   -  RISCV support is now enabled in LLVM 17.
+
+   -  Loongarch support in the :ref:`ref-classes-linuxloader` class and
+      ``core-image-minimal-initramfs`` image.
+
 -  Kernel-related enhancements:
 
 -  New core recipes:
@@ -48,10 +57,17 @@ New Features / Enhancements in 4.3
 
 -  Rust improvements:
 
-   -  Rust has been upgraded to version 1.69
+   -  Rust has been upgraded to version 1.70
 
 -  Image-related enhancements:
 
+-  Distribution-related enhancements:
+
+   -  The ``poky-altcfg`` distribution enables the ``usrmerge``
+      :ref:`distro feature <ref-manual/features:Distro Features>`.
+
+
+
 -  wic Image Creator enhancements:
 
 -  FIT image related improvements:
@@ -72,8 +88,14 @@ New Features / Enhancements in 4.3
 
 -  Packaging changes:
 
+-  :term:`SPDX` improvements:
+
+   -  :term:`SPDX` manifests are now generated by default.
+
 -  Prominent documentation updates:
 
+   -  New :doc:`../contributor-guide/index` document.
+
    -  Long due documentation for the :ref:`ref-classes-devicetree` class.
 
    -  New :ref:`summary about available init systems
@@ -85,6 +107,7 @@ New Features / Enhancements in 4.3
 
 -  Miscellaneous changes:
 
+
    -  Git based recipes in OE-Core which used the git protocol have been
       changed to use https where possibile. https is now believed to be
       faster and more reliable.
@@ -92,6 +115,9 @@ New Features / Enhancements in 4.3
    -  The ``os-release`` recipe added a ``CPE_NAME`` to the fields provided, with the
       default being populated from :term:`DISTRO`.
 
+   -  The ``psplash`` recipe now accepts a PNG format image through :term:`SPLASH_IMAGES`,
+      instead of a harder to generate and modify ``.h`` file.
+
 Known Issues in 4.3
 ~~~~~~~~~~~~~~~~~~~
 
-- 
2.34.1


