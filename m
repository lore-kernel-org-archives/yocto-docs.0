Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7660C4167E
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4279.1665393877465567404
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=OVOxhWF9;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id D392D20ECCB1; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D392D20ECCB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=+r0YDcbzMhXMxLXbu9Z373bkTuBDxjiU41icXyxH5as=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OVOxhWF9Mu7CEdeo4CYwKxEtcVuo0Dh5hBa9n/3Ms1bFPxASA8GdM74WhdIHPAyZn
	 zfwRbHUpn1ctV+JaIIn5Cqrmqxxw5K4u/7XQ9BDTfNVtoH/SERWwdyG1aSx+yG3KCc
	 lapz51jQTDDu8cPqDJU53sKdjYdP8swTnB1wNCFY=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 22/34] ref-manual: remove reference to testimage-auto class
Date: Mon, 10 Oct 2022 02:24:08 -0700
Message-Id: 
 <f3399392d1a99975fb78136ede8674b50155f8c6.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3330

From: Paul Eggleton <paul.eggleton@microsoft.com>

testimage-auto was removed in the thud release.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/dev-manual/common-tasks.rst        |  4 ++--
 documentation/migration-guides/migration-1.5.rst |  2 +-
 documentation/migration-guides/migration-2.6.rst |  2 +-
 documentation/overview-manual/concepts.rst       |  2 +-
 documentation/ref-manual/classes.rst             | 17 +++++++++--------
 documentation/ref-manual/release-process.rst     |  2 +-
 documentation/ref-manual/variables.rst           |  2 +-
 documentation/test-manual/intro.rst              |  4 ++--
 8 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index a4741c5..68ce2b8 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3048,7 +3048,7 @@ The following steps describe how to set up the AUH utility:
       your build directory.
 
    -  If you want to enable testing through the
-      :ref:`testimage <ref-classes-testimage*>`
+      :ref:`testimage <ref-classes-testimage>`
       class, which is optional, you need to have the following set in
       your ``conf/local.conf`` file::
 
@@ -8893,7 +8893,7 @@ You can start the tests automatically or manually:
 
 -  *Manually running tests:* To manually run the tests, first globally
    inherit the
-   :ref:`testimage <ref-classes-testimage*>` class
+   :ref:`testimage <ref-classes-testimage>` class
    by editing your ``local.conf`` file::
 
       INHERIT += "testimage"
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 366fb00..1b78e99 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -240,7 +240,7 @@ Automated Image Testing
 -----------------------
 
 A new automated image testing framework has been added through the
-:ref:`ref-classes-testimage*` classes. This
+:ref:`ref-classes-testimage` classes. This
 framework replaces the older ``imagetest-qemu`` framework.
 
 You can learn more about performing automated image tests in the
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index 32bb48b..b36eb19 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -319,7 +319,7 @@ This section provides information about automatic testing changes:
    practices now dictate that you use the
    :term:`IMAGE_CLASSES` variable rather than the
    :term:`INHERIT` variable when you inherit the
-   :ref:`testimage <ref-classes-testimage*>` and
+   :ref:`testimage <ref-classes-testimage>` and
    :ref:`testsdk <ref-classes-testsdk>` classes used for automatic
    testing.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 39b8713..35d6feb 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1014,7 +1014,7 @@ processing includes creation of a manifest file and optimizations.
 The manifest file (``.manifest``) resides in the same directory as the
 root filesystem image. This file lists out, line-by-line, the installed
 packages. The manifest file is useful for the
-:ref:`testimage <ref-classes-testimage*>` class,
+:ref:`testimage <ref-classes-testimage>` class,
 for example, to determine whether or not to run specific tests. See the
 :term:`IMAGE_MANIFEST`
 variable for additional information.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3b5b4f2..0a83d04 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2767,12 +2767,12 @@ session needs to be started. For example, the
 :ref:`devshell <ref-classes-devshell>` class all use the ``terminal``
 class.
 
-.. _ref-classes-testimage*:
+.. _ref-classes-testimage:
 
-``testimage*.bbclass``
-======================
+``testimage.bbclass``
+=====================
 
-The ``testimage*`` classes support running automated tests against
+The ``testimage`` class supports running automated tests against
 images using QEMU and on actual hardware. The classes handle loading the
 tests and starting the image. To use the classes, you need to perform
 steps to set up the environment.
@@ -2786,14 +2786,15 @@ steps to set up the environment.
 The tests are commands that run on the target system over ``ssh``. Each
 test is written in Python and makes use of the ``unittest`` module.
 
-The ``testimage.bbclass`` runs tests on an image when called using the
+The ``testimage`` class runs tests on an image when called using the
 following::
 
    $ bitbake -c testimage image
 
-The ``testimage-auto`` class
-runs tests on an image after the image is constructed (i.e.
-:term:`TESTIMAGE_AUTO` must be set to "1").
+Alternatively, if you wish to have tests automatically run for each image
+after it is built, you can set :term:`TESTIMAGE_AUTO`::
+
+   TESTIMAGE_AUTO = "1"
 
 For information on how to enable, run, and create new tests, see the
 ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 8acb4b8..c36fa55 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -127,7 +127,7 @@ consists of the following pieces:
    an ARM target, did the build produce ARM binaries. If, for example,
    the build produced PPC binaries then there is a problem.
 
--  :ref:`ref-classes-testimage*`: This class
+-  :ref:`ref-classes-testimage`: This class
    performs runtime testing of images after they are built. The tests
    are usually used with :doc:`QEMU </dev-manual/qemu>`
    to boot the images and check the combined runtime result boot
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7c4a3dc..ec2e326 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8342,7 +8342,7 @@ system and gives an overview of their function and contents.
       on enabling, running, and writing these tests, see the
       ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual and the
-      ":ref:`ref-classes-testimage*`" section.
+      ":ref:`ref-classes-testimage`" section.
 
    :term:`THISDIR`
       The directory in which the file BitBake is currently parsing is
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 6421dd5..36958d0 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -132,8 +132,8 @@ the following types of tests:
 
       $ bitbake image -c testimage
 
-   The tests utilize the :ref:`testimage* <ref-classes-testimage*>`
-   classes and the :ref:`ref-tasks-testimage` task.
+   The tests utilize the :ref:`testimage <ref-classes-testimage>`
+   class and the :ref:`ref-tasks-testimage` task.
 
 -  *Layer Testing:* The Autobuilder has the possibility to test whether
    specific layers work with the test of the system. The layers tested
-- 
1.8.3.1


