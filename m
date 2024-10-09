Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB932CED637
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10670.1728459693853718438
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ls10oM8U;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62BD71BF206;
	Wed,  9 Oct 2024 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aR9c5L40xXyXJLwCG54XGygq/WINpfoO+lie3UWyS0I=;
	b=Ls10oM8U1hg5skhV/NRo5oehT5aTGThIsphXniGwDsdd0phd/ZoN/bXhHzK5Qbuq4QjBx6
	DT2zeSmO0Hn1NkYuh4sWz2sc+InjOHJISpxkKIjS58xKTL2OQwwdaJbfEILeTaMQ4hUFWg
	trwNMmCHQHTKNg4G190a47z3Zs/XpuHMemOwR7HYxuYbXIfXKAw/hnkR1SgQOl/gZu7zMV
	QPwc9UqqXs+Qv1DDnvCUSlsE1cF/Jqbva6AIKGSodd4w1tVE9doAu0ul4v6QOJdhciVfH2
	HmAtMUHuz0O/9pJ8vYOS6zdqvaMjX2YDIHaEI35YB6bPr+VdhqtUmAqd0Dld7A==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 03/16] ref-manual: add new retain class and variables
Date: Wed,  9 Oct 2024 09:41:01 +0200
Message-ID: <20241009074120.866786-4-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5410

From: Antonin Godard <antonin.godard@bootlin.com>

Document the new `retain` class with its configuration variables in the
variable index.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 17 +++++++++++++
 documentation/ref-manual/variables.rst | 35 ++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 46d77d0e5..9f6e42725 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2728,6 +2728,23 @@ commit, and log. From the information, report files using a JSON format
 are created and stored in
 ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 
+.. _ref-classes-retain:
+
+``retain``
+==========
+
+The :ref:`ref-classes-retain` class can be used to create a tarball of the work
+directory for a recipe when one of its tasks fails, or any other nominated
+directories. It is useful in cases where the environment in which builds are run
+is ephemeral or otherwise inaccessible for examination during debugging.
+
+To enable, add the following to your configuration::
+
+   INHERIT += "retain"
+
+The class can be disabled for specific recipes using the :term:`RETAIN_ENABLED`
+variable.
+
 .. _ref-classes-rm-work:
 
 ``rm_work``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0236c8c9c..1e37132ed 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7137,6 +7137,41 @@ system and gives an overview of their function and contents.
       If both :term:`REQUIRED_VERSION` and :term:`PREFERRED_VERSION` are set
       for the same recipe, the :term:`REQUIRED_VERSION` value applies.
 
+   :term:`RETAIN_DIRS_ALWAYS`
+      When inheriting the :ref:`ref-classes-retain` class, this variable holds
+      space-separated recipe-specific directories to always save in a tarball
+      whether the recipe build has failed or not.
+
+   :term:`RETAIN_DIRS_FAILURE`
+      When inheriting the :ref:`ref-classes-retain` class, this variable holds
+      space-separated recipe-specific directories to save in a tarball on
+      failure of the recipe's build.
+
+   :term:`RETAIN_DIRS_GLOBAL_ALWAYS`
+      When inheriting the :ref:`ref-classes-retain` class, this variable holds
+      space-separated directories that are not specific to a recipe to save in a
+      tarball whether the build has failed or not.
+
+   :term:`RETAIN_DIRS_GLOBAL_FAILURE`
+      When inheriting the :ref:`ref-classes-retain` class, this variable holds
+      space-separated directories that are not specific to a recipe to save in a
+      tarball on build failure.
+
+   :term:`RETAIN_ENABLED`
+      Disables the creation of a tarball of the work directory done by the
+      :ref:`ref-classes-retain` class. Can be set to specific recipes to disable
+      the class when the class was inherited globally with :term:`INHERIT`.
+
+   :term:`RETAIN_OUTDIR`
+      When inheriting the :ref:`ref-classes-retain` class, this variable
+      specifies the directory where to save the tarball of the work directory.
+      The default directory is ``${TMPDIR}/retain``.
+
+   :term:`RETAIN_TARBALL_SUFFIX`
+      When inheriting the :ref:`ref-classes-retain` class, this variable
+      specifies the suffix of the tarball of the work directory. The default
+      suffix is ``${DATETIME}.tar.gz``.
+
    :term:`RM_WORK_EXCLUDE`
       With :ref:`ref-classes-rm-work` enabled, this variable
       specifies a list of recipes whose work directories should not be removed.
-- 
2.46.0


