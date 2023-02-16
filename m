Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C983C636D6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 14:08:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.10693.1676556495698627968
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 06:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V/QUN9mA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B712A1C000C;
	Thu, 16 Feb 2023 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676556493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IP/sRLsPuAZ7ajnZTzL2aDews4r8tOS6JX2r80FCkAE=;
	b=V/QUN9mAm9Gn3ggLOwDdMfdlicUNFgzzaGeoWiM89YvRzo5LDFLwV5/H4kKFT4p8UDdXWM
	/Gy/04KcCRtGnwuUS9uHhWfJuEGZZThgm3c2jW9BZ3lTX0Mt4+k4hh0p/J4FWJ2r2ZYPD1
	8Gm02QHgDs/pItjX675s+QfruI9gZC0VuGfQeW3KYQHsJlblG0glWB+OS308Drw2Mnp4/m
	alSw0W977NTolgLAyX4kO/rcuK5zm66Ujnmrvlm6sKVbMZtRgWlPTDTl8w5SSPDjZAMdjq
	sDfpHtLB5+5GS9z5GTJ3q8ZkOF7xbzFIFH9gjP9IgeFlPeMjNjiZLhmu2e2qLw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: document meson class and EXTRA_OEMESON variable
Date: Thu, 16 Feb 2023 15:08:11 +0100
Message-Id: <20230216140811.2383941-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Feb 2023 14:08:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3694

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 10 ++++++++++
 documentation/ref-manual/variables.rst | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b5443c0d0a..b34c966788 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1648,6 +1648,16 @@ messages for various BitBake severity levels (i.e. ``bbplain``,
 This class is enabled by default since it is inherited by the :ref:`ref-classes-base`
 class.
 
+.. _ref-classes-meson:
+
+``meson``
+=========
+
+The :ref:`ref-classes-meson` class allows to create recipes that build software
+using the `Meson <https://mesonbuild.com/>`__ build system. You can use
+the :term:`EXTRA_OEMESON` variable to specify additional configuration options
+to be passed using the ``meson`` command line.
+
 .. _ref-classes-metadata_scm:
 
 ``metadata_scm``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 62176f7ee8..877ea20b47 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2528,6 +2528,17 @@ system and gives an overview of their function and contents.
       variable specifies additional configuration options you want to pass
       to the ``scons`` command line.
 
+   :term:`EXTRA_OEMESON`
+      Additional `Meson <https://mesonbuild.com/>`__ options. See the
+      :ref:`ref-classes-meson` class for additional information.
+
+      In addition to standard Meson options, such options correspond
+      `Meson build options <https://mesonbuild.com/Build-options.html>`__
+      defined in the ``meson_options.txt`` file in the sources to build.
+      Here is an example::
+
+         EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
+
    :term:`EXTRA_USERS_PARAMS`
       When inheriting the :ref:`ref-classes-extrausers`
       class, this variable provides image level user and group operations.
-- 
2.37.2


