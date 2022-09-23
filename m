Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635A6C6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:19 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.581.1663955594658802388
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OenAM6M1;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A5C7200002;
	Fri, 23 Sep 2022 17:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1bwRVVQ5FO5W6abRpXn1hngdcreJB8O0nE65MOTy+g=;
	b=OenAM6M1Do8EzwdqYMF3ZUN3s6wgvYwLHfLZ4PRERCZMleM/vGE3NJQJc+TX1Gc/6nhh5t
	gBP9ev7qLZOqyttpJV9AirRkD56SIESaXy1n3fz3cb459k6Dpiqg6tMQBMt+mNclMRULRF
	U8biynkVxWlLjM1UNpS+0t9WxC1SOFw4lT9o4mTXKYEK8F3Vo+ryMRKeG4xkSX06mYN/Qw
	ynwuBWTXEdSFQlA1orSp+zErd7LN0nT/i1cnrhVVGVEqBUh9xjRTdH3KhnQs/vZTm5S86w
	8slSD2LK9qfTNTnjTcymruzKdylC3jOim29SxeCt5z/yJHdkwoz3gRi+cxwyYg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 08/30] manuals: add references to the "do_package" task
Date: Fri, 23 Sep 2022 19:51:57 +0200
Message-Id: <20220923175219.6652-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3223

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst  |  6 +++---
 documentation/overview-manual/concepts.rst | 12 ++++++------
 documentation/ref-manual/structure.rst     |  2 +-
 documentation/ref-manual/tasks.rst         |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 22d1634f1b..74b050f600 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2028,10 +2028,10 @@ Successful packaging is a combination of automated processes performed
 by the OpenEmbedded build system and some specific steps you need to
 take. The following list describes the process:
 
--  *Splitting Files*: The ``do_package`` task splits the files produced
+-  *Splitting Files*: The :ref:`ref-tasks-package` task splits the files produced
    by the recipe into logical components. Even software that produces a
    single binary might still have debug symbols, documentation, and
-   other logical components that should be split out. The ``do_package``
+   other logical components that should be split out. The :ref:`ref-tasks-package`
    task ensures that files are split up and packaged correctly.
 
 -  *Running QA Checks*: The
@@ -9634,7 +9634,7 @@ Running Specific Tasks
 
 Any given recipe consists of a set of tasks. The standard BitBake
 behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
-:ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, :ref:`ref-tasks-install`, ``do_package``,
+:ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, :ref:`ref-tasks-install`, :ref:`ref-tasks-package`,
 ``do_package_write_*``, and :ref:`ref-tasks-build`. The default task is
 :ref:`ref-tasks-build` and any tasks on which it depends build first. Some tasks,
 such as ``do_devshell``, are not part of the default build chain. If you
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 3bb728f990..bbe0ec345b 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -905,7 +905,7 @@ the analysis and package splitting process use several areas:
    individual packages.
 
 -  :term:`PKGDESTWORK`: A
-   temporary work area (i.e. ``pkgdata``) used by the ``do_package``
+   temporary work area (i.e. ``pkgdata``) used by the :ref:`ref-tasks-package`
    task to save package metadata.
 
 -  :term:`PKGDEST`: The parent
@@ -1210,13 +1210,13 @@ and other preceding tasks. For example, if BitBake runs
 ``do_populate_sysroot_setscene`` for something, it does not make sense
 to run any of the :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
 :ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, and :ref:`ref-tasks-install` tasks. However, if
-``do_package`` needs to be run, BitBake needs to run those other tasks.
+:ref:`ref-tasks-package` needs to be run, BitBake needs to run those other tasks.
 
 It becomes more complicated if everything can come from an sstate cache
 because some objects are simply not required at all. For example, you do
 not need a compiler or native tools, such as quilt, if there isn't anything
 to compile or patch. If the ``do_package_write_*`` packages are available
-from sstate, BitBake does not need the ``do_package`` task data.
+from sstate, BitBake does not need the :ref:`ref-tasks-package` task data.
 
 To handle all these complexities, BitBake runs in two phases. The first
 is the "setscene" stage. During this stage, BitBake first checks the
@@ -1854,7 +1854,7 @@ The following list explains the previous example:
 
       In cases where ``sstate-inputdirs`` and ``sstate-outputdirs`` would be
       the same, you can use ``sstate-plaindirs``. For example, to preserve the
-      ${:term:`PKGD`} and ${:term:`PKGDEST`} output from the ``do_package``
+      ${:term:`PKGD`} and ${:term:`PKGDEST`} output from the :ref:`ref-tasks-package`
       task, use the following::
 
               do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST}"
@@ -2101,7 +2101,7 @@ dependencies, you must manually declare the dependencies.
    :term:`PRIVATE_LIBS` inside
    the package's recipe.
 
--  ``pcdeps``: During the ``do_package`` task of each recipe, all
+-  ``pcdeps``: During the :ref:`ref-tasks-package` task of each recipe, all
    pkg-config modules (``*.pc`` files) installed by the recipe are
    located. For each module, the package that contains the module is
    registered as providing the module. The resulting module-to-package
@@ -2147,7 +2147,7 @@ dependencies, you must manually declare the dependencies.
    :term:`ALLOW_EMPTY` variable
    for more information.
 
-The ``do_package`` task depends on the ``do_packagedata`` task of each
+The :ref:`ref-tasks-package` task depends on the ``do_packagedata`` task of each
 recipe in :term:`DEPENDS` through use
 of a ``[``\ :ref:`deptask <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
 declaration, which guarantees that the required
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 429f81e14c..533745b370 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -630,7 +630,7 @@ Here are key subdirectories within each recipe work directory:
    split into individual packages.
 
 -  ``${WORKDIR}/packages-split``: Contains the output of the
-   ``do_package`` task after the output has been split into individual
+   :ref:`ref-tasks-package` task after the output has been split into individual
    packages. There are subdirectories for each individual package created by
    the recipe.
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 63af2730e7..1bb8bc1918 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -212,7 +212,7 @@ based on available packages and files. This task makes use of the
 :term:`PACKAGES` and :term:`FILES`
 variables.
 
-The ``do_package`` task, in conjunction with the
+The :ref:`ref-tasks-package` task, in conjunction with the
 :ref:`ref-tasks-packagedata` task, also saves some
 important package metadata. For additional information, see the
 :term:`PKGDESTWORK` variable and the
-- 
2.34.1


