Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8417FC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:45:32 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.8159.1653050722617377514
 for <docs@lists.yoctoproject.org>;
 Fri, 20 May 2022 05:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=W7DK8BNF;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 373AA100008;
	Fri, 20 May 2022 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653050720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vtjp9zFmNzEXfCXb7fZ7QwotWFANC9XUPHpjpyOSE+0=;
	b=W7DK8BNFAqiLvmSCZDQG8SwjkCXgZSON3zcuxuKfZFxPqNz3FVSi2zAzepwRnq6cuiqU5+
	8FYkOmm+hFTA9kbp/TvPfb7OzuuEhI4CiTzDE2p5EBJ8JXz50G/A31yfVcwDjnZ4lh/3kk
	X53cWkHgScrE3QEHymFEgIcgvOHsiwbo7+ihQrdOHlMga6TJBsyQubLZv1KbbQNjdIJ+OA
	HvkMnmToD3UvUSLt+nkdzddZ51FX5EsFSy3eQgpoZTXQ6QFxTnKpYXriMgXBxfcPGDWlJe
	gg8A7f/qNFCscnFdUClKmWl8qzra8LffGtfHi7faOKmp3+xCt3dwdgq6NRZAHA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] [honister] adding missing space in appends
Date: Fri, 20 May 2022 14:44:51 +0200
Message-Id: <20220520124451.103030-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 May 2022 12:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2935

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 documentation/kernel-dev/common.rst       | 2 +-
 documentation/ref-manual/variables.rst    | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4683b1c045..fa9cd58b37 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -4781,7 +4781,7 @@ configuration would be as follows::
    require conf/multilib.conf
    MULTILIBS = "multilib:lib32"
    DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
-   IMAGE_INSTALL:append = "lib32-glib-2.0"
+   IMAGE_INSTALL:append = " lib32-glib-2.0"
 
 This example enables an additional library named
 ``lib32`` alongside the normal target packages. When combining these
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index d42ca5f99a..631c46631e 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1062,7 +1062,7 @@ Section.
    contents::
 
       FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-      SRC_URI:append = "file://0001-calibrate.c-Added-some-printk-statements.patch"
+      SRC_URI:append = " file://0001-calibrate.c-Added-some-printk-statements.patch"
 
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find the patch file.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fd796fddf7..7aef27337e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3979,10 +3979,10 @@ system and gives an overview of their function and contents.
       statements add specific configurations to targeted machine types::
 
          KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-         KERNEL_FEATURES:append = "${KERNEL_EXTRA_FEATURES}"
-         KERNEL_FEATURES:append:qemuall = "cfg/virtio.scc"
+         KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
+         KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc"
          KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
-         KERNEL_FEATURES:append:qemux86-64 = "cfg/sound.scc"
+         KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc"
 
    :term:`KERNEL_FIT_LINK_NAME`
       The link name of the kernel flattened image tree (FIT) image. This
@@ -4170,7 +4170,7 @@ system and gives an overview of their function and contents.
          SRCREV_machine:core2-32-intel-common = "43b9eced9ba8a57add36af07736344dcc383f711"
          KMACHINE:core2-32-intel-common = "intel-core2-32"
          KBRANCH:core2-32-intel-common = "standard/base"
-         KERNEL_FEATURES:append:core2-32-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
+         KERNEL_FEATURES:append:core2-32-intel-common = " ${KERNEL_FEATURES_INTEL_COMMON}"
 
       The :term:`KMACHINE` statement says
       that the kernel understands the machine name as "intel-core2-32".
-- 
2.25.1


