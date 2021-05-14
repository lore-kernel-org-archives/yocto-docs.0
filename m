Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.6125.1620981344088391272
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 01:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id AFAE1200008;
	Fri, 14 May 2021 08:35:42 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/6] kernel-dev manual: simplify style
Date: Fri, 14 May 2021 10:35:23 +0200
Message-Id: <20210514083527.281767-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
References: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/kernel-dev/advanced.rst      | 12 ++++++------
 documentation/kernel-dev/common.rst        | 12 ++++++------
 documentation/kernel-dev/concepts-appx.rst |  2 +-
 documentation/kernel-dev/intro.rst         |  6 +++---
 documentation/kernel-dev/maint-appx.rst    |  4 ++--
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index b0d03851b3..0e745c375d 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -21,7 +21,7 @@ is the ``yocto-kernel-cache`` Git repository. You can find this repository
 grouped under the "Yocto Linux Kernel" heading in the
 :yocto_git:`Yocto Project Source Repositories <>`.
 
-Kernel development tools ("kern-tools") exist also in the Yocto Project
+Kernel development tools ("kern-tools") are also available in the Yocto Project
 Source Repositories under the "Yocto Linux Kernel" heading in the
 ``yocto-kernel-tools`` Git repository. The recipe that builds these
 tools is ``meta/recipes-kernel/kern-tools/kern-tools-native_git.bb`` in
@@ -313,7 +313,7 @@ The following listings show the ``build.scc`` file and part of the
 
 The description file can
 include multiple patch statements where each statement handles a single
-patch. In the example ``build.scc`` file, five patch statements exist
+patch. In the example ``build.scc`` file, there are five patch statements
 for the five patches in the directory.
 
 You can create a typical ``.patch`` file using ``diff -Nurp`` or
@@ -509,8 +509,8 @@ description as meeting the criteria set by the recipe being built. This
 example supports the "beaglebone" machine for the "standard" kernel and
 the "arm" architecture.
 
-Be aware that a hard link between the ``KTYPE`` variable and a kernel
-type description file does not exist. Thus, if you do not have the
+Be aware that there is no hard link between the ``KTYPE`` variable and a kernel
+type description file. Thus, if you do not have the
 kernel type defined in your kernel Metadata as it is here, you only need
 to ensure that the
 :term:`LINUX_KERNEL_TYPE`
@@ -776,8 +776,8 @@ patches in every kernel you build (i.e. have the patches as part of the
 lone "master" branch). It is situations like these that give rise to
 multiple branches used within a Linux kernel sources Git repository.
 
-Repository organization strategies exist that maximize source reuse,
-remove redundancy, and logically order your changes. This section
+Here are repository organization strategies maximizing source reuse,
+removing redundancy, and logically ordering your changes. This section
 presents strategies for the following cases:
 
 -  Encapsulating patches in a feature description and only including the
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 0fede0c012..f64cbab56c 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -578,7 +578,7 @@ recipe is processed.
 
 .. note::
 
-   Other methods exist to accomplish grouping and defining configuration
+   There are other ways of grouping and defining configuration
    options. For example, if you are working with a local clone of the
    kernel repository, you could checkout the kernel's ``meta`` branch,
    make your changes, and then push the changes to the local bare clone
@@ -781,8 +781,8 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
 
    .. note::
 
-      During the checkout operation, a bug exists that could cause
-      errors such as the following to appear:
+      During the checkout operation, there is a bug that could cause
+      errors such as the following:
 
       .. code-block:: none
 
@@ -1306,7 +1306,7 @@ steps:
       $ bitbake linux-yocto -c kernel_configme -f
 
    This step ensures that you create a
-   ``.config`` file from a known state. Because situations exist where
+   ``.config`` file from a known state. Because there are situations where
    your build state might become unknown, it is best to run this task
    prior to starting ``menuconfig``.
 
@@ -1536,7 +1536,7 @@ Working with a "Dirty" Kernel Version String
 ============================================
 
 If you build a kernel image and the version string has a "+" or a
-"-dirty" at the end, uncommitted modifications exist in the kernel's
+"-dirty" at the end, it means there are uncommitted modifications in the kernel's
 source directory. Follow these steps to clean up the version string:
 
 1. *Discover the Uncommitted Changes:* Go to the kernel's locally cloned
@@ -1615,7 +1615,7 @@ Here are some basic steps you can use to work with your own sources:
 
    Running the ``make defconfig`` command results in the default
    configuration for your architecture as defined by your kernel.
-   However, no guarantee exists that this configuration is valid for
+   However, there is no guarantee that this configuration is valid for
    your use case, or that your board will even boot. This is
    particularly true for non-x86 architectures.
 
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 2101f374cb..cf2e75d853 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -213,7 +213,7 @@ BSP-specific commits. In other words, the divisions of the kernel are
 transparent and are not relevant to the developer on a day-to-day basis.
 From the developer's perspective, this path is the "master" branch in
 Git terms. The developer does not need to be aware of the existence of
-any other branches at all. Of course, value exists in the having these
+any other branches at all. Of course, it can make sense to have these
 branches in the tree, should a person decide to explore them. For
 example, a comparison between two BSPs at either the commit level or at
 the line-by-line code ``diff`` level is now a trivial operation.
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index 5592f74c82..e406f6e47f 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -66,9 +66,9 @@ from the continual kernel integration and testing performed during
 development of the Yocto Project.
 
 If, instead, you have a very specific Linux kernel source tree and are
-unable to align with one of the official Yocto Linux kernel recipes, an
-alternative exists by which you can use the Yocto Project Linux kernel
-tools with your own kernel sources.
+unable to align with one of the official Yocto Linux kernel recipes,
+you have a way to use the Yocto Project Linux kernel tools with your
+own kernel sources.
 
 The remainder of this manual provides instructions for completing
 specific Linux kernel development tasks. These instructions assume you
diff --git a/documentation/kernel-dev/maint-appx.rst b/documentation/kernel-dev/maint-appx.rst
index f84ab6e239..3354de5f0c 100644
--- a/documentation/kernel-dev/maint-appx.rst
+++ b/documentation/kernel-dev/maint-appx.rst
@@ -175,7 +175,7 @@ Build Strategy
 Once you have cloned a Yocto Linux kernel repository and the cache
 repository (``yocto-kernel-cache``) onto your development system, you
 can consider the compilation phase of kernel development, which is
-building a kernel image. Some prerequisites exist that are validated by
+building a kernel image. Some prerequisites are validated by
 the build process before compilation starts:
 
 -  The :term:`SRC_URI` points to the
@@ -194,7 +194,7 @@ the build process before compilation starts:
       In the previous example, the "yocto-4.12" branch is checked out in
       the ``yocto-kernel-cache`` repository.
 
-The OpenEmbedded build system makes sure these conditions exist before
+The OpenEmbedded build system makes sure these conditions are satisfied before
 attempting compilation. Other means, however, do exist, such as
 bootstrapping a BSP.
 
-- 
2.25.1

