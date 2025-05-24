Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B065C54F30
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 20:06:46 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.13818.1748117202875571657
 for <docs@lists.yoctoproject.org>;
 Sat, 24 May 2025 13:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLZo5MI0;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5f720c717so212487085a.0
        for <docs@lists.yoctoproject.org>; Sat, 24 May 2025 13:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748117201; x=1748722001; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yQzMsJSZCU//ryN00KDnJ6EjPhGtr9Q3IG9mpKpN4k=;
        b=fLZo5MI0i8GB8jmLmsiL3INNM6nwz9ynPJbrwCoAWM3jlTcTtN387izJ0qDovpNmZp
         k6o6d7/oDaIKREoORqfW/96fi80BPI8TUGimgDPpstFfwhqAdAaZa0CSkBoFC17KKivo
         2qQHuKrcht496fS/AMRetJNfz48I5pICyKShQdm6hEJTT057/Qf26N0KK2OEVXAVnVEO
         /8YeYxwnSs/mCjmKmJgW8UjH1TwBk2Ogc5Oeai1uvzYRF3ZDgwX6hLFMBq9PtBW7siQT
         911doaEuRsOusyEI/8Ee4B+BSZt1fyw0WdhKSdscumDfrHF6dtVUZZZfEKjfrY2zHL6z
         bMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748117201; x=1748722001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yQzMsJSZCU//ryN00KDnJ6EjPhGtr9Q3IG9mpKpN4k=;
        b=sk38p5e4xl/rYD+RE9XBAMu4bnyUhTRfedthTdMb/uQArR25MFfd+Wbf9NtOPJJWKQ
         ygCXERKsjOzJTasqaB06KwncrH17XOvArlmDoUqMNQBxzHeOOeamuwAJJ44jnVbMXpHy
         nwDHAmBM6GZ/0P513+Q31bbEc/0oDvwV7fl4lxRr6kAIMY9uVQ7i7kmLd/Rp27YaSl/0
         P5MPcdFlNSqR9bPhYWjSsl/X/2yLPg+pSXvd5DBI2G9TVnRX+o27QOS9y8BR9T3Kxqum
         iJWdrrIExHHxeSuOm2axsZmNMYfrvnDOmhuez5hUCMtHwvM2tBu9zrF8f6wCPuG6axVp
         LAqw==
X-Gm-Message-State: AOJu0YygWnPY6lBQDq5irp6Bs+h/SQFsCWHIJolbN53mnM6+undZAffo
	pTIIbEMrvce43lugAQQk+3Cg+XWxnDD2yFJLZ9M3bCqgooz9gymho60yHu4WNg==
X-Gm-Gg: ASbGncuIjyAn0ocRoV8yU5aE1il7cT5t+lrsEYpCidEnKQ6/Vg6DX71+qNuRXYQectJ
	K5kjWTqS66v/t48AqMk18Fn4YzO0ga/DvA4bZmpZhECrUXlY36LbSyl15JC8YWfyFMQRl2iDNTr
	2BaVtpabCQvxzamPVTJJRW+TjxfzgqMw66eVMGx28vIkDD9nOVeN9f4rCpGwjqBSdXKfSeA/sGE
	W0jJXGhNgFO0ctRxXSIi2tD9MsGo6mNakH5DViV2IBHnHQOLTDbIgf8xiutrAE5NQZMsi3fwhwi
	zf+q9kNLubosK4qk5yFfZhF7wzQZGzccDLLTGH92fCrEk3BrZZagY3Z0gVLrd5rz5Ku0SlF24p2
	mw6LrdHoJc9vdimJJz9UTjgqQ9vumKw==
X-Google-Smtp-Source: AGHT+IGALnqvoi9i0j3Afy/MeEMysXQ06tRrk9XsDIMj+vymXK5+Xa9xuUFE5bMOF6TIUywYDAlU+w==
X-Received: by 2002:a05:620a:c52:b0:7ce:ea88:b6d9 with SMTP id af79cd13be357-7ceea88b6f3mr843680885a.13.1748117200552;
        Sat, 24 May 2025 13:06:40 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467edc16sm1364274685a.50.2025.05.24.13.06.38
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 13:06:39 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH][kirkstone 3/3] sphinx-lint: unbalanced inline literal markup
Date: Sat, 24 May 2025 16:06:30 -0400
Message-ID: <20250524200630.4299-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
In-Reply-To: <20250524200630.4299-1-twoerner@gmail.com>
References: <20250524200630.4299-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 20:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6901

Fix as many instances of unbalanced-inline-literals-delimiters as reported
by 'make sphinx-lint' as possible. Sphinx and/or its linter seem to get
tripped up randomly when references contain links to heading which contain
literals enclosed in double-back-tics, and not all of them can be "fixed"
to pass both building and linting.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/brief-yoctoprojectqs/index.rst   |  2 +-
 documentation/bsp-guide/bsp.rst                |  4 ++--
 documentation/dev-manual/debugging.rst         |  2 +-
 documentation/dev-manual/new-recipe.rst        |  2 +-
 documentation/dev-manual/upgrading-recipes.rst |  2 +-
 documentation/dev-manual/wic.rst               |  2 +-
 documentation/kernel-dev/common.rst            | 14 +++++++-------
 documentation/kernel-dev/intro.rst             |  2 +-
 documentation/overview-manual/concepts.rst     |  2 +-
 documentation/ref-manual/devtool-reference.rst |  2 +-
 documentation/ref-manual/structure.rst         |  2 +-
 documentation/ref-manual/tasks.rst             |  4 ++--
 documentation/ref-manual/terms.rst             |  2 +-
 documentation/ref-manual/variables.rst         |  6 +++---
 documentation/toaster-manual/reference.rst     |  6 +++---
 15 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index d7e8c6c51b77..392d9638aacd 100644
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
index b5f00d617e10..47e4193f38fe 100644
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
@@ -230,7 +230,7 @@ section.
 
 #. *Initialize the Build Environment:* While in the root directory of
    the Source Directory (i.e. ``poky``), run the
-   :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
+   :ref:`ref-manual/structure:``oe-init-build-env``` environment
    setup script to define the OpenEmbedded build environment on your
    build host. ::
 
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 74f57725540f..5a3fb1117097 100644
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
index be52610621b2..b7385c2ec300 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -56,7 +56,7 @@ necessary when adding a recipe to build a new piece of software to be
 included in a build.
 
 You can find a complete description of the ``devtool add`` command in
-the ":ref:`sdk-manual/extensible:a closer look at \`\`devtool add\`\``" section
+the ":ref:`sdk-manual/extensible:a closer look at ``devtool add```" section
 in the Yocto Project Application Development and the Extensible Software
 Development Kit (eSDK) manual.
 
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index 4fac78bdfb15..a38fd7837c3e 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -333,7 +333,7 @@ Manually Upgrading a Recipe
 
 If for some reason you choose not to upgrade recipes using
 :ref:`dev-manual/upgrading-recipes:Using the Auto Upgrade Helper (AUH)` or
-by :ref:`dev-manual/upgrading-recipes:Using \`\`devtool upgrade\`\``,
+by :ref:`dev-manual/upgrading-recipes:Using ``devtool upgrade```,
 you can manually edit the recipe files to upgrade the versions.
 
 .. note::
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 049996c39e58..6ff018f07fdf 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -514,7 +514,7 @@ or ::
 
    For more information on how to use the ``bmaptool``
    to flash a device with an image, see the
-   ":ref:`dev-manual/bmaptool:flashing images using \`\`bmaptool\`\``"
+   ":ref:`dev-manual/bmaptool:flashing images using ``bmaptool```"
    section.
 
 Using a Modified Kickstart File
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 815695652b1d..83fe98bf05dd 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -746,7 +746,7 @@ the extensible SDK and ``devtool``.
 
    Before attempting this procedure, be sure you have performed the
    steps to get ready for updating the kernel as described in the
-   ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+   ":ref:`kernel-dev/common:getting ready to develop using ``devtool```"
    section.
 
 Patching the kernel involves changing or adding configurations to an
@@ -759,7 +759,7 @@ output at boot time through ``printk`` statements in the kernel's
 ``calibrate.c`` source code file. Applying the patch and booting the
 modified image causes the added messages to appear on the emulator's
 console. The example is a continuation of the setup procedure found in
-the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Section.
+the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Section.
 
 1. *Check Out the Kernel Source Files:* First you must use ``devtool``
    to checkout the kernel source code in its workspace. Be sure you are
@@ -768,7 +768,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
    .. note::
 
       See this step in the
-      ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+      ":ref:`kernel-dev/common:getting ready to develop using ``devtool```"
       section for more information.
 
    Use the following ``devtool`` command to check out the code::
@@ -883,7 +883,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
    .. note::
 
       See Step 3 of the
-      ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+      ":ref:`kernel-dev/common:getting ready to develop using ``devtool```"
       section for information on setting up this layer.
 
    Once the command
@@ -1271,7 +1271,7 @@ appear in the ``.config`` file, which is in the :term:`Build Directory`.
 
    For more information about where the ``.config`` file is located, see the
    example in the
-   ":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
+   ":ref:`kernel-dev/common:using ``menuconfig```"
    section.
 
 It is simple to create a configuration fragment. One method is to use
@@ -1367,7 +1367,7 @@ when you override a policy configuration in a hardware configuration
 fragment.
 
 In order to run this task, you must have an existing ``.config`` file.
-See the ":ref:`kernel-dev/common:using \`\`menuconfig\`\``" section for
+See the ":ref:`kernel-dev/common:using ``menuconfig```" section for
 information on how to create a configuration file.
 
 Here is sample output from the ``do_kernel_configcheck`` task:
@@ -1440,7 +1440,7 @@ and
 tasks until they produce no warnings.
 
 For more information on how to use the ``menuconfig`` tool, see the
-:ref:`kernel-dev/common:using \`\`menuconfig\`\`` section.
+:ref:`kernel-dev/common:using ``menuconfig``` section.
 
 Fine-Tuning the Kernel Configuration File
 -----------------------------------------
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index cc879db8870e..fea876cbe1cb 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -122,7 +122,7 @@ general information and references for further information.
    Using ``devtool`` and the eSDK requires that you have a clean build
    of the image and that you are set up with the appropriate eSDK. For
    more information, see the
-   ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+   ":ref:`kernel-dev/common:getting ready to develop using ``devtool```"
    section.
 
    Using traditional kernel development requires that you have the
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index c7e062bdfb45..22ec46001495 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -983,7 +983,7 @@ package.
 
   For more information on the ``oe-pkgdata-util`` utility, see the section
   :ref:`dev-manual/debugging:Viewing Package Information with
-  \`\`oe-pkgdata-util\`\`` of the Yocto Project Development Tasks Manual.
+  ``oe-pkgdata-util``` of the Yocto Project Development Tasks Manual.
 
 To add a custom package variant of the ``${PN}`` recipe named
 ``${PN}-extra`` (name is arbitrary), one can add it to the
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index ccf4ab3d13df..56070b621887 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -432,7 +432,7 @@ You can read more on the ``devtool upgrade`` workflow in the
 ":ref:`sdk-manual/extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual. You can also see an example of
-how to use ``devtool upgrade`` in the ":ref:`dev-manual/upgrading-recipes:using \`\`devtool upgrade\`\``"
+how to use ``devtool upgrade`` in the ":ref:`dev-manual/upgrading-recipes:using ``devtool upgrade```"
 section in the Yocto Project Development Tasks Manual.
 
 .. _devtool-resetting-a-recipe:
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 4cf23544db79..1bb35da5dc1d 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -498,7 +498,7 @@ generated during the :ref:`ref-tasks-packagedata` task. The files stored in this
 directory contain information about each output package produced by the
 OpenEmbedded build system, and are used in different ways by the build system
 such as ":ref:`dev-manual/debugging:viewing package information with
-\`\`oe-pkgdata-util\`\``".
+``oe-pkgdata-util```".
 
 .. _structure-build-tmp-sstate-control:
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index c69fbaa51828..563ed0586f91 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -740,7 +740,7 @@ tool, which you then use to modify the kernel configuration.
            $ bitbake linux-yocto -c menuconfig
 
 
-See the ":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
+See the ":ref:`kernel-dev/common:using ``menuconfig```"
 section in the Yocto Project Linux Kernel Development Manual for more
 information on this configuration tool.
 
@@ -764,7 +764,7 @@ which can then be applied by subsequent tasks such as
 
 Runs ``make menuconfig`` for the kernel. For information on
 ``menuconfig``, see the
-":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
+":ref:`kernel-dev/common:using ``menuconfig```"
 section in the Yocto Project Linux Kernel Development Manual.
 
 .. _ref-tasks-savedefconfig:
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 89cbc8ac68a1..b9cf063ca18c 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -63,7 +63,7 @@ universal, the list includes them just in case:
       This term refers to the area used by the OpenEmbedded build system for
       builds. The area is created when you ``source`` the setup environment
       script that is found in the Source Directory
-      (i.e. :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``). The
+      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```). The
       :term:`TOPDIR` variable points to the Build Directory.
 
       You have a lot of flexibility when creating the :term:`Build Directory`.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 019285f360af..4610add7ea4f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1806,7 +1806,7 @@ system and gives an overview of their function and contents.
       ``${TMPDIR}/deploy``.
 
       For more information on the structure of the Build Directory, see
-      ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory --- ``build/```" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`",
       ":ref:`overview-manual/concepts:package feeds`", and
@@ -1850,7 +1850,7 @@ system and gives an overview of their function and contents.
       <ref-classes-image>` class.
 
       For more information on the structure of the Build Directory, see
-      ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory --- ``build/```" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`" and
       ":ref:`overview-manual/concepts:application development sdk`" sections both in
@@ -6099,7 +6099,7 @@ system and gives an overview of their function and contents.
       For examples of how this data is used, see the
       ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual and the
-      ":ref:`dev-manual/debugging:viewing package information with \`\`oe-pkgdata-util\`\``"
+      ":ref:`dev-manual/debugging:viewing package information with ``oe-pkgdata-util```"
       section in the Yocto Project Development Tasks Manual. For more
       information on the shared, global-state directory, see
       :term:`STAGING_DIR_HOST`.
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 927699d2a8f2..78e0767f5828 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -548,7 +548,7 @@ database.
 
 You need to run the ``buildslist`` command first to identify existing
 builds in the database before using the
-:ref:`toaster-manual/reference:\`\`builddelete\`\`` command. Here is an
+:ref:`toaster-manual/reference:``builddelete``` command. Here is an
 example that assumes default repository and build directory names:
 
 .. code-block:: shell
@@ -557,7 +557,7 @@ example that assumes default repository and build directory names:
    $ python ../bitbake/lib/toaster/manage.py buildslist
 
 If your Toaster database had only one build, the above
-:ref:`toaster-manual/reference:\`\`buildslist\`\``
+:ref:`toaster-manual/reference:``buildslist```
 command would return something like the following::
 
    1: qemux86 poky core-image-minimal
@@ -578,7 +578,7 @@ the database.
 
 Prior to running the ``builddelete`` command, you need to get the ID
 associated with builds by using the
-:ref:`toaster-manual/reference:\`\`buildslist\`\`` command.
+:ref:`toaster-manual/reference:``buildslist``` command.
 
 ``perf``
 --------
-- 
2.44.0.501.g19981daefd7c


