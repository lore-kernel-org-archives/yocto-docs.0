Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656A3C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 13:54:18 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.9651.1651845257096612080
 for <docs@lists.yoctoproject.org>;
 Fri, 06 May 2022 06:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HA0ek7HL;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E71CE20000C;
	Fri,  6 May 2022 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651845255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s6NJfm6oHgNXYzBn0NyKBtDAPn6JMn9QW9XItZ3YBrc=;
	b=HA0ek7HLuoDpZ4vtLW00s91AsQp4c0c5W1p0mWjxdkCjLROm8cdovYd1zQ28XFcDIQK1Jn
	0sJVQ3VoMRvR5/qSILTi9gldTx2v3GgUyToacen9TIJ1QmTCiXlL5uO/W7GS6l8ECGCzHq
	TlZwxHT79v15Xoq2Kw5D3gFT97IYcPbB90EqPR9xcDsxSzBJUeVTpRZqriY00SCX6sQM0p
	3D+qeziZl9E+TBaaWJUUhkK9BkcLpaNvJexz6uf3AYNM2n4E/5lItnhkBRVjarrTmu0ulj
	bMCYBfL8q9IjtCECgF43BPwek5E2QVt5Ta43dRXLFG1J9cRJhqS2E23oNmHx7w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] manuals: add missing space in appends
Date: Fri,  6 May 2022 15:53:54 +0200
Message-Id: <20220506135354.816882-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 May 2022 13:54:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2926

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/dev-manual/common-tasks.rst |  2 +-
 documentation/kernel-dev/common.rst       |  2 +-
 documentation/ref-manual/variables.rst    | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index f7632a5735..0528d482e5 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -4828,7 +4828,7 @@ configuration would be as follows::
    require conf/multilib.conf
    MULTILIBS = "multilib:lib32"
    DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
-   IMAGE_INSTALL:append = "lib32-glib-2.0"
+   IMAGE_INSTALL:append = " lib32-glib-2.0"
 
 This example enables an additional library named
 ``lib32`` alongside the normal target packages. When combining these
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 547da8a178..dc3345a520 100644
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
index f164b7317a..0d01317405 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4064,10 +4064,10 @@ system and gives an overview of their function and contents.
       statements add specific configurations to targeted machine types::
 
          KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-         KERNEL_FEATURES:append = "${KERNEL_EXTRA_FEATURES}"
-         KERNEL_FEATURES:append:qemuall = "cfg/virtio.scc"
-         KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
-         KERNEL_FEATURES:append:qemux86-64 = "cfg/sound.scc"
+         KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
+         KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc"
+         KERNEL_FEATURES:append:qemux86 = "  cfg/sound.scc cfg/paravirt_kvm.scc"
+         KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc"
 
    :term:`KERNEL_FIT_LINK_NAME`
       The link name of the kernel flattened image tree (FIT) image. This
@@ -4255,7 +4255,7 @@ system and gives an overview of their function and contents.
          SRCREV_machine:core2-32-intel-common = "43b9eced9ba8a57add36af07736344dcc383f711"
          KMACHINE:core2-32-intel-common = "intel-core2-32"
          KBRANCH:core2-32-intel-common = "standard/base"
-         KERNEL_FEATURES:append:core2-32-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
+         KERNEL_FEATURES:append:core2-32-intel-common = " ${KERNEL_FEATURES_INTEL_COMMON}"
 
       The :term:`KMACHINE` statement says
       that the kernel understands the machine name as "intel-core2-32".
-- 
2.25.1


