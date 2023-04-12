Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E827C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 19:11:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.1210.1681326691864027635
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 12:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ac9mUGq7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 60C99C0002;
	Wed, 12 Apr 2023 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681326689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o9AcSXz3cMuH11Bhy2aW+PU7AWCXkQAxcNXTPaIU4Dw=;
	b=Ac9mUGq7TRoHDGzGcq0MqSBBupyHnzYEzJWrZliNoYsvIENVlzSd/Tz9aBQocDlETeaXJg
	dqWFpECU2e5F2fA7YGkivCSOC8NlCrca0fYOcLLRxLyuDdcaV7cr3yyopZ5n7/1uLjXAdG
	YTQ9paxRkKAWxTx2x2yy2pt0K1fpVumyZnjoVnkgsW/492GHVPiclLxcdoJA7rRSPlEkfC
	vuyF4TqPbcJDseIzVU4DhFnM1gl8whestOY4xfN1JNPaM3Fqsn4Bw+T7nC1suJemdxi027
	Qkz9aVKWM4sn5JHTMXNZYyOwDKs7/pjSZsIqGBYDDIZC8kgS2tNugtQYmsrldg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] ref-manual: classes.rst: document devicetree.bbclass
Date: Wed, 12 Apr 2023 21:11:22 +0200
Message-Id: <20230412191122.620584-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Apr 2023 19:11:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3836

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This addresses [YOCTO #15092]

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f8172e6b29..79a2bdb69b 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -580,6 +580,49 @@ add the task at the appropriate place, which is usually after
 :ref:`ref-tasks-install`. The class then takes care of
 staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
 
+.. _ref-classes-devicetree:
+
+``devicetree``
+==============
+
+The :ref:`ref-classes-devicetree` class allows to build a recipe that compiles
+device tree source files that are not in the kernel tree.
+
+The compilation of out-of-tree device tree sources is the same as the kernel
+in-tree device tree compilation process. This includes the ability to include
+sources from the kernel such as SoC ``dtsi`` files as well as C header files,
+such as ``gpio.h``.
+
+The :ref:`ref-tasks-compile` task will compile two kinds of files:
+
+- Regular device tree sources with a ``.dts`` extension.
+
+- Device tree overlays, detected from the presence of the ``/plugin/;``
+  string in the file contents.
+
+This class behaves in a similar way as the :ref:`ref-classes-kernel-devicetree`
+class, also deploying output files into ``/boot/devicetree``. However, this
+class stores the deployed device tree binaries into the ``devicetree``
+subdirectory. This avoids clashes with the :ref:`ref-classes-kernel-devicetree`
+output. Additionally, the device trees are populated into the sysroot for
+access via the sysroot from within other recipes.
+
+An extra padding is appended to non-overlay device trees binaries. This
+can typically be used as extra space for adding extra properties at boot time.
+The padding size can be modified by setting ``DT_PADDING_SIZE`` to the desired
+size, in bytes.
+
+See :oe_git:`devicetree.bbclass sources
+</openembedded-core/tree/meta/classes-recipe/devicetree.bbclass>` 
+for further variables controlling this class.
+
+Here is an excerpt of an example ``recipes-kernel/linux/devicetree-acme.bb``
+recipe inheriting this class::
+
+   inherit devicetree
+   COMPATIBLE_MACHINE = "^mymachine$"
+   SRC_URI:mymachine = "file://mymachine.dts"
+
 .. _ref-classes-devshell:
 
 ``devshell``
-- 
2.34.1


