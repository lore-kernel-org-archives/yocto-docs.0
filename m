Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6895AC61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:22 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3463.1787708115070320448
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jMK7OvTe;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-930f618435cso22625385a.3
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708114; x=1788312914; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OFJSulw2RkqwGV2dzmcoVPk5cqc4QAoKI32qJxyYP4Y=;
        b=jMK7OvTedswZ3Sy1nEHTqlEXHL8i89jPThkth0jRsmeVIV+4uW4qzgn3C4dpMvzw4Z
         rzADwV1mRUb0lJOBFxXy3YlBebRcQlmBA84yrVmcOa/IjhhY2MIhKXyuHNMkOwVn0+HY
         THz4ra5sgOQemDx0Ml6AvfhRAqXJyXxkp2ED1CXCKGVxJfWLnLCyqCbXFscBWXSS+A3j
         eWV4h03UUTGp2MpRctJaXcvI0vowlQeno5//QjIJjEquY3cR62VDq1EStiYEikobcrcl
         zMWrTtQzY+ofVxYpv8uTVmNEp44B6v4G3300VUe4RuF+kojh5+9sey+Vy4ChbfW4+33G
         V7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708114; x=1788312914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OFJSulw2RkqwGV2dzmcoVPk5cqc4QAoKI32qJxyYP4Y=;
        b=izJ7cP4/sFTQyw6DO630m6h4tVzmktz1ez6ANTLveL+ZxFOfk0yUKTkqjIAumuLKOw
         Z8LCpoVy8s+Hj1xeBjt8fXDjx92LF2E7OPvewl7kDnzWvKvPpyXB9MVWdi+SP4j+VoDE
         +91w+/o3QgvEMIC64JVz9jYzY6LpQQFWrJR9x9WggAHOYVFTsLtgDUiIWkJaKgm749QF
         jCCu+3hMC8TINY+WaOZDDm4sDDcATRntDJJRYkETO7/zLwShs2tBZgazanIWNpJ5i1Hx
         hgNRzl49lNPeCTS3FOVLimAU7+60aJY8q+C+xKlEcpe+gOaSFh5EkIyTTr+Res55Dj8a
         8dKA==
X-Gm-Message-State: AFuF++mr3V0u11r7o4NjmMkehLcFZlWiGMoTVXYsdENumKusGkx/QvpG
	lfnj1NQyt7aUbqyMzW1LdZjxLUYGzIxYk2TMn4NGcYM8PyZG48kgvsmLLJuEfG6i
X-Gm-Gg: AR+sD10/kzUaliIn0f5hD0kib7Ttn72gReR3iLoGwV4BOu+54+lPU9jd8fdZNCPFMIV
	sdpQGsUVF4N/qZfc+H6dt6HXyWMpFM10uF7O0LkXsszpZpVigcWyJ9L/e1NdDWGGdlbEfN1naD1
	tNk5/VMVBxy/sYBi+ATYMqSmpnIiPWmMGRq+gGTY5KJ0vM1PF4MlUcthqgPTHGVhMzhJNdhnNfJ
	BXsuNkbPx88ZGwimqddsxsUtj5vgKOH32oh9RvW8PE92IN+WWYW6eslcZPK/XhVGQfj9c7UqyLx
	vLuZwEBy6NF54BpyvDqnOp6a4SzMqE37Od0UY4j7xTKx4v0X7By4ykxIFLhi7FVC7nUT4av+W6m
	VXwXCtjL02LZceYcs3fcjwY/QNLDekxQNE2g6nawCK08GplRFn4gLMRp0JSmV/cRfLh+JZYz/D3
	CaNgsZ+q5IFqww6I7iytFu73MsZxhj+E12gq9dKCLrS/Gnys0vXOohJ5TdPovziLxTBOOVoNGej
	auHzA1y+LKMAPyKwn6FWPTIYjZBDl8=
X-Received: by 2002:a05:620a:4892:b0:930:b4f9:f327 with SMTP id af79cd13be357-93780445ef0mr250368285a.33.1787708112010;
        Tue, 25 Aug 2026 18:35:12 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.10
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:11 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 03/10] dev-manual: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:48 -0400
Message-ID: <20260826013502.2674000-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10348

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 176 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/dev-manual/bblock.rst           |   4 +-
 documentation/dev-manual/bmaptool.rst         |   4 +-
 documentation/dev-manual/build-quality.rst    |   8 +-
 documentation/dev-manual/building.rst         |  44 +++--
 .../dev-manual/creating-fragments.rst         |   6 +-
 .../dev-manual/custom-distribution.rst        |   4 +-
 .../dev-manual/customizing-images.rst         |  32 +++-
 documentation/dev-manual/debugging.rst        |  40 +++--
 documentation/dev-manual/device-manager.rst   |  12 +-
 documentation/dev-manual/devtool.rst          |   8 +-
 documentation/dev-manual/disk-space.rst       |   4 +-
 .../dev-manual/error-reporting-tool.rst       |  12 +-
 documentation/dev-manual/external-scm.rst     |  20 ++-
 .../dev-manual/gobject-introspection.rst      |  12 +-
 documentation/dev-manual/hashequivserver.rst  |  12 +-
 documentation/dev-manual/init-manager.rst     |  16 +-
 documentation/dev-manual/layers.rst           |  56 ++++--
 documentation/dev-manual/libraries.rst        |  12 +-
 documentation/dev-manual/licenses.rst         |  60 +++++--
 .../dev-manual/limiting-resources.rst         |   4 +-
 documentation/dev-manual/multiconfig.rst      |  40 +++--
 documentation/dev-manual/new-machine.rst      |   4 +-
 documentation/dev-manual/new-recipe.rst       | 160 +++++++++++++-----
 documentation/dev-manual/packages.rst         |  44 +++--
 .../dev-manual/poky-manual-setup.rst          |   4 +-
 .../dev-manual/prebuilt-libraries.rst         |  12 +-
 documentation/dev-manual/qemu.rst             |   4 +-
 documentation/dev-manual/quilt.rst            |   4 +-
 documentation/dev-manual/sbom.rst             |   4 +-
 .../dev-manual/speeding-up-build.rst          |   4 +-
 .../dev-manual/sstate-mirrors-setup.rst       |  16 +-
 .../dev-manual/temporary-source-code.rst      |   8 +-
 .../dev-manual/upgrading-recipes.rst          |  12 +-
 documentation/dev-manual/wayland.rst          |   8 +-
 documentation/dev-manual/x32-psabi.rst        |   4 +-
 35 files changed, 522 insertions(+), 176 deletions(-)

diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-manual/bblock.rst
index 605bb7565524..a6ca740c5123 100644
--- a/documentation/dev-manual/bblock.rst
+++ b/documentation/dev-manual/bblock.rst
@@ -87,7 +87,9 @@ Locking mechanism
 variables: :term:`SIGGEN_LOCKEDSIGS`, :term:`SIGGEN_LOCKEDSIGS_TYPES`
 and :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`.
 
-In particular, ``bblock`` sets::
+In particular, ``bblock`` sets:
+
+.. code-block:: bitbake
 
   SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "info"
   SIGGEN_LOCKEDSIGS_TYPES += "${PACKAGE_ARCHS}"
diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index 29e7f0d2ebbd..8fd949eea2a2 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -29,7 +29,9 @@ that while this example uses a Wic image, you can use `bmaptool` to flash
 any type of image. Use these steps to flash an image using `bmaptool`:
 
 #. *Update your local.conf File:* You need to have the following set
-   in your ``local.conf`` file before building your image::
+   in your ``local.conf`` file before building your image:
+
+   .. code-block:: bitbake
 
       IMAGE_FSTYPES += "wic wic.bmap"
 
diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index e9b066c4453f..6682122d4ee4 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -36,7 +36,9 @@ Enabling and Disabling Build History
 Build history is disabled by default. To enable it, add the following
 :term:`INHERIT` statement and set the :term:`BUILDHISTORY_COMMIT` variable to
 "1" at the end of your ``conf/local.conf`` file found in the
-:term:`Build Directory`::
+:term:`Build Directory`:
+
+.. code-block:: bitbake
 
    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "1"
@@ -261,7 +263,9 @@ image. If you are just interested in this information and not interested
 in collecting specific package or SDK information, you can enable
 writing only image information without any history by adding the
 following to your ``conf/local.conf`` file found in the
-:term:`Build Directory`::
+:term:`Build Directory`:
+
+.. code-block:: bitbake
 
    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "0"
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 60cb22785725..cb073a2be5ad 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -230,14 +230,18 @@ To achieve this, you need to perform some additional steps:
 #. *Create a multiconfig for your Initramfs image:* You can perform the steps
    on ":ref:`dev-manual/building:building images for multiple targets using multiple configurations`" to create a separate multiconfig.
    For the sake of simplicity let's assume such multiconfig is called: ``initramfscfg.conf`` and
-   contains the variables::
+   contains the variables:
+
+   .. code-block:: bitbake
 
       TMPDIR = "${TOPDIR}/tmp-initramfscfg"
       TCLIBC = "musl"
 
 #. *Set additional Initramfs variables on your main configuration:*
    Additionally, on your main configuration (``local.conf``) you need to set the
-   variables::
+   variables:
+
+   .. code-block:: bitbake
 
      INITRAMFS_MULTICONFIG = "initramfscfg"
      INITRAMFS_DEPLOY_DIR_IMAGE = "${TOPDIR}/tmp-initramfscfg/deploy/images/${MACHINE}"
@@ -416,7 +420,9 @@ instead of ``udev``.
 
 Use your ``local.conf`` file to make changes. For example, to eliminate
 ``udev`` and ``glib``, set the following in the local configuration
-file::
+file:
+
+.. code-block:: bitbake
 
    VIRTUAL-RUNTIME_dev_manager = ""
 
@@ -603,7 +609,9 @@ your tunings to best consider build times and package feed maintenance.
    machine-architecture dependent, make sure your recipe enables the
    "machine" package architecture through the
    :term:`MACHINE_ARCH`
-   variable::
+   variable:
+
+   .. code-block:: bitbake
 
       PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -611,7 +619,9 @@ your tunings to best consider build times and package feed maintenance.
    specifically enable a package architecture through the
    :term:`PACKAGE_ARCH`, The
    OpenEmbedded build system defaults to the
-   :term:`TUNE_PKGARCH` setting::
+   :term:`TUNE_PKGARCH` setting:
+
+   .. code-block:: bitbake
 
       PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
@@ -707,13 +717,17 @@ the external directory and use it as is, not copy it.
 To build from software that comes from an external source, all you need to do
 is inherit the :ref:`ref-classes-externalsrc` class and then set
 the :term:`EXTERNALSRC` variable to point to your external source code. Here
-are the statements to put in your ``local.conf`` file::
+are the statements to put in your ``local.conf`` file:
+
+.. code-block:: bitbake
 
    INHERIT += "externalsrc"
    EXTERNALSRC:pn-myrecipe = "path-to-your-source-tree"
 
 This next example shows how to accomplish the same thing by setting
-:term:`EXTERNALSRC` in the recipe itself or in the recipe's append file::
+:term:`EXTERNALSRC` in the recipe itself or in the recipe's append file:
+
+.. code-block:: bitbake
 
    EXTERNALSRC = "path"
    EXTERNALSRC_BUILD = "path"
@@ -729,7 +743,9 @@ directory separate from the external source directory as specified by
 to have the source built in the same directory in which it resides, or
 some other nominated directory, you can set
 :term:`EXTERNALSRC_BUILD`
-to point to that directory::
+to point to that directory:
+
+.. code-block:: bitbake
 
    EXTERNALSRC_BUILD:pn-myrecipe = "path-to-your-source-tree"
 
@@ -757,7 +773,9 @@ Follow these steps to populate your Downloads directory:
    an empty location or one that does not yet exist.
 
 #. *Generate Tarballs of the Source Git Repositories:* Edit your
-   ``local.conf`` configuration file as follows::
+   ``local.conf`` configuration file as follows:
+
+   .. code-block:: bitbake
 
       DL_DIR = "/home/your-download-dir/"
       BB_GENERATE_MIRROR_TARBALLS = "1"
@@ -795,7 +813,9 @@ directory:
 #. *Using Local Files Only:* Inside your ``local.conf`` file, add the
    :term:`SOURCE_MIRROR_URL` variable, inherit the
    :ref:`ref-classes-own-mirrors` class, and add the
-   :term:`BB_NO_NETWORK` variable to your ``local.conf``::
+   :term:`BB_NO_NETWORK` variable to your ``local.conf``:
+
+   .. code-block:: bitbake
 
       SOURCE_MIRROR_URL ?= "file:///home/your-download-dir/"
       INHERIT += "own-mirrors"
@@ -824,7 +844,9 @@ directory:
       The offline build does not work if recipes attempt to find the
       latest version of software by setting
       :term:`SRCREV` to
-      ``${``\ :term:`AUTOREV`\ ``}``::
+      ``${``\ :term:`AUTOREV`\ ``}``:
+
+      .. code-block:: bitbake
 
          SRCREV = "${AUTOREV}"
 
diff --git a/documentation/dev-manual/creating-fragments.rst b/documentation/dev-manual/creating-fragments.rst
index 8dabd599f13f..ea9ad8eb23dc 100644
--- a/documentation/dev-manual/creating-fragments.rst
+++ b/documentation/dev-manual/creating-fragments.rst
@@ -61,7 +61,7 @@ Build System`:
 After creating these variables, our custom fragment should look like the
 following:
 
-.. code-block::
+.. code-block:: bitbake
    :caption: custom-fragment.conf
 
    BB_CONF_FRAGMENT_SUMMARY = "This fragment sets a limit of 4 bitbake threads and 4 parsing threads"
@@ -71,7 +71,7 @@ following:
 For now, our fragment does not have any additional configuration statement.
 Let's add the following assignments to our fragment:
 
-.. code-block::
+.. code-block:: bitbake
    :caption: custom-fragment.conf (continued)
 
    BB_NUMBER_THREADS = "4"
@@ -123,7 +123,7 @@ Adding new :term:`Built-in Fragments <Built-in Fragment>` can be done by
 appending the :term:`OE_FRAGMENTS_BUILTIN` variable from your :term:`layer`
 configuration file:
 
-.. code-block::
+.. code-block:: bitbake
    :caption: layer.conf
 
    OE_FRAGMENTS_BUILTIN:append = " custom-builtin-fragment:CUSTOM_VARIABLE"
diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
index 4dafd2725557..1146d5313102 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -87,7 +87,9 @@ layer. The following steps provide some more detail:
    file in the :term:`Build Directory`, set your :term:`DISTRO` variable to
    point to your distribution's configuration file. For example, if your
    distribution's configuration file is named ``mydistro.conf``, then
-   you point to it as follows::
+   you point to it as follows:
+
+   .. code-block:: bitbake
 
       DISTRO = "mydistro"
 
diff --git a/documentation/dev-manual/customizing-images.rst b/documentation/dev-manual/customizing-images.rst
index 6eed9ef56a80..b715f83990fa 100644
--- a/documentation/dev-manual/customizing-images.rst
+++ b/documentation/dev-manual/customizing-images.rst
@@ -18,7 +18,9 @@ variable changes are in effect for every build and consequently affect
 all images, which might not be what you require.
 
 To add a package to your image using the local configuration file, use
-the :term:`IMAGE_INSTALL` variable with the ``:append`` operator::
+the :term:`IMAGE_INSTALL` variable with the ``:append`` operator:
+
+.. code-block:: bitbake
 
    IMAGE_INSTALL:append = " strace"
 
@@ -36,7 +38,9 @@ takes effect.
 
 As shown in its simplest use, ``IMAGE_INSTALL:append`` affects all
 images. It is possible to extend the syntax so that the variable applies
-to a specific image only. Here is an example::
+to a specific image only. Here is an example:
+
+.. code-block:: bitbake
 
    IMAGE_INSTALL:append:pn-core-image-minimal = " strace"
 
@@ -105,7 +109,9 @@ Customizing Images Using Custom .bb Files
 
 You can also customize an image by creating a custom recipe that defines
 additional software as part of the image. The following example shows
-the form for the two lines you need::
+the form for the two lines you need:
+
+.. code-block:: bitbake
 
    IMAGE_INSTALL = "packagegroup-core-x11-base package1 package2"
    inherit core-image
@@ -120,7 +126,9 @@ The other method for creating a custom image is to base it on an
 existing image. For example, if you want to create an image based on
 ``core-image-sato`` but add the additional package ``strace`` to the
 image, copy the ``meta/recipes-sato/images/core-image-sato.bb`` to a new
-``.bb`` and add the following line to the end of the copy::
+``.bb`` and add the following line to the end of the copy:
+
+.. code-block:: bitbake
 
    IMAGE_INSTALL += "strace"
 
@@ -151,7 +159,9 @@ in the ``packagegroup-base.bb`` recipe.
 Here is a short, fabricated example showing the same basic pieces for a
 hypothetical packagegroup defined in ``packagegroup-custom.bb``, where
 the variable :term:`PN` is the standard way to abbreviate the reference to
-the full packagegroup name ``packagegroup-custom``::
+the full packagegroup name ``packagegroup-custom``:
+
+.. code-block:: bitbake
 
    DESCRIPTION = "My Custom Package Groups"
 
@@ -193,11 +203,15 @@ configured hostname written to ``/etc/hostname`` is "qemux86".
 
 You can customize this name by altering the value of the "hostname"
 variable in the ``base-files`` recipe using either an append file or a
-configuration file. Use the following in an append file::
+configuration file. Use the following in an append file:
+
+.. code-block:: bitbake
 
    hostname = "myhostname"
 
-Use the following in a configuration file::
+Use the following in a configuration file:
+
+.. code-block:: bitbake
 
    hostname:pn-base-files = "myhostname"
 
@@ -212,7 +226,9 @@ you can easily reset the default hostname.
 
 Another point of interest is that if you unset the variable, the image
 will have no default hostname in the filesystem. Here is an example that
-unsets the variable in a configuration file::
+unsets the variable in a configuration file:
+
+.. code-block:: bitbake
 
   hostname:pn-base-files = ""
 
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 3afc17ad4ba2..6ee101721ef8 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -628,7 +628,9 @@ in the log, use the "debug" loglevel.
 Here is an example written in Python. The code handles logging for
 a function that determines the number of tasks needed to be run. See the
 ":ref:`ref-tasks-listtasks`"
-section for additional information::
+section for additional information:
+
+.. code-block:: bitbake
 
    python do_listtasks() {
        bb.debug(2, "Starting to figure out the task list")
@@ -654,7 +656,9 @@ The syntax you use for recipes written in Bash is similar to that of
 recipes written in Python described in the previous section.
 
 Here is an example written in Bash. The code logs the progress of
-the ``do_my_function`` function::
+the ``do_my_function`` function:
+
+.. code-block:: bitbake
 
    do_my_function() {
        bbdebug 2 "Running do_my_function"
@@ -861,7 +865,9 @@ The final thing you need to do to implement the fix in the build is to
 update the "neard" recipe (i.e. ``neard-0.14.bb``) so that the
 :term:`SRC_URI` statement includes
 the patch file. The recipe file is in the folder above the patch. Here
-is what the edited :term:`SRC_URI` statement would look like::
+is what the edited :term:`SRC_URI` statement would look like:
+
+.. code-block:: bitbake
 
    SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
               file://neard.in \
@@ -943,7 +949,9 @@ To run a ``debuginfod`` server, you need to do the following:
    (it already is in :term:`OpenEmbedded-Core (OE-Core)` defaults and
    :term:`Poky` reference distribution).
 
-   If not, set in your distro config file or in ``local.conf``::
+   If not, set in your distro config file or in ``local.conf``:
+
+   .. code-block:: bitbake
 
       DISTRO_FEATURES:append = " debuginfod"
 
@@ -1010,7 +1018,9 @@ debugger.
 #. *Configure your build system to construct the companion debug
    filesystem:*
 
-   In your ``local.conf`` file, set the following::
+   In your ``local.conf`` file, set the following:
+
+   .. code-block:: bitbake
 
       IMAGE_GEN_DEBUGFS = "1"
       IMAGE_FSTYPES_DEBUGFS = "tar.bz2"
@@ -1029,7 +1039,9 @@ debugger.
 
 #. *Configure the system to include gdbserver in the target filesystem:*
 
-   Make the following addition in your ``local.conf`` file::
+   Make the following addition in your ``local.conf`` file:
+
+   .. code-block:: bitbake
 
       EXTRA_IMAGE_FEATURES:append = " tools-debug"
 
@@ -1165,17 +1177,23 @@ debug on the target hardware.
 To support this kind of debugging, you need do the following:
 
 -  Ensure that GDB is on the target. You can do this by making
-   the following addition to your ``local.conf`` file::
+   the following addition to your ``local.conf`` file:
+
+   .. code-block:: bitbake
 
       EXTRA_IMAGE_FEATURES:append = " tools-debug"
 
 -  Ensure that debug symbols are present. You can do so by adding the
-   corresponding ``-dbg`` package to :term:`IMAGE_INSTALL`::
+   corresponding ``-dbg`` package to :term:`IMAGE_INSTALL`:
+
+   .. code-block:: bitbake
 
       IMAGE_INSTALL:append = " packagename-dbg"
 
    Alternatively, you can add the following to ``local.conf`` to include
-   all the debug symbols::
+   all the debug symbols:
+
+   .. code-block:: bitbake
 
       EXTRA_IMAGE_FEATURES:append = " dbg-pkgs"
 
@@ -1185,7 +1203,9 @@ To support this kind of debugging, you need do the following:
    of optimization used by the compiler. For example, when adding the
    following line to your ``local.conf`` file, you will reduce optimization
    from :term:`FULL_OPTIMIZATION` of "-O2" to :term:`DEBUG_OPTIMIZATION`
-   of "-O -fno-omit-frame-pointer"::
+   of "-O -fno-omit-frame-pointer":
+
+   .. code-block:: bitbake
 
            DEBUG_BUILD = "1"
 
diff --git a/documentation/dev-manual/device-manager.rst b/documentation/dev-manual/device-manager.rst
index 49fc785feccb..1fa572090804 100644
--- a/documentation/dev-manual/device-manager.rst
+++ b/documentation/dev-manual/device-manager.rst
@@ -23,7 +23,9 @@ Using Persistent and Pre-Populated ``/dev``
 
 To use the static method for device population, you need to set the
 :term:`USE_DEVFS` variable to "0"
-as follows::
+as follows:
+
+.. code-block:: bitbake
 
    USE_DEVFS = "0"
 
@@ -35,7 +37,9 @@ machine or distro configuration file. Alternatively, you can set this
 variable in your ``local.conf`` configuration file.
 
 If you do not define the :term:`IMAGE_DEVICE_TABLES` variable, the default
-``device_table-minimal.txt`` is used::
+``device_table-minimal.txt`` is used:
+
+.. code-block:: bitbake
 
    IMAGE_DEVICE_TABLES = "device_table-mymachine.txt"
 
@@ -47,7 +51,9 @@ Using ``devtmpfs`` and a Device Manager
 
 To use the dynamic method for device population, you need to use (or be
 sure to set) the :term:`USE_DEVFS`
-variable to "1", which is the default::
+variable to "1", which is the default:
+
+.. code-block:: bitbake
 
    USE_DEVFS = "1"
 
diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index d67f22277342..2078678a855e 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -981,7 +981,9 @@ the :term:`DEPENDS` variable in the original recipe to include the new
 recipe.
 
 If you need to add runtime dependencies, you can do so by adding the
-following to your recipe::
+following to your recipe:
+
+.. code-block:: bitbake
 
    RDEPENDS:${PN} += "dependency1 dependency2 ..."
 
@@ -1062,7 +1064,9 @@ mind:
    the command line, add the variable setting to
    :term:`EXTRA_OEMAKE` or
    :term:`PACKAGECONFIG_CONFARGS`
-   within the recipe. Here is an example using :term:`EXTRA_OEMAKE`::
+   within the recipe. Here is an example using :term:`EXTRA_OEMAKE`:
+
+   .. code-block:: bitbake
 
       EXTRA_OEMAKE += "'CC=${CC}' 'CXX=${CXX}'"
 
diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index ba3afa5a2cab..efc7529d9263 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -8,7 +8,9 @@ Conserving Disk Space During Builds
 
 To help conserve disk space during builds, you can add the following
 statement to your project's ``local.conf`` configuration file found in
-the :term:`Build Directory`::
+the :term:`Build Directory`:
+
+.. code-block:: bitbake
 
    INHERIT += "rm_work"
 
diff --git a/documentation/dev-manual/error-reporting-tool.rst b/documentation/dev-manual/error-reporting-tool.rst
index 30d1ce2b315b..3b765e30db51 100644
--- a/documentation/dev-manual/error-reporting-tool.rst
+++ b/documentation/dev-manual/error-reporting-tool.rst
@@ -28,14 +28,18 @@ Enabling and Using the Tool
 By default, the error reporting tool is disabled. You can enable it by
 inheriting the :ref:`ref-classes-report-error` class by adding the
 following statement to the end of your ``local.conf`` file in your
-:term:`Build Directory`::
+:term:`Build Directory`:
+
+.. code-block:: bitbake
 
    INHERIT += "report-error"
 
 By default, the error reporting feature stores information in
 ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 However, you can specify a directory to use by adding the following to
-your ``local.conf`` file::
+your ``local.conf`` file:
+
+.. code-block:: bitbake
 
    ERR_REPORT_DIR = "path"
 
@@ -70,7 +74,9 @@ Disabling the Tool
 
 To disable the error reporting feature, simply remove or comment out the
 following statement from the end of your ``local.conf`` file in your
-:term:`Build Directory`::
+:term:`Build Directory`:
+
+.. code-block:: bitbake
 
    INHERIT += "report-error"
 
diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index e7ab8a4c6b9e..dfdd6853ff68 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -13,7 +13,9 @@ Subversion (SVN) and Git.
 
 To enable this behavior, the :term:`PV` of
 the recipe needs to include a ``+`` sign in its assignment.
-Here is an example::
+Here is an example:
+
+.. code-block:: bitbake
 
    PV = "1.2.3+git"
 
@@ -21,7 +23,9 @@ Here is an example::
 during the packaging phase.
 
 Then, you can add the following to your
-``local.conf``::
+``local.conf``:
+
+.. code-block:: bitbake
 
    SRCREV:pn-PN = "${AUTOREV}"
 
@@ -29,17 +33,23 @@ Then, you can add the following to your
 which you want to enable automatic source revision updating.
 
 If you do not want to update your local configuration file, you can add
-the following directly to the recipe to finish enabling the feature::
+the following directly to the recipe to finish enabling the feature:
+
+.. code-block:: bitbake
 
    SRCREV = "${AUTOREV}"
 
 The Yocto Project provides a distribution named ``poky-bleeding``, whose
-configuration file contains the line::
+configuration file contains the line:
+
+.. code-block:: bitbake
 
    require conf/distro/include/poky-floating-revisions.inc
 
 This line pulls in the listed include file that defines the set of
-AUTOREV-enabled recipes::
+AUTOREV-enabled recipes:
+
+.. code-block:: bitbake
 
    INHERIT += "poky-bleeding"
 
diff --git a/documentation/dev-manual/gobject-introspection.rst b/documentation/dev-manual/gobject-introspection.rst
index 8203f17f0177..c57b0a302227 100644
--- a/documentation/dev-manual/gobject-introspection.rst
+++ b/documentation/dev-manual/gobject-introspection.rst
@@ -52,7 +52,9 @@ library package involves the following:
 #. Try to build the recipe. If you encounter build errors that look like
    something is unable to find ``.so`` libraries, check where these
    libraries are located in the source tree and add the following to the
-   recipe::
+   recipe:
+
+   .. code-block:: bitbake
 
       GIR_EXTRA_LIBS_PATH = "${B}/something/.libs"
 
@@ -82,7 +84,9 @@ perhaps QEMU does not work on your build host and target architecture
 combination. If so, you can use either of the following methods to
 disable GIR file generations:
 
--  Add the following to your distro configuration::
+-  Add the following to your distro configuration:
+
+   .. code-block:: bitbake
 
       DISTRO_FEATURES_OPTED_OUT = "gobject-introspection-data"
 
@@ -90,7 +94,9 @@ disable GIR file generations:
    QEMU but will still enable building introspection tools and libraries
    (i.e. building them does not require the use of QEMU).
 
--  Add the following to your machine configuration::
+-  Add the following to your machine configuration:
+
+   .. code-block:: bitbake
 
       MACHINE_FEATURES_OPTED_OUT = "qemu-usermode"
 
diff --git a/documentation/dev-manual/hashequivserver.rst b/documentation/dev-manual/hashequivserver.rst
index 75b77c30b944..3c1f813cf95f 100644
--- a/documentation/dev-manual/hashequivserver.rst
+++ b/documentation/dev-manual/hashequivserver.rst
@@ -79,7 +79,9 @@ Yocto Project Build Setup
 =========================
 
 To use the server started in the previous section, set the following variables
-in a :term:`configuration file`::
+in a :term:`configuration file`:
+
+.. code-block:: bitbake
 
    BB_HASHSERVE = "<bind address>"
    BB_SIGNATURE_HANDLER = "OEEquivHash"
@@ -91,7 +93,9 @@ See the documentation of :term:`BB_SIGNATURE_HANDLER` for more details on this
 variable.
 
 You can optionally specify an upstream server with :term:`BB_HASHSERVE_UPSTREAM`
-variable. For example::
+variable. For example:
+
+.. code-block:: bitbake
 
    BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
 
@@ -101,7 +105,9 @@ This will make the local server pull hashes from the upstream server. The
 
 To output debugging information on what is happening with Hash Equivalence when
 builds are started, you can configure :term:`BitBake` logging as follows from a
-:term:`configuration file`::
+:term:`configuration file`:
+
+.. code-block:: bitbake
 
    BB_LOGCONFIG = "hashequiv.json"
 
diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index c9d344a88bf3..51644df2dd51 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -54,7 +54,9 @@ Using SysVinit with udev
 =========================
 
 SysVinit with the udev device manager corresponds to the
-default setting in :term:`Poky`. This corresponds to setting::
+default setting in :term:`Poky`. This corresponds to setting:
+
+.. code-block:: bitbake
 
    INIT_MANAGER = "sysvinit"
 
@@ -63,7 +65,9 @@ Using BusyBox init with BusyBox mdev
 
 BusyBox init with BusyBox mdev is the simplest and lightest solution
 for small root filesystems. All you need is BusyBox, which most systems
-have anyway::
+have anyway:
+
+.. code-block:: bitbake
 
    INIT_MANAGER = "mdev-busybox"
 
@@ -72,7 +76,9 @@ Using systemd
 
 The last option is to use systemd together with the udev device
 manager. This is the most powerful and versatile solution, especially
-for more complex systems::
+for more complex systems:
+
+.. code-block:: bitbake
 
    INIT_MANAGER = "systemd"
 
@@ -103,7 +109,9 @@ Using systemd-journald without a traditional syslog daemon
 Counter-intuitively, ``systemd-journald`` is not a syslog runtime or provider,
 and the proper way to use ``systemd-journald`` as your sole logging mechanism is to
 effectively disable syslog entirely by setting these variables in your distribution
-configuration file::
+configuration file:
+
+.. code-block:: bitbake
 
    VIRTUAL-RUNTIME_syslog = ""
    VIRTUAL-RUNTIME_base-utils-syslog = ""
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 3937c54ad2cc..a15fce6b93ba 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -212,7 +212,9 @@ following list:
       machine "one". To do so, you use an append file named
       ``base-files.bbappend`` and create a dependency on "foo" by
       altering the :term:`DEPENDS`
-      variable::
+      variable:
+
+      .. code-block:: bitbake
 
          DEPENDS = "foo"
 
@@ -225,12 +227,16 @@ following list:
       ``foo``.
 
       To make sure your changes apply only when building machine "one",
-      use a machine override with the :term:`DEPENDS` statement::
+      use a machine override with the :term:`DEPENDS` statement:
+
+      .. code-block:: bitbake
 
          DEPENDS:one = "foo"
 
       You should follow the same strategy when using ``:append``
-      and ``:prepend`` operations::
+      and ``:prepend`` operations:
+
+      .. code-block:: bitbake
 
          DEPENDS:append:one = " foo"
          DEPENDS:prepend:one = "foo "
@@ -238,7 +244,9 @@ following list:
       As an actual example, here's a
       snippet from the generic kernel include file ``linux-yocto.inc``,
       wherein the kernel compile and link options are adjusted in the
-      case of a subset of the supported architectures::
+      case of a subset of the supported architectures:
+
+      .. code-block:: bitbake
 
          DEPENDS:append:aarch64 = " libgcc"
          KERNEL_CC:append:aarch64 = " ${TOOLCHAIN_OPTIONS}"
@@ -260,7 +268,9 @@ following list:
       file, you can use an append file to cause the build to use your
       own version of the file. For example, an append file in your layer
       at ``meta-one/recipes-core/base-files/base-files.bbappend`` could
-      extend :term:`FILESPATH` using :term:`FILESEXTRAPATHS` as follows::
+      extend :term:`FILESPATH` using :term:`FILESEXTRAPATHS` as follows:
+
+      .. code-block:: bitbake
 
          FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
 
@@ -571,7 +581,9 @@ during the build.
 
 Here is the append file, which is named ``formfactor_0.0.bbappend``
 and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
-file is in the layer at ``recipes-bsp/formfactor``::
+file is in the layer at ``recipes-bsp/formfactor``:
+
+.. code-block:: bitbake
 
    FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
@@ -619,7 +631,9 @@ As another example, consider the main ``xserver-xf86-config`` recipe and a
 corresponding ``xserver-xf86-config`` append file both from
 :term:`OpenEmbedded-Core (OE-Core)`.  Here is the main ``xserver-xf86-config`` recipe, which is named
 ``xserver-xf86-config_0.1.bb`` and located in the "meta" layer at
-``meta/recipes-graphics/xorg-xserver``::
+``meta/recipes-graphics/xorg-xserver``:
+
+.. code-block:: bitbake
 
    SUMMARY = "X.Org X server configuration file"
    HOMEPAGE = "http://www.x.org"
@@ -645,7 +659,9 @@ corresponding ``xserver-xf86-config`` append file both from
 
 Here is the append file, which is named ``xserver-xf86-config_%.bbappend``
 and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
-file is in the layer at ``recipes-graphics/xorg-xserver``::
+file is in the layer at ``recipes-graphics/xorg-xserver``:
+
+.. code-block:: bitbake
 
    FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
@@ -685,7 +701,9 @@ build system to calculate it based on the layer's dependencies.
 
 To specify the layer's priority manually, use the
 :term:`BBFILE_PRIORITY`
-variable and append the layer's root name::
+variable and append the layer's root name:
+
+.. code-block:: bitbake
 
    BBFILE_PRIORITY_mylayer = "1"
 
@@ -753,14 +771,18 @@ for the kernel only if our feature ``mylayer-kernel`` is part of the
 
       PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
 
-#. Provide a path to this include file in your ``layer.conf``::
+#. Provide a path to this include file in your ``layer.conf``:
+
+   .. code-block:: bitbake
 
       META_MYLAYER_KERNEL_PROVIDER_PATH = "${LAYERDIR}/conf/distro/include/mylayer-kernel-provider.inc"
 
 #. Create a new class in ``meta-mylayer/classes-global/``, for example a class
    ``meta-mylayer-cfg.bbclass``. Make it conditionally require the file
    ``mylayer-kernel-provider.inc`` defined above, using the variable
-   ``META_MYLAYER_KERNEL_PROVIDER_PATH`` defined in ``layer.conf``::
+   ``META_MYLAYER_KERNEL_PROVIDER_PATH`` defined in ``layer.conf``:
+
+   .. code-block:: bitbake
 
       require ${@bb.utils.contains('DISTRO_FEATURES', 'mylayer-kernel', '${META_MYLAYER_KERNEL_PROVIDER_PATH}', '', d)}
 
@@ -773,7 +795,9 @@ for the kernel only if our feature ``mylayer-kernel`` is part of the
       ``bb.utils.contains`` returns an empty string.
 
 #. Back to your ``layer.conf`` file, add the class ``meta-mylayer-cfg`` class to
-   the :term:`USER_CLASSES` variable::
+   the :term:`USER_CLASSES` variable:
+
+   .. code-block:: bitbake
 
       USER_CLASSES:append = " meta-mylayer-cfg"
 
@@ -846,7 +870,9 @@ The following list describes the available commands:
       variable values, you need to tidy these up yourself. Consider the
       following example. Here, the ``bitbake-layers`` command adds the
       line ``#### bbappended ...`` so that you know where the following
-      lines originate::
+      lines originate:
+
+      .. code-block:: bitbake
 
          ...
          DESCRIPTION = "A useful utility"
@@ -860,7 +886,9 @@ The following list describes the available commands:
          EXTRA_OECONF += "--enable-somethingelse"
 
 
-      Ideally, you would tidy up these utilities as follows::
+      Ideally, you would tidy up these utilities as follows:
+
+      .. code-block:: bitbake
 
          ...
          DESCRIPTION = "Customized utility"
diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index 160734729183..46ce2856158e 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -38,7 +38,9 @@ library files.
    static library files through ``${PN}-dev``.
 
 Here is a small part of the BitBake configuration file, where you can see
-how the static library files are defined::
+how the static library files are defined:
+
+.. code-block:: bitbake
 
    PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 
@@ -118,7 +120,9 @@ Using Multilib
 After you have set up the recipes, you need to define the actual
 combination of multiple libraries you want to build. You accomplish this
 through your ``local.conf`` configuration file in the
-:term:`Build Directory`. An example configuration would be as follows::
+:term:`Build Directory`. An example configuration would be as follows:
+
+.. code-block:: bitbake
 
    MACHINE = "qemux86-64"
    require conf/multilib.conf
@@ -231,7 +235,9 @@ you have other recipes that depend on a given library, you need to use
 the :term:`DEPENDS` variable to
 create the dependency. Continuing with the same example, if you want to
 have a recipe depend on the 1.8 version of the ``clutter`` library, use
-the following in your recipe::
+the following in your recipe:
+
+.. code-block:: bitbake
 
    DEPENDS = "clutter-1.8"
 
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 774b5db23517..132a848b4660 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -28,7 +28,9 @@ Specifying the ``LIC_FILES_CHKSUM`` Variable
 
 The :term:`LIC_FILES_CHKSUM` variable contains checksums of the license text
 in the source code for the recipe. Here is an example of how to
-specify :term:`LIC_FILES_CHKSUM`::
+specify :term:`LIC_FILES_CHKSUM`:
+
+.. code-block:: bitbake
 
    LIC_FILES_CHKSUM = "file://COPYING;md5=xxxx \
                        file://licfile1.txt;beginline=5;endline=29;md5=yyyy \
@@ -51,7 +53,9 @@ variable as the default directory when searching files listed in
 :term:`LIC_FILES_CHKSUM`. The previous example employs the default
 directory.
 
-Consider this next example::
+Consider this next example:
+
+.. code-block:: bitbake
 
    LIC_FILES_CHKSUM = "file://src/ls.c;beginline=5;endline=16;\
                                        md5=bb14ed3c4cda583abc85401304b5cd4e"
@@ -113,18 +117,24 @@ are defined on a recipe-by-recipe basis through the
 :term:`LICENSE_FLAGS` variable
 definition in the affected recipe. For instance, the
 ``meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly`` recipe of
-:term:`OpenEmbedded-Core (OE-Core)` contains the following statement::
+:term:`OpenEmbedded-Core (OE-Core)` contains the following statement:
+
+.. code-block:: bitbake
 
    LICENSE_FLAGS = "commercial"
 
 Here is a
 slightly more complicated example that contains both an explicit recipe
-name and version (after variable expansion)::
+name and version (after variable expansion):
+
+.. code-block:: bitbake
 
    LICENSE_FLAGS = "license_${PN}_${PV}"
 
 It is possible to give more details about a specific license
-using flags on the :term:`LICENSE_FLAGS_DETAILS` variable::
+using flags on the :term:`LICENSE_FLAGS_DETAILS` variable:
+
+.. code-block:: bitbake
 
    LICENSE_FLAGS_DETAILS[my-eula-license] = "For further details, see https://example.com/eula."
 
@@ -142,7 +152,9 @@ could add either the string "commercial_gst-plugins-ugly" or the more
 general string "commercial" to :term:`LICENSE_FLAGS_ACCEPTED`. See the
 ":ref:`dev-manual/licenses:license flag matching`" section for a full
 explanation of how :term:`LICENSE_FLAGS` matching works. Here is the
-example::
+example:
+
+.. code-block:: bitbake
 
    LICENSE_FLAGS_ACCEPTED = "commercial_gst-plugins-ugly"
 
@@ -150,7 +162,9 @@ Likewise, to additionally enable the package built from the recipe
 containing ``LICENSE_FLAGS = "license_${PN}_${PV}"``, and assuming that
 the actual recipe name was ``emgd_1.10.bb``, the following string would
 enable that package as well as the original ``gst-plugins-ugly``
-package::
+package:
+
+.. code-block:: bitbake
 
    LICENSE_FLAGS_ACCEPTED = "commercial_gst-plugins-ugly license_emgd_1.10"
 
@@ -162,7 +176,9 @@ or characters. A partial string will match any license that contains the
 given string as the first portion of its license. For example, the
 following value will also match both of the packages
 previously mentioned as well as any other packages that have licenses
-starting with "commercial" or "license"::
+starting with "commercial" or "license":
+
+.. code-block:: bitbake
 
    LICENSE_FLAGS_ACCEPTED = "commercial license"
 
@@ -207,7 +223,9 @@ For example, simply specifying the string "commercial" in the
 "commercial" such as "commercial_foo" and "commercial_bar", which
 are the strings the build system automatically generates for
 hypothetical recipes named "foo" and "bar" assuming those recipes simply
-specify the following::
+specify the following:
+
+.. code-block:: bitbake
 
    LICENSE_FLAGS = "commercial"
 
@@ -245,13 +263,17 @@ Other Variables Related to Commercial Licenses
 
 There are other helpful variables related to commercial license handling,
 defined in the
-``meta/conf/distro/include/default-distrovars.inc`` file in :term:`OpenEmbedded-Core (OE-Core)`::
+``meta/conf/distro/include/default-distrovars.inc`` file in :term:`OpenEmbedded-Core (OE-Core)`:
+
+.. code-block:: bitbake
 
    COMMERCIAL_AUDIO_PLUGINS ?= ""
    COMMERCIAL_VIDEO_PLUGINS ?= ""
 
 If you want to enable these components, you can do so by making sure you have
-statements similar to the following in your ``local.conf`` configuration file::
+statements similar to the following in your ``local.conf`` configuration file:
+
+.. code-block:: bitbake
 
    COMMERCIAL_AUDIO_PLUGINS = "gst-plugins-ugly-mad \
        gst-plugins-ugly-mpegaudioparse"
@@ -262,7 +284,9 @@ statements similar to the following in your ``local.conf`` configuration file::
 Of course, you could also create a matching list for those components using the
 more general "commercial" string in the :term:`LICENSE_FLAGS_ACCEPTED` variable,
 but that would also enable all the other packages with :term:`LICENSE_FLAGS`
-containing "commercial", which you may or may not want::
+containing "commercial", which you may or may not want:
+
+.. code-block:: bitbake
 
    LICENSE_FLAGS_ACCEPTED = "commercial"
 
@@ -361,7 +385,9 @@ create them with various levels of compliance in mind.
 
 One way of doing this (but certainly not the only way) is to release
 just the source as a tarball. You can do this by adding the following to
-the ``local.conf`` file found in the :term:`Build Directory`::
+the ``local.conf`` file found in the :term:`Build Directory`:
+
+.. code-block:: bitbake
 
    INHERIT += "archiver"
    ARCHIVER_MODE[src] = "original"
@@ -417,7 +443,9 @@ One requirement that is often overlooked is inclusion of license text.
 This requirement also needs to be dealt with prior to generating the
 final image. Some licenses require the license text to accompany the
 binary. You can achieve this by adding the following to your
-``local.conf`` file::
+``local.conf`` file:
+
+.. code-block:: bitbake
 
    COPY_LIC_MANIFEST = "1"
    COPY_LIC_DIRS = "1"
@@ -528,7 +556,9 @@ variable. Using this variable also avoids QA errors when you use a
 non-common, non-CLOSED license in a recipe.
 
 Here is an example that uses the ``LICENSE.Abilis.txt`` file as
-the license from the fetched source::
+the license from the fetched source:
+
+.. code-block:: bitbake
 
    NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
 
diff --git a/documentation/dev-manual/limiting-resources.rst b/documentation/dev-manual/limiting-resources.rst
index 9b3db0a59514..8101a9d1ea3b 100644
--- a/documentation/dev-manual/limiting-resources.rst
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -38,7 +38,9 @@ details.
 
    If you want to have a different limit from the rest of the build for a
    recipe, it is also possible to achieve with the following line added to your
-   ``local.conf`` :term:`configuration file`::
+   ``local.conf`` :term:`configuration file`:
+
+   .. code-block:: bitbake
 
       PARALLEL_MAKE:pn-linux-yocto = "-j4"
 
diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index 71fe542efbbd..356dcb768def 100644
--- a/documentation/dev-manual/multiconfig.rst
+++ b/documentation/dev-manual/multiconfig.rst
@@ -61,7 +61,9 @@ Follow these steps to set up and execute multiple configuration builds:
 
    Here is an example showing the minimal statements needed in a
    :term:`configuration file` named ``qemux86.conf`` for a ``qemux86`` target
-   whose temporary build directory is ``tmp-qemux86``::
+   whose temporary build directory is ``tmp-qemux86``:
+
+   .. code-block:: bitbake
 
       MACHINE = "qemux86"
       TMPDIR .= "-${BB_CURRENT_MC}"
@@ -77,7 +79,9 @@ Follow these steps to set up and execute multiple configuration builds:
    variable in your ``conf/local.conf`` configuration file to specify
    each multiconfig. Continuing with the example from the previous
    figure, the :term:`BBMULTICONFIG` variable needs to enable two
-   multiconfigs: "x86" and "arm" by specifying each configuration file::
+   multiconfigs: "x86" and "arm" by specifying each configuration file:
+
+   .. code-block:: bitbake
 
       BBMULTICONFIG = "x86 arm"
 
@@ -134,13 +138,17 @@ essentially that the
 
 To enable dependencies in a multiple configuration build, you must
 declare the dependencies in the recipe using the following statement
-form::
+form:
+
+.. code-block:: bitbake
 
    task_or_package[mcdepends] = "mc:from_multiconfig:to_multiconfig:recipe_name:task_on_which_to_depend"
 
 To better show how to use this statement, consider the example scenario
 from the first paragraph of this section. The following statement needs
-to be added to the recipe that builds the ``core-image-sato`` image::
+to be added to the recipe that builds the ``core-image-sato`` image:
+
+.. code-block:: bitbake
 
    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_rootfs"
 
@@ -161,7 +169,9 @@ dependency, BitBake also executes through the :ref:`ref-tasks-rootfs` task for t
 
 Having a recipe depend on the root filesystem of another build might not
 seem that useful. Consider this change to the statement in the
-``core-image-sato`` recipe::
+``core-image-sato`` recipe:
+
+.. code-block:: bitbake
 
    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_image"
 
@@ -192,7 +202,9 @@ Suggested best practices
    the deployed item based on :term:`TMPDIR`.
 
    The :ref:`ref-tasks-install` and :ref:`ref-tasks-deploy` tasks should look
-   like this::
+   like this:
+
+   .. code-block:: bitbake
 
       do_install() {
           install -m 0644 ${TMPDIR}-<multiconfig>/tmp/deploy/images/<machine>/somefile ${D}/some/path
@@ -234,7 +246,9 @@ Configuration Build`, each multiconfig will require a separate
 :term:`TMPDIR` for our baremetal firmware build configuration.
 
 For example, we will define a new ``conf/multiconfig/baremetal-firmware.conf``
-as follows::
+as follows:
+
+.. code-block:: bitbake
 
    TMPDIR .= "-${BB_CURRENT_MC}"
    TCLIBC = "newlib"
@@ -272,7 +286,9 @@ Using a ``mcdepend``, a recipe belonging to the Linux build can trigger the
 build of ``my-firmware``. For example, let's consider that our Linux build needs
 to assemble a "special" firmware that uses the output of our ``my-firmware``
 recipe - let's call it ``my-parent-firmware.bb``. Then, we should specify this
-dependency in ``my-parent-firmware.bb`` with::
+dependency in ``my-parent-firmware.bb`` with:
+
+.. code-block:: bitbake
 
    do_compile[mcdepends] = "mc::baremetal-firmware:my-firmware:do_deploy"
 
@@ -287,7 +303,9 @@ After ``my-firmware`` recipe has deployed ``my-firmware.elf``, we need to use
 the output in some way. We can make a series of assumptions, based on the
 default Yocto Project variables in order to get the binary for packaging.
 
-First, we can set the following in ``my-parent-firmware.bb``::
+First, we can set the following in ``my-parent-firmware.bb``:
+
+.. code-block:: bitbake
 
    FIRMWARE_FILE ??= "${TMPDIR}-baremetal-firmware/deploy/images/<machine>/my-firmware.elf"
    FIRMWARE_FILE[vardepsexclude] += "TMPDIR"
@@ -302,7 +320,9 @@ cache <overview-manual/concepts:shared state cache>`.
 Additionally, ``<machine>`` should be replaced by the :term:`MACHINE` for which
 we are building in the baremetal-firmware context.
 
-We can then add a :ref:`ref-tasks-install` task to ``my-parent-firmware``::
+We can then add a :ref:`ref-tasks-install` task to ``my-parent-firmware``:
+
+.. code-block:: bitbake
 
    do_install() {
        install -Dm 0644 ${FIRMWARE_FILE} ${D}/lib/firmware/my-firmware.elf
diff --git a/documentation/dev-manual/new-machine.rst b/documentation/dev-manual/new-machine.rst
index b4d29027be12..c08e359a2e64 100644
--- a/documentation/dev-manual/new-machine.rst
+++ b/documentation/dev-manual/new-machine.rst
@@ -77,7 +77,9 @@ of adding a suitable ``defconfig`` file. The file needs to be added into
 a location similar to ``defconfig`` files used for other machines in a
 given kernel recipe. A possible way to do this is by listing the file in
 the :term:`SRC_URI` and adding the machine to the expression in
-:term:`COMPATIBLE_MACHINE`::
+:term:`COMPATIBLE_MACHINE`:
+
+.. code-block:: bitbake
 
    COMPATIBLE_MACHINE = '(qemux86|qemumips)'
 
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index d1c863117259..27e9065d5f4c 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -147,7 +147,9 @@ get started. Here are some points on both methods:
 -  *Use and modify the following skeleton recipe:* If for some reason
    you do not want to use ``recipetool`` and you cannot find an existing
    recipe that is close to meeting your needs, you can use the following
-   structure to provide the fundamental areas of a new recipe::
+   structure to provide the fundamental areas of a new recipe:
+
+   .. code-block:: bitbake
 
       DESCRIPTION = ""
       HOMEPAGE = ""
@@ -170,7 +172,9 @@ the recipe.
    recipe through the layer's ``conf/layer.conf`` file and the
    :term:`BBFILES` variable. This
    variable sets up a path from which the build system can locate
-   recipes. Here is the typical use::
+   recipes. Here is the typical use:
+
+   .. code-block:: bitbake
 
       BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
                   ${LAYERDIR}/recipes-*/*/*.bbappend"
@@ -289,7 +293,9 @@ recipe to match the new version.
 Here is a simple example from the
 :oe_git:`strace recipe </openembedded-core/tree/meta/recipes-devtools/strace>`
 where the source comes from a single tarball. Notice the use of the
-:term:`PV` variable::
+:term:`PV` variable:
+
+.. code-block:: bitbake
 
    SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
 
@@ -303,7 +309,9 @@ another example that specifies these types of files, see the
 Another way of specifying source is from an SCM. For Git repositories,
 you must specify :term:`SRCREV` and you should specify :term:`PV` to include
 a ``+`` sign in its definition. Here is an example from the recipe
-:oe_git:`l3afpad_git.bb </openembedded-core/tree/meta/recipes-sato/l3afpad/l3afpad_git.bb>`::
+:oe_git:`l3afpad_git.bb </openembedded-core/tree/meta/recipes-sato/l3afpad/l3afpad_git.bb>`:
+
+.. code-block:: bitbake
 
    SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
 
@@ -329,7 +337,9 @@ If your :term:`SRC_URI` variable points to more than a single URL (excluding
 SCM URLs), you need to provide the ``sha256`` checksum for each URL. For these
 cases, you provide a name for each URL as part of the :term:`SRC_URI` and then
 reference that name in the subsequent checksum statements. Here is an example
-combining lines from the files ``git.inc`` and ``git_2.24.1.bb``::
+combining lines from the files ``git.inc`` and ``git_2.24.1.bb``:
+
+.. code-block:: bitbake
 
    SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
               ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
@@ -360,7 +370,9 @@ paste them into your recipe and then run the build again to continue.
 This final example is a bit more complicated and is from the
 :oe_git:`rxvt-unicode </openembedded-core/tree/meta/recipes-sato/rxvt-unicode>`
 recipe. The example's :term:`SRC_URI` statement identifies multiple files as the source
-files for the recipe: a tarball, a patch file, a desktop file, and an icon::
+files for the recipe: a tarball, a patch file, a desktop file, and an icon:
+
+.. code-block:: bitbake
 
    SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
               file://xwc.patch \
@@ -396,7 +408,9 @@ Limiting the Number of Parallel Connections
 Some users are behind firewalls or use servers where the number of parallel
 connections is limited. In such cases, you can limit the number of fetch
 tasks being run in parallel by adding the following to your ``local.conf``
-file::
+file:
+
+.. code-block:: bitbake
 
    do_fetch[number_threads] = "4"
 
@@ -644,7 +658,9 @@ standard mainline kernel, not your own custom one.
 When you use custom kernel headers you need to get them from
 :term:`STAGING_KERNEL_DIR`,
 which is the directory with kernel headers that are required to build
-out-of-tree modules. Your recipe will also need the following::
+out-of-tree modules. Your recipe will also need the following:
+
+.. code-block:: bitbake
 
    do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
@@ -675,7 +691,9 @@ Here are some common issues that cause failures.
 
    To fix the problem, you need to either satisfy the missing dependency
    in the Makefile or whatever script produced the Makefile, or (as a
-   workaround) set :term:`PARALLEL_MAKE` to an empty string::
+   workaround) set :term:`PARALLEL_MAKE` to an empty string:
+
+   .. code-block:: bitbake
 
       PARALLEL_MAKE = ""
 
@@ -784,7 +802,9 @@ installed correctly.
       can result in race conditions. If you experience intermittent failures
       during :ref:`ref-tasks-install`, you might be able to work around them by
       disabling parallel Makefile installs by adding the following to the
-      recipe::
+      recipe:
+
+      .. code-block:: bitbake
 
          PARALLEL_MAKEINST = ""
 
@@ -895,7 +915,9 @@ take. The following list describes the process:
    :term:`MACHINE` value is passed
    into the configure script or a patch is applied only for a particular
    machine), you should mark them as such by adding the following to the
-   recipe::
+   recipe:
+
+   .. code-block:: bitbake
 
       PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -903,7 +925,9 @@ take. The following list describes the process:
    contain anything specific to the target machine or architecture at
    all (e.g. recipes that simply package script files or configuration
    files), you should use the :ref:`ref-classes-allarch` class to
-   do this for you by adding this to your recipe::
+   do this for you by adding this to your recipe:
+
+   .. code-block:: bitbake
 
       inherit allarch
 
@@ -947,7 +971,9 @@ used by the :ref:`ref-tasks-populate_sysroot` task as defined by the
 :term:`SYSROOT_DIRS` variable to automatically populate the sysroot. It
 is possible to modify the list of directories that populate the sysroot.
 The following example shows how you could add the ``/opt`` directory to
-the list of directories within a recipe::
+the list of directories within a recipe:
+
+.. code-block:: bitbake
 
    SYSROOT_DIRS += "/opt"
 
@@ -974,7 +1000,9 @@ recipe. Suppose you have three kernel recipes whose :term:`PN` values map to
 ``kernel-big``, ``kernel-mid``, and ``kernel-small``. Furthermore, each of
 these recipes in some way uses a :term:`PROVIDES` statement that essentially
 identifies itself as being able to provide ``virtual/kernel``. Here is one way
-through the :ref:`ref-classes-kernel` class::
+through the :ref:`ref-classes-kernel` class:
+
+.. code-block:: bitbake
 
    PROVIDES += "virtual/kernel"
 
@@ -996,7 +1024,9 @@ relevant line from that include file::
 When you use a virtual provider, you do not have to "hard code" a recipe
 name as a build dependency. You can use the
 :term:`DEPENDS` variable to state the
-build is dependent on ``virtual/kernel`` for example::
+build is dependent on ``virtual/kernel`` for example:
+
+.. code-block:: bitbake
 
    DEPENDS = "virtual/kernel"
 
@@ -1053,7 +1083,9 @@ build system and package managers, so the resulting packages will not
 correctly trigger an upgrade.
 
 In order to ensure the versions compare properly, the recommended
-convention is to use a tilde (``~``) character as follows::
+convention is to use a tilde (``~``) character as follows:
+
+.. code-block:: bitbake
 
   PV = 0.8.16~rc1
 
@@ -1158,7 +1190,9 @@ Building an application from a single file that is stored locally (e.g. under
 variable. Additionally, you need to manually write the :ref:`ref-tasks-compile`
 and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
 directory containing the source code, which is set to :term:`UNPACKDIR` in this
-case --- the directory BitBake uses for the build::
+case --- the directory BitBake uses for the build:
+
+.. code-block:: bitbake
 
    SUMMARY = "Simple helloworld application"
    SECTION = "examples"
@@ -1198,11 +1232,15 @@ empty :ref:`ref-tasks-install` task by default.
 Some applications might require extra parameters to be passed to the
 compiler. For example, the application might need an additional header
 path. You can accomplish this by adding to the :term:`CFLAGS` variable. The
-following example shows this::
+following example shows this:
+
+.. code-block:: bitbake
 
    CFLAGS:prepend = "-I ${S}/include "
 
-In the following example, ``lz4`` is a makefile-based package::
+In the following example, ``lz4`` is a makefile-based package:
+
+.. code-block:: bitbake
 
    SUMMARY = "Extremely Fast Compression algorithm"
    DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
@@ -1242,7 +1280,9 @@ inherit the :ref:`ref-classes-autotools` class, which contains the definitions
 of all the steps needed to build an Autotool-based application. The result of
 the build is automatically packaged. And, if the application uses NLS for
 localization, packages with local information are generated (one package per
-language). Here is one example: (``hello_2.3.bb``)::
+language). Here is one example: (``hello_2.3.bb``):
+
+.. code-block:: bitbake
 
    SUMMARY = "GNU Helloworld application"
    SECTION = "examples"
@@ -1268,7 +1308,9 @@ just need a recipe that has sources described in :term:`SRC_URI` and inherits
 the :ref:`ref-classes-meson` class.
 
 The :oe_git:`ipcalc recipe </meta-openembedded/tree/meta-networking/recipes-support/ipcalc>`
-is a simple example of an application without dependencies::
+is a simple example of an application without dependencies:
+
+.. code-block:: bitbake
 
    SUMMARY = "Tool to assist in network address calculations for IPv4 and IPv6."
    HOMEPAGE = "https://gitlab.com/ipcalc/ipcalc"
@@ -1296,7 +1338,9 @@ application into multiple packages.
 Here is an example that uses the ``libxpm`` recipe. By default,
 this recipe generates a single package that contains the library along
 with a few binaries. You can modify the recipe to split the binaries
-into separate packages::
+into separate packages:
+
+.. code-block:: bitbake
 
    require xorg-lib-common.inc
 
@@ -1385,7 +1429,9 @@ doing the following:
    that replaces :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` with custom
    versions, then you can use the
    ``[``\ :ref:`noexec <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
-   flag to turn the tasks into no-ops, as follows::
+   flag to turn the tasks into no-ops, as follows:
+
+   .. code-block:: bitbake
 
       do_configure[noexec] = "1"
       do_compile[noexec] = "1"
@@ -1409,7 +1455,9 @@ As a basic example of a :ref:`ref-classes-bin-package`-style recipe, consider
 this snippet from the
 :oe_git:`wireless-regdb </openembedded-core/tree/meta/recipes-kernel/wireless-regdb>`
 recipe file, which fetches a single tarball of binary content and manually
-installs with no need for any configuration or compilation::
+installs with no need for any configuration or compilation:
+
+.. code-block:: bitbake
 
    SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
    SRC_URI[sha256sum] = "57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456"
@@ -1454,7 +1502,9 @@ chapter of the BitBake User Manual.
    supported.
 
    The following example shows some of the ways you can use variables in
-   recipes::
+   recipes:
+
+   .. code-block:: bitbake
 
       S = "${UNPACKDIR}/postfix-${PV}"
       CFLAGS += "-DNO_ASM"
@@ -1467,7 +1517,9 @@ chapter of the BitBake User Manual.
    syntax, although access to OpenEmbedded variables and internal
    methods are also available.
 
-   Here is an example function from the ``sed`` recipe::
+   Here is an example function from the ``sed`` recipe:
+
+   .. code-block:: bitbake
 
       do_install () {
           autotools_do_install
@@ -1490,7 +1542,9 @@ chapter of the BitBake User Manual.
    from other files (``include`` and ``require``) and export variables
    to the environment (``export``).
 
-   The following example shows the use of some of these keywords::
+   The following example shows the use of some of these keywords:
+
+   .. code-block:: bitbake
 
       export POSTCONF = "${STAGING_BINDIR}/postconf"
       inherit autoconf
@@ -1509,7 +1563,9 @@ in the BitBake User Manual.
 
 -  *Line Continuation (\\):* Use the backward slash (``\``) character to
    split a statement over multiple lines. Place the slash character at
-   the end of the line that is to be continued on the next line::
+   the end of the line that is to be continued on the next line:
+
+   .. code-block:: bitbake
 
        VAR = "A really long \
               line"
@@ -1520,7 +1576,9 @@ in the BitBake User Manual.
       slash character.
 
 -  *Using Variables (${VARNAME}):* Use the ``${VARNAME}`` syntax to
-   access the contents of a variable::
+   access the contents of a variable:
+
+   .. code-block:: bitbake
 
       SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/zlib-${PV}.tar.gz"
 
@@ -1540,7 +1598,9 @@ in the BitBake User Manual.
       when you make the assignment, but this is not generally needed.
 
 -  *Quote All Assignments ("value"):* Use double quotes around values in
-   all variable assignments (e.g. ``"value"``). Here is an example::
+   all variable assignments (e.g. ``"value"``). Here is an example:
+
+   .. code-block:: bitbake
 
       VAR1 = "${OTHERVAR}"
       VAR2 = "The version is ${PV}"
@@ -1554,11 +1614,15 @@ in the BitBake User Manual.
 
    Here is an example where ``VAR1`` is set to "New value" if it is
    currently empty. However, if ``VAR1`` has already been set, it
-   remains unchanged::
+   remains unchanged:
+
+   .. code-block:: bitbake
 
       VAR1 ?= "New value"
 
-   In this next example, ``VAR1`` is left with the value "Original value"::
+   In this next example, ``VAR1`` is left with the value "Original value":
+
+   .. code-block:: bitbake
 
       VAR1 = "Original value"
       VAR1 ?= "New value"
@@ -1571,7 +1635,9 @@ in the BitBake User Manual.
       This operator adds a space between the existing content of the
       variable and the new content.
 
-   Here is an example::
+   Here is an example:
+
+   .. code-block:: bitbake
 
       SRC_URI += "file://fix-makefile.patch"
 
@@ -1583,7 +1649,9 @@ in the BitBake User Manual.
       This operator adds a space between the new content and the
       existing content of the variable.
 
-   Here is an example::
+   Here is an example:
+
+   .. code-block:: bitbake
 
       VAR =+ "Starts"
 
@@ -1597,13 +1665,17 @@ in the BitBake User Manual.
 
    The following example shows the space being explicitly added to the
    start to ensure the appended value is not merged with the existing
-   value::
+   value:
+
+   .. code-block:: bitbake
 
       CFLAGS:append = " --enable-important-feature"
 
    You can also use
    the ``:append`` operator with overrides, which results in the actions
-   only being performed for the specified target or machine::
+   only being performed for the specified target or machine:
+
+   .. code-block:: bitbake
 
       CFLAGS:append:sh4 = " --enable-important-sh4-specific-feature"
 
@@ -1615,13 +1687,17 @@ in the BitBake User Manual.
 
    The following example shows the space being explicitly added to the
    end to ensure the prepended value is not merged with the existing
-   value::
+   value:
+
+   .. code-block:: bitbake
 
       CFLAGS:prepend = "-I${S}/myincludes "
 
    You can also use the
    ``:prepend`` operator with overrides, which results in the actions
-   only being performed for the specified target or machine::
+   only being performed for the specified target or machine:
+
+   .. code-block:: bitbake
 
       CFLAGS:prepend:sh4 = "-I${S}/myincludes "
 
@@ -1631,7 +1707,9 @@ in the BitBake User Manual.
    value to "standard/base" for any target
    :term:`MACHINE`, except for
    qemuarm where it should be set to "standard/arm-versatile-926ejs",
-   you would do the following::
+   you would do the following:
+
+   .. code-block:: bitbake
 
       KBRANCH = "standard/base"
       KBRANCH:qemuarm = "standard/arm-versatile-926ejs"
@@ -1654,7 +1732,9 @@ in the BitBake User Manual.
    search and replacement on a variable).
 
    You indicate Python code using the ``${@python_code}`` syntax for the
-   variable assignment::
+   variable assignment:
+
+   .. code-block:: bitbake
 
       SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.', '')}.tgz
 
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index c75584c936bf..16ce82606007 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -163,7 +163,9 @@ be consistent and correct with the latest changes.
 The simplest form for a PR Service is for a single host development system
 that builds the package feed (building system). For this scenario, you can
 enable a local PR Service by setting :term:`PRSERV_HOST` in your
-``local.conf`` file in the :term:`Build Directory`::
+``local.conf`` file in the :term:`Build Directory`:
+
+.. code-block:: bitbake
 
    PRSERV_HOST = "localhost:0"
 
@@ -248,13 +250,17 @@ the specific source code revision from which to build. You set the
 :term:`SRCREV` variable to
 :term:`AUTOREV` to cause the
 OpenEmbedded build system to automatically use the latest revision of
-the software::
+the software:
+
+.. code-block:: bitbake
 
    SRCREV = "${AUTOREV}"
 
 Furthermore, you need to include a ``+`` sign in :term:`PV` in order to
 automatically update the version whenever the revision of the source
-code changes. Here is an example::
+code changes. Here is an example:
+
+.. code-block:: bitbake
 
    PV = "1.0+git"
 
@@ -338,7 +344,9 @@ package for each one it finds by appending to the
 :term:`PACKAGES` variable and
 setting the appropriate values for ``FILES:packagename``,
 ``RDEPENDS:packagename``, ``DESCRIPTION:packagename``, and so forth.
-Here is an example from the ``lighttpd`` recipe::
+Here is an example from the ``lighttpd`` recipe:
+
+.. code-block:: bitbake
 
    python populate_packages:prepend () {
        lighttpd_libdir = d.expand('${libdir}')
@@ -470,7 +478,9 @@ any dependencies on optional modules from other recipes are satisfied by
 your recipe. You can be sure these dependencies are satisfied by using
 the :term:`PACKAGES_DYNAMIC`
 variable. Here is an example that continues with the ``lighttpd`` recipe
-shown earlier::
+shown earlier:
+
+.. code-block:: bitbake
 
    PACKAGES_DYNAMIC = "lighttpd-module-.*"
 
@@ -561,7 +571,9 @@ variable to specify the format:
 #. Open the ``local.conf`` file inside your :term:`Build Directory` (e.g.
    ``bitbake-builds/build/conf/local.conf``).
 
-#. Select the desired package format as follows::
+#. Select the desired package format as follows:
+
+   .. code-block:: bitbake
 
       PACKAGE_CLASSES ?= "package_packageformat"
 
@@ -837,11 +849,15 @@ Signing RPM Packages
 
 To enable signing RPM packages, you must modify the ``rpm``
 recipe configuration to include support for OpenPGP signing.
-That may be done either in a ``.bbappend`` for the ``rpm`` recipe::
+That may be done either in a ``.bbappend`` for the ``rpm`` recipe:
+
+.. code-block:: bitbake
 
    PACKAGECONFIG:append = " sequoia"
 
-or in a :term:`Configuration File`::
+or in a :term:`Configuration File`:
+
+.. code-block:: bitbake
 
    PACKAGECONFIG:append:pn-rpm-native = " sequoia"
    PACKAGECONFIG:append:pn-rpm = " sequoia"
@@ -878,7 +894,9 @@ signed package feeds for IPK and RPM packages.
 
 The steps you need to take to enable signed package feed use are similar
 to the steps used to sign RPM packages. You must define the following in
-your ``local.config`` or ``distro.config`` file::
+your ``local.config`` or ``distro.config`` file:
+
+.. code-block:: bitbake
 
    INHERIT += "sign_package_feed"
    PACKAGE_FEED_GPG_NAME = "key_name"
@@ -1115,7 +1133,9 @@ command::
    $ devtool add https://github.com/martinaglv/cute-files.git
 
 The recipe this command generates is very similar to the recipe created in
-the previous section. However, the :term:`SRC_URI` looks like the following::
+the previous section. However, the :term:`SRC_URI` looks like the following:
+
+.. code-block:: bitbake
 
    SRC_URI = " \
        git://github.com/martinaglv/cute-files.git;protocol=https;branch=master \
@@ -1167,7 +1187,9 @@ by the literal sequence '\\n'. The separator can be redefined using the
 variable flag ``separator``.
 
 Here is an example that adds two custom fields for ipk
-packages::
+packages:
+
+.. code-block:: bitbake
 
    PACKAGE_ADD_METADATA_IPK = "Vendor: CustomIpk\nGroup:Applications/Spreadsheets"
 
diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index 833e1631ee50..f2287c25c339 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -119,7 +119,9 @@ an entire Linux distribution, including the toolchain, from source.
        can download these artifacts faster than you would be able to build them.
 
        To use such mirrors, uncomment the below lines in your ``conf/local.conf``
-       file in the :term:`Build Directory`::
+       file in the :term:`Build Directory`:
+
+       .. code-block:: bitbake
 
           BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
           SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
index 9cc8bd2d9dee..8eb4d5023b17 100644
--- a/documentation/dev-manual/prebuilt-libraries.rst
+++ b/documentation/dev-manual/prebuilt-libraries.rst
@@ -149,7 +149,9 @@ triggers a QA warning that a non-symlink library is in a ``-dev`` package,
 and binaries in the same recipe link to the library in ``${PN}-dev``,
 which triggers more QA warnings. To solve this problem, you need to package the
 unversioned library into ``${PN}`` where it belongs. The abridged
-default :term:`FILES` variables in ``bitbake.conf`` are::
+default :term:`FILES` variables in ``bitbake.conf`` are:
+
+.. code-block:: bitbake
 
    SOLIBS = ".so.*"
    SOLIBSDEV = ".so"
@@ -162,7 +164,9 @@ default :term:`FILES` variables in ``bitbake.conf`` are::
 variables are then used in ``FILES:${PN}`` and ``FILES:${PN}-dev``, which puts
 the real libraries into ``${PN}`` and the unversioned symbolic link into ``${PN}-dev``.
 To package unversioned libraries, you need to modify the variables in the recipe
-as follows::
+as follows:
+
+.. code-block:: bitbake
 
    SOLIBS = ".so"
    FILES_SOLIBSDEV = ""
@@ -186,7 +190,9 @@ The example below installs an unversioned x86-64 pre-built library named
 x86-64 architecture while the :term:`INSANE_SKIP`, :term:`INHIBIT_PACKAGE_STRIP`
 and :term:`INHIBIT_SYSROOT_STRIP` variables are all set as in the above
 versioned library example. The "magic" is setting the :term:`SOLIBS` and
-:term:`FILES_SOLIBSDEV` variables as explained above::
+:term:`FILES_SOLIBSDEV` variables as explained above:
+
+.. code-block:: bitbake
 
    SUMMARY = "libfoo sample recipe"
    SECTION = "libs"
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 514a72fc528a..eead23f67376 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -434,7 +434,9 @@ command line:
    (or the next free ports). Specific forwarding rules can be configured
    by setting ``QB_SLIRP_OPT`` as environment variable or in ``qemuboot.conf``
    in the :term:`Build Directory` ``deploy/image`` directory.
-   Examples::
+   Examples:
+
+   .. code-block:: bitbake
 
       QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp::8080-:80"
 
diff --git a/documentation/dev-manual/quilt.rst b/documentation/dev-manual/quilt.rst
index 59240705ad99..2173d86981db 100644
--- a/documentation/dev-manual/quilt.rst
+++ b/documentation/dev-manual/quilt.rst
@@ -83,7 +83,9 @@ Follow these general steps:
    that holds the recipe (``.bb``) file or the append (``.bbappend``)
    file. Placing the patch here guarantees that the OpenEmbedded build
    system will find the patch. Next, add the patch into the :term:`SRC_URI`
-   of the recipe. Here is an example::
+   of the recipe. Here is an example:
+
+   .. code-block:: bitbake
 
       SRC_URI += "file://my_changes.patch"
 
diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index 45b63ed8edea..aff328423287 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -27,7 +27,9 @@ assessments, as all the components used in the Software Supply Chain are listed.
 The OpenEmbedded build system generates such information by default (by
 inheriting the :ref:`ref-classes-create-spdx` class in :term:`INHERIT_DISTRO`).
 
-If needed, it can be disabled from a :term:`configuration file`::
+If needed, it can be disabled from a :term:`configuration file`:
+
+.. code-block:: bitbake
 
    INHERIT_DISTRO:remove = "create-spdx"
 
diff --git a/documentation/dev-manual/speeding-up-build.rst b/documentation/dev-manual/speeding-up-build.rst
index 262935313a19..a6930fc41642 100644
--- a/documentation/dev-manual/speeding-up-build.rst
+++ b/documentation/dev-manual/speeding-up-build.rst
@@ -90,7 +90,9 @@ that can help you speed up the build:
 -  Disable static library generation for recipes derived from
    ``autoconf`` or ``libtool``: Here is an example showing how to
    disable static libraries and still provide an override to handle
-   exceptions::
+   exceptions:
+
+   .. code-block:: bitbake
 
       STATICLIBCONF = "--disable-static"
       STATICLIBCONF:sqlite3-native = ""
diff --git a/documentation/dev-manual/sstate-mirrors-setup.rst b/documentation/dev-manual/sstate-mirrors-setup.rst
index e69aa00d1cc6..a0c6e7d579fc 100644
--- a/documentation/dev-manual/sstate-mirrors-setup.rst
+++ b/documentation/dev-manual/sstate-mirrors-setup.rst
@@ -86,7 +86,9 @@ Client Configuration
 
 Configuring clients to this server happens through a :term:`configuration file`,
 for example, the :ref:`site.conf <structure-build-conf-site.conf>` file. Only
-the :term:`SSTATE_MIRRORS` variable is needed to setup the connection::
+the :term:`SSTATE_MIRRORS` variable is needed to setup the connection:
+
+.. code-block:: bitbake
 
    SSTATE_MIRRORS = "file://.* http://127.0.0.1:8000/PATH;downloadfilename=PATH"
 
@@ -134,7 +136,9 @@ Going Further
 
    Another method to configure the username and password is from the
    URL in :term:`SSTATE_MIRRORS` directly, with the ``user`` and ``pswd``
-   parameters::
+   parameters:
+
+   .. code-block:: bitbake
 
       SSTATE_MIRRORS ?= "\
           file://.* https://someserver.tld/share/sstate/PATH;user=<user>;pswd=<password>;downloadfilename=PATH \
@@ -146,7 +150,9 @@ Going Further
    mirror as an exception.
 
 -  Multiple shared state sources can be specified in the :term:`SSTATE_MIRRORS`
-   variable. For example::
+   variable. For example:
+
+   .. code-block:: bitbake
 
       SSTATE_MIRRORS = "\
          file://.* https://someserver.com/PATH;downloadfilename=PATH \
@@ -158,7 +164,9 @@ Going Further
 
 -  Fetching the shared state artifacts from a local directory, such as an
    :wikipedia:`NFS <Network_File_System>`-mounted directory, is also possible
-   using the ``file://`` fetcher::
+   using the ``file://`` fetcher:
+
+   .. code-block:: bitbake
 
       SSTATE_MIRRORS = "file://.* file:///path/to/shared-state/PATH;downloadfilename=PATH"
 
diff --git a/documentation/dev-manual/temporary-source-code.rst b/documentation/dev-manual/temporary-source-code.rst
index cb27d22070ef..a2f6b6ef40d5 100644
--- a/documentation/dev-manual/temporary-source-code.rst
+++ b/documentation/dev-manual/temporary-source-code.rst
@@ -16,7 +16,9 @@ During a build, the unpacked temporary source code used by recipes to
 build packages is available in the :term:`Build Directory` as defined by the
 :term:`S` variable. Below is the default value for the :term:`S` variable as
 defined in the ``meta/conf/bitbake.conf`` configuration file in
-:term:`OpenEmbedded-Core (OE-Core)`::
+:term:`OpenEmbedded-Core (OE-Core)`:
+
+.. code-block:: bitbake
 
    S = "${UNPACKDIR}/${BP}"
 
@@ -26,7 +28,9 @@ You should be aware that many recipes override the
 .. note::
 
    The :term:`BP` represents the base recipe name, which consists of the name
-   and version::
+   and version:
+
+   .. code-block:: bitbake
 
            BP = "${BPN}-${PV}"
 
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index cc984bbccbeb..fdbe630393a7 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -103,7 +103,9 @@ The following steps describe how to set up the AUH utility:
    -  If you want to enable :ref:`Build
       History <dev-manual/build-quality:maintaining build output quality with \`\`buildhistory\`\`>`,
       which is optional, you need the following lines in the
-      ``conf/local.conf`` file::
+      ``conf/local.conf`` file:
+
+      .. code-block:: bitbake
 
          INHERIT =+ "buildhistory"
          BUILDHISTORY_COMMIT = "1"
@@ -115,14 +117,18 @@ The following steps describe how to set up the AUH utility:
 
    -  If you want to enable testing through the :ref:`ref-classes-testimage`
       class, which is optional, you need to have the following set in
-      your ``conf/local.conf`` file::
+      your ``conf/local.conf`` file:
+
+      .. code-block:: bitbake
 
          IMAGE_CLASSES += "testimage"
 
       .. note::
 
          If your distro does not enable by default ptest, which :term:`Poky`
-         does, you need the following in your ``local.conf`` file::
+         does, you need the following in your ``local.conf`` file:
+
+         .. code-block:: bitbake
 
                  DISTRO_FEATURES:append = " ptest"
 
diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
index 18d1bfb0a608..510bc2bcfd91 100644
--- a/documentation/dev-manual/wayland.rst
+++ b/documentation/dev-manual/wayland.rst
@@ -48,7 +48,9 @@ Wayland with Kernel Mode Setting
 (`KMS <https://wiki.archlinux.org/index.php/Kernel_Mode_Setting>`__)
 support, include the "wayland" flag in the
 :term:`DISTRO_FEATURES`
-statement in your ``local.conf`` file::
+statement in your ``local.conf`` file:
+
+.. code-block:: bitbake
 
    DISTRO_FEATURES:append = " wayland"
 
@@ -63,7 +65,9 @@ Installing Wayland and Weston
 To install the Wayland feature into an image, you must include the
 following
 :term:`CORE_IMAGE_EXTRA_INSTALL`
-statement in your ``local.conf`` file::
+statement in your ``local.conf`` file:
+
+.. code-block:: bitbake
 
    CORE_IMAGE_EXTRA_INSTALL += "wayland weston"
 
diff --git a/documentation/dev-manual/x32-psabi.rst b/documentation/dev-manual/x32-psabi.rst
index 0a19d28233d8..1bff33a34a3b 100644
--- a/documentation/dev-manual/x32-psabi.rst
+++ b/documentation/dev-manual/x32-psabi.rst
@@ -39,7 +39,9 @@ follows:
 -  There is support for large images.
 
 To use the x32 psABI, you need to edit your ``conf/local.conf``
-configuration file as follows::
+configuration file as follows:
+
+.. code-block:: bitbake
 
    MACHINE = "qemux86-64"
    DEFAULTTUNE = "x86-64-x32"

