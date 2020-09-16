Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3906.1600300778521292904
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id CBB0960002;
	Wed, 16 Sep 2020 23:59:36 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 14/16] sphinx: fix or add missing links and remove mention of Eclipse workflow
Date: Thu, 17 Sep 2020 01:59:04 +0200
Message-Id: <20200916235906.243174-14-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Eclipse plugin has long been gone.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../overview-manual-concepts.rst              | 26 ++++++++-----------
 .../overview-manual-yp-intro.rst              | 15 ++++++-----
 documentation/what-i-wish-id-known.rst        | 25 +++++++++---------
 3 files changed, 31 insertions(+), 35 deletions(-)

diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 08d640a5b..3d8dc7afd 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -1142,15 +1142,12 @@ the extensible SDK (eSDK):
 .. note::
 
    For more information on the cross-development toolchain generation,
-   see the "
-   Cross-Development Toolchain Generation
-   " section. For information on advantages gained when building a
-   cross-development toolchain using the
-   do_populate_sdk
-   task, see the "
-   Building an SDK Installer
-   " section in the Yocto Project Application Development and the
-   Extensible Software Development Kit (eSDK) manual.
+   see the ":ref:`overview-manual/overview-manual-concepts:cross-development toolchain generation`"
+   section. For information on advantages gained when building a
+   cross-development toolchain using the do_populate_sdk task, see the
+   ":ref:`sdk-manual/sdk-appendix-obtain:building an sdk installer`" section in
+   the Yocto Project Application Development and the Extensible Software
+   Development Kit (eSDK) manual.
 
 Like image generation, the SDK script process consists of several stages
 and depends on many variables. The
@@ -1323,9 +1320,8 @@ this output:
 .. note::
 
    For a list of example images that the Yocto Project provides, see the
-   "
-   Images
-   " chapter in the Yocto Project Reference Manual.
+   ":doc:`../ref-manual/ref-images`" chapter in the Yocto Project Reference
+   Manual.
 
 The build process writes images out to the :term:`Build Directory`
 inside the
@@ -1623,9 +1619,9 @@ Here is the bootstrap process for the relocatable toolchain:
 .. note::
 
    For information on advantages gained when building a
-   cross-development toolchain installer, see the "
-   Building an SDK Installer
-   " appendix in the Yocto Project Application Development and the
+   cross-development toolchain installer, see the
+   ":ref:`sdk-manual/sdk-appendix-obtain:building an sdk installer`" appendix
+   in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual.
 
 Shared State Cache
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index dee9922eb..265fbda7f 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -255,7 +255,7 @@ accomplish this through a recipe that is a BitBake append
 .. note::
 
    For general information on BSP layer structure, see the
-   Yocto Project Board Support Packages (BSP) Developer's Guide
+   :doc:`../bsp-guide/bsp-guide`
    .
 
 The :term:`Source Directory`
@@ -557,6 +557,9 @@ targets:
       and conforms to a subset of Debian's policy manual regarding
       control files.
 
+   You can find the opkg source in the Yocto Project
+   :yocto_git:`Source Repositories <>`.
+
 .. _gs-archived-components:
 
 Archived Components
@@ -605,9 +608,8 @@ Project.
 .. note::
 
    For additional detail about the Yocto Project development
-   environment, see the "
-   The Yocto Project Development Environment
-   " chapter.
+   environment, see the ":doc:`overview-manual-development-environment`"
+   chapter.
 
 -  *Native Linux Host:* By far the best option for a Build Host. A
    system running Linux as its native operating system allows you to
@@ -695,9 +697,8 @@ these items that make up the Poky repository in the
 
    If you are interested in all the contents of the
    poky
-   Git repository, see the "
-   Top-Level Core Components
-   " section in the Yocto Project Reference Manual.
+   Git repository, see the ":ref:`ref-manual/ref-structure:top-level core components`"
+   section in the Yocto Project Reference Manual.
 
 The following figure illustrates what generally comprises Poky:
 
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index ea4a3d279..26e26f015 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -190,29 +190,28 @@ contact us with other suggestions.
      contains procedural information grouped to help you get set up, work with
      layers, customize images, write new recipes, work with libraries, and use
      QEMU. The information is task-based and spans the breadth of the Yocto
-     Project.
+     Project. See the :doc:`../dev-manual/dev-manual`.
 
    * **Look Through the Yocto Project Application Development and the Extensible
      Software Development Kit (eSDK) manual**: This manual describes how to use
      both the standard SDK and the extensible SDK, which are used primarily for
-     application development. This manual also provides example workflows that
-     use the popular Eclipse\ |trade| development environment and that use
-     devtool. See the "Workflow using Eclipse\ |trade|" and "Using devtool in
-     your SDK Workflow" sections for more information.
+     application development. The :doc:`../sdk-manual/sdk-extensible` also provides
+     example workflows that use devtool. See the section
+     :ref:`sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow`
+     for more information.
 
    * **Learn About Kernel Development**: If you want to see how to work with the
-     kernel and understand Yocto Linux kernels, see the Yocto Project Linux
-     Kernel Development Manual. This manual provides information on how to patch
-     the kernel, modify kernel recipes, and configure the kernel.
+     kernel and understand Yocto Linux kernels, see the :doc:`../kernel-dev/kernel-dev`.
+     This manual provides information on how to patch the kernel, modify kernel
+     recipes, and configure the kernel.
 
    * **Learn About Board Support Packages (BSPs)**: If you want to learn about
-     BSPs, see the Yocto Project Board Support Packages (BSP) Developer's
-     Guide. This manual also provides an example BSP creation workflow. See the
-     "Developing a Board Support Package (BSP)" section.
+     BSPs, see the :doc:`../bsp-guide/bsp-guide`. This manual also provides an
+     example BSP creation workflow. See the :doc:`../bsp-guide/bsp` section.
 
    * **Learn About Toaster**: Toaster is a web interface to the Yocto Project's
      OpenEmbedded build system. If you are interested in using this type of
-     interface to create images, see the Toaster User Manual.
+     interface to create images, see the :doc:`../toaster-manual/toaster-manual`.
 
    * **Have Available the Yocto Project Reference Manual**: Unlike the rest of
      the Yocto Project manual set, this manual is comprised of material suited
@@ -220,7 +219,7 @@ contact us with other suggestions.
      look at how the pieces of the Yocto Project development environment work
      together, information on various technical details, guidance on migrating
      to a newer Yocto Project release, reference material on the directory
-     structure, classes, and tasks. The Yocto Project Reference Manual also
+     structure, classes, and tasks. The :doc:`../ref-manual/ref-manual` also
      contains a fairly comprehensive glossary of variables used within the Yocto
      Project.
 
-- 
2.26.2

