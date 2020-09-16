Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3903.1600300777217612516
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 7BC2360004;
	Wed, 16 Sep 2020 23:59:35 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 12/16] sphinx: fix a few typos or missing/too many words
Date: Thu, 17 Sep 2020 01:59:02 +0200
Message-Id: <20200916235906.243174-12-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../brief-yoctoprojectqs/brief-yoctoprojectqs.rst      | 10 +++++-----
 .../overview-manual/overview-manual-concepts.rst       |  8 +++-----
 .../overview-manual/overview-manual-yp-intro.rst       |  8 ++++----
 .../transitioning-to-a-custom-environment.rst          |  4 ++--
 documentation/what-i-wish-id-known.rst                 |  4 ++--
 5 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index 9d8b502f8..6eabf3b80 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -102,7 +102,7 @@ commands to clone the Poky repository.
    remote: Counting
    objects: 432160, done. remote: Compressing objects: 100%
    (102056/102056), done. remote: Total 432160 (delta 323116), reused
-   432037 (delta 323000) Receiving objects: 100% (432160/432160), 153.81 MiB \| 8.54 MiB/s, done.
+   432037 (delta 323000) Receiving objects: 100% (432160/432160), 153.81 MiB | 8.54 MiB/s, done.
    Resolving deltas: 100% (323116/323116), done.
    Checking connectivity... done.
 
@@ -287,7 +287,7 @@ Follow these steps to add a hardware layer:
    This example adds the
    `meta-altera <https://github.com/kraj/meta-altera>`__ hardware layer.
 
-#. **Clone the Layer** Use Git to make a local copy of the layer on your
+#. **Clone the Layer:** Use Git to make a local copy of the layer on your
    machine. You can put the copy in the top level of the copy of the
    Poky repository created earlier:
 
@@ -299,7 +299,7 @@ Follow these steps to add a hardware layer:
       remote: Counting objects: 25170, done.
       remote: Compressing objects: 100% (350/350), done.
       remote: Total 25170 (delta 645), reused 719 (delta 538), pack-reused 24219
-      Receiving objects: 100% (25170/25170), 41.02 MiB \| 1.64 MiB/s, done.
+      Receiving objects: 100% (25170/25170), 41.02 MiB | 1.64 MiB/s, done.
       Resolving deltas: 100% (13385/13385), done.
       Checking connectivity... done.
 
@@ -340,7 +340,7 @@ Follow these steps to add a hardware layer:
       $ cd ~/poky/build
       $ bitbake-layers add-layer ../meta-altera
       NOTE: Starting bitbake server...
-      Parsing recipes: 100% \|##################################################################\| Time: 0:00:32
+      Parsing recipes: 100% |##################################################################| Time: 0:00:32
       Parsing of 918 .bb files complete (0 cached, 918 parsed). 1401 targets,
       123 skipped, 0 masked, 0 errors.
 
@@ -388,7 +388,7 @@ Where To Go Next
 ================
 
 Now that you have experienced using the Yocto Project, you might be
-asking yourself "What now?" The Yocto Project has many sources of
+asking yourself "What now?". The Yocto Project has many sources of
 information including the website, wiki pages, and user manuals:
 
 -  **Website:** The :yocto_home:`Yocto Project Website <>` provides
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 935c01805..9bd02a700 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -787,7 +787,7 @@ Build Directory's hierarchy:
 -  :term:`PN`: The name of the recipe used
    to build the package. This variable can have multiple meanings.
    However, when used in the context of input files, ``PN`` represents
-   the the name of the recipe.
+   the name of the recipe.
 
 -  :term:`WORKDIR`: The location
    where the OpenEmbedded build system builds a recipe (i.e. does the
@@ -1125,8 +1125,7 @@ build system has created the final image output files.
 .. note::
 
    The entire image generation process is run under
-   Pseudo
-   . Running under Pseudo ensures that the files in the root filesystem
+   Pseudo. Running under Pseudo ensures that the files in the root filesystem
    have correct ownership.
 
 .. _sdk-generation-dev-environment:
@@ -1736,8 +1735,7 @@ objective of making native or cross packages relocatable.
 .. note::
 
    Both native and cross packages run on the
-   build host
-   . However, cross packages generate output for the target
+   build host. However, cross packages generate output for the target
    architecture.
 
 The checksum therefore needs to exclude ``WORKDIR``. The simplistic
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index c83290ed5..dee9922eb 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -134,7 +134,7 @@ Project:
 -  *License Manifest:* The Yocto Project provides a :ref:`license
    manifest <dev-manual/dev-manual-common-tasks:maintaining open source license compliance during your product's lifecycle>`
    for review by people who need to track the use of open source
-   licenses (e.g.legal teams).
+   licenses (e.g. legal teams).
 
 .. _gs-challenges:
 
@@ -540,7 +540,7 @@ targets:
    You can find the Matchbox source in the Yocto Project
    :yocto_git:`Source Repositories <>`.
 
--  *Opkg* Open PacKaGe management (opkg) is a lightweight package
+-  *Opkg:* Open PacKaGe management (opkg) is a lightweight package
    management system based on the itsy package (ipkg) management system.
    Opkg is written in C and resembles Advanced Package Tool (APT) and
    Debian Package (dpkg) in operation.
@@ -655,7 +655,7 @@ Project.
    virtualization technology.
 
    For information on how to set up a Build Host with WSLv2, see the
-   ":ref:dev-manual/dev-manual-start:setting up to use windows subsystem for linux (wslv2)`"
+   ":ref:`dev-manual/dev-manual-start:setting up to use windows subsystem for linux (wslv2)`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Toaster:* Regardless of what your Build Host is running, you can use
@@ -743,7 +743,7 @@ and Fall. For more information on the Yocto Project release schedule and
 cadence, see the ":doc:`../ref-manual/ref-release-process`" chapter in the
 Yocto Project Reference Manual.
 
-Much has been said about Poky being a "default configuration." A default
+Much has been said about Poky being a "default configuration". A default
 configuration provides a starting image footprint. You can use Poky out
 of the box to create an image ranging from a shell-accessible minimal
 image all the way up to a Linux Standard Base-compliant image that uses
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 43a646d87..8dfcda379 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -11,7 +11,7 @@ Transitioning to a custom environment for systems development
    So you've finished the :doc:`brief-yoctoprojectqs/brief-yoctoprojectqs` and
    glanced over the document :doc:`what-i-wish-id-known`, the latter contains
    important information learned from other users. You're well prepared. But
-   now, as you are starting your own project, isn't exactly straightforward what
+   now, as you are starting your own project, it isn't exactly straightforward what
    to do. And, the documentation is daunting. We've put together a few hints to
    get you started.
 
@@ -67,7 +67,7 @@ Transitioning to a custom environment for systems development
    BSP, :ref:`create your own layer for the BSP <bsp-guide/bsp:creating a new
    bsp layer using the \`\`bitbake-layers\`\` script>`. For example, given a
    64-bit x86-based machine, copy the conf/intel-corei7-64 definition and give
-   it a machine a relevant name (think board name, not product name). Make sure
+   the machine a relevant name (think board name, not product name). Make sure
    the layer configuration is dependent on the meta-intel layer (or at least,
    meta-intel remains in your bblayers.conf). Now you can put your custom BSP
    settings into your layer and you can re-use it for different applications.
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 05d1aa35b..ea4a3d279 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -85,7 +85,7 @@ contact us with other suggestions.
    pinpoint where trouble is occurring and how the build is breaking. The
    workflow breaks down into the following steps:
 
-   #. Fetch – get the sourcecode
+   #. Fetch – get the source code
    #. Extract – unpack the sources
    #. Patch – apply patches for bug fixes and new capability
    #. Configure – set up your environment specifications
@@ -105,7 +105,7 @@ contact us with other suggestions.
    You can use the "-g" option with BitBake to generate this graph.  When you
    start a build and the build breaks, you could see packages you have no clue
    about or have any idea why the build system has included them.  The
-   dependency graph can clarify that confustion.  You can learn more about
+   dependency graph can clarify that confusion.  You can learn more about
    dependency graphs and how to generate them in the
    :ref:`bitbake-user-manual/bitbake-user-manual-intro:generating dependency
    graphs` section in the BitBake User Manual.
-- 
2.26.2

