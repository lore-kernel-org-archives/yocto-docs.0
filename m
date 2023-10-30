Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAD1C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 18:20:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.156953.1698690024386827025
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Oct 2023 11:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YJ9rpQlL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F7BE40007;
	Mon, 30 Oct 2023 18:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698690022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pD0Bb5F2kXBJrsqWoOkTVJzjXQKhZ1TU0cLwumCnKmE=;
	b=YJ9rpQlLanQbynYcsmN3zspVxi3MFCOh699CkPGcpQRXS2iJ/ahO9qgQQQ+w71JRThLOdh
	LwS/AsVWK7V+xjoFfrOnNDuEUktfxUKDZu06CzHWGnkrWLEeYq2lw7itey0QLdiFqw4m5G
	jLI22MiOYRn7BckoG8vMsMbuUzb7lCgVDNP33Zf4hIAuIRRAZ17yyJKjarDNSkcn58GQFN
	vUdy8bTbVZf05IRQfx9ouXHndkabT7V+DcgC2QcStLBqPjy+njQTozKQwG7ZTeMZCtJGEC
	0Vg43o6T+zmT+8+oK3p2hd3aSTi+7ZKVOMpWRfvEmpf5qz1rNVBTEF0hjZK1tA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: further updates for release 4.3
Date: Mon, 30 Oct 2023 19:20:14 +0100
Message-Id: <20231030182014.1778138-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 30 Oct 2023 18:20:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4527

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-4.3.rst        | 12 ++-
 .../migration-guides/release-notes-4.3.rst    | 89 +++++++++++++++----
 2 files changed, 82 insertions(+), 19 deletions(-)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documentation/migration-guides/migration-4.3.rst
index 891f2d08ce..7647246a0d 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -44,8 +44,8 @@ Compiling changes
 ~~~~~~~~~~~~~~~~~
 
 -  Code on 32 bit platforms is now compiled with largefile support and 64
-   bit ``time_t``, to avoid the Y2038 time overflow issue. This could break
-   existing programs in untested layers.
+   bit ``time_t``, to avoid the Y2038 time overflow issue. This breaks the ABI
+   and could break existing programs in untested layers.
 
 .. _migration-4.3-supported-distributions:
 
@@ -118,6 +118,7 @@ Removed variables
 
 The following variables have been removed:
 
+-  ``AUTHOR``
 -  ``PERLARCH``
 -  ``PERLVERSION``
 
@@ -168,6 +169,13 @@ QA check changes
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
+-  `jsDelivr <https://www.jsdelivr.com/`>__ now offers a new Content Delivery
+   Network (CDN) to Yocto Project users, which is completely free of charge
+   for Open Source projects. In particular, it can be used to efficiently
+   access prebuilt binary artifacts (see :term:`SSTATE_MIRRORS`) from many
+   different locations in the world. This is available to all supported Poky
+   releases.
+
 -  The ``-crosssdk`` suffix and any :term:`MLPREFIX` were removed from
    ``virtual/XXX`` provider/dependencies where a ``PREFIX`` was used as well,
    as we don't need both and it made automated dependency rewriting
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 424e75541d..35d9981e0f 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -10,7 +10,11 @@ New Features / Enhancements in 4.3
 
 -  New variables:
 
-   -  :term:`FILE_LAYERNAME`: bitbake now sets this to the name of the layer containing the recipe
+   -  :term:`CVE_CHECK_STATUSMAP`, :term:`CVE_STATUS`, :term:`CVE_STATUS_GROUPS`,
+      replaceing the deprecated :term:`CVE_CHECK_IGNORE`.
+
+   -  :term:`FILE_LAYERNAME`: bitbake now sets this to the name of the layer
+      containing the recipe
 
    -  :term:`FIT_ADDRESS_CELLS` and :term:`UBOOT_FIT_ADDRESS_CELLS`.
       See details below.
@@ -19,26 +23,29 @@ New Features / Enhancements in 4.3
 
    -  :term:`KERNEL_DTBVENDORED`: whether to keep vendor subdirectories.
 
+   -  :term:`KERNEL_LOCALVERSION`: to add a string to the kernel version
+      information.
+
+   -  :term:`KERNEL_STRIP`: to specify the command to strip the kernel binary.
+
    -  :term:`LICENSE_FLAGS_DETAILS`: add extra details about a recipe license
       in case it is not allowed by :term:`LICENSE_FLAGS_ACCEPTED`.
 
-   -  :term:`FILE_LAYERNAME`: bitbake now sets this to the name of the layer containing the recipe.
-
-   -  :term:`KERNEL_LOCALVERSION`: to add a string to the kernel version information.
+   -  :term:`MESON_TARGET`: to compile a specific Meson target instead of the
+      default ones.
 
-   -  :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`: to restrict package managers used in reproducibility testing.
+   -  :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`: to restrict package managers used
+      in reproducibility testing.
 
-   -  :term:`KERNEL_STRIP`: to specify the command to strip the kernel binary.
+-  Layername functionality available through overrides
 
-- Layername functionality available through overrides
+   Code can now know which layer a recipe is coming from through the newly added :term:`FILE_LAYERNAME`
+   variable. This has been added as an override of the form ``layer-<layername>``. In particular,
+   this means QA checks can now be layer specific, for example::
 
-  Code can now know which layer a recipe is coming from through the newly added :term:`FILE_LAYERNAME`
-  variable. This has been added as an override of the form ``layer-<layername>``. In particular,
-  this means QA checks can now be layer specific, for example::
+      ERROR_QA:layer-core:append = " patch-status"
 
-    ERROR_QA:layer-core:append = " patch-status"
-
-  which will enable the ``patch-status`` QA check for the core layer.
+   This will enable the ``patch-status`` QA check for the core layer.
 
 -  Architecture-specific enhancements:
 
@@ -47,17 +54,48 @@ New Features / Enhancements in 4.3
    -  Loongarch support in the :ref:`ref-classes-linuxloader` class and
       ``core-image-minimal-initramfs`` image.
 
+   -  The ``arch-armv8`` and ``arch-armv9`` architectures are now given
+      `Scalable Vector Extension (SVE)
+      <https://developer.arm.com/documentation/100891/0612/sve-overview/introducing-sve>`__
+      based tune options. Commits:
+      :yocto_git:`1 </poky/commit/?id=e4be03be5be62e367a40437a389121ef97d6cff3>`,
+      :yocto_git:`2 </poky/commit/?id=8cd5d264af4c346730531cb98ae945ab862dbd69>`.
+
 -  Kernel-related enhancements:
 
 -  New core recipes:
 
+   -  ``musl-legacy-error``: glibc ``error()`` API implementation still needed
+      by a few packages.
+
+   -  `python3-beartype <https://beartype.readthedocs.io>`, unbearably fast
+      runtime type checking in pure Python.
+
+   -  `python3-spdx-tools <https://github.com/spdx/tools-python>`__,
+      tools for SPDX validation and conversion.
+
+   -  `python3-uritools <https://github.com/tkem/uritools/>`__, replacement for
+      the ``urllib.parse`` module.
+
+   -  `ttyrun <https://github.com/ibm-s390-linux/s390-tools>`__, starts
+      ``getty`` programs only when a terminal exists, preventing respawns
+      through the ``init`` program.
+
 -  New classes:
 
-   - A ``ptest-cargo`` class was added to allow Cargo based recipes to easily add ptests
+   -  A ``ptest-cargo`` class was added to allow Cargo based recipes to easily add ptests
+
+   -  A :ref:`ref-classes-cargo_c` class was added to allow recipes to make Rust code
+      available to C and C++ programs.
 
--  QEMU/runqemu enhancements:
+-  QEMU / ``runqemu`` enhancements:
 
-   -  QEMU has been upgraded to version 8.0
+   -  QEMU has been upgraded to version 8.1
+
+   -  Many updates to the ``runqemu`` command.
+
+   -  The ``qemu-system-native`` recipe is now built with PNG support, which could be
+      useful to grab screeshots for error reporting purposes.
 
 -  Rust improvements:
 
@@ -81,8 +119,17 @@ New Features / Enhancements in 4.3
 
 -  Testing:
 
+   -  The :ref:`ref-classes-insane` class now adds an :ref:`unimplemented-ptest
+      <qa-check-unimplemented-ptest>` infrastructure to detect package sources
+      with unit tests but no implemented ptests in the recipe.
+
 -  Utility script changes:
 
+   -  New ``scripts/patchtest`` utility to check patches to the
+      OpenEmbedded-Core project. See
+      :ref:`contributor-guide/submit-changes:validating patches with patchtest`
+      for details.
+
 -  BitBake improvements:
 
    -  The BitBake Cooker log now contains notes when the caches are
@@ -94,10 +141,19 @@ New Features / Enhancements in 4.3
 
    -  :term:`SPDX` manifests are now generated by default.
 
+-  Security improvements:
+
+   -  Most repositories now include a :yocto_git:`SECURITY.md
+      </poky/tree/SECURITY.md>` file with hints for security researchers
+      and other parties who might report potential security vulnerabilities.
+
 -  Prominent documentation updates:
 
    -  New :doc:`../contributor-guide/index` document.
 
+   -  New :doc:`../dev-manual/security-subjects` chapter in the Development
+      Tasks Manual.
+
    -  Long due documentation for the :ref:`ref-classes-devicetree` class.
 
    -  New :ref:`summary about available init systems
@@ -109,7 +165,6 @@ New Features / Enhancements in 4.3
 
 -  Miscellaneous changes:
 
-
    -  Git based recipes in OE-Core which used the git protocol have been
       changed to use https where possibile. https is now believed to be
       faster and more reliable.
-- 
2.34.1


