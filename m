Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634D0C6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:39 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.536.1663955609688181514
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ntxScz6E;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 43E31100004;
	Fri, 23 Sep 2022 17:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNC3DeVaM08bEKSXv2zXCnY5EGxrhHKYKBwwbUQfS94=;
	b=ntxScz6E1c1m3BJCRnxnDwlGUHDSYkobFBN+HrNVqZ23E91dB12fvizcT/bbP8aj4KbcPR
	2ovHQBEKwQEGUSr7WyG1os6Rgr4Fy3vbk4PNVxeWjBg5OJPXu6N6B89ruaNcGaClqhUX+G
	vFsew7QJZJ9OfD1/4wRdtaYCx65JYyANQbnC1yl/hYQpWZF4P4QiwPofJe4WSemrFTodMz
	2HL9MbuT9MrpqsCEtKGxI0+gEj++4kC5tz6tKWUHdQxVJPZlczAvyp/KBgYeKrCl0LCATb
	d7cPn+ehU2dammWR8FYbnQQEhHdd0JpnpyxK8A0opGlI67Jhr59NjTTWRczt7Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 12/30] manuals: add references to "do_package_write_*" tasks
Date: Fri, 23 Sep 2022 19:52:01 +0200
Message-Id: <20220923175219.6652-13-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3227

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Using a reference to "do_package_write_deb", the first entry
in the list.

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst  | 2 +-
 documentation/overview-manual/concepts.rst | 4 ++--
 documentation/ref-manual/classes.rst       | 2 +-
 documentation/ref-manual/tasks.rst         | 2 +-
 documentation/ref-manual/variables.rst     | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 947e10560a..dbf7dad558 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9635,7 +9635,7 @@ Running Specific Tasks
 Any given recipe consists of a set of tasks. The standard BitBake
 behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, :ref:`ref-tasks-patch`,
 :ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, :ref:`ref-tasks-install`, :ref:`ref-tasks-package`,
-``do_package_write_*``, and :ref:`ref-tasks-build`. The default task is
+:ref:`do_package_write_* <ref-tasks-package_write_deb>`, and :ref:`ref-tasks-build`. The default task is
 :ref:`ref-tasks-build` and any tasks on which it depends build first. Some tasks,
 such as ``do_devshell``, are not part of the default build chain. If you
 wish to run a task that is not part of the default build chain, you can
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index f1457522da..a477139996 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1198,7 +1198,7 @@ the work involved would be equal to or greater than the underlying task.
 
 In the build system, the common tasks that have setscene variants are
 :ref:`ref-tasks-package`,
-``do_package_write_*``,
+:ref:`do_package_write_* <ref-tasks-package_write_deb>`,
 :ref:`ref-tasks-deploy`,
 :ref:`ref-tasks-packagedata`, and
 :ref:`ref-tasks-populate_sysroot`.
@@ -1215,7 +1215,7 @@ to run any of the :ref:`ref-tasks-fetch`, ``do_unpack``, :ref:`ref-tasks-patch`,
 It becomes more complicated if everything can come from an sstate cache
 because some objects are simply not required at all. For example, you do
 not need a compiler or native tools, such as quilt, if there isn't anything
-to compile or patch. If the ``do_package_write_*`` packages are available
+to compile or patch. If the :ref:`do_package_write_* <ref-tasks-package_write_deb>` packages are available
 from sstate, BitBake does not need the :ref:`ref-tasks-package` task data.
 
 To handle all these complexities, BitBake runs in two phases. The first
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 076ebb31ae..977dc34523 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -47,7 +47,7 @@ splitting out of debug symbols during packaging).
    even if the recipes do not produce architecture-specific output.
 
    Configuring such recipes for all architectures causes the
-   ``do_package_write_*`` tasks to
+   :ref:`do_package_write_* <ref-tasks-package_write_deb>` tasks to
    have different signatures for the machines with different tunings.
    Additionally, unnecessary rebuilds occur every time an image for a
    different :term:`MACHINE` is built even when the recipe never changes.
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index f0129c1f72..b099ce7a5c 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -170,7 +170,7 @@ Copies files that are to be packaged into the holding area
 working directory set to ``${``\ :term:`B`\ ``}``, which is the
 compilation directory. The :ref:`ref-tasks-install` task, as well as other tasks
 that either directly or indirectly depend on the installed files (e.g.
-:ref:`ref-tasks-package`, ``do_package_write_*``, and
+:ref:`ref-tasks-package`, :ref:`do_package_write_* <ref-tasks-package_write_deb>`, and
 :ref:`ref-tasks-rootfs`), run under
 :ref:`fakeroot <overview-manual/concepts:fakeroot and pseudo>`.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 45d058a281..272673d90b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6200,7 +6200,7 @@ system and gives an overview of their function and contents.
       The practical effect of the above :term:`RDEPENDS` assignment is that
       ``bar`` and ``baz`` will be declared as dependencies inside the
       package ``foo`` when it is written out by one of the
-      :ref:`do_package_write_\* <ref-tasks-package_write_deb>` tasks.
+      :ref:`do_package_write_* <ref-tasks-package_write_deb>` tasks.
       Exactly how this is done depends on which package format is used,
       which is determined by
       :term:`PACKAGE_CLASSES`. When the
@@ -6212,7 +6212,7 @@ system and gives an overview of their function and contents.
       added. This dependency is from the recipe's
       :ref:`ref-tasks-build` (not to be confused with
       :ref:`ref-tasks-compile`) task to the
-      ``do_package_write_*`` task of the recipes that build ``bar`` and
+      :ref:`do_package_write_* <ref-tasks-package_write_deb>` task of the recipes that build ``bar`` and
       ``baz``.
 
       The names of the packages you list within :term:`RDEPENDS` must be the
-- 
2.34.1


