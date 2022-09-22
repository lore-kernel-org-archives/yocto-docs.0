Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF3BC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 13:33:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.7160.1663853607438053602
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 06:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iwpb3p+N;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6700440016;
	Thu, 22 Sep 2022 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663853604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xxiBjY7vZ4sEMPzlkaXQ93razOmVG5saJg+fO2JU2a8=;
	b=iwpb3p+NTosWnTwfE+15FhixxW3y4xJd6t2/J1Lq6vbWkSIpi9SWAKt2xtv/E/OmRhoVjZ
	01G5ZbZA1ME2y86nCY2l0Zt22YD3g7rSXmcqY/QF0Ji5T4p9ueXJ86UzEMfN6anhuBsx6V
	MDacmAl5dYZI2S+To5Xyidqgyqwn+pX4fgf0loJ3UHS91OwhbCcQhzn8OGYrCD1e717jJY
	9urQNIUSV1/3mSTV1nD7azycgwQwK7d6PY51877q9o8uHmgcWdUoxpg6WD/q7ZLl+zSaEf
	d+41qknyDmAXPcr16ZF3itpp4HRqbMUmBk2Q/krpr6sSMwO5l0X+lsw50pMpUg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: structure.rst: improve information about
 build/cache/
Date: Thu, 22 Sep 2022 15:33:20 +0200
Message-Id: <20220922133320.2393962-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 13:33:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3209

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also include this directory in alphabetical order.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/structure.rst | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 6c6f52e799..c7a9889eb8 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -237,6 +237,18 @@ subdirectories. For information on the build history feature, see the
 ":ref:`dev-manual/common-tasks:maintaining build output quality`"
 section in the Yocto Project Development Tasks Manual.
 
+.. _structure-build-cache:
+
+``build/cache/``
+----------------
+
+This directory contains several internal files used by the OpenEmbedded
+build system.
+
+It also contains ``sanity_info``, a text file keeping track of important
+build information such as the values of :term:`TMPDIR`, :term:`SSTATE_DIR`,
+as well as the name and version of the host distribution.
+
 .. _structure-build-conf-local.conf:
 
 ``build/conf/local.conf``
@@ -320,14 +332,6 @@ Once the build process gets the sample file, it uses ``sed`` to substitute final
    version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/templates/default``
    directory.
 
-.. _structure-build-conf-sanity_info:
-
-``build/cache/sanity_info``
----------------------------
-
-This file indicates the state of the sanity checks and is created during
-the build.
-
 .. _structure-build-downloads:
 
 ``build/downloads/``
-- 
2.34.1


