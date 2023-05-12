Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA182C77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 09:45:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.20091.1683884694128752646
 for <docs@lists.yoctoproject.org>;
 Fri, 12 May 2023 02:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cNCAGnM6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8BA32FF807;
	Fri, 12 May 2023 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683884691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4bjQgVJE88dDlvtT1eSgx1r82z7jTN9hM3wmy/UVAKQ=;
	b=cNCAGnM6f3m/3BCgpDHkcOTBqMX1OS6HC2JKzYRgNDNNVxDA0MIlxiB5XUrNNSuXQW/yfF
	PqFoX6ogou8yCJInssIpa9vJgkuOn6Sopus6RGA1S4dNPfgrQSRYv0DoMYXOxNtZvaxuXf
	+OFmGv6x4xLoNiB9eTKVDCDwwsZzZztaefSI2KBdbRws5mi3z7PNGgeR1ePXLoH43GeYr5
	lsId0CLPdEecvwCjdkIc5aqRlgDvX5JXoJGMInuUlgAlC5xWFEo8f8Pf1GL2UdAwuzOp06
	9yN5iDd+kI9uyhCHwMZakHcX0UloemGt4VDPIFK2y4Yv/l1J64IweTFC72TuKg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: improve documentation for kernel-devicetree class
Date: Fri, 12 May 2023 11:44:49 +0200
Message-Id: <20230512094449.2424101-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 May 2023 09:45:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3940

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Document the new KERNEL_DTBDEST and KERNEL_DTBVENDORED variables
- Also document the related KERNEL_DEVICETREE_BUNDLE
  and KERNEL_PACKAGE_NAME variables

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst   |  8 +++++++
 documentation/ref-manual/variables.rst | 32 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 78174d51d1..e454a54537 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1576,6 +1576,14 @@ Linux kernel compilation (including modules).
 The :ref:`ref-classes-kernel-devicetree` class, which is inherited by the
 :ref:`ref-classes-kernel` class, supports device tree generation.
 
+Its behavior is mainly controlled by the following variables:
+
+-  :term:`KERNEL_DEVICETREE_BUNDLE`: whether to bundle the kernel and device tree
+-  :term:`KERNEL_DTBDEST`: directory where to install DTB files
+-  :term:`KERNEL_DTBVENDORED`: whether to keep vendor subdirectories
+-  :term:`KERNEL_DTC_FLAGS`: flags for ``dtc``, the Device Tree Compiler
+-  :term:`KERNEL_PACKAGE_NAME`: base name of the kernel packages
+
 .. _ref-classes-kernel-fitimage:
 
 ``kernel-fitimage``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b7829ae7af..50a8d69907 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4451,6 +4451,13 @@ system and gives an overview of their function and contents.
       In order to use this variable, the :ref:`ref-classes-kernel-devicetree`
       class must be inherited.
 
+   :term:`KERNEL_DEVICETREE_BUNDLE`
+      When set to "1", this variable allows to bundle the Linux kernel
+      and the Device Tree Binary together in a single file.
+
+      This variable is set to "0" by default by the
+      :ref:`ref-classes-kernel-devicetree` class.
+
    :term:`KERNEL_DTB_LINK_NAME`
       The link name of the kernel device tree binary (DTB). This variable
       is set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as
@@ -4476,6 +4483,23 @@ system and gives an overview of their function and contents.
 
       See :term:`KERNEL_ARTIFACT_NAME` for additional information.
 
+   :term:`KERNEL_DTBDEST`
+      This variable, used by the :ref:`ref-classes-kernel-devicetree`
+      class, allows to change the installation directory of the DTB
+      (Device Tree Binary) files.
+
+      It is set by default to "${KERNEL_IMAGEDEST}" by the
+      :ref:`ref-classes-kernel` class.
+
+   :term:`KERNEL_DTBVENDORED`
+      This variable, used by the :ref:`ref-classes-kernel-devicetree`,
+      allows to ignore vendor subdirectories when installing DTB
+      (Device Tree Binary) files, when it is set to "false".
+
+      To keep vendor subdirectories, set this variable to "true".
+
+      It is set by default to "false" by the :ref:`ref-classes-kernel` class.
+
    :term:`KERNEL_DTC_FLAGS`
       Specifies the ``dtc`` flags that are passed to the Linux kernel build
       system when generating the device trees (via ``DTC_FLAGS`` environment
@@ -4624,6 +4648,14 @@ system and gives an overview of their function and contents.
       provide those module configurations, see the
       :term:`module_conf_* <module_conf>` variable.
 
+   :term:`KERNEL_PACKAGE_NAME`
+      Specifies the base name of the kernel packages, such as "kernel"
+      in the kernel packages such as "kernel-modules", "kernel-image" and
+      "kernel-dbg".
+
+      The default value for this variable is set to "kernel" by the
+      :ref:`ref-classes-kernel` class.
+
    :term:`KERNEL_PATH`
       The location of the kernel sources. This variable is set to the value
       of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
-- 
2.34.1


