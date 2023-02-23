Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD237C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 15:37:50 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.13496.1677166660760751637
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 07:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DZ/Hn+5r;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 301E2100003;
	Thu, 23 Feb 2023 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677166658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cCO1EKPyyGP9p7P9QCCN+McA14tbWel2lHiB9khhzgw=;
	b=DZ/Hn+5rUa0lpL5bbNx/x8qludgE+vlMFoVHnBak1FPpzrYWqGs0nY2hbm3NQM1Rm5gK+N
	VeSBG6DctzuWYGrt1lHBnlaiuZyxlm+GMqTXxOWpyoINdpjwI1tHCZPUbspNg6uIXrrZMP
	aLJkc2vHPtMtUQ2R9a+1ApRtN5FJkzz4E49v9O6eXZSHzIr1NGZQL/xZy1aKqMbz/Rxq5D
	j03RUTV23Q3dBTAyihUIviy7kFS4XPX/JB+06ppS/KoiwdNpEF86FFzILAJVRMxn+faMhv
	VmtcSU0CnQAU6x3GTx0P022ECY8wxjeN2lHO0oiyCZGpMG9GchcEHEt9L9ASVA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] dev-manual: new-recipe.rst: add Meson example recipe
Date: Thu, 23 Feb 2023 16:37:28 +0100
Message-Id: <20230223153729.2492175-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 15:37:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3726

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 143c8b9c3b..9f00ac198f 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1173,6 +1173,8 @@ recipe examples given various scenarios:
 
 -  Building an Autotooled package
 
+-  Building a Meson package
+
 -  Splitting an application into multiple packages
 
 -  Adding binaries to an image
@@ -1288,6 +1290,35 @@ as described in the ":ref:`dev-manual/licenses:tracking license changes`"
 section in the Yocto Project Overview and Concepts Manual. You can quickly
 create Autotool-based recipes in a manner similar to the previous example.
 
+Building a Meson Package
+------------------------
+
+Applications built with the `Meson build system <https://mesonbuild.com/>`__
+just need a recipe that has sources described in :term:`SRC_URI` and inherits
+the :ref:`ref-classes-meson` class.
+
+The :oe_git:`ipcalc recipe </meta-openembedded/tree/meta-networking/recipes-support/ipcalc>`
+is a simple example of an application without dependencies::
+
+   SUMMARY = "Tool to assist in network address calculations for IPv4 and IPv6."
+   HOMEPAGE = "https://gitlab.com/ipcalc/ipcalc"
+
+   SECTION = "net"
+
+   LICENSE = "GPL-2.0-only"
+   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+   SRC_URI = "git://gitlab.com/ipcalc/ipcalc.git;protocol=https;branch=master"
+   SRCREV = "4c4261a47f355946ee74013d4f5d0494487cc2d6"
+
+   S = "${WORKDIR}/git"
+
+   inherit meson
+
+Applications with dependencies are likely to inherit the
+:ref:`ref-classes-pkgconfig` class, as ``pkg-config`` it is the default method
+that Meson uses to find dependencies and compile applications against them.
+
 Splitting an Application into Multiple Packages
 -----------------------------------------------
 
-- 
2.37.2


