Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99E0C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 09:42:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.9541.1670492527343742713
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Dec 2022 01:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NPjJeCGe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F36D820011;
	Thu,  8 Dec 2022 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670492525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VhCpKYQRhjPLBNDw397LhrqYY3poe1Xoc1FAkCJe7jM=;
	b=NPjJeCGe6+zHhkvi/0tGHZNbs6n5ohFrhw/RsdMa02QnrtVHl04MA11btf7j9Hm62DQ672
	makFarOkoGi0hgXLHwJpps4RTqmuLusbhshJgqNC1M3Fka3CWVyV+dn4I6kZGXbsB7vduy
	WBMXC0Xm9EyNAgtyx5mOiLKEH2XCAJOsJLZ6pBRz83YUqqmGw8jPAw1XZWPYHdwGBP6gFL
	jkKvPlB0CUh5SUGO13TwUjOSdAqvyF7ANdWXDOkwE8liWbxyUPXnokKpgLyNdrsPQUbD/e
	GPIA4YRquPjlwFu5bnzQmwcZpT98HPtSnUyZ9dcySKqfD5GW/fdG3nwEB2/7Sw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: fix double colons
Date: Thu,  8 Dec 2022 10:41:58 +0100
Message-Id: <20221208094158.532375-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Dec 2022 09:42:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3523

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fixing double colons appearing alone on a line, while
they could be put at the end of the previous line.

Sometimes placing a note after the quoted text
to avoid such a situation. It's more natural too
not to have a note between the introduction text
and the quoted section.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Note: instances to replace detected by the following command:
git grep "^\s*\:\:\s*$"
---
 documentation/dev-manual/debugging.rst        |  6 +--
 .../dev-manual/error-reporting-tool.rst       |  3 +-
 documentation/dev-manual/licenses.rst         |  3 +-
 documentation/dev-manual/new-recipe.rst       | 16 +++----
 documentation/dev-manual/qemu.rst             | 20 +++------
 documentation/dev-manual/quilt.rst            |  3 +-
 documentation/dev-manual/runtime-testing.rst  |  3 +-
 .../dev-manual/upgrading-recipes.rst          | 14 +++---
 documentation/dev-manual/wic.rst              |  6 +--
 documentation/kernel-dev/advanced.rst         | 15 +++----
 documentation/kernel-dev/common.rst           | 43 ++++++++-----------
 .../migration-guides/migration-2.2.rst        | 12 +++---
 .../ref-manual/devtool-reference.rst          |  7 +--
 documentation/ref-manual/variables.rst        | 36 ++++++----------
 documentation/sdk-manual/appendix-obtain.rst  |  3 +-
 documentation/sdk-manual/extensible.rst       | 27 +++++-------
 documentation/sdk-manual/using.rst            | 21 ++++-----
 documentation/sdk-manual/working-projects.rst | 15 +++----
 18 files changed, 94 insertions(+), 159 deletions(-)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index ef296de7ac..f433e8e6a9 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -327,8 +327,7 @@ BitBake has determined by doing the following:
    In the output of the above command, you will find a line like the
    following, which lists all the (inferred) variable dependencies for
    the task. This list also includes indirect dependencies from
-   variables depending on other variables, recursively.
-   ::
+   variables depending on other variables, recursively::
 
       Task dependencies: ['PV', 'SRCREV', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]', 'base_do_fetch']
 
@@ -641,8 +640,7 @@ The syntax you use for recipes written in Bash is similar to that of
 recipes written in Python described in the previous section.
 
 Following is an example written in Bash. The code logs the progress of
-the ``do_my_function`` function.
-::
+the ``do_my_function`` function::
 
    do_my_function() {
        bbdebug 2 "Running do_my_function"
diff --git a/documentation/dev-manual/error-reporting-tool.rst b/documentation/dev-manual/error-reporting-tool.rst
index a2636da37a..6854f1046a 100644
--- a/documentation/dev-manual/error-reporting-tool.rst
+++ b/documentation/dev-manual/error-reporting-tool.rst
@@ -71,8 +71,7 @@ Disabling the Tool
 
 To disable the error reporting feature, simply remove or comment out the
 following statement from the end of your ``local.conf`` file in your
-:term:`Build Directory`.
-::
+:term:`Build Directory`::
 
    INHERIT += "report-error"
 
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 0db193f7e4..0f8d759519 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -154,8 +154,7 @@ or characters. A partial string will match any license that contains the
 given string as the first portion of its license. For example, the
 following value will also match both of the packages
 previously mentioned as well as any other packages that have licenses
-starting with "commercial" or "license".
-::
+starting with "commercial" or "license"::
 
    LICENSE_FLAGS_ACCEPTED = "commercial license"
 
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 2e9c2089f7..3adebf2746 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -109,8 +109,7 @@ Following are some syntax examples:
 
  - Use this syntax to generate a recipe using code that
    you extract from source. The extracted code is placed in its own layer
-   defined by :term:`EXTERNALSRC`.
-   ::
+   defined by :term:`EXTERNALSRC`::
 
       recipetool create -o OUTFILE -x EXTERNALSRC source
 
@@ -147,8 +146,7 @@ get started. Here are some points on both methods:
 -  *Use and modify the following skeleton recipe:* If for some reason
    you do not want to use ``recipetool`` and you cannot find an existing
    recipe that is close to meeting your needs, you can use the following
-   structure to provide the fundamental areas of a new recipe.
-   ::
+   structure to provide the fundamental areas of a new recipe::
 
       DESCRIPTION = ""
       HOMEPAGE = ""
@@ -347,9 +345,7 @@ paste them into your recipe and then run the build again to continue.
 This final example is a bit more complicated and is from the
 ``meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb`` recipe. The
 example's :term:`SRC_URI` statement identifies multiple files as the source
-files for the recipe: a tarball, a patch file, a desktop file, and an
-icon.
-::
+files for the recipe: a tarball, a patch file, a desktop file, and an icon::
 
    SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
               file://xwc.patch \
@@ -1196,8 +1192,7 @@ under ``files``) requires a recipe that has the file listed in the
 :ref:`ref-tasks-compile` and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
 directory containing the source code, which is set to
 :term:`WORKDIR` in this case --- the
-directory BitBake uses for the build.
-::
+directory BitBake uses for the build::
 
    SUMMARY = "Simple helloworld application"
    SECTION = "examples"
@@ -1233,8 +1228,7 @@ which contains the definitions of all the steps needed to build an
 Autotool-based application. The result of the build is automatically
 packaged. And, if the application uses NLS for localization, packages
 with local information are generated (one package per language).
-Following is one example: (``hello_2.3.bb``)
-::
+Following is one example: (``hello_2.3.bb``)::
 
    SUMMARY = "GNU Helloworld application"
    SECTION = "examples"
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 504fcbdd8d..084e67580d 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -103,7 +103,9 @@ available. Follow these general steps to run QEMU:
       automatically finds the ``bzImage-qemux86-64.bin`` image file and
       the ``core-image-minimal-qemux86-64-20200218002850.rootfs.ext4``
       (assuming the current build created a ``core-image-minimal``
-      image).
+      image)::
+
+        $ runqemu qemux86-64
 
       .. note::
 
@@ -111,14 +113,9 @@ available. Follow these general steps to run QEMU:
          and uses the most recently built image according to the
          timestamp.
 
-      ::
-
-        $ runqemu qemux86-64
-
    -  This example produces the exact same results as the previous
       example. This command, however, specifically provides the image
-      and root filesystem type.
-      ::
+      and root filesystem type::
 
          $ runqemu qemux86-64 core-image-minimal ext4
 
@@ -127,23 +124,20 @@ available. Follow these general steps to run QEMU:
       variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be enabled,
       an appropriate driver must be installed (see the ``audio`` option
       in :ref:`dev-manual/qemu:\`\`runqemu\`\` command-line options`
-      for more information).
-      ::
+      for more information)::
 
          $ runqemu qemux86-64 ramfs audio
 
    -  This example does not provide enough information for QEMU to
       launch. While the command does provide a root filesystem type, it
-      must also minimally provide a `MACHINE`, `KERNEL`, or `VM` option.
-      ::
+      must also minimally provide a `MACHINE`, `KERNEL`, or `VM` option::
 
          $ runqemu ext4
 
    -  This example specifies to boot a virtual machine image
       (``.wic.vmdk`` file). From the ``.wic.vmdk``, ``runqemu``
       determines the QEMU architecture (`MACHINE`) to be "qemux86-64" and
-      the root filesystem type to be "vmdk".
-      ::
+      the root filesystem type to be "vmdk"::
 
          $ runqemu /home/scott-lenovo/vm/core-image-minimal-qemux86-64.wic.vmdk
 
diff --git a/documentation/dev-manual/quilt.rst b/documentation/dev-manual/quilt.rst
index d1b605bcd5..1dd9ff02d4 100644
--- a/documentation/dev-manual/quilt.rst
+++ b/documentation/dev-manual/quilt.rst
@@ -67,8 +67,7 @@ Follow these general steps:
 
 7. *Generate the Patch:* Once your changes work as expected, you need to
    use Quilt to generate the final patch that contains all your
-   modifications.
-   ::
+   modifications::
 
       $ quilt refresh
 
diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index 24f3dd1511..88b3ed541b 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -578,8 +578,7 @@ data:
 
 Following is an example JSON file that handles test "foo" installing
 package "bar" and test "foobar" installing packages "foo" and "bar".
-Once the test is complete, the packages are removed from the DUT.
-::
+Once the test is complete, the packages are removed from the DUT::
 
      {
          "foo": {
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index a0856f43da..c41e3e1a5d 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -260,14 +260,7 @@ your build configuration (i.e. ``${BUILDDIR}/conf/bblayers.conf``)::
 For this example, assume that the ``nano.bb`` recipe that
 is upstream has a 2.9.3 version number. However, the version in the
 local repository is 2.7.4. The following command from your build
-directory automatically upgrades the recipe for you:
-
-.. note::
-
-   Using the ``-V`` option is not necessary. Omitting the version number causes
-   ``devtool upgrade`` to upgrade the recipe to the most recent version.
-
-::
+directory automatically upgrades the recipe for you::
 
    $ devtool upgrade nano -V 2.9.3
    NOTE: Starting bitbake server...
@@ -286,6 +279,11 @@ directory automatically upgrades the recipe for you:
    NOTE: Upgraded source extracted to /home/scottrif/poky/build/workspace/sources/nano
    NOTE: New recipe is /home/scottrif/poky/build/workspace/recipes/nano/nano_2.9.3.bb
 
+.. note::
+
+   Using the ``-V`` option is not necessary. Omitting the version number causes
+   ``devtool upgrade`` to upgrade the recipe to the most recent version.
+
 Continuing with this example, you can use ``devtool build`` to build the
 newly upgraded recipe::
 
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index d2f7bd0130..7ed887b270 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -539,8 +539,7 @@ will need to boot from ``sdb`` instead of ``sda``, which is what the
 
 The example begins by making a copy of the ``directdisk-gpt.wks`` file
 in the ``scripts/lib/image/canned-wks`` directory and then by changing
-the lines that specify the target disk from which to boot.
-::
+the lines that specify the target disk from which to boot::
 
    $ cp /home/stephano/yocto/poky/scripts/lib/wic/canned-wks/directdisk-gpt.wks \
         /home/stephano/yocto/poky/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
@@ -557,8 +556,7 @@ Once the lines are changed, the
 example generates the ``directdisksdb-gpt`` image. The command points
 the process at the ``core-image-minimal`` artifacts for the Next Unit of
 Computing (nuc) :term:`MACHINE` the
-``local.conf``.
-::
+``local.conf``::
 
    $ wic create directdisksdb-gpt -e core-image-minimal
    INFO: Building wic-tools...
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index b16b3e0517..401f5a7a96 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -566,15 +566,7 @@ Example
 Many real-world examples are more complex. Like any other ``.scc`` file,
 BSP descriptions can aggregate features. Consider the Minnow BSP
 definition given the ``linux-yocto-4.4`` branch of the
-``yocto-kernel-cache`` (i.e.
-``yocto-kernel-cache/bsp/minnow/minnow.scc``):
-
-.. note::
-
-   Although the Minnow Board BSP is unused, the Metadata remains and is
-   being used here just as an example.
-
-::
+``yocto-kernel-cache`` (i.e.  ``yocto-kernel-cache/bsp/minnow/minnow.scc``)::
 
    include cfg/x86.scc
    include features/eg20t/eg20t.scc
@@ -597,6 +589,11 @@ definition given the ``linux-yocto-4.4`` branch of the
    kconf hardware minnow.cfg
    kconf hardware minnow-dev.cfg
 
+.. note::
+
+   Although the Minnow Board BSP is unused, the Metadata remains and is
+   being used here just as an example.
+
 The ``minnow.scc`` description file includes a hardware configuration
 fragment (``minnow.cfg``) specific to the Minnow BSP as well as several
 more general configuration fragments and features enabling hardware
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index e9660dd4e6..c4c1f629a6 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -166,8 +166,7 @@ section:
    checked out for ``poky`` is the Yocto Project &DISTRO_NAME; branch. If
    you need to checkout out the &DISTRO_NAME; branch, see the
    ":ref:`dev-manual/start:checking out by branch in poky`"
-   section in the Yocto Project Development Tasks Manual.
-   ::
+   section in the Yocto Project Development Tasks Manual::
 
       $ cd poky
       $ git branch
@@ -244,16 +243,7 @@ section:
    ``standard/base`` branch.
 
    The following commands show how to create a local copy of the
-   ``linux-yocto-4.12`` kernel and be in the ``standard/base`` branch.
-
-   .. note::
-
-      The ``linux-yocto-4.12`` kernel can be used with the Yocto Project 2.4
-      release and forward.
-      You cannot use the ``linux-yocto-4.12`` kernel with releases prior to
-      Yocto Project 2.4.
-
-   ::
+   ``linux-yocto-4.12`` kernel and be in the ``standard/base`` branch::
 
       $ cd ~
       $ git clone git://git.yoctoproject.org/linux-yocto-4.12 --branch standard/base
@@ -265,6 +255,13 @@ section:
       Resolving deltas: 100% (5152604/5152604), done. Checking connectivity... done.
       Checking out files: 100% (59846/59846), done.
 
+   .. note::
+
+      The ``linux-yocto-4.12`` kernel can be used with the Yocto Project 2.4
+      release and forward.
+      You cannot use the ``linux-yocto-4.12`` kernel with releases prior to
+      Yocto Project 2.4.
+
 6. *Create a Local Copy of the Kernel Cache Git Repository:* For
    simplicity, it is recommended that you create your copy of the kernel
    cache Git repository outside of the
@@ -428,8 +425,7 @@ As an example, consider the following append file used by the BSPs in
 
 Here are the contents of this file. Be aware that the actual commit ID
 strings in this example listing might be different than the actual
-strings in the file from the ``meta-yocto-bsp`` layer upstream.
-::
+strings in the file from the ``meta-yocto-bsp`` layer upstream::
 
    KBRANCH:genericx86  = "standard/base"
    KBRANCH:genericx86-64  = "standard/base"
@@ -490,8 +486,7 @@ For example, suppose you had some configuration options in a file called
 ``network_configs.cfg``. You can place that file inside a directory
 named ``linux-yocto`` and then add a :term:`SRC_URI` statement such as the
 following to the append file. When the OpenEmbedded build system builds
-the kernel, the configuration options are picked up and applied.
-::
+the kernel, the configuration options are picked up and applied::
 
    SRC_URI += "file://network_configs.cfg"
 
@@ -766,7 +761,10 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
 
 4. *Create the Image With the New Kernel:* Use the
    ``devtool build-image`` command to create a new image that has the
-   new kernel.
+   new kernel::
+
+      $ cd ~
+      $ devtool build-image core-image-minimal
 
    .. note::
 
@@ -776,11 +774,6 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
       :yocto_wiki:`TipsAndTricks/KernelDevelopmentWithEsdk </TipsAndTricks/KernelDevelopmentWithEsdk>`
       Wiki Page.
 
-   ::
-
-      $ cd ~
-      $ devtool build-image core-image-minimal
-
 5. *Test the New Image:* For this example, you can run the new image
    using QEMU to verify your changes:
 
@@ -812,8 +805,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
 
 7. *Export the Patches and Create an Append File:* To export your
    commits as patches and create a ``.bbappend`` file, use the following
-   command. This example uses the previously established layer named ``meta-mylayer``.
-   ::
+   command. This example uses the previously established layer named ``meta-mylayer``::
 
       $ devtool finish linux-yocto ~/meta-mylayer
 
@@ -1760,8 +1752,7 @@ Here is an example that looks at what has changed in the ``emenlow``
 branch of the ``linux-yocto-3.19`` kernel. The lower commit range is the
 commit associated with the ``standard/base`` branch, while the upper
 commit range is the commit associated with the ``standard/emenlow``
-branch.
-::
+branch::
 
    $ git whatchanged origin/standard/base..origin/standard/emenlow
 
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 82c8e52df5..751fa06ee8 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -184,13 +184,7 @@ root filesystem, provides an image, and uses the ``nographic`` option::
    $ runqemu qemux86-64 tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4 tmp/deploy/images/qemux86-64/bzImage nographic
 
 Following is a list of variables that can be set in configuration files
-such as ``bsp.conf`` to enable the BSP to be booted by ``runqemu``:
-
-.. note::
-
-   "QB" means "QEMU Boot".
-
-::
+such as ``bsp.conf`` to enable the BSP to be booted by ``runqemu``::
 
    QB_SYSTEM_NAME: QEMU name (e.g. "qemu-system-i386")
    QB_OPT_APPEND: Options to append to QEMU (e.g. "-show-cursor")
@@ -223,6 +217,10 @@ such as ``bsp.conf`` to enable the BSP to be booted by ``runqemu``:
 To use ``runqemu``, set :term:`IMAGE_CLASSES` as
 follows and run ``runqemu``:
 
+.. note::
+
+   "QB" means "QEMU Boot".
+
 .. note::
 
    For command-line syntax, use ``runqemu help``.
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index c2e1c2c29b..6aa09f6d6f 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -385,9 +385,7 @@ want to use it because the dependency on ``cdebconf`` is not easily
 satisfied. Maintainers can explicit the reason that is shown by adding
 the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
 See :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
-for an example.
-
-::
+for an example::
 
    $ devtool check-upgrade-status
    ...
@@ -555,8 +553,7 @@ Use the ``devtool undeploy-target`` command to remove deployed build
 output from the target machine. For the ``devtool undeploy-target``
 command to work, you must have previously used the
 ":ref:`devtool deploy-target <ref-manual/devtool-reference:deploying your software on the target machine>`"
-command.
-::
+command::
 
    $ devtool undeploy-target recipe target
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 99100498b7..3190020aaf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -250,8 +250,7 @@ system and gives an overview of their function and contents.
       Azure Storage Shared Access Signature, when using the
       :ref:`Azure Storage fetcher (az://) <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
       This variable can be defined to be used by the fetcher to authenticate
-      and gain access to non-public artifacts.
-      ::
+      and gain access to non-public artifacts::
 
          AZ_SAS = ""se=2021-01-01&sp=r&sv=2018-11-09&sr=c&skoid=<skoid>&sig=<signature>""
 
@@ -324,8 +323,7 @@ system and gives an overview of their function and contents.
 
       -  There is limited support for wildcard matching against the beginning of
          host names. For example, the following setting matches
-         ``git.gnu.org``, ``ftp.gnu.org``, and ``foo.git.gnu.org``.
-         ::
+         ``git.gnu.org``, ``ftp.gnu.org``, and ``foo.git.gnu.org``::
 
             BB_ALLOWED_NETWORKS = "*.gnu.org"
 
@@ -529,8 +527,7 @@ system and gives an overview of their function and contents.
 
       For performance reasons, creating and placing tarballs of these
       repositories is not the default action by the OpenEmbedded build
-      system.
-      ::
+      system::
 
          BB_GENERATE_MIRROR_TARBALLS = "1"
 
@@ -3020,8 +3017,7 @@ system and gives an overview of their function and contents.
          :term:`IMAGE_LINGUAS` appropriately.
 
       You can set :term:`GLIBC_GENERATE_LOCALES` in your ``local.conf`` file.
-      By default, all locales are generated.
-      ::
+      By default, all locales are generated::
 
          GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
 
@@ -5889,8 +5885,7 @@ system and gives an overview of their function and contents.
 
       Consider the following :term:`PACKAGECONFIG` block taken from the
       ``librsvg`` recipe. In this example the feature is ``gtk``, which has
-      three arguments that determine the feature's behavior.
-      ::
+      three arguments that determine the feature's behavior::
 
          PACKAGECONFIG[gtk] = "--with-gtk3,--without-gtk3,gtk+3"
 
@@ -7821,8 +7816,7 @@ system and gives an overview of their function and contents.
       If a mirror uses the same structure as
       :term:`SSTATE_DIR`, you need to add "PATH" at the
       end as shown in the examples below. The build system substitutes the
-      correct path within the directory structure.
-      ::
+      correct path within the directory structure::
 
          SSTATE_MIRRORS ?= "\
              file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
@@ -8616,8 +8610,7 @@ system and gives an overview of their function and contents.
 
       Alternatively, you can
       provide the "auto" option to have all applicable tests run against
-      the image.
-      ::
+      the image::
 
          TEST_SUITES:append = " auto"
 
@@ -9115,8 +9108,7 @@ system and gives an overview of their function and contents.
       releases are not identified by Git tags, set :term:`UPSTREAM_CHECK_COMMITS`
       to ``1`` in the recipe, and the OpenEmbedded build system
       will compare the latest commit with the one currently specified
-      by the recipe (:term:`SRCREV`).
-      ::
+      by the recipe (:term:`SRCREV`)::
 
          UPSTREAM_CHECK_COMMITS = "1"
 
@@ -9129,8 +9121,7 @@ system and gives an overview of their function and contents.
 
       You can use the :term:`UPSTREAM_CHECK_GITTAGREGEX` variable to provide a
       regular expression to filter only the relevant tags should the
-      default filter not work correctly.
-      ::
+      default filter not work correctly::
 
          UPSTREAM_CHECK_GITTAGREGEX = "git_tag_regex"
 
@@ -9138,8 +9129,7 @@ system and gives an overview of their function and contents.
       Use the :term:`UPSTREAM_CHECK_REGEX` variable to specify a different
       regular expression instead of the default one when the package
       checking system is parsing the page found using
-      :term:`UPSTREAM_CHECK_URI`.
-      ::
+      :term:`UPSTREAM_CHECK_URI`::
 
          UPSTREAM_CHECK_REGEX = "package_regex"
 
@@ -9150,8 +9140,7 @@ system and gives an overview of their function and contents.
       determined by fetching the directory listing where the tarball is and
       attempting to find a later tarball. When this approach does not work,
       you can use :term:`UPSTREAM_CHECK_URI` to provide a different URI that
-      contains the link to the latest tarball.
-      ::
+      contains the link to the latest tarball::
 
          UPSTREAM_CHECK_URI = "recipe_url"
 
@@ -9162,8 +9151,7 @@ system and gives an overview of their function and contents.
       :term:`UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHECK_COMMITS` variables in
       the recipe allows to determine what the latest upstream version is,
       you can set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1`` in the recipe
-      to acknowledge that the check cannot be performed.
-      ::
+      to acknowledge that the check cannot be performed::
 
          UPSTREAM_VERSION_UNKNOWN = "1"
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index b90247d2e0..fa82af5c22 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -111,8 +111,7 @@ build the SDK installer. Follow these steps:
    the Source Directory (i.e. ``poky``), run the
    :ref:`structure-core-script` environment
    setup script to define the OpenEmbedded build environment on your
-   build host.
-   ::
+   build host::
 
       $ source oe-init-build-env
 
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 4d36270e64..7ab43e0a9d 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -138,16 +138,7 @@ must be writable for whichever users need to use the SDK.
 The following command shows how to run the installer given a toolchain
 tarball for a 64-bit x86 development host system and a 64-bit x86 target
 architecture. The example assumes the SDK installer is located in
-``~/Downloads/`` and has execution rights.
-
-.. note::
-
-   If you do not have write permissions for the directory into which you
-   are installing the SDK, the installer notifies you and exits. For
-   that case, set up the proper permissions in the directory and run the
-   installer again.
-
-::
+``~/Downloads/`` and has execution rights::
 
    $ ./Downloads/poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-ext-2.5.sh
    Poky (Yocto Project Reference Distro) Extensible SDK installer version 2.5
@@ -168,6 +159,13 @@ architecture. The example assumes the SDK installer is located in
    Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
     $ . /home/scottrif/poky_sdk/environment-setup-core2-64-poky-linux
 
+.. note::
+
+   If you do not have write permissions for the directory into which you
+   are installing the SDK, the installer notifies you and exits. For
+   that case, set up the proper permissions in the directory and run the
+   installer again.
+
 Running the Extensible SDK Environment Setup Script
 ===================================================
 
@@ -406,8 +404,7 @@ command:
    creates any patches corresponding to commits in the local Git
    repository, moves the new recipe to a more permanent layer, and then
    resets the recipe so that the recipe is built normally rather than
-   from the workspace.
-   ::
+   from the workspace::
 
       $ devtool finish recipe layer
 
@@ -605,8 +602,7 @@ command:
    repository, updates the recipe to point to them (or creates a
    ``.bbappend`` file to do so, depending on the specified destination
    layer), and then resets the recipe so that the recipe is built
-   normally rather than from the workspace.
-   ::
+   normally rather than from the workspace::
 
       $ devtool finish recipe layer
 
@@ -780,8 +776,7 @@ The following diagram shows the common development flow used with the
 
    If you specify a destination layer that is the same as the original
    source, then the old version of the recipe and associated files are
-   removed prior to adding the new version.
-   ::
+   removed prior to adding the new version::
 
       $ devtool finish recipe layer
 
diff --git a/documentation/sdk-manual/using.rst b/documentation/sdk-manual/using.rst
index 301627812c..f1ff0c76ca 100644
--- a/documentation/sdk-manual/using.rst
+++ b/documentation/sdk-manual/using.rst
@@ -52,8 +52,7 @@ libraries appropriate for developing against the corresponding image.
 
 The names of the tarball installer scripts are such that a string
 representing the host system appears first in the filename and then is
-immediately followed by a string representing the target architecture.
-::
+immediately followed by a string representing the target architecture::
 
    poky-glibc-host_system-image_type-arch-toolchain-release_version.sh
 
@@ -97,16 +96,7 @@ must be writable for whichever users need to use the SDK.
 The following command shows how to run the installer given a toolchain
 tarball for a 64-bit x86 development host system and a 64-bit x86 target
 architecture. The example assumes the SDK installer is located in
-``~/Downloads/`` and has execution rights.
-
-.. note::
-
-   If you do not have write permissions for the directory into which you
-   are installing the SDK, the installer notifies you and exits. For
-   that case, set up the proper permissions in the directory and run the
-   installer again.
-
-::
+``~/Downloads/`` and has execution rights::
 
    $ ./Downloads/poky-glibc-x86_64-core-image-sato-i586-toolchain-&DISTRO;.sh
    Poky (Yocto Project Reference Distro) SDK installer version &DISTRO;
@@ -119,6 +109,13 @@ architecture. The example assumes the SDK installer is located in
    Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
     $ . /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
+.. note::
+
+   If you do not have write permissions for the directory into which you
+   are installing the SDK, the installer notifies you and exits. For
+   that case, set up the proper permissions in the directory and run the
+   installer again.
+
 Again, reference the
 ":ref:`sdk-manual/appendix-obtain:installed standard sdk directory structure`"
 section for more details on the resulting directory structure of the installed
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 0eddee08e3..beec1dd09a 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -33,8 +33,7 @@ project:
 
 1. *Create a Working Directory and Populate It:* Create a clean
    directory for your project and then make that directory your working
-   location.
-   ::
+   location::
 
       $ mkdir $HOME/helloworld
       $ cd $HOME/helloworld
@@ -146,8 +145,7 @@ project:
    This next command is a simple way to verify the installation of your
    project. Running the command prints the architecture on which the
    binary file can run. This architecture should be the same
-   architecture that the installed cross-toolchain supports.
-   ::
+   architecture that the installed cross-toolchain supports::
 
       $ file ./tmp/usr/local/bin/hello
 
@@ -210,8 +208,7 @@ demonstrates these variable behaviors.
 In a new shell environment variables are not established for the SDK
 until you run the setup script. For example, the following commands show
 a null value for the compiler variable (i.e.
-:term:`CC`).
-::
+:term:`CC`)::
 
    $ echo ${CC}
 
@@ -232,8 +229,7 @@ example:
 
 1. *Create a Working Directory and Populate It:* Create a clean
    directory for your project and then make that directory your working
-   location.
-   ::
+   location::
 
       $ mkdir $HOME/helloworld
       $ cd $HOME/helloworld
@@ -322,8 +318,7 @@ example:
 
    You can override the :term:`CC` environment variable with the same
    variable as set from the Makefile by uncommenting the line in the
-   Makefile and running ``make`` again.
-   ::
+   Makefile and running ``make`` again::
 
       $ make clean
       rm -rf *.o
-- 
2.37.2


