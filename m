Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCCAC636D4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 10:37:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.3833.1676630264414408300
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 02:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XakUDLxz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 56A0EFF80B;
	Fri, 17 Feb 2023 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676630262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1if+Xva7A2Lw7HV90VW0emVm/AibluHaI+2anpBPji8=;
	b=XakUDLxzo5E0vfQr78Go0Hib414Aj5kcc/OGQnT/tqYO5vKLO0go59IxM6UF4efXqhlqAo
	7R8p/bZyMJUls1Xe5DzM/X1L2UztjTVVKPCYBJ7Ur9B3wJo1OgMuGenDsWLrkwp8ozZYde
	zpWivaAQdJS04k3fuFSMZEd75xonXk8w80z+ejez9kjLutbpsLd/Cm1RMDrhpJ0evRYr+L
	kJk2cGw6oMevApAoNOQQ78u0d8iRQLbUDW4vlMrf1FT7RlTOgPP/svwa0juhGEylOJcD/R
	xJXPjNwo+6r9fpSAbQINPk23iuYLlEI7kZ1bq0vTqXAqNKK9y0vgPW/pjTsEnw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] ref-manual: document meson class and variables
Date: Fri, 17 Feb 2023 11:37:40 +0100
Message-Id: <20230217103740.4074267-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <174494407BBDCD9F.23192@lists.yoctoproject.org>
References: <174494407BBDCD9F.23192@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Feb 2023 10:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3697

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Changes in V2:
- Fix typo
- Document the MESON_BUILDTYPE variable too
Thanks to feedback from Peter Kjellerstedt
---
 documentation/ref-manual/classes.rst   | 10 ++++++++++
 documentation/ref-manual/variables.rst | 25 +++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b5443c0d0a..75dbe97299 100644
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
+the :term:`MESON_BUILDTYPE` and :term:`EXTRA_OEMESON` variables to specify
+additional configuration options to be passed using the ``meson`` command line.
+
 .. _ref-classes-metadata_scm:
 
 ``metadata_scm``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 62176f7ee8..f4de3b5658 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2528,6 +2528,20 @@ system and gives an overview of their function and contents.
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
       When inheriting the :ref:`ref-classes-extrausers`
       class, this variable provides image level user and group operations.
@@ -5138,6 +5152,17 @@ system and gives an overview of their function and contents.
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
2.37.2


