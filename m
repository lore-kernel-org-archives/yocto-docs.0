Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79654C07E9D
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:52:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.556.1663955574824399879
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J3hfgegb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 749D260005;
	Fri, 23 Sep 2022 17:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=61DB0R5Qeg02NRpbbfUenzyiA9T5dBxMuXzF5JWRWmw=;
	b=J3hfgegbIqMBBKrKrJwSe7MAjSDp9NbXZHCCBim/U4td3op+9rCcP9ldhLEJIOot9vQdRk
	6YGux7gD4t+uANyw8iwG3KIBIG/JxjAtHB81bKa49nSiV7XonS06GUL38O/cHp/86cLDKg
	LQCxNNRUqa9c2Bx3nuY2DuU28QDEpSo+U6mZaMA9FKaws/fWg56So3OCFre6LrNYJhvU6f
	78v6kJO+UflaswohQuh4to5cKmLrFq7TKFZlyLBrT34xk69QKfjSxHpLYBi5leTVVx0kdN
	ZINqox6AhxXyU3pydkkCnnFc+16/b6tdSfCg8Z0SNc8xx9SLHG2umb88s2v/EA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 04/30] manuals: add reference to "do_configure" task
Date: Fri, 23 Sep 2022 19:51:53 +0200
Message-Id: <20220923175219.6652-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:52:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3219

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst        | 6 +++---
 documentation/migration-guides/migration-1.8.rst | 2 +-
 documentation/migration-guides/migration-2.1.rst | 4 ++--
 documentation/migration-guides/migration-2.6.rst | 2 +-
 documentation/overview-manual/concepts.rst       | 2 +-
 documentation/ref-manual/tasks.rst               | 2 +-
 documentation/ref-manual/variables.rst           | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 7b20234991..61755dd06e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2551,7 +2551,7 @@ doing the following:
    ``${``\ :term:`S`\ ``}``.
 
    If ``${S}`` might contain a Makefile, or if you inherit some class
-   that replaces ``do_configure`` and ``do_compile`` with custom
+   that replaces :ref:`ref-tasks-configure` and ``do_compile`` with custom
    versions, then you can use the
    ``[``\ :ref:`noexec <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
    flag to turn the tasks into no-ops, as follows::
@@ -2881,7 +2881,7 @@ you can use as references.
 If you are creating a new kernel recipe, normal recipe-writing rules
 apply for setting up a :term:`SRC_URI`. Thus, you need to specify any
 necessary patches and set :term:`S` to point at the source code. You need to
-create a ``do_configure`` task that configures the unpacked kernel with
+create a :ref:`ref-tasks-configure` task that configures the unpacked kernel with
 a ``defconfig`` file. You can do this by using a ``make defconfig``
 command or, more commonly, by copying in a suitable ``defconfig`` file
 and then running ``make oldconfig``. By making use of ``inherit kernel``
@@ -9634,7 +9634,7 @@ Running Specific Tasks
 
 Any given recipe consists of a set of tasks. The standard BitBake
 behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
-``do_configure``, ``do_compile``, :ref:`ref-tasks-install`, ``do_package``,
+:ref:`ref-tasks-configure`, ``do_compile``, :ref:`ref-tasks-install`, ``do_package``,
 ``do_package_write_*``, and :ref:`ref-tasks-build`. The default task is
 :ref:`ref-tasks-build` and any tasks on which it depends build first. Some tasks,
 such as ``do_devshell``, are not part of the default build chain. If you
diff --git a/documentation/migration-guides/migration-1.8.rst b/documentation/migration-guides/migration-1.8.rst
index 51a13873e2..546c798196 100644
--- a/documentation/migration-guides/migration-1.8.rst
+++ b/documentation/migration-guides/migration-1.8.rst
@@ -128,7 +128,7 @@ when the :ref:`ref-tasks-configure` task needs to be
 re-executed.
 
 One of the improvements is to attempt to run "make clean" during the
-``do_configure`` task if a ``Makefile`` exists. Some software packages
+:ref:`ref-tasks-configure` task if a ``Makefile`` exists. Some software packages
 do not provide a working clean target within their make files. If you
 have such recipes, you need to set
 :term:`CLEANBROKEN` to "1" within the recipe, for example::
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index b2d8a0b678..bfc600ccca 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -108,12 +108,12 @@ this change should not be a problem. However, if you have a recipe that
 bypasses the standard :ref:`ref-tasks-configure` task
 from the :ref:`autotools <ref-classes-autotools>` class and the software the recipe is building
 uses a very old version of ``autoconf``, the recipe might be incapable
-of determining the correct size of ``off_t`` during ``do_configure``.
+of determining the correct size of ``off_t`` during :ref:`ref-tasks-configure`.
 
 The best course of action is to patch the software as necessary to allow
 the default implementation from the :ref:`autotools <ref-classes-autotools>` class to work such
 that ``autoreconf`` succeeds and produces a working configure script,
-and to remove the overridden ``do_configure`` task such that the default
+and to remove the overridden :ref:`ref-tasks-configure` task such that the default
 implementation does get used.
 
 .. _migration-2.1-image-generation-split-out-from-filesystem-generation:
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index 11e659de7c..32bb48bccc 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -135,7 +135,7 @@ Fetching these types of dependencies that are not provided in the
 sysroot negatively affects the ability to reproduce builds. This type of
 fetching is now explicitly disabled. Consequently, any missing
 dependencies in Python recipes that use these classes now result in an
-error during the ``do_configure`` task.
+error during the :ref:`ref-tasks-configure` task.
 
 .. _migration-2.6-linux-yocto-configuration-audit-issues-now-correctly-reported:
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 2e1aa3df48..858118beec 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1209,7 +1209,7 @@ The build system has knowledge of the relationship between these tasks
 and other preceding tasks. For example, if BitBake runs
 ``do_populate_sysroot_setscene`` for something, it does not make sense
 to run any of the :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
-``do_configure``, ``do_compile``, and :ref:`ref-tasks-install` tasks. However, if
+:ref:`ref-tasks-configure`, ``do_compile``, and :ref:`ref-tasks-install` tasks. However, if
 ``do_package`` needs to be run, BitBake needs to run those other tasks.
 
 It becomes more complicated if everything can come from an sstate cache
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index f3aebcecc3..16715984ae 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -58,7 +58,7 @@ The default behavior of this task is to run ``oe_runmake clean`` if a
 makefile (``Makefile``, ``makefile``, or ``GNUmakefile``) is found and
 :term:`CLEANBROKEN` is not set to "1". If no such
 file is found or the :term:`CLEANBROKEN` variable is set to "1", the
-``do_configure`` task does nothing.
+:ref:`ref-tasks-configure` task does nothing.
 
 .. _ref-tasks-configure_ptest_base:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 060bf499bb..bc29b5a05b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1620,7 +1620,7 @@ system and gives an overview of their function and contents.
       the appropriate staging sysroot, given by the
       :term:`STAGING_DIR* <STAGING_DIR>` variables, by the time the
       :ref:`ref-tasks-configure` task for ``foo`` runs.
-      This mechanism is implemented by having ``do_configure`` depend on
+      This mechanism is implemented by having :ref:`ref-tasks-configure` depend on
       the :ref:`ref-tasks-populate_sysroot` task of
       each recipe listed in :term:`DEPENDS`, through a
       ``[``\ :ref:`deptask <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
-- 
2.34.1


