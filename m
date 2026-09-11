Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0000EC88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:11:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41862.1789139518430466897
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nx+ARZ18;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E70EC63A0E
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:12:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD553601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18C2C11C7AFAC;
	Fri, 11 Sep 2026 17:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BjWQl+RGzlgc3xoBRSMhlZBRgQTEjous4eHdcSrXRhM=;
	b=nx+ARZ18GjHMo5pc8rULCP6ybngD3QwUQuKSuzStH9HCY/N3tnJ3bTHKQiyyBzWe3gcMHk
	lev3goNFDBucL76x0GiD0LbPRWpwlkZaOQe7kA9+1rRcstwd49y2wQlkRaqlmbINj5yzQx
	lLksGvkBFDlAEKQKHdaOZSpf6mATbcrDC93Kh/csgvV1/ahOjaB+Uv3l052Oapy2jrEWtd
	KF5/3uH1cIF8Ncu5T/aYQVpdycfe4sJ2/8YnXag/qPt5yTXa+BQR/OmjpLKc2leudLSdkx
	YAjg5rqXRmN1ZIPrz6owZiCNB4cy/sH2F/VaJdqd6VZz1BkPmB6hhsnJIq8KUA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 17:11:13 +0200
Subject: [PATCH 7/8] docs-wide: advise setting global changes in the proper
 place
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-remove-local-conf-refs-v1-7-322e1e9a232d@bootlin.com>
References: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
In-Reply-To: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=60404;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fHMisMg1kXEetE1ICH/DLZU1MP4WIrDV901y0Xwktk0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBoXumtooRsCtzeF2Gh1kUHJyOaH+QXJxg33F
 a5CBUiyRuiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQaFwAKCRDRgEFAKaOo
 Nuu9D/938RnqrbjHhjoDJe8E+NQaxS/S8yh9d5Ee5PYk2MhSZ4CCbiW10+6Hno6lnmYSJpQWi+B
 eF16ne6wwr7zkAdhEDJeGszp2/J2AbXym7jBuH1oPkGVPnyAF+XqvlmQaljk8ZgqyT4fAVoHES7
 Xmzn6rXaWLeyuhiEUPBCFFU2Pqg3RMNfIqUit2kZ7FRHRVhUBQvsvFGB/9n8Ngjko4hh11fXz46
 VUKHvvzlG79W/WFU3wQmMh/GfgDm72UzM3uv9QLhFJ/HpAoSvkBplOmRHoTg9bMeKXtPqkJ/QaP
 RbrHohyMuK+IyRMmDOHGS3jAKNN4QjmgOtAtu0yUMnwUkRq2tki8VSGQtTNiZLG+luU/Ayb90yw
 RzSP/74baUTSDQPH76S0hfeDbQPkOkcNpAPedNk974+H/L57UsChneBrdrt1dhzdrc3+mTjzGqB
 O3MWw9CbShN6uz28et7PqVBJ+dcjnuvJ0Iw6O3UCdrxWVAzYSU9Hx1eGdBgMeKVr9SKqiyn66rf
 BkRkShOE6HNWaODgR23lqDKeaHeOuEjfzRFN/+TteTMNlIDDPBvnHG8twrPG8qnm8oaaFifo9JT
 w6sz0FCVTdi8pT51js1bs6hVqfGLWGf0zmx2DskSwhe/N49EbEh+IEsF32lixSKc3I+53PJJ5w1
 CMhHe2cmfHzW7Iw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10476

Go over occurrences of "local.conf" in the documentation and replace
these kinds of suggestions by better recommendations, e.g. set this in
your distro/machine configuration file.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/bmaptool.rst              |   5 +-
 documentation/dev-manual/build-quality.rst         |  11 +-
 documentation/dev-manual/building.rst              |  29 +++---
 documentation/dev-manual/custom-distribution.rst   |   6 +-
 documentation/dev-manual/customizing-images.rst    |   9 +-
 documentation/dev-manual/debugging.rst             |   2 +-
 documentation/dev-manual/device-manager.rst        |   4 +-
 .../dev-manual/efficiently-fetching-sources.rst    |   2 +-
 documentation/dev-manual/external-scm.rst          |   2 +-
 documentation/dev-manual/external-toolchain.rst    |   6 +-
 documentation/dev-manual/libraries.rst             |   7 +-
 documentation/dev-manual/licenses.rst              |   3 +-
 documentation/dev-manual/new-recipe.rst            |   9 +-
 documentation/dev-manual/packages.rst              |  16 +--
 documentation/dev-manual/upgrading-recipes.rst     |   8 +-
 documentation/dev-manual/wayland.rst               |   4 +-
 documentation/kernel-dev/common.rst                |   9 +-
 documentation/overview-manual/concepts.rst         |   9 +-
 documentation/profile-manual/intro.rst             |   4 +-
 documentation/profile-manual/usage.rst             |  15 +--
 documentation/ref-manual/classes.rst               |  21 ++--
 documentation/ref-manual/faq.rst                   |   8 +-
 documentation/ref-manual/images.rst                |   5 +-
 documentation/ref-manual/system-requirements.rst   |   2 +-
 documentation/ref-manual/variables.rst             | 115 ++++++++++-----------
 documentation/sdk-manual/appendix-customizing.rst  |   3 +-
 documentation/sdk-manual/appendix-obtain.rst       |  15 ++-
 documentation/security-manual/read-only-rootfs.rst |   2 +-
 documentation/security-manual/securing-images.rst  |   4 +-
 documentation/test-manual/reproducible-builds.rst  |   6 +-
 documentation/test-manual/runtime-testing.rst      |   2 +-
 .../transitioning-to-a-custom-environment.rst      |   2 +-
 32 files changed, 181 insertions(+), 164 deletions(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index 29e7f0d2e..b145974c6 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -28,8 +28,9 @@ Following, is an example that shows how to flash a Wic image. Realize
 that while this example uses a Wic image, you can use `bmaptool` to flash
 any type of image. Use these steps to flash an image using `bmaptool`:
 
-#. *Update your local.conf File:* You need to have the following set
-   in your ``local.conf`` file before building your image::
+#. *Update your image types:* You need to have the :term:`IMAGE_FSTYPES`
+   set in image recipe, distro :term:`configuration file` or
+   :ref:`structure-build-conf-local.conf` file before building your image::
 
       IMAGE_FSTYPES += "wic wic.bmap"
 
diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index e9b066c44..37d18efd2 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -35,8 +35,8 @@ Enabling and Disabling Build History
 
 Build history is disabled by default. To enable it, add the following
 :term:`INHERIT` statement and set the :term:`BUILDHISTORY_COMMIT` variable to
-"1" at the end of your ``conf/local.conf`` file found in the
-:term:`Build Directory`::
+"1" in a :term:`configuration file`, such as the
+:ref:`structure-build-conf-local.conf` file::
 
    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "1"
@@ -53,7 +53,7 @@ build output information and commit it as a single commit to a local
    during the build.
 
 You can disable build history by removing the previous statements from
-your ``conf/local.conf`` file.
+your :term:`configuration file`.
 
 Understanding What the Build History Contains
 =============================================
@@ -134,7 +134,7 @@ You can use the
 ``buildhistory-collect-srcrevs`` command with the ``-a`` option to
 collect the stored :term:`SRCREV` values from build history and report them
 in a format suitable for use in global configuration (e.g.,
-``local.conf`` or a distro include file) to override floating
+a distro include :term:`configuration file`) to override floating
 :term:`AUTOREV` values to a fixed set of revisions. Here is some example
 output from this command::
 
@@ -260,8 +260,7 @@ dependency graphs, so you can see why something was pulled into the
 image. If you are just interested in this information and not interested
 in collecting specific package or SDK information, you can enable
 writing only image information without any history by adding the
-following to your ``conf/local.conf`` file found in the
-:term:`Build Directory`::
+following to a :term:`configuration file`::
 
    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "0"
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 60cb22785..705bad6ed 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -112,8 +112,9 @@ Follow these steps to create an :term:`Initramfs` image:
 #. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
    Image:* If you want the :term:`Initramfs` image that is built to be bundled
    in with the kernel image, set the :term:`INITRAMFS_IMAGE_BUNDLE`
-   variable to ``"1"`` in your ``local.conf`` configuration file and set the
-   :term:`INITRAMFS_IMAGE` variable in the recipe that builds the kernel image.
+   variable to ``"1"`` in a :term:`configuration file`, such as a machine
+   :term:`configuration file`, and set the :term:`INITRAMFS_IMAGE` variable in
+   the recipe that builds the kernel image.
 
    Setting the :term:`INITRAMFS_IMAGE_BUNDLE` flag causes the :term:`Initramfs`
    image to be unpacked into the ``${B}/usr/`` directory. The unpacked
@@ -236,7 +237,7 @@ To achieve this, you need to perform some additional steps:
       TCLIBC = "musl"
 
 #. *Set additional Initramfs variables on your main configuration:*
-   Additionally, on your main configuration (``local.conf``) you need to set the
+   Additionally, in your :term:`configuration file` you need to set the
    variables::
 
      INITRAMFS_MULTICONFIG = "initramfscfg"
@@ -328,10 +329,11 @@ your own distribution that are likely modeled after ``poky-tiny``.
 
 .. note::
 
-   To use ``poky-tiny`` in your build, set the :term:`DISTRO` variable in your
-   ``local.conf`` file to "poky-tiny" as described in the
-   ":ref:`dev-manual/custom-distribution:creating your own distribution`"
-   section.
+   To use ``poky-tiny`` in your build, set the
+   :ref:`ref-fragments-builtin-core-distro` fragment to "poky-tiny" as described in the
+   :ref:`ref-bitbake-config-build-enable-fragment` section, or set the
+   :term:`DISTRO` variable to "poky-tiny" in the
+   :ref:`structure-build-conf-local.conf` file.
 
 Understanding some memory concepts will help you reduce the system size.
 Memory consists of static, dynamic, and temporary memory. Static memory
@@ -414,9 +416,8 @@ minimal impact on the feature set. For example, you might not need a VGA
 display. Or, you might be able to get by with ``devtmpfs`` and ``mdev``
 instead of ``udev``.
 
-Use your ``local.conf`` file to make changes. For example, to eliminate
-``udev`` and ``glib``, set the following in the local configuration
-file::
+Use your distro :term:`configuration file` to make such changes. For example, to
+eliminate ``udev`` and ``glib``, set the following::
 
    VIRTUAL-RUNTIME_dev_manager = ""
 
@@ -792,10 +793,10 @@ any machine and at any time.
 Follow these steps to build your target using the files in the downloads
 directory:
 
-#. *Using Local Files Only:* Inside your ``local.conf`` file, add the
-   :term:`SOURCE_MIRROR_URL` variable, inherit the
-   :ref:`ref-classes-own-mirrors` class, and add the
-   :term:`BB_NO_NETWORK` variable to your ``local.conf``::
+#. *Using Local Files Only:* Inside your ``local.conf`` or distro
+   :term:`configuration file`, add the :term:`SOURCE_MIRROR_URL` variable,
+   inherit the :ref:`ref-classes-own-mirrors` class, and add the
+   :term:`BB_NO_NETWORK` variable::
 
       SOURCE_MIRROR_URL ?= "file:///home/your-download-dir/"
       INHERIT += "own-mirrors"
diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
index 4dafd2725..365bfa8f7 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -40,7 +40,8 @@ layer. The following steps provide some more detail:
    .. note::
 
       The :term:`DISTRO` variable in your ``local.conf`` file determines the
-      name of your distribution.
+      name of your distribution. You can also use the
+      :ref:`ref-fragments-builtin-core-distro` configuration fragment.
 
    You can split out parts of your configuration file into include files
    and then "require" them from within your distribution configuration
@@ -91,6 +92,9 @@ layer. The following steps provide some more detail:
 
       DISTRO = "mydistro"
 
+   You can also set the :ref:`ref-fragments-builtin-core-distro` configuration
+   fragment from the command-line.
+
 -  *Add more to the layer if necessary:* Use your layer to hold other
    information needed for the distribution:
 
diff --git a/documentation/dev-manual/customizing-images.rst b/documentation/dev-manual/customizing-images.rst
index 6eed9ef56..9a345c8bb 100644
--- a/documentation/dev-manual/customizing-images.rst
+++ b/documentation/dev-manual/customizing-images.rst
@@ -56,7 +56,8 @@ high-level image features by using the
 variables. Although the functions for both variables are nearly
 equivalent, best practices dictate using :term:`IMAGE_FEATURES` from within
 a recipe and using :term:`EXTRA_IMAGE_FEATURES` from within your
-``local.conf`` file, which is found in the :term:`Build Directory`.
+``local.conf`` for temporary changes (which is found in the :term:`Build
+Directory`) and a distro :term:`configuration file` for permanent changes.
 
 To understand how these features work, the best reference is
 :ref:`meta/classes-recipe/image.bbclass <ref-classes-image>`.
@@ -90,9 +91,9 @@ image does not contain an SSH server.
 
 You can customize your image and change these defaults. Edit the
 :term:`IMAGE_FEATURES` variable in your recipe or use the
-:term:`EXTRA_IMAGE_FEATURES` in your ``local.conf`` file so that it
-configures the image you are working with to include
-``ssh-server-dropbear`` or ``ssh-server-openssh``.
+:term:`EXTRA_IMAGE_FEATURES` in your ``local.conf`` file (or distro
+:term:`configuration file`) so that it configures the image you are working with
+to include ``ssh-server-dropbear`` or ``ssh-server-openssh``.
 
 .. note::
 
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 3afc17ad4..1718b90d2 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -943,7 +943,7 @@ To run a ``debuginfod`` server, you need to do the following:
    (it already is in :term:`OpenEmbedded-Core (OE-Core)` defaults and
    :term:`Poky` reference distribution).
 
-   If not, set in your distro config file or in ``local.conf``::
+   If not, set in your distro :term:`configuration file` or in ``local.conf``::
 
       DISTRO_FEATURES:append = " debuginfod"
 
diff --git a/documentation/dev-manual/device-manager.rst b/documentation/dev-manual/device-manager.rst
index 49fc785fe..757b23d1a 100644
--- a/documentation/dev-manual/device-manager.rst
+++ b/documentation/dev-manual/device-manager.rst
@@ -31,7 +31,7 @@ The content of the resulting ``/dev`` directory is defined in a Device
 Table file. The
 :term:`IMAGE_DEVICE_TABLES`
 variable defines the Device Table to use and should be set in the
-machine or distro configuration file. Alternatively, you can set this
+machine or distro :term:`configuration file`. Alternatively, you can set this
 variable in your ``local.conf`` configuration file.
 
 If you do not define the :term:`IMAGE_DEVICE_TABLES` variable, the default
@@ -63,7 +63,7 @@ permissions ``0600``.
 To have more control over the device nodes, you can use a device manager like
 ``udev`` or ``busybox-mdev``. You choose the device manager by defining the
 :term:`VIRTUAL-RUNTIME_dev_manager <VIRTUAL-RUNTIME>` variable in your machine
-or distro configuration file. Alternatively, you can set this variable in
+or distro :term:`configuration file`. Alternatively, you can set this variable in
 your ``local.conf`` configuration file::
 
    VIRTUAL-RUNTIME_dev_manager = "udev"
diff --git a/documentation/dev-manual/efficiently-fetching-sources.rst b/documentation/dev-manual/efficiently-fetching-sources.rst
index a3366226c..ab72e8dd2 100644
--- a/documentation/dev-manual/efficiently-fetching-sources.rst
+++ b/documentation/dev-manual/efficiently-fetching-sources.rst
@@ -26,7 +26,7 @@ adding statements to your configuration file so that the build process
 checks local directories first for existing tarballs before checking the
 Internet.
 
-Here is an efficient way to set it up in your ``local.conf`` file::
+Here is an efficient way to set it up in a :term:`configuration file`::
 
    SOURCE_MIRROR_URL ?= "file:///home/you/your-download-dir/"
    INHERIT += "own-mirrors"
diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index e7ab8a4c6..bab5055f7 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -21,7 +21,7 @@ Here is an example::
 during the packaging phase.
 
 Then, you can add the following to your
-``local.conf``::
+:ref:`structure-build-conf-local.conf` file::
 
    SRCREV:pn-PN = "${AUTOREV}"
 
diff --git a/documentation/dev-manual/external-toolchain.rst b/documentation/dev-manual/external-toolchain.rst
index 29459ea12..ea196b67a 100644
--- a/documentation/dev-manual/external-toolchain.rst
+++ b/documentation/dev-manual/external-toolchain.rst
@@ -15,8 +15,10 @@ follows:
    ``bblayers.conf`` file through the
    :term:`BBLAYERS` variable.
 
--  Set the :term:`EXTERNAL_TOOLCHAIN` variable in your ``local.conf`` file
-   to the location in which you installed the toolchain.
+-  Set the :term:`EXTERNAL_TOOLCHAIN` variable in your
+   :ref:`structure-build-conf-local.conf` file
+   to the location in which you installed the toolchain (or in your distro
+   :term:`configuration file`).
 
 The toolchain configuration is very flexible and customizable. It
 is primarily controlled with the :term:`TCMODE` variable. This variable
diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index 160734729..d7b9f0cfc 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -116,9 +116,10 @@ Using Multilib
 --------------
 
 After you have set up the recipes, you need to define the actual
-combination of multiple libraries you want to build. You accomplish this
-through your ``local.conf`` configuration file in the
-:term:`Build Directory`. An example configuration would be as follows::
+combination of multiple libraries you want to build. You can accomplish this
+through your :ref:`structure-build-conf-local.conf` configuration file in the
+:term:`Build Directory`, or a custom machine :term:`configuration file`. An
+example configuration would be as follows::
 
    MACHINE = "qemux86-64"
    require conf/multilib.conf
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 774b5db23..b5091087e 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -417,7 +417,8 @@ One requirement that is often overlooked is inclusion of license text.
 This requirement also needs to be dealt with prior to generating the
 final image. Some licenses require the license text to accompany the
 binary. You can achieve this by adding the following to your
-``local.conf`` file::
+:ref:`structure-build-conf-local.conf` file or distro :term:`configuration
+file`::
 
    COPY_LIC_MANIFEST = "1"
    COPY_LIC_DIRS = "1"
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 3f360597f..f43fc2be3 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -395,8 +395,8 @@ Limiting the Number of Parallel Connections
 
 Some users are behind firewalls or use servers where the number of parallel
 connections is limited. In such cases, you can limit the number of fetch
-tasks being run in parallel by adding the following to your ``local.conf``
-file::
+tasks being run in parallel by adding the following to your
+:ref:`structure-build-conf-local.conf` file::
 
    do_fetch[number_threads] = "4"
 
@@ -1549,8 +1549,9 @@ in the BitBake User Manual.
    assign a value to a variable, but only when the variable is currently
    unset. Use the question mark followed by the equal sign (``?=``) to
    make a "soft" assignment used for conditional assignment. Typically,
-   "soft" assignments are used in the ``local.conf`` file for variables
-   that are allowed to come through from the external environment.
+   "soft" assignments are used in :term:`configuration files <Configuration
+   File>` for variables that are allowed to come through from the external
+   environment.
 
    Here is an example where ``VAR1`` is set to "New value" if it is
    currently empty. However, if ``VAR1`` has already been set, it
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index c75584c93..95488c761 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -33,7 +33,7 @@ or to not install a package at all.
 The following list introduces variables you can use to prevent packages
 from being installed into your image. Each of these variables only works
 with IPK and RPM package types, not for Debian packages.
-Also, you can use these variables from your ``local.conf`` file
+Also, you can use these variables in a distro :term:`configuration file`
 or attach them to a specific image recipe by using a recipe name
 override. For more detail on the variables, see the descriptions in the
 Yocto Project Reference Manual's glossary chapter.
@@ -179,14 +179,16 @@ you need to start the PR Service using the ``bitbake-prserv`` command::
    bitbake-prserv --host ip --port port --start
 
 In addition to
-hand-starting the service, you need to update the ``local.conf`` file of
+hand-starting the service, you need to update the
+:ref:`structure-build-conf-local.conf` file of
 each building system as described earlier so each system points to the
 server and port.
 
 It is also recommended you use build history, which adds some sanity
 checks to binary package versions, in conjunction with the server that
 is running the PR Service. To enable build history, add the following to
-each building system's ``local.conf`` file::
+each building system's :ref:`structure-build-conf-local.conf` file (or set this
+in your distro :term:`configuration file`)::
 
    # It is recommended to activate "buildhistory" for testing the PR service
    INHERIT += "buildhistory"
@@ -558,10 +560,8 @@ to use. In your configuration, you use the
 :term:`PACKAGE_CLASSES`
 variable to specify the format:
 
-#. Open the ``local.conf`` file inside your :term:`Build Directory` (e.g.
-   ``bitbake-builds/build/conf/local.conf``).
-
-#. Select the desired package format as follows::
+#. Select the desired package format as follows from your
+:ref:`structure-build-conf-local.conf` or distro :term:`configuration file`::
 
       PACKAGE_CLASSES ?= "package_packageformat"
 
@@ -878,7 +878,7 @@ signed package feeds for IPK and RPM packages.
 
 The steps you need to take to enable signed package feed use are similar
 to the steps used to sign RPM packages. You must define the following in
-your ``local.config`` or ``distro.config`` file::
+your :ref:`structure-build-conf-local.conf` or distro :term:`configuration file`::
 
    INHERIT += "sign_package_feed"
    PACKAGE_FEED_GPG_NAME = "key_name"
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index 3a974fdfc..5c4e7df5d 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -115,14 +115,15 @@ The following steps describe how to set up the AUH utility:
 
    -  If you want to enable testing through the :ref:`ref-classes-testimage`
       class, which is optional, you need to have the following set in
-      your ``conf/local.conf`` file::
+      your :ref:`structure-build-conf-local.conf` file::
 
          IMAGE_CLASSES += "testimage"
 
       .. note::
 
          If your distro does not enable by default ptest, which :term:`Poky`
-         does, you need the following in your ``local.conf`` file::
+         does, you need the following in your
+         :ref:`structure-build-conf-local.conf` file::
 
                  DISTRO_FEATURES:append = " ptest"
 
@@ -139,7 +140,8 @@ The following steps describe how to set up the AUH utility:
    :yocto_git:`AUH source repository </auto-upgrade-helper/tree/>`.
 
    Read through the sample file and make configurations as needed. For
-   example, if you enabled build history in your ``local.conf`` as
+   example, if you enabled build history in your
+   :ref:`structure-build-conf-local.conf` as
    described earlier, you must enable it in ``upgrade-helper.conf``.
 
    Also, if you are using the default ``maintainers.inc`` file supplied
diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
index 18d1bfb0a..5e333b626 100644
--- a/documentation/dev-manual/wayland.rst
+++ b/documentation/dev-manual/wayland.rst
@@ -48,7 +48,7 @@ Wayland with Kernel Mode Setting
 (`KMS <https://wiki.archlinux.org/index.php/Kernel_Mode_Setting>`__)
 support, include the "wayland" flag in the
 :term:`DISTRO_FEATURES`
-statement in your ``local.conf`` file::
+statement in your distro :term:`configuration file`::
 
    DISTRO_FEATURES:append = " wayland"
 
@@ -63,7 +63,7 @@ Installing Wayland and Weston
 To install the Wayland feature into an image, you must include the
 following
 :term:`CORE_IMAGE_EXTRA_INSTALL`
-statement in your ``local.conf`` file::
+statement in your distro :term:`configuration file`::
 
    CORE_IMAGE_EXTRA_INSTALL += "wayland weston"
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index d9b4478d5..af06e8dcd 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -51,7 +51,8 @@ section:
 #. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable
    is set to "qemux86-64", which is fine if you are building for the QEMU
    emulator in 64-bit mode. However, if you are not, you need to set the
-   :term:`MACHINE` variable appropriately in your ``conf/local.conf`` file
+   :term:`MACHINE` variable appropriately in your
+   :ref:`structure-build-conf-local.conf` file
    found in the :term:`Build Directory` (i.e.  ``bitbake-builds/build`` in this example).
 
    Also, since you are preparing to work on the kernel image, you need
@@ -60,7 +61,8 @@ section:
 
    In this example we wish to build for qemux86 so we must set the
    :term:`MACHINE` variable to "qemux86" and also add the "kernel-modules".
-   As described we do this by appending to ``conf/local.conf``::
+   As described we do this by appending to
+   :ref:`structure-build-conf-local.conf`::
 
       MACHINE = "qemux86"
       MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
@@ -156,7 +158,8 @@ section:
 
    In this example we wish to build for qemux86 so we must set the
    :term:`MACHINE` variable to "qemux86" and also add the "kernel-modules".
-   As described we do this by appending to ``conf/local.conf``::
+   As described we do this by appending to
+   :ref:`structure-build-conf-local.conf`::
 
       MACHINE = "qemux86"
       MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index d4530e97f..e0e3c0398 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -122,12 +122,12 @@ Reference Manual provides details about classes and how to use them.
 Configurations
 --------------
 
-The configuration files (``.conf``) define various configuration
+The :term:`configuration files <Configuration File>` (``.conf``) define various configuration
 variables that govern the OpenEmbedded build process. These files fall
 into several areas that define machine configuration options,
 distribution configuration options, compiler tuning options, general
 common configuration options, and user configuration options in
-``conf/local.conf``, which is found in the :term:`Build Directory`.
+:ref:`structure-build-conf-local.conf`, which is found in the :term:`Build Directory`.
 
 
 Layers
@@ -228,8 +228,9 @@ the Build Environment>`, you can specify which directory will be the
 Setting up the build environment creates a :term:`Build Directory`
 if one does not already exist. BitBake uses the :term:`Build Directory`
 for all its work during builds. The Build Directory has a ``conf`` subdirectory
-that contains default versions of your ``local.conf`` and ``bblayers.conf``
-configuration files. These default :term:`configuration files <Configuration
+that contains default versions of your :ref:`structure-build-conf-local.conf`
+and :ref:`structure-build-conf-bblayers.conf`
+:term:`configuration files <Configuration File>`. These default :term:`configuration files <Configuration
 File>` are created only if they do not already exist in the :term:`Build
 Directory` at the time you source the build environment setup script.
 
diff --git a/documentation/profile-manual/intro.rst b/documentation/profile-manual/intro.rst
index 317912552..6241dffcb 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -32,7 +32,9 @@ General Setup
 =============
 
 Most of the tools are available only in ``sdk`` images or in images built
-after adding ``tools-profile`` to your ``local.conf`` file. So, in order to be able
+after adding ``tools-profile`` to the :term:`EXTRA_IMAGE_FEATURES` variable.
+
+So, in order to be able
 to access all of the tools described here, you can build and boot
 an ``sdk`` image, perhaps one of::
 
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index f8de6848e..dc34fa36c 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -48,7 +48,7 @@ For this section, we'll assume you've already performed the basic setup
 outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 
 In particular, you'll get the most mileage out of perf if you profile an
-image built with the following in your ``local.conf`` file::
+image built with the following in a :term:`configuration file`::
 
    INHIBIT_PACKAGE_STRIP = "1"
 
@@ -296,7 +296,7 @@ The problem is that perf can't find the symbol information for the
 ``busybox`` binary, which is actually stripped out by the Yocto build
 system.
 
-One way around that is to put the following in your ``local.conf`` file
+One way around that is to put the following in a :term:`configuration file`
 when you build the image::
 
    INHIBIT_PACKAGE_STRIP = "1"
@@ -306,13 +306,14 @@ what can we do to get perf to resolve the symbols? Basically we need to
 install the debugging information for the BusyBox package.
 
 To generate the debug info for the packages in the image, we can add
-``dbg-pkgs`` to :term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::
+``dbg-pkgs`` to :term:`EXTRA_IMAGE_FEATURES` in
+:ref:`structure-build-conf-local.conf`. For example::
 
    EXTRA_IMAGE_FEATURES:append = " dbg-pkgs"
 
 Additionally, in order to generate the type of debugging information that perf
 understands, we also need to set :term:`PACKAGE_DEBUG_SPLIT_STYLE`
-in the ``local.conf`` file::
+in a :term:`configuration file`::
 
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
 
@@ -1867,8 +1868,8 @@ Practically speaking, that means you need to do the following:
       $ bitbake core-image-sato-sdk
 
 -  Or build a non-SDK image but include the profiling tools
-   (edit ``local.conf`` and add ``tools-profile`` to the end of
-   :term:`EXTRA_IMAGE_FEATURES` variable)::
+   (add ``tools-profile`` to the :term:`EXTRA_IMAGE_FEATURES`
+   variable)::
 
       $ bitbake core-image-sato
 
@@ -1894,7 +1895,7 @@ section of this manual, and boot the resulting target image.
 .. note::
 
    If you have a :term:`Build Directory` containing multiple machines, you need
-   to have the :term:`MACHINE` you're connecting to selected in ``local.conf``, and
+   to have the :term:`MACHINE` you're connecting to selected, and
    the kernel in that machine's :term:`Build Directory` must match the kernel on
    the booted system exactly, or you'll get the above ``crosstap`` message
    when you try to call a script.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 6b48cf693..ec768b755 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2010,9 +2010,9 @@ code specific to particular package types resides in these
 package-specific classes: :ref:`ref-classes-package_deb`,
 :ref:`ref-classes-package_rpm`, :ref:`ref-classes-package_ipk`.
 
-You can control the list of resulting package formats by using the
-:term:`PACKAGE_CLASSES` variable defined in your ``conf/local.conf``
-configuration file, which is located in the :term:`Build Directory`.
+You can control the list of resulting package formats by setting the
+:term:`PACKAGE_CLASSES` variable in your :ref:`structure-build-conf-local.conf`
+file or distro :term:`configuration file`.
 When defining the variable, you can specify one or more package types.
 Since images are generated from packages, a packaging class is needed
 to enable image generation. The first class listed in this variable is
@@ -2065,7 +2065,7 @@ packages are written out in a ``.deb`` file format to the
 
 This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
-variable in the ``local.conf`` file.
+variable.
 
 .. _ref-classes-package_ipk:
 
@@ -2079,7 +2079,7 @@ are written out in a ``.ipk`` file format to the
 
 This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
-variable in the ``local.conf`` file.
+variable.
 
 .. _ref-classes-package_rpm:
 
@@ -2093,7 +2093,7 @@ are written out in a ``.rpm`` file format to the
 
 This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
-variable in the ``local.conf`` file.
+variable.
 
 .. _ref-classes-packagedata:
 
@@ -2616,7 +2616,8 @@ recipe are no longer needed. However, by default, the build system
 preserves these files for inspection and possible debugging purposes. If
 you would rather have these files deleted to save disk space as the build
 progresses, you can enable :ref:`ref-classes-rm-work` by adding the following to
-your ``local.conf`` file, which is found in the :term:`Build Directory`::
+your :ref:`structure-build-conf-local.conf` file, which is found in the
+:term:`Build Directory`::
 
    INHERIT += "rm_work"
 
@@ -2625,7 +2626,8 @@ recipe, enabling :ref:`ref-classes-rm-work` will potentially result in your
 changes to the source being lost. To exclude some recipes from having their work
 directories deleted by :ref:`ref-classes-rm-work`, you can add the names of the
 recipe or recipes you are working on to the :term:`RM_WORK_EXCLUDE` variable,
-which can also be set in your ``local.conf`` file. Here is an example::
+which can also be set in your :ref:`structure-build-conf-local.conf` file. Here
+is an example::
 
    RM_WORK_EXCLUDE += "busybox glibc"
 
@@ -3849,7 +3851,8 @@ using the Vala programming language.
 The :ref:`ref-classes-vex` class is used to generate metadata needed by external
 tools to check for vulnerabilities, for example CVEs.
 
-In order to use this class, inherit the class in the ``local.conf`` file and it
+In order to use this class, inherit the class in your
+:ref:`structure-build-conf-local.conf` or distro :term:`configuration file` and it
 will add the ``generate_vex`` task for every recipe::
 
    INHERIT += "vex"
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 374ecf8e8..f8e047e27 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -119,8 +119,8 @@ of other mirrors including the Yocto Project source mirror if those
 fail.
 
 As an example, you could add a specific server for the build system to
-attempt before any others by adding something like the following to the
-``local.conf`` configuration file::
+attempt before any others by adding something like the following to
+a :term:`configuration file`::
 
    PREMIRRORS:prepend = "\
        git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
@@ -159,8 +159,8 @@ technique is useful if you want to create a mirror server. If not,
 however, the technique can simply waste time during the build.
 
 Finally, consider an example where you are behind an HTTP-only firewall.
-You could make the following changes to the ``local.conf`` configuration
-file as long as the :term:`PREMIRRORS` server is current::
+You could make the following changes to a :term:`configuration
+file` as long as the :term:`PREMIRRORS` server is current::
 
    PREMIRRORS:prepend = "\
        git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index 37694d11f..8b287505c 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -21,8 +21,9 @@ image you want.
 
        INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0*"
 
-   Alternatively, you can adjust ``local.conf`` file, repeating and adjusting the line
-   for all images where the license restriction must apply:
+   Alternatively, you can adjust your distro :term:`configuration file`,
+   repeating and adjusting the line for all images where the license restriction
+   must apply:
 
        INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"
 
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 8317452b2..052cd4b0d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -591,7 +591,7 @@ installer:
 
    .. note::
 
-      The :term:`SDKMACHINE` variable in your ``local.conf`` file determines
+      The :term:`SDKMACHINE` variable determines
       whether you build tools for a 32-bit or 64-bit system.
 
    Once the build completes, you can find the ``.sh`` file that installs
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0df84b463..c04b24ce0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -288,11 +288,10 @@ system and gives an overview of their function and contents.
 
          BAD_RECOMMENDATIONS = "package_name package_name package_name ..."
 
-      You can set this variable globally in your ``local.conf`` file or you
-      can attach it to a specific image recipe by using the recipe name
-      override::
+      You can set this variable globally in a :term:`configuration file` or you
+      can specify it in an image recipe directly::
 
-         BAD_RECOMMENDATIONS:pn-target_image = "package_name"
+         BAD_RECOMMENDATIONS = "package_name"
 
       It is important to realize that if you choose to not install packages
       using this variable and some other packages are dependent on them
@@ -572,8 +571,7 @@ system and gives an overview of their function and contents.
 
          BB_GENERATE_MIRROR_TARBALLS = "1"
 
-      Set this variable in your
-      ``local.conf`` file in the :term:`Build Directory`.
+      Set this variable in a :term:`configuration file`.
 
       Once you have the tarballs containing your source files, you can
       clean up your :term:`DL_DIR` directory by deleting any Git or other
@@ -942,7 +940,8 @@ system and gives an overview of their function and contents.
    :term:`BBMULTICONFIG`
       Specifies each additional separate configuration when you are
       building targets with multiple configurations. Use this variable in
-      your ``conf/local.conf`` configuration file. Specify a
+      your :ref:`structure-build-conf-local.conf` configuration file for local testing, or in a
+      machine :term:`configuration file`. Specify a
       multiconfig name for each configuration file you are using. For
       example, the following line specifies three configuration files::
 
@@ -1731,8 +1730,8 @@ system and gives an overview of their function and contents.
       "``${``\ :term:`TMPDIR`\ ``}/sysroots-components``").
 
    :term:`CONF_VERSION`
-      Tracks the version of the local configuration file (i.e.
-      ``local.conf``). The value for :term:`CONF_VERSION` increments each time
+      Tracks the version of the local configuration file (:ref:`structure-build-conf-local.conf`).
+      The value for :term:`CONF_VERSION` increments each time
       ``build/conf/`` compatibility changes.
 
    :term:`CONFFILES`
@@ -1968,8 +1967,9 @@ system and gives an overview of their function and contents.
 
    :term:`CORE_IMAGE_EXTRA_INSTALL`
       Specifies the list of packages to be added to the image. You should
-      only set this variable in the ``local.conf`` configuration file found
-      in the :term:`Build Directory`.
+      set this variable in the :ref:`structure-build-conf-local.conf` configuration file found
+      in the :term:`Build Directory`, or in a distro :term:`configuration file`
+      if your distro should always include this list of package.
 
       This variable replaces ``POKY_EXTRA_INSTALL``, which is no longer
       supported.
@@ -2720,8 +2720,8 @@ system and gives an overview of their function and contents.
       ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 
       You can set :term:`ERR_REPORT_DIR` to the path you want the error
-      reporting tool to store the debug files as follows in your
-      ``local.conf`` file::
+      reporting tool to store the debug files as follows in a
+      :term:`configuration file`::
 
          ERR_REPORT_DIR = "path"
 
@@ -2912,9 +2912,10 @@ system and gives an overview of their function and contents.
       A list of additional features to include in an image. When listing
       more than one feature, separate them with a space.
 
-      Typically, you configure this variable in your ``local.conf`` file,
-      which is found in the :term:`Build Directory`. Although you can use this
-      variable from within a recipe, best practices dictate that you do not.
+      Typically, you configure this variable in your :ref:`structure-build-conf-local.conf` file for
+      local modifications, or in your distro :term:`configuration file` for
+      permanent changes. Although you can use this variable from within a
+      recipe, best practices dictate that you do not.
 
       .. note::
 
@@ -3131,7 +3132,7 @@ system and gives an overview of their function and contents.
       Points to the base URL of the server and location within the
       document-root that provides the metadata and packages required by
       OPKG to support runtime package management of IPK packages. You set
-      this variable in your ``local.conf`` file.
+      this variable in a :term:`configuration file`.
 
       Consider the following example::
 
@@ -3867,7 +3868,9 @@ system and gives an overview of their function and contents.
          If you specifically remove the locale ``en_US.UTF-8``, you must set
          :term:`IMAGE_LINGUAS` appropriately.
 
-      You can set :term:`GLIBC_GENERATE_LOCALES` in your ``local.conf`` file.
+      You can set :term:`GLIBC_GENERATE_LOCALES` in your ``local.conf`` file for
+      local testing or in your distro :term:`configuration file`.
+
       By default, all locales are generated::
 
          GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
@@ -3963,7 +3966,7 @@ system and gives an overview of their function and contents.
    :term:`GRUB_GFXSERIAL`
       Configures the GNU GRand Unified Bootloader (GRUB) to have graphics
       and serial in the boot menu. Set this variable to "1" in your
-      ``local.conf`` or distribution configuration file to enable graphics
+      :ref:`structure-build-conf-local.conf` or distribution :term:`configuration file` to enable graphics
       and serial in the menu.
 
       See the :ref:`ref-classes-grub-efi` class for more
@@ -5448,7 +5451,7 @@ system and gives an overview of their function and contents.
       building and configuring the kernel stops with an error.
 
       You can turn these errors into warnings by setting the
-      following in ``conf/local.conf``::
+      following in a :term:`configuration file`::
 
          KERNEL_DANGLING_FEATURES_WARN_ONLY = "1"
 
@@ -6583,11 +6586,10 @@ system and gives an overview of their function and contents.
 
          NO_RECOMMENDATIONS = "1"
 
-      You can set this variable globally in your ``local.conf`` file or you
-      can attach it to a specific image recipe by using the recipe name
-      override::
+      You can set this variable globally in a :term:`configuration file` or you
+      can specify it in an image recipe directly::
 
-         NO_RECOMMENDATIONS:pn-target_image = "1"
+         NO_RECOMMENDATIONS = "1"
 
       It is important to realize that if you choose to not install packages
       using this variable and some other packages are dependent on them
@@ -6944,9 +6946,7 @@ system and gives an overview of their function and contents.
       included in the default package.
 
    :term:`PACKAGE_CLASSES`
-      This variable, which is set in the ``local.conf`` configuration file
-      found in the ``conf`` folder of the
-      :term:`Build Directory`, specifies the package manager the
+      This variable specifies the package manager the
       OpenEmbedded build system uses when packaging data.
 
       You can provide one or more of the following arguments for the
@@ -6957,7 +6957,7 @@ system and gives an overview of their function and contents.
       The build system uses only the first argument in the list as the
       package manager when creating your image or SDK. However, packages
       will be created using any additional packaging classes you specify.
-      For example, if you use the following in your ``local.conf`` file::
+      For example, if you use the following in your distro :term:`configuration file`::
 
          PACKAGE_CLASSES ?= "package_ipk"
 
@@ -7018,11 +7018,10 @@ system and gives an overview of their function and contents.
 
          PACKAGE_EXCLUDE = "package_name package_name package_name ..."
 
-      You can set this variable globally in your ``local.conf`` file or you
-      can attach it to a specific image recipe by using the recipe name
-      override::
+      You can set this variable globally in a :term:`configuration file` or you
+      can specify it in an image recipe directly::
 
-         PACKAGE_EXCLUDE:pn-target_image = "package_name"
+         PACKAGE_EXCLUDE = "package_name"
 
       If you choose to not install a package using this variable and some
       other package is dependent on it (i.e. listed in a recipe's
@@ -7317,8 +7316,8 @@ system and gives an overview of their function and contents.
             PACKAGECONFIG:append = " f4"
 
       -  *Configuration file:* This method is identical to changing the
-         block through an append file except you edit your ``local.conf``
-         or ``mydistro.conf`` file. As with append files previously
+         block through an append file except you edit your :ref:`structure-build-conf-local.conf`
+         or distro :term:`configuration file`. As with append files previously
          described, you can either completely override the variable::
 
             PACKAGECONFIG:pn-recipename = "f4 f5"
@@ -8009,8 +8008,8 @@ system and gives an overview of their function and contents.
    :term:`PRSERV_HOST`
       The network based :term:`PR` service host and port.
 
-      The ``conf/templates/default/local.conf.sample.extended`` configuration
-      file in :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>` shows how the
+      The :oecore_path:`meta/conf/templates/default/local.conf.sample.extended`
+      configuration file in :term:`OpenEmbedded-Core (OE-Core)` shows how the
       :term:`PRSERV_HOST` variable is set::
 
          PRSERV_HOST = "localhost:0"
@@ -9371,9 +9370,8 @@ system and gives an overview of their function and contents.
       package. Removal of these files is required for packages containing
       prebuilt binaries and libraries such as ``libstdc++`` and ``glibc``.
 
-      To enable file removal, set the variable to "1" in your
-      ``conf/local.conf`` configuration file in your:
-      :term:`Build Directory`::
+      To enable file removal, set the variable to "1" in a :term:`configuration
+      file`::
 
          SKIP_FILEDEPS = "1"
 
@@ -9437,7 +9435,7 @@ system and gives an overview of their function and contents.
    :term:`SOURCE_MIRROR_FETCH`
       When you are fetching files to create a mirror of sources (i.e.
       creating a source mirror), setting :term:`SOURCE_MIRROR_FETCH` to "1" in
-      your ``local.conf`` configuration file ensures the source for all
+      a :term:`configuration file` ensures the source for all
       recipes are fetched regardless of whether or not a recipe is
       compatible with the configuration. A recipe is considered
       incompatible with the currently configured machine when either or
@@ -10978,9 +10976,10 @@ system and gives an overview of their function and contents.
 
    :term:`TEMPLATECONF`
       Specifies the directory used by the build system to find templates
-      from which to build the ``bblayers.conf`` and ``local.conf`` files.
+      from which to build the :ref:`structure-build-conf-bblayers.conf` and
+      :ref:`structure-build-conf-local.conf` files.
       Use this variable if you wish to customize such files, and the default
-      BitBake targets shown when sourcing the ``oe-init-build-env`` script.
+      BitBake targets shown when sourcing the :ref:`structure-core-script` script.
 
       For details, see the
       :ref:`dev-manual/custom-template-configuration-directory:creating a custom template configuration directory`
@@ -11034,8 +11033,7 @@ system and gives an overview of their function and contents.
       The time in seconds allowed for an image to boot before automated
       runtime tests begin to run against an image. The default timeout
       period to allow the boot process to reach the login prompt is 500
-      seconds. You can specify a different value in the ``local.conf``
-      file.
+      seconds. You can specify a different value in a :term:`configuration file`.
 
       For more information on testing images, see the
       ":ref:`test-manual/runtime-testing:performing automated runtime testing`"
@@ -11184,10 +11182,9 @@ system and gives an overview of their function and contents.
 
       These tests are written in Python making use of the ``unittest``
       module, and the majority of them run commands on the target system
-      over ``ssh``. You can set this variable to "1" in your ``local.conf``
-      file in the :term:`Build Directory` to have the
-      OpenEmbedded build system automatically run these tests after an
-      image successfully builds:
+      over ``ssh``. You can set this variable to "1" in a :term:`configuration
+      file` to have the OpenEmbedded build system automatically run these tests
+      after an image successfully builds:
 
          TESTIMAGE_AUTO = "1"
 
@@ -12472,14 +12469,11 @@ system and gives an overview of their function and contents.
       Classes inherited using :term:`USER_CLASSES` must be located in the
       ``classes-global/`` or ``classes/`` subdirectories.
 
-      The default list is set in your ``local.conf`` file::
+      A default list is set in the
+      :oecore_path:`meta/conf/templates/default/local.conf.sample` file::
 
          USER_CLASSES ?= "buildstats"
 
-      For more information, see
-      ``conf/templates/default/local.conf.sample`` in
-      :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`.
-
    :term:`USERADD_DEPENDS`
       Specifies a list of recipes that create users / groups (via
       :term:`USERADD_PARAM` / :term:`GROUPADD_PARAM`) which a recipe
@@ -12498,8 +12492,8 @@ system and gives an overview of their function and contents.
       ``uid`` and ``gid`` values. Consequently, the
       :term:`USERADD_ERROR_DYNAMIC` variable is by default not set. If you plan
       on using statically assigned ``gid`` and ``uid`` values, you should
-      set the :term:`USERADD_ERROR_DYNAMIC` variable in your ``local.conf``
-      file as follows::
+      set the :term:`USERADD_ERROR_DYNAMIC` variable in a :term:`configuration
+      file`::
 
          USERADD_ERROR_DYNAMIC = "error"
 
@@ -12529,8 +12523,7 @@ system and gives an overview of their function and contents.
       When applying static group identification (``gid``) values, the
       OpenEmbedded build system looks in :term:`BBPATH` for a
       ``files/group`` file and then applies those ``uid`` values. Set the
-      variable as follows in your ``local.conf`` file::
-
+      variable as follows in a :term:`configuration file`::
 
          USERADD_GID_TABLES = "files/group"
 
@@ -12580,7 +12573,7 @@ system and gives an overview of their function and contents.
       When applying static user identification (``uid``) values, the
       OpenEmbedded build system looks in :term:`BBPATH` for a
       ``files/passwd`` file and then applies those ``uid`` values. Set the
-      variable as follows in your ``local.conf`` file::
+      variable as follows in a :term:`configuration file`::
 
          USERADD_UID_TABLES = "files/passwd"
 
@@ -12595,8 +12588,10 @@ system and gives an overview of their function and contents.
       ``group`` files found in :term:`BBPATH`.
 
       To use static user identification (``uid``) and group identification
-      (``gid``) values, set the variable as follows in your ``local.conf``
-      file: USERADDEXTENSION = "useradd-staticids"
+      (``gid``) values, set the variable as follows in in a
+      :term:`configuration file`::
+
+         USERADDEXTENSION = "useradd-staticids"
 
       .. note::
 
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 467c5c10c..65fd4af9f 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -20,7 +20,8 @@ The extensible SDK primarily consists of a pre-configured copy of the
 OpenEmbedded build system from which it was produced. Thus, the SDK's
 configuration is derived using that build system and the filters shown
 in the following list. When these filters are present, the OpenEmbedded
-build system applies them against ``local.conf`` and ``auto.conf``:
+build system applies them against :ref:`structure-build-conf-local.conf` and
+:ref:`structure-build-conf-auto.conf`:
 
 -  Variables whose values start with "/" are excluded since the
    assumption is that those values are paths that are likely to be
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 24a8e17b3..d70c38fa5 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -99,15 +99,13 @@ build the SDK installer. Follow these steps:
    to get a :term:`build host` ready.
 
 #. *Make Sure You Are Building an Installer for the Correct Machine:*
-   Check to be sure that your :term:`MACHINE` variable in the ``local.conf``
-   file in your :term:`Build Directory` matches the architecture
+   Check to be sure that your :term:`MACHINE` matches the architecture
    for which you are building.
 
 #. *Make Sure Your SDK Machine is Correctly Set:* If you are building a
    toolchain designed to run on an architecture that differs from your
    current development host machine (i.e. the build host), be sure that
-   the :term:`SDKMACHINE` variable in the ``local.conf`` file in your
-   :term:`Build Directory` is correctly set.
+   the :term:`SDKMACHINE` variable is correctly set.
 
    .. note::
 
@@ -153,12 +151,11 @@ build the SDK installer. Follow these steps:
          of libraries, you need to be sure your SDK has the appropriate
          static development libraries. Use the
          :term:`TOOLCHAIN_TARGET_TASK`
-         variable inside your ``local.conf`` file before building the
-         SDK installer. Doing so ensures that the eventual SDK
-         installation process installs the appropriate library packages
+         variable to install the appropriate library packages
          as part of the SDK. Here is an example using ``libc``
-         static development libraries: TOOLCHAIN_TARGET_TASK:append = "
-         libc-staticdev"
+         static development libraries::
+
+            TOOLCHAIN_TARGET_TASK:append = " libc-staticdev"
 
 #. *Run the Installer:* You can now run the SDK installer from
    ``tmp/deploy/sdk`` in the :term:`Build Directory`. Here is an example:
diff --git a/documentation/security-manual/read-only-rootfs.rst b/documentation/security-manual/read-only-rootfs.rst
index 251178ed5..823ddcecd 100644
--- a/documentation/security-manual/read-only-rootfs.rst
+++ b/documentation/security-manual/read-only-rootfs.rst
@@ -28,7 +28,7 @@ image's recipe file via the :term:`IMAGE_FEATURES` variable::
    IMAGE_FEATURES += "read-only-rootfs"
 
 As an alternative, you can add the same feature
-from within your :term:`Build Directory`'s ``local.conf`` file with the
+from within your distro :term:`configuration file` with the
 associated :term:`EXTRA_IMAGE_FEATURES` variable, as in::
 
    EXTRA_IMAGE_FEATURES = "read-only-rootfs"
diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
index bcf4237bf..9772b52d3 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -81,7 +81,7 @@ your build output more secure. The security flags are in the
    disabled by default.
 
 Use the following line in your ``local.conf`` file or in your custom
-distribution configuration file to enable the security compiler and
+distro :term:`configuration file` to enable the security compiler and
 linker flags for your build::
 
    require conf/distro/include/security_flags.inc
@@ -100,7 +100,7 @@ system to make your images more secure:
 
       EXTRA_IMAGE_FEATURES = "allow-empty-password empty-root-password allow-root-login"
 
-   to your ``local.conf`` file, or by enabling the exactly equivalent
+   to your distro :term:`configuration file`, or by enabling the exactly equivalent
    configuration fragment :ref:`ref-fragments-root-login-with-empty-password`.
 
    If you're using either of these approaches during development,
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 84523ff13..892f7b9c8 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -94,12 +94,12 @@ run::
 This defaults to including a ``world`` build so, if other layers are added, it
 would also run the tests for recipes in the additional layers. Different build
 targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variable
-in ``local.conf``. For example, running reproducibility tests for only the
+in :ref:`structure-build-conf-local.conf`. For example, running reproducibility tests for only the
 ``python3-numpy`` recipe can be done by setting::
 
    OEQA_REPRODUCIBLE_TEST_TARGET = "python3-numpy"
 
-in local.conf before running the ``oe-selftest`` command shown above.
+in :ref:`structure-build-conf-local.conf` before running the ``oe-selftest`` command shown above.
 
 Reproducibility builds the target list twice. The first build will be run using
 :ref:`Shared State <overview-manual/concepts:Shared State>` if available, the
@@ -150,7 +150,7 @@ Using :term:`OEQA_REPRODUCIBLE_TEST_* <OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS>` var
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 If you want to test the reproducibility of a set of recipes, you can define
-:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf::
+:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your :ref:`structure-build-conf-local.conf`::
 
    OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS = "my-recipe"
 
diff --git a/documentation/test-manual/runtime-testing.rst b/documentation/test-manual/runtime-testing.rst
index a64a97c80..4eef9d059 100644
--- a/documentation/test-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -95,7 +95,7 @@ Once you start running the tests, the following happens:
    to reach the login prompt. You can change the timeout period by
    setting
    :term:`TEST_QEMUBOOT_TIMEOUT`
-   in the ``local.conf`` file.
+   in a :term:`configuration file`.
 
 #. Once the boot process is reached and the login prompt appears, the
    tests run. The full boot log is written to
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 17938ebda..13f906eea 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -98,7 +98,7 @@ Transitioning to a custom environment for systems development
    well as the package feed and possibly the update solution. You would create
    your own distribution in a new layer inheriting from :term:`Poky` but overriding what
    needs to change for your distribution. If you find yourself adding a lot of
-   configuration to your local.conf file aside from paths and other typical
+   configuration to your :ref:`structure-build-conf-local.conf` file aside from paths and other typical
    local settings, it's time to :ref:`consider creating your own distribution
    <dev-manual/custom-distribution:creating your own distribution>`.
 

-- 
2.55.0


