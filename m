Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3904.1600300777901373160
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 2D09960005;
	Wed, 16 Sep 2020 23:59:35 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 13/16] sphinx: "highlight" some variables, tasks or files
Date: Thu, 17 Sep 2020 01:59:03 +0200
Message-Id: <20200916235906.243174-13-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../brief-yoctoprojectqs.rst                  | 14 ++--
 .../overview-manual-concepts.rst              | 79 ++++++-------------
 .../transitioning-to-a-custom-environment.rst |  8 +-
 3 files changed, 35 insertions(+), 66 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index 6eabf3b80..7e24b9e68 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -131,7 +131,7 @@ Move to the ``poky`` directory and take a look at the tags:
    yocto_1.5_M5.rc8
 
 For this example, check out the branch based on the
-&DISTRO_REL_TAG; release:
+``&DISTRO_REL_TAG;`` release:
 
 .. code-block:: shell
 
@@ -139,8 +139,8 @@ For this example, check out the branch based on the
    Switched to a new branch 'my-&DISTRO_REL_TAG;'
 
 The previous Git checkout command creates a local branch named
-my-&DISTRO_REL_TAG;. The files available to you in that branch exactly
-match the repository's files in the "&DISTRO_NAME_NO_CAP;" development
+``my-&DISTRO_REL_TAG;``. The files available to you in that branch exactly
+match the repository's files in the ``&DISTRO_NAME_NO_CAP;`` development
 branch at the time of the Yocto Project &DISTRO_REL_TAG; release.
 
 For more options and information about accessing Yocto Project related
@@ -317,7 +317,7 @@ Follow these steps to add a hardware layer:
 #. **Change the Configuration to Build for a Specific Machine:** The
    :term:`MACHINE` variable in the
    ``local.conf`` file specifies the machine for the build. For this
-   example, set the ``MACHINE`` variable to "cyclone5". These
+   example, set the ``MACHINE`` variable to ``cyclone5``. These
    configurations are used:
    https://github.com/kraj/meta-altera/blob/master/conf/machine/cyclone5.conf.
 
@@ -351,13 +351,13 @@ Follow these steps to add a hardware layer:
 
 Completing these steps has added the ``meta-altera`` layer to your Yocto
 Project development environment and configured it to build for the
-"cyclone5" machine.
+``cyclone5`` machine.
 
 .. note::
 
    The previous steps are for demonstration purposes only. If you were
-   to attempt to build an image for the "cyclone5" machine, you should
-   read the Altera README.
+   to attempt to build an image for the ``cyclone5`` machine, you should
+   read the Altera ``README``.
 
 Creating Your Own General Layer
 ===============================
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 9bd02a700..08d640a5b 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -278,7 +278,7 @@ development environment.
    The
    scripts/oe-setup-builddir
    script uses the
-   $TEMPLATECONF
+   ``$TEMPLATECONF``
    variable to determine which sample configuration files to locate.
 
 The ``local.conf`` file provides many basic variables that define a
@@ -620,8 +620,7 @@ module.
    For information on how to have the OpenEmbedded build system generate
    tarballs for Git repositories and place them in the
    DL_DIR
-   directory, see the
-   BB_GENERATE_MIRROR_TARBALLS
+   directory, see the :term:`BB_GENERATE_MIRROR_TARBALLS`
    variable in the Yocto Project Reference Manual.
 
 When fetching a repository, BitBake uses the
@@ -1243,9 +1242,9 @@ usually made available in the form of a shared state (sstate) cache.
 .. note::
 
    For information on variables affecting sstate, see the
-   SSTATE_DIR
+   :term:`SSTATE_DIR`
    and
-   SSTATE_MIRRORS
+   :term:`SSTATE_MIRRORS`
    variables.
 
 The idea of a setscene task (i.e ``do_``\ taskname\ ``_setscene``) is a
@@ -1916,25 +1915,15 @@ The following list explains the previous example:
 
    .. note::
 
-      If
-      do_deploy
-      is not already in the shared state cache or if its input checksum
-      (signature) has changed from when the output was cached, the task
-      runs to populate the shared state cache, after which the contents
-      of the shared state cache is copied to
-      ${DEPLOY_DIR_IMAGE}
-      . If
-      do_deploy
-      is in the shared state cache and its signature indicates that the
-      cached output is still valid (i.e. if no relevant task inputs have
-      changed), then the contents of the shared state cache copies
-      directly to
-      ${DEPLOY_DIR_IMAGE}
-      by the
-      do_deploy_setscene
-      task instead, skipping the
-      do_deploy
-      task.
+      If ``do_deploy`` is not already in the shared state cache or if its input
+      checksum (signature) has changed from when the output was cached, the task
+      runs to populate the shared state cache, after which the contents of the
+      shared state cache is copied to ${:term:`DEPLOY_DIR_IMAGE`}. If
+      ``do_deploy`` is in the shared state cache and its signature indicates
+      that the cached output is still valid (i.e. if no relevant task inputs
+      have changed), then the contents of the shared state cache copies
+      directly to ${``DEPLOY_DIR_IMAGE``} by the ``do_deploy_setscene`` task
+      instead, skipping the ``do_deploy`` task.
 
 -  The following task definition is glue logic needed to make the
    previous settings effective:
@@ -1961,18 +1950,9 @@ The following list explains the previous example:
 
    .. note::
 
-      In cases where
-      sstate-inputdirs
-      and
-      sstate-outputdirs
-      would be the same, you can use
-      sstate-plaindirs
-      . For example, to preserve the
-      ${PKGD}
-      and
-      ${PKGDEST}
-      output from the
-      do_package
+      In cases where ``sstate-inputdirs`` and ``sstate-outputdirs`` would be
+      the same, you can use ``sstate-plaindirs``. For example, to preserve the
+      ${:term:`PKGD`} and ${:term:`PKGDEST`} output from the ``do_package``
       task, use the following:
       ::
 
@@ -2016,14 +1996,11 @@ shared state files. Here is an example:
 
 .. note::
 
-   The shared state directory (
-   SSTATE_DIR
-   ) is organized into two-character subdirectories, where the
-   subdirectory names are based on the first two characters of the hash.
-   If the shared state directory structure for a mirror has the same
-   structure as
-   SSTATE_DIR
-   , you must specify "PATH" as part of the URI to enable the build
+   The shared state directory (``SSTATE_DIR``) is organized into two-character
+   subdirectories, where the subdirectory names are based on the first two
+   characters of the hash.
+   If the shared state directory structure for a mirror has the same structure
+   as ``SSTATE_DIR``, you must specify "PATH" as part of the URI to enable the build
    system to map to the appropriate subdirectory.
 
 The shared state package validity can be detected just by looking at the
@@ -2129,17 +2106,9 @@ dependencies, you must manually declare the dependencies.
 
    .. note::
 
-      By default,
-      foo-dev
-      also has an
-      RDEPENDS
-      -style dependency on
-      foo
-      , because the default value of
-      RDEPENDS_${PN}-dev
-      (set in
-      bitbake.conf
-      ) includes "${PN}".
+      By default, ``foo-dev`` also has an ``RDEPENDS``-style dependency on
+      ``foo``, because the default value of ``RDEPENDS_${PN}-dev`` (set in
+      bitbake.conf) includes "${PN}".
 
    To ensure that the dependency chain is never broken, ``-dev`` and
    ``-dbg`` packages are always generated by default, even if the
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 8dfcda379..160152b09 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -47,16 +47,16 @@ Transitioning to a custom environment for systems development
 #. **Based on the layers you've chosen, make needed changes in your
    configuration**.
    For instance, you've chosen a machine type and added in the corresponding BSP
-   layer. You'll then need to change the value of the MACHINE variable in your
+   layer. You'll then need to change the value of the ``MACHINE`` variable in your
    configuration file (build/local.conf) to point to that same machine
    type. There could be other layer-specific settings you need to change as
-   well. Each layer has a README document that you can look at for this type of
+   well. Each layer has a ``README`` document that you can look at for this type of
    usage information.
 
 #. **Add a new layer for any custom recipes and metadata you create**.
-   Use the "bitbake-layers create-layer" tool for Yocto Project 2.4+
+   Use the ``bitbake-layers create-layer`` tool for Yocto Project 2.4+
    releases. If you are using a Yocto Project release earlier than 2.4, use the
-   "yocto-layer create" tool. The "bitbake-layers" tool also provides a number
+   ``yocto-layer create`` tool. The ``bitbake-layers`` tool also provides a number
    of other useful layer-related commands. See
    :ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the
    \`\`bitbake-layers\`\` script` section.
-- 
2.26.2

