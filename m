Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE6ACCA47B
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 15:59:57 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.7561.1655135986825580919
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 08:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hKrV2rc+;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CCFEB240005;
	Mon, 13 Jun 2022 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655135984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G4Pm47ZS/vFDFMgliU3irM5k4aOL9QgqivWMwfbtnFY=;
	b=hKrV2rc+ZeVBr4+xxdT8aI1VZDUFG9RdW7hJcim50cspuNOBx55IygHnVW0JaOFuq0nr+X
	rDJk3ZGU5FhsR6/caZyLGcSpbALzpZvzLNXWqcwpLRty8JnkdJV4+xWym649DTiQrPHZJq
	SHswpnSub4Qg9U0RhtnP4CB4WWB28i2+tOFh6Y9uwljBygDd2u8WAMm1aFdqWLei5Ay+5s
	RfdrZRGe09wjhx79zNwQQXwKJ+Tiz+ScpWe6N3EGJ90AIhbPxYJIu08PLsnmFuG7Hkreb+
	y3Gk/56AHB69I8T/llC/Mf3sQKQ9BFv8jaSYscwzVkk3ijJ8Q+RBiINf4Q9S8w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: add description for the "sysroot" term
Date: Mon, 13 Jun 2022 17:59:39 +0200
Message-Id: <20220613155939.94911-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jun 2022 15:59:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2990

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This term is used throughout the manual but is not properly
introduced anywhere.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/terms.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index cba514c345..76f3fb0d08 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -383,6 +383,31 @@ universal, the list includes them just in case:
      ":ref:`overview-manual/development-environment:repositories, tags, and branches`"
      section in the Yocto Project Overview and Concepts Manual.
 
+   :term:`Sysroot`
+
+      A directory considered as the root directory for locating
+      header and library files needed to generate binaries for a target
+      processor architecture.
+
+      In the context of cross-compiling toolchains, a *sysroot*
+      typically contains C library and kernel headers, plus the
+      compiled binaries for the C library. A *multilib toolchain*
+      can contain multiple variants of the C library binaries,
+      each compiled for a target instruction set (such as ``armv5``,
+      ``armv7`` and ``armv8``), and possibly optimized for a specific CPU core.
+
+      In the more specific context of the OpenEmbedded build System and
+      of the Yocto Project, each recipe has two *sysroots*:
+
+      -  A *target sysroot* contains all the **target** libraries and headers
+         needed to build the recipe.
+
+      -  A *native sysroot* contains all the **host** files and executables
+         needed to build the recipe.
+
+      See the :term:`SYSROOT_* <SYSROOT_DESTDIR>` variables controlling
+      how sysroots are created and stored.
+
    :term:`Task`
       A per-recipe unit of execution for BitBake (e.g.
       :ref:`ref-tasks-compile`,
-- 
2.34.1


