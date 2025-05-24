Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245F8C54F30
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 01:49:21 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.3.1748051353732664994
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 18:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UYgK8P3u;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so5324886d6.2
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 18:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748051352; x=1748656152; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoylhWV1FhmttKnwAnER3I+NDUazyIaA6xQk7o03Pzk=;
        b=UYgK8P3uiyoJryimvgik7H1cGa45+akQMa8mH/TnXy63u8MLArg1nfYILUU1BSXv78
         Ca+5f/EID7+JkfS0pIBD2qYetFHbAWdANgtDMIH0Da5NKKYvToVx5yC9uFCo0FiHPZBO
         yOCalzjWnB8sSzBKWxKBqcaGFCzXGXiJ67NKCRrH9TGquO0reLjlqrMmXAZBBRZ1u28l
         pqRKoZESH2aSfl2unJH3GvODJW6gbM8B3k4tSXDkyEKbyclOM+1MeyYQMNpuXZm/7Mtm
         Nmrz+CnilVMq2YnGFV8iNY6DR6WAqM30SeO9O81SYAWPFSzvSfnHpUxlePwxGVI7tCLM
         8gGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748051352; x=1748656152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoylhWV1FhmttKnwAnER3I+NDUazyIaA6xQk7o03Pzk=;
        b=guuiVOAAqyi+qBb9C/vr2XQIPIFqi4fpVgbKpNQop6yEvchCzLcuioelxE0d0RJ/K/
         mR7NGD+iFVJW/si7Z1EZVzXLU2YHXE3rtEQUyoFaPAflBUwZHyMDcoqRI9EDesh/6byN
         RAtlVtBe1jfMfGgJ1jWxLuvPIFHdZytVcvS0iO6fu3lMCK5Q0kwuZkD1eP+dY9QBox0a
         VJ4az9j4rLNFyQRPZS7iL8Elaf+AiJF1ghuDBLmQHfsbdWf3q2w8WJheKE813TX1+vHM
         3esPzzWfRCYXzhtynP/f2UGiz4bmDeoogByXd408RcoI2dijaDno35lxSBd6C2dkF/UR
         nAWg==
X-Gm-Message-State: AOJu0YwSL2NB5YBDAwWQrfcTJpzA6n6I4o5Yb7z/yHQogmpSK2MTHF2W
	Po9/tmHFw8wZ4FO5KU1TBT/RUm3l3YXSxHloIaKvJpwCPNUAlRpCXyyMegBelg==
X-Gm-Gg: ASbGncuXd9GZdexzSZEKGIT3KATNKNZF8NCatGGws+FzYRaQs8x5+wgzLnmoaatARb3
	EvOydyJ1A9BMzjCChwlSQp97+aJkdH/ZMtdiG2/JxY9S/JVnI4SDhH6dUZzglGwb238oG+bcYHm
	pJ9hR2HLFaFLPRUcGJ6xm4RqObrVwRQp2/hIdpgUkrn04F7xlvbSByijNVpXAweE3HyjhLv+XH4
	/FmkXYreB6sW+Cp7eNaChmzNFlx2RozvNU5/pCfp+9KtkHAkFpzhqY29EOCXjomtZw2BnzUT3zU
	SMlEKe2cVYZmhhdcQUbGIlBCxNva2HiW0yLJY3BhJ40Tawky9gOSAaphHOSA8bxL4cOEuXE9lMO
	ys1D4bN8sb/IajzEbk6k=
X-Google-Smtp-Source: AGHT+IFG6spMqxk142+KjO9hBycJ2p8QpfaQ0tM+VKlOo/vMBLC34DDXAry4yESgf/u+7Yr/ABAe7g==
X-Received: by 2002:a05:6214:401b:b0:6e8:9e9c:d20f with SMTP id 6a1803df08f44-6fa9d15997fmr28891886d6.21.1748051351600;
        Fri, 23 May 2025 18:49:11 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0899016sm122736276d6.30.2025.05.23.18.49.09
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:49:10 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] sphinx-lint: unbalanced inline literal markup
Date: Fri, 23 May 2025 21:49:02 -0400
Message-ID: <20250524014902.35467-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
In-Reply-To: <20250524014902.35467-1-twoerner@gmail.com>
References: <20250524014902.35467-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 01:49:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6897

Fix as many instances of unbalanced-inline-literals-delimiters as reported
by 'make sphinx-lint' as possible. Sphinx and/or its linter seem to get
tripped up randomly when references contain links to a heading which
contain literals enclosed in double-back-tics; especially in the cases
where a heading either contains multiple literals or when the literal is
not at the end of the heading. Not all of them can be "fixed" to pass both
building and linting.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/brief-yoctoprojectqs/index.rst       |  2 +-
 documentation/bsp-guide/bsp.rst                    |  4 ++--
 documentation/dev-manual/debugging.rst             |  2 +-
 documentation/dev-manual/new-recipe.rst            |  2 +-
 documentation/dev-manual/start.rst                 |  2 +-
 documentation/dev-manual/upgrading-recipes.rst     |  2 +-
 documentation/kernel-dev/common.rst                | 14 +++++++-------
 documentation/kernel-dev/intro.rst                 |  2 +-
 .../migration-guides/release-notes-4.3.rst         |  2 +-
 documentation/overview-manual/concepts.rst         |  2 +-
 documentation/ref-manual/devtool-reference.rst     |  2 +-
 documentation/ref-manual/structure.rst             |  2 +-
 documentation/ref-manual/tasks.rst                 |  4 ++--
 documentation/ref-manual/terms.rst                 |  2 +-
 documentation/ref-manual/variables.rst             |  8 ++++----
 documentation/toaster-manual/reference.rst         |  6 +++---
 16 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 2f6e4cf02e58..070f5e2cf361 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -182,7 +182,7 @@ an entire Linux distribution, including the toolchain, from source.
       page of the Yocto Project Wiki.
 
 #. **Initialize the Build Environment:** From within the ``poky``
-   directory, run the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``
+   directory, run the :ref:`ref-manual/structure:``oe-init-build-env```
    environment
    setup script to define Yocto Project's build environment on your
    build host.
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 3e484aa47374..35972f172698 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -81,7 +81,7 @@ directory of that Layer. This directory is what you add to the
 ``conf/bblayers.conf`` file found in your
 :term:`Build Directory`, which is
 established after you run the OpenEmbedded build environment setup
-script (i.e. :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``).
+script (i.e. :ref:`ref-manual/structure:``oe-init-build-env```).
 Adding the root directory allows the :term:`OpenEmbedded Build System`
 to recognize the BSP
 layer and from it build an image. Here is an example::
@@ -229,7 +229,7 @@ section.
 
 #. *Initialize the Build Environment:* While in the root directory of
    the Source Directory (i.e. ``poky``), run the
-   :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
+   :ref:`ref-manual/structure:``oe-init-build-env``` environment
    setup script to define the OpenEmbedded build environment on your
    build host. ::
 
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 92458a0c3720..8552b26aea90 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -36,7 +36,7 @@ section:
    use the BitBake ``-e`` option to examine variable values after a
    recipe has been parsed.
 
--  ":ref:`dev-manual/debugging:viewing package information with \`\`oe-pkgdata-util\`\``"
+-  ":ref:`dev-manual/debugging:viewing package information with ``oe-pkgdata-util```"
    describes how to use the ``oe-pkgdata-util`` utility to query
    :term:`PKGDATA_DIR` and
    display package-related information for built packages.
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 4a65d7024363..9792bd4c1f64 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -56,7 +56,7 @@ necessary when adding a recipe to build a new piece of software to be
 included in a build.
 
 You can find a complete description of the ``devtool add`` command in
-the ":ref:`dev-manual/devtool:a closer look at \`\`devtool add\`\``" section
+the ":ref:`dev-manual/devtool:a closer look at ``devtool add```" section
 in the Yocto Project Application Development and the Extensible Software
 Development Kit (eSDK) manual.
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index e6cb6f4551e0..73548132a3ff 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -858,7 +858,7 @@ Initializing the Build Environment
 ==================================
 
 Before you can use Yocto you need to setup the build environment.
-From within the ``poky`` directory, source the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
+From within the ``poky`` directory, source the :ref:`ref-manual/structure:``oe-init-build-env``` environment
 setup script to define Yocto Project's build environment on your build host::
 
    $ source oe-init-build-env
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index 35901a0ea8a7..2e6567867989 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -333,7 +333,7 @@ Manually Upgrading a Recipe
 
 If for some reason you choose not to upgrade recipes using
 :ref:`dev-manual/upgrading-recipes:Using the Auto Upgrade Helper (AUH)` or
-by :ref:`dev-manual/upgrading-recipes:Using \`\`devtool upgrade\`\``,
+by :ref:`dev-manual/upgrading-recipes:Using ``devtool upgrade```,
 you can manually edit the recipe files to upgrade the versions.
 
 .. note::
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 28ef3b22c343..654c4e0a01e3 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -672,7 +672,7 @@ The steps in this procedure show you how you can patch the kernel using
 
    Before attempting this procedure, be sure you have performed the
    steps to get ready for updating the kernel as described in the
-   ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+   ":ref:`kernel-dev/common:getting ready to develop using ``devtool```"
    section.
 
 Patching the kernel involves changing or adding configurations to an
@@ -685,7 +685,7 @@ output at boot time through ``printk`` statements in the kernel's
 ``calibrate.c`` source code file. Applying the patch and booting the
 modified image causes the added messages to appear on the emulator's
 console. The example is a continuation of the setup procedure found in
-the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Section.
+the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Section.
 
 #. *Check Out the Kernel Source Files:* First you must use ``devtool``
    to checkout the kernel source code in its workspace.
@@ -693,7 +693,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
    .. note::
 
       See this step in the
-      ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+      ":ref:`kernel-dev/common:getting ready to develop using ``devtool```"
       section for more information.
 
    Use the following ``devtool`` command to check out the code::
@@ -804,7 +804,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
    .. note::
 
       See Step 3 of the
-      ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+      ":ref:`kernel-dev/common:getting ready to develop using ``devtool```"
       section for information on setting up this layer.
 
    Once the command
@@ -1190,7 +1190,7 @@ appear in the ``.config`` file, which is in the :term:`Build Directory`.
 
    For more information about where the ``.config`` file is located, see the
    example in the
-   ":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
+   ":ref:`kernel-dev/common:using ``menuconfig```"
    section.
 
 It is simple to create a configuration fragment. One method is to use
@@ -1286,7 +1286,7 @@ when you override a policy configuration in a hardware configuration
 fragment.
 
 In order to run this task, you must have an existing ``.config`` file.
-See the ":ref:`kernel-dev/common:using \`\`menuconfig\`\``" section for
+See the ":ref:`kernel-dev/common:using ``menuconfig```" section for
 information on how to create a configuration file.
 
 Here is sample output from the :ref:`ref-tasks-kernel_configcheck` task:
@@ -1359,7 +1359,7 @@ and
 tasks until they produce no warnings.
 
 For more information on how to use the ``menuconfig`` tool, see the
-:ref:`kernel-dev/common:using \`\`menuconfig\`\`` section.
+:ref:`kernel-dev/common:using ``menuconfig``` section.
 
 Fine-Tuning the Kernel Configuration File
 -----------------------------------------
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index a663733a1df9..7df342f8d504 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -122,7 +122,7 @@ general information and references for further information.
    Using ``devtool`` requires that you have a clean build
    of the image. For
    more information, see the
-   ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+   ":ref:`kernel-dev/common:getting ready to develop using ``devtool```"
    section.
 
    Using traditional kernel development requires that you have the
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index d1ab70447b63..0103ac985ef1 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -295,7 +295,7 @@ New Features / Enhancements in 4.3
    -  Generation of :term:`SPDX` manifests is now enabled by default.
 
    -  Git based recipes in OE-Core which used the ``git``  protocol have been
-      changed to use `https`` where possible, as it is typically faster and
+      changed to use ``https`` where possible, as it is typically faster and
       more reliable.
 
    -  The ``os-release`` recipe added a ``CPE_NAME`` to the fields provided, with the
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 416c28f0d95a..85dea9fe05b2 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -956,7 +956,7 @@ package.
 
   For more information on the ``oe-pkgdata-util`` utility, see the section
   :ref:`dev-manual/debugging:Viewing Package Information with
-  \`\`oe-pkgdata-util\`\`` of the Yocto Project Development Tasks Manual.
+  ``oe-pkgdata-util``` of the Yocto Project Development Tasks Manual.
 
 To add a custom package variant of the ``${PN}`` recipe named
 ``${PN}-extra`` (name is arbitrary), one can add it to the
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index e173720e1ad1..5ac567591c48 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -435,7 +435,7 @@ You can read more on the ``devtool upgrade`` workflow in the
 ":ref:`dev-manual/devtool:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual. You can also see an example of
-how to use ``devtool upgrade`` in the ":ref:`dev-manual/upgrading-recipes:using \`\`devtool upgrade\`\``"
+how to use ``devtool upgrade`` in the ":ref:`dev-manual/upgrading-recipes:using ``devtool upgrade```"
 section in the Yocto Project Development Tasks Manual.
 
 .. _devtool-resetting-a-recipe:
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 616c3c4c9bf3..2190f5b90e55 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -515,7 +515,7 @@ generated during the :ref:`ref-tasks-packagedata` task. The files stored in this
 directory contain information about each output package produced by the
 OpenEmbedded build system, and are used in different ways by the build system
 such as ":ref:`dev-manual/debugging:viewing package information with
-\`\`oe-pkgdata-util\`\``".
+``oe-pkgdata-util```".
 
 .. _structure-build-tmp-sstate-control:
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index d2e1f4ce143c..d85d1151f0cf 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -726,7 +726,7 @@ tool, which you then use to modify the kernel configuration.
            $ bitbake linux-yocto -c menuconfig
 
 
-See the ":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
+See the ":ref:`kernel-dev/common:using ``menuconfig```"
 section in the Yocto Project Linux Kernel Development Manual for more
 information on this configuration tool.
 
@@ -750,7 +750,7 @@ which can then be applied by subsequent tasks such as
 
 Runs ``make menuconfig`` for the kernel. For information on
 ``menuconfig``, see the
-":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
+":ref:`kernel-dev/common:using ``menuconfig```"
 section in the Yocto Project Linux Kernel Development Manual.
 
 .. _ref-tasks-savedefconfig:
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 9d765c89c860..9f610614159a 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -63,7 +63,7 @@ universal, the list includes them just in case:
       This term refers to the area used by the OpenEmbedded build system for
       builds. The area is created when you ``source`` the setup environment
       script that is found in the Source Directory
-      (i.e. :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``). The
+      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```). The
       :term:`TOPDIR` variable points to the :term:`Build Directory`.
 
       You have a lot of flexibility when creating the :term:`Build Directory`.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae8f1..b5cecb67eef7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2243,7 +2243,7 @@ system and gives an overview of their function and contents.
       resides within the :term:`Build Directory` as ``${TMPDIR}/deploy``.
 
       For more information on the structure of the Build Directory, see
-      ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory --- ``build/```" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`",
       ":ref:`overview-manual/concepts:package feeds`", and
@@ -2285,7 +2285,7 @@ system and gives an overview of their function and contents.
       contents of :term:`IMGDEPLOYDIR` by the :ref:`ref-classes-image` class.
 
       For more information on the structure of the :term:`Build Directory`, see
-      ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory --- ``build/```" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`" and
       ":ref:`overview-manual/concepts:application development sdk`" sections both in
@@ -7010,7 +7010,7 @@ system and gives an overview of their function and contents.
       For examples of how this data is used, see the
       ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual and the
-      ":ref:`dev-manual/debugging:viewing package information with \`\`oe-pkgdata-util\`\``"
+      ":ref:`dev-manual/debugging:viewing package information with ``oe-pkgdata-util```"
       section in the Yocto Project Development Tasks Manual. For more
       information on the shared, global-state directory, see
       :term:`STAGING_DIR_HOST`.
@@ -7064,7 +7064,7 @@ system and gives an overview of their function and contents.
          the package is built, the version information can be retrieved with
          ``oe-pkgdata-util package-info <package name>``. See the
          :ref:`dev-manual/debugging:Viewing Package Information with
-         \`\`oe-pkgdata-util\`\`` section of the Yocto Project Development Tasks
+         ``oe-pkgdata-util``` section of the Yocto Project Development Tasks
          Manual for more information on ``oe-pkgdata-util``.
 
 
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 755b895cee36..3050b5d0f55c 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -546,7 +546,7 @@ database.
 
 You need to run the ``buildslist`` command first to identify existing
 builds in the database before using the
-:ref:`toaster-manual/reference:\`\`builddelete\`\`` command. Here is an
+:ref:`toaster-manual/reference:``builddelete``` command. Here is an
 example that assumes default repository and :term:`Build Directory` names:
 
 .. code-block:: shell
@@ -555,7 +555,7 @@ example that assumes default repository and :term:`Build Directory` names:
    $ python ../bitbake/lib/toaster/manage.py buildslist
 
 If your Toaster database had only one build, the above
-:ref:`toaster-manual/reference:\`\`buildslist\`\``
+:ref:`toaster-manual/reference:``buildslist```
 command would return something like the following::
 
    1: qemux86 poky core-image-minimal
@@ -576,7 +576,7 @@ the database.
 
 Prior to running the ``builddelete`` command, you need to get the ID
 associated with builds by using the
-:ref:`toaster-manual/reference:\`\`buildslist\`\`` command.
+:ref:`toaster-manual/reference:``buildslist``` command.
 
 ``perf``
 --------
-- 
2.44.0.501.g19981daefd7c


