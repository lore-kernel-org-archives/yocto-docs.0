Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2B4C001B3
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 09:18:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.6748.1687339090013599357
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 02:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JzLEjo6a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687339087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CigPaAPIjpKiHWJUL4/+0bYbaaK/VNemUc5p7HoTqnQ=;
	b=JzLEjo6aFsD3F1sXxbIxqCtcZQknWAk7CS9V/NQzghjMUNlUfow6Rz4WtHnnFzWg7A9lHL
	gq2mBmJzctbQw5N9mImx5auVX9JMrfQFadrlWPo50NO4Ia42ncHA4cXC7imLlhXl+3Phbw
	9kwOLtMAVn+hAdcVdnVdyPjWzydn07RIlgekj0LA7qtyOt/zLolNE+pupOvngbDc457XoE
	Ulxu9EGZJIqPKvjIPiML6LwZbsdW5BuNnEoxLGsMj5+3S0MpIF6BeXSVyhWjpTOyoUjs1r
	YasQ15JHBWvcDpyhKZpD37xOOeXmgupD6vgaCY82wNMx/RputBuVV/HsaklHGg==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29B32FF81A;
	Wed, 21 Jun 2023 09:18:06 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] ref-manual: variables.rst: explicit variables accepting colon separated lists
Date: Wed, 21 Jun 2023 11:17:58 +0200
Message-Id: <20230621091758.1164139-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jun 2023 09:18:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4018

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO 15128]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

---

Changes in V2:
- Include SOC_FAMILY (review from Alexandre Belloni)
---
 documentation/ref-manual/variables.rst | 39 +++++++++++++++-----------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cba3cf5d07..2c2ac9fedd 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2200,6 +2200,11 @@ system and gives an overview of their function and contents.
       is included in the default value of
       :term:`OVERRIDES`.
 
+      Here is an example from :yocto_git:`meta-poky/conf/distro/poky-tiny.conf
+      </poky/tree/meta-poky/conf/distro/poky-tiny.conf>`::
+
+         DISTROOVERRIDES = "poky:poky-tiny"
+
    :term:`DL_DIR`
       The central download directory used by the build process to store
       downloads. By default, :term:`DL_DIR` gets files suitable for mirroring
@@ -2756,12 +2761,11 @@ system and gives an overview of their function and contents.
          FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
 
    :term:`FILESEXTRAPATHS`
-      Extends the search path the OpenEmbedded build system uses when
-      looking for files and patches as it processes recipes and append
-      files. The default directories BitBake uses when it processes recipes
-      are initially defined by the :term:`FILESPATH`
-      variable. You can extend :term:`FILESPATH` variable by using
-      :term:`FILESEXTRAPATHS`.
+      A colon-separated list to extend the search path the OpenEmbedded build
+      system uses when looking for files and patches as it processes recipes
+      and append files. The default directories BitBake uses when it processes
+      recipes are initially defined by the :term:`FILESPATH` variable. You can
+      extend :term:`FILESPATH` variable by using :term:`FILESEXTRAPATHS`.
 
       Best practices dictate that you accomplish this by using
       :term:`FILESEXTRAPATHS` from within a ``.bbappend`` file and that you
@@ -2822,12 +2826,12 @@ system and gives an overview of their function and contents.
       recipe to correctly extend the path.
 
    :term:`FILESOVERRIDES`
-      A subset of :term:`OVERRIDES` used by the OpenEmbedded build system for
-      creating :term:`FILESPATH`. The :term:`FILESOVERRIDES` variable uses
-      overrides to automatically extend the :term:`FILESPATH` variable. For an
-      example of how that works, see the :term:`FILESPATH` variable
-      description. Additionally, you find more information on how overrides
-      are handled in the
+      A colon-separated list to specify a subset of :term:`OVERRIDES` used by
+      the OpenEmbedded build system for creating :term:`FILESPATH`. The
+      :term:`FILESOVERRIDES` variable uses overrides to automatically extend
+      the :term:`FILESPATH` variable. For an example of how that works, see the
+      :term:`FILESPATH` variable description. Additionally, you find more
+      information on how overrides are handled in the
       ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
       section of the BitBake User Manual.
 
@@ -2842,8 +2846,8 @@ system and gives an overview of their function and contents.
          build system.
 
    :term:`FILESPATH`
-      The default set of directories the OpenEmbedded build system uses
-      when searching for patches and files.
+      A colon-separated list specifying the default set of directories the
+      OpenEmbedded build system uses when searching for patches and files.
 
       During the build process, BitBake searches each directory in
       :term:`FILESPATH` in the specified order when looking for files and
@@ -7577,9 +7581,10 @@ system and gives an overview of their function and contents.
          SKIP_RECIPE[myrecipe] = "Not supported by our organization."
 
    :term:`SOC_FAMILY`
-      Groups together machines based upon the same family of SOC (System On
-      Chip). You typically set this variable in a common ``.inc`` file that
-      you include in the configuration files of all the machines.
+      A colon-separated list grouping together machines based upon the same
+      family of SOC (System On Chip). You typically set this variable in a
+      common ``.inc`` file that you include in the configuration files of all
+	  the machines.
 
       .. note::
 
-- 
2.34.1


