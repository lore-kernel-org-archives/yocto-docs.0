Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.1330.1603127297102162186
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 10:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.193, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.8
Received: from localhost.localdomain (80-110-110-8.cgn.dynamic.surfer.at [80.110.110.8])
	(Authenticated sender: foss@0leil.net)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPA id 5D730240006;
	Mon, 19 Oct 2020 17:08:13 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.com,
	Quentin Schulz <foss@0leil.net>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [RESEND v2] docs: ref-manual: ref-terms: add links to terms in glossary
Date: Mon, 19 Oct 2020 19:07:01 +0200
Message-Id: <20201019170701.9605-1-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Everything declared in a glossary has a "term-" link that is usable as an
HTML anchor. The link already works, one just cannot get a link from
within the ref-terms page.

Let's make this possible.

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/ref-terms.rst | 48 +++++++++++++-------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index bd8df149e..b4ceebc0b 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -10,7 +10,7 @@ universal, the list includes them just in case:
 
 .. glossary::
 
-   Append Files
+   :term:`Append Files`
       Files that append build information to a recipe file.  Append files are
       known as BitBake append files and ``.bbappend`` files. The OpenEmbedded
       build system expects every append file to have a corresponding recipe
@@ -50,18 +50,18 @@ universal, the list includes them just in case:
          name. You cannot use the wildcard character in any other location of
          the name.
 
-   BitBake
+   :term:`BitBake`
       The task executor and scheduler used by the OpenEmbedded build system to
       build images. For more information on BitBake, see the :doc:`BitBake User
       Manual <bitbake:index>`.
 
-   Board Support Package (BSP)
+   :term:`Board Support Package (BSP)`
       A group of drivers, definitions, and other components that provide support
       for a specific hardware configuration. For more information on BSPs, see
       the :ref:`bsp-guide/bsp-guide:Yocto Project Board Support Package
       Developer's Guide`.
 
-   Build Directory
+   :term:`Build Directory`
       This term refers to the area used by the OpenEmbedded build system for
       builds. The area is created when you ``source`` the setup environment
       script that is found in the Source Directory
@@ -109,19 +109,19 @@ universal, the list includes them just in case:
          drive. Doing so effectively separates ``TMPDIR`` from :term:`TOPDIR`, which is the
          Build Directory.
 
-   Build Host
+   :term:`Build Host`
       The system used to build images in a Yocto Project Development
       environment. The build system is sometimes referred to as the development
       host.
 
-   Classes
+   :term:`Classes`
       Files that provide for logic encapsulation and inheritance so that
       commonly used patterns can be defined once and then easily used in
       multiple recipes. For reference information on the Yocto Project classes,
       see the ":ref:`ref-manual/ref-classes:Classes`" chapter. Class files end with the
       ``.bbclass`` filename extension.
 
-   Configuration File
+   :term:`Configuration File`
       Files that hold global definitions of variables, user-defined variables,
       and hardware configuration information. These files tell the OpenEmbedded
       build system what to build and what to put into the image to support a
@@ -138,13 +138,13 @@ universal, the list includes them just in case:
       :file:`machine/beaglebone.conf` configuration file defines variables for
       the Texas Instruments ARM Cortex-A8 development board).
 
-   Container Layer
+   :term:`Container Layer`
       Layers that hold other layers. An example of a container layer is
       OpenEmbedded's `meta-openembedded
       <https://github.com/openembedded/meta-openembedded>`_ layer. The
       ``meta-openembedded`` layer contains many ``meta-*`` layers.
 
-   Cross-Development Toolchain
+   :term:`Cross-Development Toolchain`
       In general, a cross-development toolchain is a collection of software
       development tools and utilities that run on one architecture and allow you
       to develop software for a different, or targeted, architecture. These
@@ -167,7 +167,7 @@ universal, the list includes them just in case:
       toolchain in the :ref:`sdk-manual/sdk-manual:Yocto Project Application
       Development and the Extensible Software Development Kit (eSDK)` manual.
 
-   Extensible Software Development Kit (eSDK)
+   :term:`Extensible Software Development Kit (eSDK)`
       A custom SDK for application developers. This eSDK allows developers to
       incorporate their library and programming changes back into the image to
       make their code available to other application developers.
@@ -176,14 +176,14 @@ universal, the list includes them just in case:
       Project Application Development and the Extensible Software Development
       Kit (eSDK)` manual.
 
-   Image
+   :term:`Image`
       An image is an artifact of the BitBake build process given a collection of
       recipes and related Metadata. Images are the binary output that run on
       specific hardware or QEMU and are used for specific use-cases. For a list
       of the supported image types that the Yocto Project provides, see the
       ":ref:`ref-manual/ref-images:Images`" chapter.
 
-   Layer
+   :term:`Layer`
       A collection of related recipes. Layers allow you to consolidate related
       metadata to customize your build. Layers also isolate information used
       when building for multiple architectures.  Layers are hierarchical in
@@ -202,7 +202,7 @@ universal, the list includes them just in case:
       Layers`" section in the Yocto Project Board Support Packages (BSP)
       Developer's Guide.
 
-   Metadata
+   :term:`Metadata`
       A key element of the Yocto Project is the Metadata that
       is used to construct a Linux distribution and is contained in the
       files that the :term:`OpenEmbedded Build System`
@@ -221,7 +221,7 @@ universal, the list includes them just in case:
       :yocto_git:`yocto-kernel-cache </cgit/cgit.cgi/yocto-kernel-cache>`
       Git repository.
 
-   OpenEmbedded-Core (OE-Core)
+   :term:`OpenEmbedded-Core (OE-Core)`
       OE-Core is metadata comprised of
       foundational recipes, classes, and associated files that are meant to
       be common among many different OpenEmbedded-derived systems,
@@ -234,7 +234,7 @@ universal, the list includes them just in case:
       You can see the Metadata in the ``meta`` directory of the Yocto
       Project :yocto_git:`Source Repositories </cgit/cgit.cgi/poky>`.
 
-   OpenEmbedded Build System
+   :term:`OpenEmbedded Build System`
       The build system specific to the Yocto
       Project. The OpenEmbedded build system is based on another project
       known as "Poky", which uses :term:`BitBake` as the task
@@ -248,7 +248,7 @@ universal, the list includes them just in case:
 
          For some historical information about Poky, see the :term:`Poky` term.
 
-   Package
+   :term:`Package`
       In the context of the Yocto Project, this term refers to a
       recipe's packaged output produced by BitBake (i.e. a "baked recipe").
       A package is generally the compiled binaries produced from the
@@ -266,7 +266,7 @@ universal, the list includes them just in case:
       :term:`PR`, :term:`PV`, and
       :term:`PE`).
 
-   Package Groups
+   :term:`Package Groups`
       Arbitrary groups of software Recipes. You use
       package groups to hold recipes that, when built, usually accomplish a
       single task. For example, a package group could contain the recipes
@@ -275,7 +275,7 @@ universal, the list includes them just in case:
       is really just another recipe. Because package group files are
       recipes, they end with the ``.bb`` filename extension.
 
-   Poky
+   :term:`Poky`
       Poky, which is pronounced *Pock*-ee, is a reference embedded
       distribution and a reference test configuration. Poky provides the
       following:
@@ -300,7 +300,7 @@ universal, the list includes them just in case:
          OpenedHand, the poky project became the basis for the Yocto
          Project's build system.
 
-   Recipe
+   :term:`Recipe`
       A set of instructions for building packages. A recipe
       describes where you get source code, which patches to apply, how to
       configure the source, how to compile it and so on. Recipes also
@@ -308,13 +308,13 @@ universal, the list includes them just in case:
       represent the logical unit of execution, the software to build, the
       images to build, and use the ``.bb`` file extension.
 
-   Reference Kit
+   :term:`Reference Kit`
       A working example of a system, which includes a
       :term:`BSP<Board Support Package (BSP)>` as well as a
       :term:`build host<Build Host>` and other components, that can
       work on specific hardware.
 
-   Source Directory
+   :term:`Source Directory`
      This term refers to the directory structure
      created as a result of creating a local copy of the ``poky`` Git
      repository ``git://git.yoctoproject.org/poky`` or expanding a
@@ -373,20 +373,20 @@ universal, the list includes them just in case:
      ":ref:`overview-manual/overview-manual-development-environment:repositories, tags, and branches`"
      section in the Yocto Project Overview and Concepts Manual.
 
-   Task
+   :term:`Task`
       A unit of execution for BitBake (e.g.
       :ref:`ref-tasks-compile`,
       :ref:`ref-tasks-fetch`,
       :ref:`ref-tasks-patch`, and so forth).
 
-   Toaster
+   :term:`Toaster`
       A web interface to the Yocto Project's :term:`OpenEmbedded Build System`.
       The interface enables you to
       configure and run your builds. Information about builds is collected
       and stored in a database. For information on Toaster, see the
       :doc:`../toaster-manual/toaster-manual`.
 
-   Upstream
+   :term:`Upstream`
       A reference to source code or repositories that are not
       local to the development system but located in a master area that is
       controlled by the maintainer of the source code. For example, in
-- 
2.26.2

