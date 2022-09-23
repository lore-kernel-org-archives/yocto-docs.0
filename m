Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62977C6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.529.1663955581166002447
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dEPSfBZo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5C8381BF206;
	Fri, 23 Sep 2022 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wffBHG4EeAm5XJvvuJfLSr5DLY2QCUL6B/XGpMexoGI=;
	b=dEPSfBZoYtU5P7Uoh6c9ATnYDvaT8mI+SBDOuT0T7YOxNhDVl+EkuxBVXCFW3cEkDxvctQ
	ZZ+mkjAYjyu8UvH8Dbfaz/SQs15TibjU3LE/aSQza3Jifmny8Ca7uzx8X9Zf67Qm/iatYo
	EGTej7OuIr4JM2yWnmKfhvTH+mzykcnj7wf/DerP/k3+0+64RSIsPK/wFOsi2YfjcmEquW
	8t9NU++T9u714pwd87g0W3QwaXKtYYFia7A4oYKbSCkJNLSZ+wqMuFoys8aLNhL/E7wJ36
	M4RzXoqQ39zIaTM2DWtn1xldljXafbIuduEjwWeF3rh3UdjEF2mAY8pMcycZDA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 05/30] manuals: add reference to the "do_compile" task
Date: Fri, 23 Sep 2022 19:51:54 +0200
Message-Id: <20220923175219.6652-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3220

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst  | 16 ++++++++--------
 documentation/overview-manual/concepts.rst |  2 +-
 documentation/ref-manual/classes.rst       |  2 +-
 documentation/ref-manual/tasks.rst         |  2 +-
 documentation/ref-manual/variables.rst     |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 61755dd06e..0b512601e5 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -1826,8 +1826,8 @@ out-of-tree modules. Your recipe will also need the following::
 Compilation
 -----------
 
-During a build, the ``do_compile`` task happens after source is fetched,
-unpacked, and configured. If the recipe passes through ``do_compile``
+During a build, the :ref:`ref-tasks-compile` task happens after source is fetched,
+unpacked, and configured. If the recipe passes through :ref:`ref-tasks-compile`
 successfully, nothing needs to be done.
 
 However, if the compile step fails, you need to diagnose the failure.
@@ -2337,7 +2337,7 @@ Single .c File Package (Hello World!)
 Building an application from a single file that is stored locally (e.g.
 under ``files``) requires a recipe that has the file listed in the
 :term:`SRC_URI` variable. Additionally, you need to manually write the
-``do_compile`` and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
+:ref:`ref-tasks-compile` and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
 directory containing the source code, which is set to
 :term:`WORKDIR` in this case --- the
 directory BitBake uses for the build.
@@ -2401,7 +2401,7 @@ Makefile-Based Package
 
 Applications that use GNU ``make`` also require a recipe that has the
 source archive listed in :term:`SRC_URI`. You do not need to add a
-``do_compile`` step since by default BitBake starts the ``make`` command
+:ref:`ref-tasks-compile` step since by default BitBake starts the ``make`` command
 to compile the application. If you need additional ``make`` options, you
 should store them in the
 :term:`EXTRA_OEMAKE` or
@@ -2551,7 +2551,7 @@ doing the following:
    ``${``\ :term:`S`\ ``}``.
 
    If ``${S}`` might contain a Makefile, or if you inherit some class
-   that replaces :ref:`ref-tasks-configure` and ``do_compile`` with custom
+   that replaces :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` with custom
    versions, then you can use the
    ``[``\ :ref:`noexec <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
    flag to turn the tasks into no-ops, as follows::
@@ -3446,7 +3446,7 @@ Follow these general steps:
    you added to the patch.
 
 6. *Test Your Changes:* Once you have modified the source code, the
-   easiest way to test your changes is by calling the ``do_compile``
+   easiest way to test your changes is by calling the :ref:`ref-tasks-compile`
    task as shown in the following example::
 
       $ bitbake -c compile -f package
@@ -9634,7 +9634,7 @@ Running Specific Tasks
 
 Any given recipe consists of a set of tasks. The standard BitBake
 behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
-:ref:`ref-tasks-configure`, ``do_compile``, :ref:`ref-tasks-install`, ``do_package``,
+:ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, :ref:`ref-tasks-install`, ``do_package``,
 ``do_package_write_*``, and :ref:`ref-tasks-build`. The default task is
 :ref:`ref-tasks-build` and any tasks on which it depends build first. Some tasks,
 such as ``do_devshell``, are not part of the default build chain. If you
@@ -9677,7 +9677,7 @@ The following example shows one way you can use the ``-f`` option::
 
 This sequence first builds and then recompiles ``matchbox-desktop``. The
 last command reruns all tasks (basically the packaging tasks) after the
-compile. BitBake recognizes that the ``do_compile`` task was rerun and
+compile. BitBake recognizes that the :ref:`ref-tasks-compile` task was rerun and
 therefore understands that the other tasks also need to be run again.
 
 Another, shorter way to rerun a task and all
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 858118beec..06220401bc 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1209,7 +1209,7 @@ The build system has knowledge of the relationship between these tasks
 and other preceding tasks. For example, if BitBake runs
 ``do_populate_sysroot_setscene`` for something, it does not make sense
 to run any of the :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
-:ref:`ref-tasks-configure`, ``do_compile``, and :ref:`ref-tasks-install` tasks. However, if
+:ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, and :ref:`ref-tasks-install` tasks. However, if
 ``do_package`` needs to be run, BitBake needs to run those other tasks.
 
 It becomes more complicated if everything can come from an sstate cache
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 6e37738850..076ebb31ae 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2401,7 +2401,7 @@ uses these build systems, the recipe needs to inherit the ``setuptools3`` class.
 
    .. note::
 
-      The ``setuptools3`` class ``do_compile()`` task now calls
+      The ``setuptools3`` class :ref:`ref-tasks-compile` task now calls
       ``setup.py bdist_wheel`` to build the ``wheel`` binary archive format
       (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__).
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 16715984ae..e5938ee236 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -36,7 +36,7 @@ directory set to ``${``\ :term:`B`\ ``}``.
 
 The default behavior of this task is to run the ``oe_runmake`` function
 if a makefile (``Makefile``, ``makefile``, or ``GNUmakefile``) is found.
-If no such file is found, the ``do_compile`` task does nothing.
+If no such file is found, the :ref:`ref-tasks-compile` task does nothing.
 
 .. _ref-tasks-compile_ptest_base:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index bc29b5a05b..8055f044d0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5603,7 +5603,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          If the software being built experiences dependency issues during
-         the ``do_compile`` task that result in race conditions, you can clear
+         the :ref:`ref-tasks-compile` task that result in race conditions, you can clear
          the :term:`PARALLEL_MAKE` variable within the recipe as a workaround. For
          information on addressing race conditions, see the
          ":ref:`dev-manual/common-tasks:debugging parallel make races`"
-- 
2.34.1


