Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D13CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 14:17:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.52470.1695046631499154824
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 07:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MSp90buw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 822CBC000A;
	Mon, 18 Sep 2023 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695046629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OGBi+RxS0R8Fi8RMguXpnTCxCDqNu5YsLU8qLQidvVM=;
	b=MSp90buwR+4cnHzkwBZkWS122P/AZLnYS6u4+v8OEbkPiynkpJosarp8Hx0kqVSKRISwKD
	N24/DuB113ACXXB5n4ZVJmjIDRXEanbzyom8u80B/0Vd0dU9n8ToXtQQNPSnPFJFm8eDU5
	0kz9z9jpc7ly4p3ON06yuRUoS02/yCuiJmVmH96XZULno2/T6fYaB/dreRm7l+6HFiEE1y
	xM7Y/Gs2Hhoic5FddW7jeTkvfxw6xYpAqCs031WyIKZMbJjy7UhjNffwXM3y/13CGFkBDZ
	GKR8xnC8TYXSZS714MghQTRZO/b1Dp098oKxYwWRf5/2DXmmSOkH6gYb7QZGxQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 1/5] ref-manual: add meson class and variables
Date: Mon, 18 Sep 2023 16:17:00 +0200
Message-Id: <20230918141704.79680-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Sep 2023 14:17:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4219

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Backported from the master branch

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 10 ++++++++++
 documentation/ref-manual/variables.rst | 25 +++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 6ee0d33451..04afd3acf7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1537,6 +1537,16 @@ messages for various BitBake severity levels (i.e. ``bbplain``,
 This class is enabled by default since it is inherited by the ``base``
 class.
 
+.. _ref-classes-meson:
+
+``meson.bbclass``
+=================
+
+The :ref:`ref-classes-meson` class allows to create recipes that build software
+using the `Meson <https://mesonbuild.com/>`__ build system. You can use
+the :term:`MESON_BUILDTYPE` and :term:`EXTRA_OEMESON` variables to specify
+additional configuration options to be passed using the ``meson`` command line.
+
 .. _ref-classes-metadata_scm:
 
 ``metadata_scm.bbclass``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 88b27492c7..1cc489a7ea 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2345,6 +2345,20 @@ system and gives an overview of their function and contents.
       variable specifies additional configuration options you want to pass
       to the ``scons`` command line.
 
+   :term:`EXTRA_OEMESON`
+      Additional `Meson <https://mesonbuild.com/>`__ options. See the
+      :ref:`ref-classes-meson` class for additional information.
+
+      In addition to standard Meson options, such options correspond to
+      `Meson build options <https://mesonbuild.com/Build-options.html>`__
+      defined in the ``meson_options.txt`` file in the sources to build.
+      Here is an example::
+
+         EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
+
+      Note that any custom value for the Meson ``--buildtype`` option
+      should be set through the :term:`MESON_BUILDTYPE` variable.
+
    :term:`EXTRA_USERS_PARAMS`
       When inheriting the :ref:`extrausers <ref-classes-extrausers>`
       class, this variable provides image level user and group operations.
@@ -4794,6 +4808,17 @@ system and gives an overview of their function and contents.
    :term:`MAINTAINER`
       The email address of the distribution maintainer.
 
+   :term:`MESON_BUILDTYPE`
+      Value of the Meson ``--buildtype`` argument used by the
+      :ref:`ref-classes-meson` class. It defaults to ``debug`` if
+      :term:`DEBUG_BUILD` is set to "1", and ``plain`` otherwise.
+
+      See `Meson build options <https://mesonbuild.com/Builtin-options.html>`__
+      for the values you could set in a recipe. Values such as ``plain``,
+      ``debug``, ``debugoptimized``, ``release`` and ``minsize`` allow
+      you to specify the inclusion of debugging symbols and the compiler
+      optimizations (none, performance or size).
+
    :term:`METADATA_BRANCH`
       The branch currently checked out for the OpenEmbedded-Core layer (path
       determined by :term:`COREBASE`).
-- 
2.34.1


