Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C51DC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 18:12:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.15174.1637691172708926857
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 10:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3DA20C000D;
	Tue, 23 Nov 2021 18:12:51 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/3] misc manuals: add further class references
Date: Tue, 23 Nov 2021 19:12:39 +0100
Message-Id: <20211123181239.2057168-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123181239.2057168-1-michael.opdenacker@bootlin.com>
References: <20211123181239.2057168-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Nov 2021 18:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2182

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst  | 32 ++++++++++------------
 documentation/overview-manual/concepts.rst |  2 +-
 documentation/test-manual/intro.rst        |  2 +-
 3 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 9611a4f206..5ac347d18b 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -938,7 +938,8 @@ a recipe and using :term:`EXTRA_IMAGE_FEATURES` from within your
 :term:`Build Directory`.
 
 To understand how these features work, the best reference is
-``meta/classes/image.bbclass``. This class lists out the available
+:ref:`meta/classes/image.bbclass <ref-classes-image>`.
+This class lists out the available
 :term:`IMAGE_FEATURES` of which most map to package groups while some, such
 as ``debug-tweaks`` and ``read-only-rootfs``, resolve as general
 configuration settings.
@@ -2113,7 +2114,7 @@ statement that essentially identifies itself as being able to provide
 
    PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
 
-Any recipe that inherits the ``kernel`` class is
+Any recipe that inherits the :ref:`kernel <ref-classes-kernel>` class is
 going to utilize a :term:`PROVIDES` statement that identifies that recipe as
 being able to provide the ``virtual/kernel`` item.
 
@@ -2459,7 +2460,7 @@ sometimes you have no choice.
 The easiest solution is to create a recipe that uses the
 :ref:`bin_package <ref-classes-bin-package>` class
 and to be sure that you are using default locations for build artifacts.
-In most cases, the ``bin_package`` class handles "skipping" the
+In most cases, the :ref:`bin_package <ref-classes-bin-package>` class handles "skipping" the
 configure and compile steps as well as sets things up to grab packages
 from the appropriate area. In particular, this class sets ``noexec`` on
 both the :ref:`ref-tasks-configure`
@@ -2467,7 +2468,7 @@ and :ref:`ref-tasks-compile` tasks,
 sets ``FILES:${PN}`` to "/" so that it picks up all files, and sets up a
 :ref:`ref-tasks-install` task, which
 effectively copies all files from ``${S}`` to ``${D}``. The
-``bin_package`` class works well when the files extracted into ``${S}``
+:ref:`bin_package <ref-classes-bin-package>` class works well when the files extracted into ``${S}``
 are already laid out in the way they should be laid out on the target.
 For more information on these variables, see the
 :term:`FILES`,
@@ -2492,7 +2493,7 @@ Reference Manual's variable glossary.
       section in the Yocto Project Overview and Concepts Manual for more
       information.
 
-If you cannot use the ``bin_package`` class, you need to be sure you are
+If you cannot use the :ref:`bin_package <ref-classes-bin-package>` class, you need to be sure you are
 doing the following:
 
 -  Create a recipe where the
@@ -2532,7 +2533,7 @@ doing the following:
 
 .. note::
 
-  If image prelinking is enabled (e.g. "image-prelink" is in :term:`USER_CLASSES`
+  If image prelinking is enabled (e.g. :ref:`image-prelink <ref-classes-image-prelink>` is in :term:`USER_CLASSES`
   which it is by default), prelink will change the binaries in the generated images
   and this often catches people out. Remove that class to ensure binaries are
   preserved exactly if that is necessary.
@@ -4454,19 +4455,16 @@ Follow these steps to build your target using the files in the downloads
 directory:
 
 1. *Using Local Files Only:* Inside your ``local.conf`` file, add the
-   :term:`SOURCE_MIRROR_URL`
-   variable, inherit the
-   :ref:`own-mirrors <ref-classes-own-mirrors>`
-   class, and use the
-   :term:`BB_NO_NETWORK`
-   variable to your ``local.conf``.
+   :term:`SOURCE_MIRROR_URL` variable, inherit the
+   :ref:`own-mirrors <ref-classes-own-mirrors>` class, and use the
+   :term:`BB_NO_NETWORK` variable to your ``local.conf``.
    ::
 
       SOURCE_MIRROR_URL ?= "file:///home/your-download-dir/"
       INHERIT += "own-mirrors"
       BB_NO_NETWORK = "1"
 
-   The :term:`SOURCE_MIRROR_URL` and ``own-mirror``
+   The :term:`SOURCE_MIRROR_URL` and :ref:`own-mirrors <ref-classes-own-mirrors>`
    class set up the system to use the downloads directory as your "own
    mirror". Using the :term:`BB_NO_NETWORK` variable makes sure that
    BitBake's fetching process in step 3 stays local, which means files
@@ -4748,7 +4746,8 @@ done using the
 Eventually, all recipes will be covered and this list will not be
 needed.
 
-For the most part, the Multilib class extension works automatically to
+For the most part, the :ref:`Multilib <ref-classes-multilib*>`
+class extension works automatically to
 extend the package name from ``${PN}`` to ``${MLPREFIX}${PN}``, where
 :term:`MLPREFIX` is the particular multilib (e.g. "lib32-" or "lib64-").
 Standard variables such as
@@ -4760,8 +4759,7 @@ Standard variables such as
 :term:`PACKAGES_DYNAMIC` are
 automatically extended by the system. If you are extending any manual
 code in the recipe, you can use the ``${MLPREFIX}`` variable to ensure
-those names are extended correctly. This automatic extension code
-resides in ``multilib.bbclass``.
+those names are extended correctly.
 
 Using Multilib
 ~~~~~~~~~~~~~~
@@ -10967,7 +10965,7 @@ accidental release of proprietary software. The Yocto Project provides
 an :ref:`archiver <ref-classes-archiver>` class to
 help avoid some of these concerns.
 
-Before you employ :term:`DL_DIR` or the ``archiver`` class, you need to
+Before you employ :term:`DL_DIR` or the :ref:`archiver <ref-classes-archiver>` class, you need to
 decide how you choose to provide source. The source ``archiver`` class
 can generate tarballs and SRPMs and can create them with various levels
 of compliance in mind.
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 89a5eb49fb..33b4071026 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1800,7 +1800,7 @@ type of output occurs when a set of data is merged into a shared
 directory tree such as the sysroot.
 
 The Yocto Project team has tried to keep the details of the
-implementation hidden in ``sstate`` class. From a user's perspective,
+implementation hidden in the :ref:`sstate <ref-classes-sstate>` class. From a user's perspective,
 adding shared state wrapping to a task is as simple as this
 :ref:`ref-tasks-deploy` example taken
 from the :ref:`deploy <ref-classes-deploy>` class::
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 101d283665..4a3a97e29a 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -121,7 +121,7 @@ the following types of tests:
 
       $ bitbake image -c testsdkext
 
-   The tests utilize the ``testsdkext`` class and the ``do_testsdkext`` task.
+   The tests utilize the :ref:`testsdkext <ref-classes-testsdk>` class and the ``do_testsdkext`` task.
 
 -  *Feature Testing:* Various scenario-based tests are run through the
    :ref:`OpenEmbedded Self test (oe-selftest) <ref-manual/release-process:Testing and Quality Assurance>`. We test oe-selftest on each of the main distributions
-- 
2.25.1


