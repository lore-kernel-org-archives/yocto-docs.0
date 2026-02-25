Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C4DF4BB9F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 11:08:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43119.1772017691344740731
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 03:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=LNyC1ULG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 987BD1A12F6
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 11:08:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60FE55FDE5
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 11:08:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55D3210368F45;
	Wed, 25 Feb 2026 12:08:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772017688; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=l/H1pvW8CtEy6hg1rZ1CF/RLbA9xdgHR5DlRFoLeeNA=;
	b=LNyC1ULG+xtOyEu4oq1g/x9D9FMwRe/qEq/962GrDEWq32k+/KJ7k5T1KXsV1iO9WpGHpv
	6XhmJYShWLoz4FOyIbzCwwRNdNO8WNbqXwxXceCYWrVNltbnXmfKHN3boJw7WT5LQ7ft/0
	0AchbMQRQfQXDW97yH2g5u+YCEip83393xlSJxJImVxtZoPQ7Iw+bz0MDdZGYjz61pVNEo
	3gIlwOBbxK6lBSfAybfC2j2yuu2F5Z5Q28xLu7REhyBJRQSnoe+HblWJdghvaScUivdWpL
	fHP3JHboTrc5Ch76Ey/y/WLMXtp84fehniMAWYX22zC+wiVqvH41PGxiwHAvBw==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH] ref-manual: add SPDX_INCLUDE_KERNEL_CONFIG and SPDX_INCLUDE_PACKAGECONFIG
Date: Wed, 25 Feb 2026 12:08:00 +0100
Message-ID: <20260225110800.126491-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 11:08:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8984

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Adding documentation for the new variables to export the Linux kernel
configuration and recipe PACKAGECONFIG features into the SPDX document.

Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
---
 documentation/dev-manual/sbom.rst             |  6 +++
 .../migration-guides/release-notes-6.0.rst    |  6 +++
 documentation/ref-manual/variables.rst        | 43 +++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual=
/sbom.rst
index 8452fb12b..95303ed70 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -56,6 +56,12 @@ more information in the output :term:`SPDX` data:
 -  Add a description of the **compiled** source files used to generate h=
ost tools
    and target packages (:term:`SPDX_INCLUDE_COMPILED_SOURCES`)
=20
+-  Export the Linux kernel configuration (``CONFIG_*`` parameters) into =
the
+   SPDX document (:term:`SPDX_INCLUDE_KERNEL_CONFIG`).
+
+-  Export the recipe's ``PACKAGECONFIG`` features (enabled/disabled) int=
o the
+   SPDX document (:term:`SPDX_INCLUDE_PACKAGECONFIG`).
+
 -  Add archives of these source files themselves (:term:`SPDX_ARCHIVE_SO=
URCES`).
=20
 Though the toplevel :term:`SPDX` output is available in
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/docum=
entation/migration-guides/release-notes-6.0.rst
index c6e5b5a1f..af72d1e93 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -31,6 +31,12 @@ New Features / Enhancements in |yocto-ver|
      directory where OpenSSH host keys are stored. The default value is
      ``/etc/ssh``.
=20
+   - :term:`SPDX_INCLUDE_KERNEL_CONFIG`: export the Linux kernel
+     configuration (``CONFIG_*`` parameters) into the SPDX document.
+
+   - :term:`SPDX_INCLUDE_PACKAGECONFIG`: export a recipe's
+     :term:`PACKAGECONFIG` features (enabled/disabled) into the SPDX doc=
ument.
+
 -  Kernel-related changes:
=20
 -  New core recipes:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index fb4581bae..2e812d02d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9121,6 +9121,49 @@ system and gives an overview of their function and=
 contents.
       increases the SBOM size (potentially by several gigabytes for typi=
cal
       images).
=20
+   :term:`SPDX_INCLUDE_KERNEL_CONFIG`
+      This option allows exporting the Linux kernel configuration
+      (the contents of the ``.config`` file) into the recipe's SPDX
+      document as a separate ``build_Build`` object. Each kernel
+      configuration parameter (``CONFIG_*``) is recorded and linked to
+      the main kernel object using an ``ancestorOf`` relationship.
+
+      .. note::
+
+         This variable only has effect when using the SPDX 3.0 output
+         format (see :ref:`ref-classes-create-spdx`).
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_KERNEL_CONFIG =3D "1"
+
+      When enabled, a separate SPDX object is created for the kernel
+      configuration, improving reproducibility, compliance tracking,
+      and auditing of build-time kernel features.
+
+   :term:`SPDX_INCLUDE_PACKAGECONFIG`
+      This option allows exporting a recipe's :term:`PACKAGECONFIG`
+      features into the recipe's SPDX document. Each feature is
+      recorded as a ``DictionaryEntry`` with key
+      ``PACKAGECONFIG:<feature>`` and value ``enabled`` or
+      ``disabled``, depending on whether the feature is active in
+      the current build.
+
+      .. note::
+
+         This variable only has effect when using the SPDX 3.0 output
+         format (see :ref:`ref-classes-create-spdx`).
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_PACKAGECONFIG =3D "1"
+
+      When enabled, the build-time configuration of each recipe is
+      captured in the SPDX document, improving transparency,
+      reproducibility, and security auditing. It allows consumers of
+      the SPDX SBOM to determine which optional features were
+      enabled or disabled in a given build.
+
    :term:`SPDX_LICENSES`
       Path to the JSON file containing SPDX license identifier mappings.
       This file maps common license names to official SPDX license
--=20
2.51.0


