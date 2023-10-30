Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45169C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 09:48:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.144918.1698659281326823350
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Oct 2023 02:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z/8976K8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DD5B1C0005;
	Mon, 30 Oct 2023 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698659279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MmGFsJuEymYyhRct70VS6BCNO6xZAXwsBklw1cp4//4=;
	b=Z/8976K8/0ktMIhEO4GR3grNozBWlH0SySCfVM3kBQsdwEimh8KipSnPb3sVC09E+nO68J
	W5RbkTyTMzcdSUg9gc4JLJjEeGlbN9EGyPoLzO/b2CVrMROL4J9DKTSTWPWVxEclaC+FaQ
	9cjbljvpsJKixwZIxLfv+z8Wbq/aV0G6m3EEsub6b1XrFe1ITTjulYecVcudSBq22RstKe
	9QXDFzLFBaiKBmNnsf03YWsS8BTEIEki6px6T5rYPhcv4Rvvew++cpUUCFnpShTvxo+h6P
	s512QJ6ET09RspKd1naKuXiO0abrt66QfrM+lD0nq9dP9+/VRGMfM+CTo//zKw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] ref-manual: document MESON_TARGET
Date: Mon, 30 Oct 2023 10:47:47 +0100
Message-Id: <20231030094747.1731168-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 30 Oct 2023 09:48:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4524

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/classes.rst   | 7 ++++---
 documentation/ref-manual/variables.rst | 5 +++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index c7a5e9a63a..f1d545f310 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1779,9 +1779,10 @@ class.
 =========
 
 The :ref:`ref-classes-meson` class allows to create recipes that build software
-using the `Meson <https://mesonbuild.com/>`__ build system. You can use
-the :term:`MESON_BUILDTYPE` and :term:`EXTRA_OEMESON` variables to specify
-additional configuration options to be passed using the ``meson`` command line.
+using the `Meson <https://mesonbuild.com/>`__ build system. You can use the
+:term:`MESON_BUILDTYPE`, :term:`MESON_TARGET` and :term:`EXTRA_OEMESON`
+variables to specify additional configuration options to be passed using the
+``meson`` command line.
 
 .. _ref-classes-metadata_scm:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2d875c984d..3eff516f62 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5319,6 +5319,11 @@ system and gives an overview of their function and contents.
       you to specify the inclusion of debugging symbols and the compiler
       optimizations (none, performance or size).
 
+   :term:`MESON_TARGET`
+      A variable for the :ref:`ref-classes-meson` class, allowing to choose
+      a Meson target to build in :ref:`ref-tasks-compile`.  Otherwise, the
+      default targets are built.
+
    :term:`METADATA_BRANCH`
       The branch currently checked out for the OpenEmbedded-Core layer (path
       determined by :term:`COREBASE`).
-- 
2.34.1


