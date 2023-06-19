Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9361EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 16:17:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.11694.1687191444678203722
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 09:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FXXES9Ft;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687191442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bzlMwVZEmG9OowDHFPrz+mfS7ozllR/ZOPgBkC1LhP8=;
	b=FXXES9FtvNIuUScjV2uwGcOqhq/PqpG49GjTW+ba+JVRkebqXsI5JwUkaIpvmczi+49hrm
	Rsu/CX9ytmbwjTeolfH5Ks5rd+A7IFfpNpF34rgIOkvpw2tW3ielghs+3HlGIy6HivgoVd
	molK6kKoBxUvC4QqFIz1TkLUHQl/CJF9yWzPFSXc9a0f/mSjy/EhT8Wgw/RAbcDv4WmWq4
	TRv9IKSezrSbyqh4HkKrZTBPlr8XqmceA1Z3V2rojwqdEUQnll/vNTVrn+lO3a+BzssECO
	eKeC2SRnSIiWzdittX8LqvtI4LmbCCI9Wx/z7LO3QQBYbcK+i0u2f8d05X+u/A==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B054F240005;
	Mon, 19 Jun 2023 16:17:22 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables.rst: explicit variables accepting colon separated lists
Date: Mon, 19 Jun 2023 18:17:19 +0200
Message-Id: <20230619161719.910423-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Jun 2023 16:17:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4007

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO 15128]
---
 documentation/ref-manual/variables.rst | 32 +++++++++++++++-----------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cba3cf5d07..3dc6a5e7f3 100644
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
+      A colon separated list to extend the search path the OpenEmbedded build
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
-- 
2.34.1


