Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63514C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 14:41:29 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.12144.1737124886094453929
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 06:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tYnXI-0004ft-3u; Fri, 17 Jan 2025 15:41:24 +0100
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tYnXH-000RVN-0i;
	Fri, 17 Jan 2025 15:41:23 +0100
Received: from ejo by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tYnXH-005sUR-0R;
	Fri, 17 Jan 2025 15:41:23 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de
Subject: [PATCH v2] ref-manual: add documentation for the barebox class
Date: Fri, 17 Jan 2025 15:41:11 +0100
Message-Id: <20250117144111.1400592-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 14:41:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6140

From: Enrico Joerns <ejo@pengutronix.de>

This adds the initial documentation for the newly added barebox.bbclass
to the Reference Manual's class list.
It also adds the two most notable variables to the variable list.

Signed-off-by: Enrico Joerns <ejo@pengutronix.de>
---
v1 -> v2:
  - add link to Kconfig documentation
  - add link to conf/image-uefi.conf in git
  - add example for BAREBOX_BINARY
  - be more specific about BAREBOX_CONFIG usage, its defaults, and
    example values

 documentation/ref-manual/classes.rst   | 37 ++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst | 25 +++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 22c4301a4..8ad77319e 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -128,6 +128,43 @@ It's useful to have some idea of how the tasks defined by the
 -  :ref:`ref-tasks-install` --- runs ``make install`` and
    passes in ``${``\ :term:`D`\ ``}`` as ``DESTDIR``.
 
+.. _ref-classes-barebox:
+
+``barebox``
+===========
+
+The :ref:`ref-classes-barebox` class manages building the barebox bootloader.
+
+If a file named ``defconfig`` is included in the :term:`SRC_URI`, it will be
+copied to ``.config`` in the build directory and used as the barebox
+configuration.
+Instead of providing a ``defconfig`` file, you can set :term:`BAREBOX_CONFIG`
+to a defconfig provided by the barebox source tree.
+If neither ``defconfig`` nor :term:`BAREBOX_CONFIG` is specified, the class
+will raise an error.
+
+The :ref:`ref-classes-barebox` class supports config fragments and internally
+includes the :ref:`ref-classes-cml1` class to provide `Kconfig
+<https://docs.kernel.org/kbuild/kconfig-language.html>`__ support for
+barebox, enabling tasks such as :ref:`ref-tasks-menuconfig` and
+:ref:`ref-tasks-diffconfig`.
+
+The generated barebox binaries are deployed to
+:term:`DEPLOY_DIR_IMAGE` as well as installed to ``BAREBOX_INSTALL_PATH``
+(``/boot`` by default) making them part of the recipe’s base package.
+This setup supports both using the barebox binaries as independent artifacts
+and installing them into a rootfs.
+:term:`BAREBOX_BINARY` can be used to select a distinct binary to deploy and
+install.
+If ``barebox`` is set as the :term:`EFI_PROVIDER`, the class will leverage
+:oe_git:`conf/image-uefi.conf </openembedded-core/tree/meta/conf/image-uefi.conf>`
+to define the default installation paths and naming conventions.
+
+The compiled-in barebox environment can be extended by adding environment files
+to the ``BAREBOX_ENV_DIR``.
+The ``BAREBOX_FIRMWARE_DIR`` variable allows you to specify the firmware blob
+search directory, enabling loading of additional firmware like TF-A or OP-TEE.
+
 .. _ref-classes-base:
 
 ``base``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 702a6caf8..e9bffd811 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -293,6 +293,31 @@ system and gives an overview of their function and contents.
       :term:`PACKAGE_EXCLUDE` variables for related
       information.
 
+   :term:`BAREBOX_BINARY`
+      The barebox build system can build multiple barebox binaries at once.
+      By default, all built binaries will be deployed and installed under their
+      original name.
+      If only a specific binary should be deployed/installed, its name can
+      be specified in :term:`BAREBOX_BINARY`::
+
+        BAREBOX_BINARY = "barebox-boundarydevices-imx6dl-nitrogen6x-1g.img"
+
+   :term:`BAREBOX_CONFIG`
+      If set, it specifies the name of the barebox defconfig to build.
+      The name must be a defconfig file known to the barebox build environment.
+      This variable is mainly useful for generic use cases where a dedicated
+      configuration is not required.
+      The :ref:`ref-classes-barebox` class itself already sets it for some QEMU
+      machines::
+
+        BAREBOX_CONFIG:qemuarm = "multi_v7_defconfig"
+        BAREBOX_CONFIG:qemuarm64 = "multi_v8_defconfig"
+        BAREBOX_CONFIG:qemux86-64 = "efi_defconfig"
+
+      Except for these, the default value of :term:`BAREBOX_CONFIG` is empty.
+      For more information on how to provide a barebox configuration, see the
+      :ref:`ref-classes-barebox` class.
+
    :term:`BASE_LIB`
       The library directory name for the CPU or Application Binary
       Interface (ABI) tune. The :term:`BASE_LIB` applies only in the Multilib
-- 
2.39.5


