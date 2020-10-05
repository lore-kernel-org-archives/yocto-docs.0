Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.1542.1601923082374420143
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPA id 7128DC0009;
	Mon,  5 Oct 2020 18:38:00 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2 5/8] docs: ref-manual: fix typos
Date: Mon,  5 Oct 2020 20:37:25 +0200
Message-Id: <20201005183728.9832-5-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005183728.9832-1-foss@0leil.net>
References: <20201005183728.9832-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Quentin Schulz <foss@0leil.net>
---

v2:
 - removed fix for OE_INIT_FILE since the variable's been removed the
patch just before,

 documentation/ref-manual/migration-1.4.rst           |  2 +-
 documentation/ref-manual/migration-2.3.rst           |  2 +-
 documentation/ref-manual/migration-3.1.rst           |  2 +-
 documentation/ref-manual/ref-classes.rst             |  4 ++--
 documentation/ref-manual/ref-system-requirements.rst |  2 +-
 documentation/ref-manual/ref-tasks.rst               | 10 +++++-----
 documentation/ref-manual/ref-terms.rst               |  2 +-
 documentation/ref-manual/ref-variables.rst           |  2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/documentation/ref-manual/migration-1.4.rst b/documentation/ref-manual/migration-1.4.rst
index 231fc95da..daaea0ffa 100644
--- a/documentation/ref-manual/migration-1.4.rst
+++ b/documentation/ref-manual/migration-1.4.rst
@@ -12,7 +12,7 @@ BitBake
 Differences include the following:
 
 -  *Comment Continuation:* If a comment ends with a line continuation
-   (\) character, then the next line must also be a comment. Any
+   (\\) character, then the next line must also be a comment. Any
    instance where this is not the case, now triggers a warning. You must
    either remove the continuation character, or be sure the next line is
    a comment.
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index 60e4b2e45..25c5e0f14 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -481,7 +481,7 @@ The following miscellaneous changes have occurred:
    following:
    ::
 
-      KERNEL_MODULE_PACKAGE_SUFFIX to ""
+      KERNEL_MODULE_PACKAGE_SUFFIX = ""
 
 -  Removal of ``libtool`` ``*.la`` files is now enabled by default. The
    ``*.la`` files are not actually needed on Linux and relocating them
diff --git a/documentation/ref-manual/migration-3.1.rst b/documentation/ref-manual/migration-3.1.rst
index 92c8c7761..4fcd2490d 100644
--- a/documentation/ref-manual/migration-3.1.rst
+++ b/documentation/ref-manual/migration-3.1.rst
@@ -181,7 +181,7 @@ to be changed as a result.
 
 An example of the new scheme: ::
 
-   SRC_URI = "npm://registry.npmjs.org;package=array-flatten;version=1.1.1 \\
+   SRC_URI = "npm://registry.npmjs.org;package=array-flatten;version=1.1.1 \
               npmsw://${THISDIR}/npm-shrinkwrap.json"
 
 Another example where the sources are fetched from git rather than an npm repository: ::
diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index aa5e44069..134564362 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -1388,7 +1388,7 @@ Multiple device trees can be added to the FIT image created by
 ``kernel-fitimage`` and the device tree is optional.
 The address where the device tree is to be loaded by U-boot is
 specified by :term:`UBOOT_DTBO_LOADADDRESS` for device tree overlays
-and by `:term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
+and by :term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
 
 Only a single RAM disk can be added to the FIT image created by
 ``kernel-fitimage`` and the RAM disk in FIT is optional.
@@ -2257,7 +2257,7 @@ The root filesystem is created from packages using one of the
 :term:`PACKAGE_CLASSES` variable.
 
 For information on how root filesystem images are created, see the
-:ref:`image-generation-dev-environment`"
+":ref:`image-generation-dev-environment`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-sanity:
diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 1259fecd4..b03a266ef 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -239,7 +239,7 @@ supported CentOS-8 Linux distribution:
    Yocto Project documentation manuals:
    ::
 
-      $ sudo dnf install docbook-style-dsssl docbook-style-xsl \\
+      $ sudo dnf install docbook-style-dsssl docbook-style-xsl \
       docbook-dtds docbook-utils fop libxslt dblatex xmlto
 
 Required Git, tar, Python and gcc Versions
diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index ec1ecbe70..ca1c56820 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -326,9 +326,9 @@ As mentioned earlier, the build system treats files whose file types are
 file as a patch file:
 ::
 
-   SRC_URI = " \\
-       git://path_to_repo/some_package \\
-       file://file;apply=yes \\
+   SRC_URI = " \
+       git://path_to_repo/some_package \
+       file://file;apply=yes \
        "
 
 Conversely, if you have a directory full of patch files and you want to
@@ -537,7 +537,7 @@ Removes all output files and shared state
 (:ref:`sstate <overview-manual/overview-manual-concepts:shared state cache>`) cache for a
 target. Essentially, the ``do_cleansstate`` task is identical to the
 :ref:`ref-tasks-clean` task with the added removal of
-shared state (`:ref:`sstate <overview-manual/overview-manual-concepts:shared state cache>`)
+shared state (:ref:`sstate <overview-manual/overview-manual-concepts:shared state cache>`)
 cache.
 
 You can run this task using BitBake as follows:
@@ -593,7 +593,7 @@ Lists all defined tasks for a target.
 ``do_package_index``
 --------------------
 
-Creates or updates the index in the `:ref:`package-feeds-dev-environment` area.
+Creates or updates the index in the :ref:`package-feeds-dev-environment` area.
 
 .. note::
 
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index 425490061..276a571fa 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -45,7 +45,7 @@ universal, the list includes them just in case:
 
       .. note::
 
-         The use of the " % " character is limited in that it only works
+         The use of the "%" character is limited in that it only works
          directly in front of the .bbappend portion of the append file's
          name. You cannot use the wildcard character in any other location of
          the name.
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index eb4042b4f..9b90ad6fa 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -4573,7 +4573,7 @@ system and gives an overview of their function and contents.
       recipe:
       ::
 
-         SRC_URI_append_qemuall = "file://wired.config \
+         SRC_URI_append_qemuall = " file://wired.config \
              file://wired-setup \
              "
 
-- 
2.26.2

