Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C52C433FE
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:55:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.8321.1653051311695953400
 for <docs@lists.yoctoproject.org>;
 Fri, 20 May 2022 05:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MQGOIWhj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CA3481BF209;
	Fri, 20 May 2022 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653051310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+1fuvH7iVJExQBfyy/z+/OWLJAPlg8igoIl3PdTImuU=;
	b=MQGOIWhjtOX7YRjQQvSnG+3qlJ9O+uEyZJGbqCEv4OyVe8oq7vYfBcocTkp51q80m+LqnQ
	3EGfGVfH+Pjc2Bz817rBE/ZjMoqkT0ozbztfOHQCbxzQrBPPdnnmCnrVu7qojWP8eVFWlU
	z8Rf66DR9aSGtQSA1c8lWf1/b316AkFtV9jA8JyUme1L6RzYG5O6e1zdRJY0rMoIufVY67
	SOAqe9gg6QIhDvAFbWEx4zOdqKNQH2OeVh0t1Zof/yBh4ah2aurXSKgjy/pHWIfxoVr4hD
	bt4D7VqwSQ89aWVZ32E6vWEFGggZsgWQhPc+aSQo0vaoTAcXPutdCc94y2xT9w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] [dunfell] manuals: add missing space in appends
Date: Fri, 20 May 2022 14:55:07 +0200
Message-Id: <20220520125507.105418-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 May 2022 12:55:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2936

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 2 +-
 documentation/kernel-dev/kernel-dev-common.rst       | 2 +-
 documentation/ref-manual/ref-variables.rst           | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 159da6a019..7c0fc662bd 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -4967,7 +4967,7 @@ configuration would be as follows:
    require conf/multilib.conf
    MULTILIBS = "multilib:lib32"
    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
-   IMAGE_INSTALL_append = "lib32-glib-2.0"
+   IMAGE_INSTALL_append = " lib32-glib-2.0"
 
 This example enables an additional library named
 ``lib32`` alongside the normal target packages. When combining these
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index 830b3e88ca..6b5e9484d0 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -1100,7 +1100,7 @@ Section.
    ::
 
       FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-      SRC_URI_append = "file://0001-calibrate.c-Added-some-printk-statements.patch"
+      SRC_URI_append = " file://0001-calibrate.c-Added-some-printk-statements.patch"
 
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find the patch file.
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index db0cc2d66e..49e756cfba 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -3846,10 +3846,10 @@ system and gives an overview of their function and contents.
       ::
 
          KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-         KERNEL_FEATURES_append = "${KERNEL_EXTRA_FEATURES}"
-         KERNEL_FEATURES_append_qemuall = "cfg/virtio.scc"
+         KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+         KERNEL_FEATURES_append_qemuall = " cfg/virtio.scc"
          KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
-         KERNEL_FEATURES_append_qemux86-64 = "cfg/sound.scc"
+         KERNEL_FEATURES_append_qemux86-64 = " cfg/sound.scc"
 
    :term:`KERNEL_FIT_LINK_NAME`
       The link name of the kernel flattened image tree (FIT) image. This
@@ -4048,7 +4048,7 @@ system and gives an overview of their function and contents.
          SRCREV_machine_core2-32-intel-common = "43b9eced9ba8a57add36af07736344dcc383f711"
          KMACHINE_core2-32-intel-common = "intel-core2-32"
          KBRANCH_core2-32-intel-common = "standard/base"
-         KERNEL_FEATURES_append_core2-32-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
+         KERNEL_FEATURES_append_core2-32-intel-common = " ${KERNEL_FEATURES_INTEL_COMMON}"
 
       The ``KMACHINE`` statement says
       that the kernel understands the machine name as "intel-core2-32".
-- 
2.25.1


