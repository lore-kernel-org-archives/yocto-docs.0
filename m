Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCD6D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18698.1764344121406799650
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SQgI1g4r;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E35DC1A1E0A
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8DC160706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0AE810B02063;
	Fri, 28 Nov 2025 16:35:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WAZ/4JnqiudUJBbfrkCoBcICvvo9JlKkMIGKdDDn8Bk=;
	b=SQgI1g4rttnYN+gvaptodhh5fM7NeoRu5npEonnLP8Xwl+WMhASnvC0UWFlR/GEZjauz/U
	BvIXRnxtamCQ3uTRJ90x6A9pWbje7mG/U8XSiyaPg3GXSpvhtt3wiTNEvBdrI/vMrXK1Xv
	5l4pkMSbGLNRNqvZClSLVUNHgcB7Q6x6PQvToPfAjd5iHmpnbfPuScXU5d5ZE1sgqMlTe1
	sedD/uqYP+ef5cTD7nPoIoSVNXpRRl630TyBV7YGAh+iZon1ZXMJhRIsL5omXO42QmDR6B
	TlpVTYfS547Rj8KZAQ9uC8rgeRHuHslYY5ih9ZE4oHQM+cDPVN3TSrPSFNiXKQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Nov 2025 16:35:06 +0100
Subject: [PATCH 9/9] migration-guides/release-notes-5.3.rst: latest changes
 from master
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-release-note-5-3-updates-v1-9-6ef679198e80@bootlin.com>
References: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
In-Reply-To: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5800;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uwwl6B2llheDHeKCkfBVzKQS3GA4bsAFMAwtc3Hetik=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEv8+i6ZnhHLM4MzOwVzWwMOcb9farnPy/wr
 tqJiPKsDfaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLwAKCRDRgEFAKaOo
 NocOEADK/aUheZ9dZJgx5/BGNEQ0j6jA9TI1Rvptyj4sa4UbgxBTfC/Zcahk56I2UmAJq7GLznT
 ClNstzOQNuMTcr2o6RB6r5G9s+7njnis2gPrWSQGTn6gPhFiULL2U+4oF+8ZSSe6sDz9yF7IhOP
 epqvdfoBX0ftE6Cva/ejKLCWuUuXPVXZamAS7Lfdc7gYryW5Myik6aaXGLH6SgBt17EH2bEZ05a
 pujHlFAG8QwLQ/vtfhD5X9Ouy+Svf+bArwinO2EE595jQ9bnJ2b6eE8b/SV3lDYU+UKyABhiELN
 /FrY+Yb88Fo38rmgEIL2MSa0hM+nFQytZxIft25vze5NkvotBgAaYLQLY2BnF4fd3dTSHHY0Pwz
 5T6Rqzs6irriScL6vN+6/KuIJoCY/j3BLKEIwz5CK85ptmW3SuLOXgAAOjtWJG2GZR+c3ceRsWY
 DcCyFoK07WPWrgT2JXkwHZuxXJS4VEKOHLLkRYDuAYpHHtXE6dRGReg57OPVVPACen/deYGV9aI
 e+2AhqsI7tH03ws49HZ3nE+H9/tmWLGJY2O4fRXwLgxn24P3LJGmvbXu0Y7/zKNkF8+xAzBAFne
 HFoZiJ5mQYw9+0FmIioxfXKnxDrES/3m12h/IzbCfMjNnz3uIcL9etWCN7xFOulwUX5RlT1dwmr
 Esf4F7ikEpU6Y1g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8172

Cover the changes from:

- openembedded-core:
  7d1d3b4958bc ("oeqa: runtime: logrotate: Fix typos and add comments")
  to
  ac7327583aef ("libdrm: upgrade 2.4.125 -> 2.4.128")

- meta-yocto:
  6257391c9594 ("yocto-bsp/6.16: specify genericarm64 SRCREV")
  to
  b3b659263566 ("local.conf.sample: comment out the root-with-empty-password setting")

- bitbake:
  b96154aeb1fc ("bitbake-setup: add the initial implementation")
  to
  720df1a53452 ("bitbake-setup: add whinlatter configs for poky and oe-nodistro")

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.3.rst   | 22 +++-----------
 .../migration-guides/release-notes-5.3.rst         | 35 +++++++++++++++++++++-
 2 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index b17cffe5a..a1586fba6 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -188,22 +188,10 @@ GNU/Linux distributions:
 -  Debian 13 (Trixie)
 -  Fedora 42
 -  Ubuntu 25.04
-
-On the other hand, some earlier distributions are no longer supported:
-
--  XXX
+-  Ubuntu 25.10
 
 See :ref:`all supported distributions <system-requirements-supported-distros>`.
 
-Rust language changes
-~~~~~~~~~~~~~~~~~~~~~
-
-systemd changes
-~~~~~~~~~~~~~~~
-
-Recipe changes
-~~~~~~~~~~~~~~
-
 Removed variables
 ~~~~~~~~~~~~~~~~~
 
@@ -244,6 +232,9 @@ The following recipes have been removed in this release:
 -  ``cwautomacros``: A long-obsolete set of custom :ref:`ref-classes-autotools`
    macros, not used by any other recipe.
 
+-  ``rust-llvm``: removed after the Rust and LLVM recipes were reworked to
+   depend on the ``llvm`` recipe instead.
+
 Removed :term:`PACKAGECONFIG` entries
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -309,11 +300,6 @@ The following classes have been removed in this release:
    any automated testing and it would be hard to setup and maintain a testing
    environment for it. The original users/maintainers aren't using it now.
 
-Removed features
-~~~~~~~~~~~~~~~~
-
-The following features have been removed in this release:
-
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index a7e989ced..536067d63 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -236,8 +236,19 @@ New Features / Enhancements in |yocto-ver|
       fourth argument of the :term:`UBOOT_CONFIG` variable. See the
       documentation of :ref:`ref-classes-uboot-config` class for more details.
 
+   -  The :term:`WESTON_USER` and :term:`WESTON_USER_HOME` variables can be
+      used to define the username and home directory for the `Weston` user.
+
+-  New core tasks:
+
+   -  The :ref:`ref-tasks-list_image_features` can be used to list the available
+      :term:`IMAGE_FEATURES` for an image recipe.
+
 -  Kernel-related changes:
 
+   -  Support for the 6.17 kernel exists but 6.16 is the default selected one in
+      the :term:`Poky` distro.
+
    -  ``linux/generate-cve-exclusions``: use data from CVEProject instead of
       the archived https://linuxkernelcves.com.
 
@@ -551,6 +562,10 @@ New Features / Enhancements in |yocto-ver|
       :term:`DEPLOY_DIR_IMAGE` directory into an extra non-rootfs partition. See the
       :term:`IMAGE_EXTRA_PARTITION_FILES` variable for more information.
 
+   -  The ``--diskid`` option was added to allow passing a :wikipedia:`MS-DOS
+      </MS-DOS>` or :wikipedia:`GPT <GUID_Partition_Table>`-formatted
+      disk IDs for a partition (for example: ``deadbeef-cafe-babe-f00d-cec2ea4eface``).
+
 -  SDK-related changes:
 
    -  Include additional information about Meson setting in the SDK environment
@@ -566,6 +581,9 @@ New Features / Enhancements in |yocto-ver|
       ``zsh-completion-pkgs`` feature to the :term:`IMAGE_FEATURES` variable in
       the image recipe.
 
+   -  The SDK build is now part of the :ref:`ref-classes-buildhistory`
+      difference analysis (``buildhistory-diff`` command).
+
 -  Testing-related changes:
 
    -  ``bitbake/tests/fetch``: Add tests for ``gitsm`` with git-lfs.
@@ -748,8 +766,21 @@ New Features / Enhancements in |yocto-ver|
    -  ``openssl``: add FIPS support. This can be enabled through the ``fips``
       :term:`PACKAGECONFIG`.
 
--  :ref:`ref-classes-cve-check` class changes:
+   -  The default :term:`Poky` template configuration
+      (:yocto_git:`local.conf.sample </meta-yocto/commit/meta-poky/conf/templates/default/local.conf.sample?id=b3b659263566c4d2f2813190e72d93f8598a4c47>`)
+      does not define the ``allow-empty-password``, ``empty-root-password``, and
+      ``allow-root-login`` in :term:`EXTRA_IMAGE_FEATURES` anymore.
+
+-  :term:`Toaster` changes:
+
+   -  Adapt it for :doc:`bitbake-setup
+      <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`.
 
+   -  Remove hard dependency on the :term:`Poky` repository, as its :ref:`master
+      branch is no longer updated <migration-guides/migration-5.3:The Poky
+      repository master branch is no longer updated>`.
+
+-  :ref:`ref-classes-cve-check` class changes:
 
    -  ``cve-update-db-native``: FKIE: use Secondary metric if there is no
       Primary metric.
@@ -962,6 +993,8 @@ New Features / Enhancements in |yocto-ver|
 Known Issues in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+N/A
+
 Recipe License changes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.51.0


