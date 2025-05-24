Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0C5C54ED0
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 01:10:50 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.1714.1748049044312203957
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 18:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fy2RfRWZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7cd0a7b672bso24851785a.2
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 18:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748049043; x=1748653843; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjEzLiRXKI3euxtInP0QwruLD3FjuXvTOsaAHVRw3ro=;
        b=Fy2RfRWZvaRo2wJzRpaGj6PPeFSMwSFe2exNKA2WZJdCFC7OUP+BmbH0sH4aTC/Jpe
         DiH7JacKEAjJaoR0G/QUE/Mzlq/fw3yKNlDr7/NqtDrY5aW0nZ6I6+7idCmO6SGi51DL
         rWRyjE0iKqS4AQUMm6VQPb0+gjuuYeYnzWpHWQo0fQEVQlJIcDkQ3kTrzkJD3ftAPSfU
         LgFPwjcUdb0sc9JEqFTQBbm0zkNbheIw8z/TyAUbVxhSi18jLVq7FQIf2tTBezrV31Zi
         1mJ5C0G1kYSewLyjNOAcs9hJW4WbubLFEKrHvBkxwdnhaaTO/vg1qjV29RO+UpJtwjUK
         PH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748049043; x=1748653843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjEzLiRXKI3euxtInP0QwruLD3FjuXvTOsaAHVRw3ro=;
        b=t1d2gE6VSkqL5jWepF4HAdYP8YzsTAk1AK59DXeuJ6ldpV5FKjCAB2yJJroIUqmfoM
         VGpP836sKKMZAxazIdbWWOYKQfXBdKLYNqmd82cr1IJM9vDEKxXhi6pUtqIncFx5s3TU
         fHG1WCieW4XAC5YJ/+YoE3dgifki/9ZDXleXbCute3/Y1xd98zvG8E/KFxT5AADjJvFN
         0X2y6iBSHuHL6sE/hFw3XbxlmNwYjRCB9OwPUSXHDLeghHBIghQDES0r9ANAyPoFMO6u
         jVazj+ewNmWFchOuSXot1IwVIPR7hMTHWQh2RRi62bOXSMDGS0N2hdEi2hK2iEt+Bw14
         A4wA==
X-Gm-Message-State: AOJu0YzK/ilv0eqG0Lj2TrjZ86AL61lNgGt3AkNuq84ZSl2QlDoEGcKF
	AWsLkvlx+4pQe1niYeI1UwHL7RUlSxq4iNik0MqQscy74wQYLKb/CHz5g1vWHg==
X-Gm-Gg: ASbGncv52pu1iiyvWSEEGwchNdYgoWF++FEgG176dxUj05wMGvgihCvn4h16TO5TOsk
	GqvLkYVDWv/JwPQOvUkS2+zKUKJDsMJc+bKwblgrw+j4Uwpg5vKNCxAZUIX5DMHAnuB6TOd6ZHm
	PEsZ2xgLjBlRnf5EvGsDcRKSVd3xwV1eNREGymzEZkPHuAksjF+NpNjpagmfksbj/GAhS0T2Qw4
	HBEIiTcSW39KE4Agb0q60YiqAC/vaS0lH0+VoodyXMSXIpB2P5weTfOe2laBwjHkk/sb3iaKMh2
	/SLZjnxilCLF+7pzwdrsss5h2wxlvnLPRNtKdYc1PWwD5gZc4zzbDkh7JldVAHYpghDCfSLyDNZ
	VTWlgpLHoVwNmG9W8CoQ=
X-Google-Smtp-Source: AGHT+IH9K/4ZItCAt9vpNG/NVx4tP70lbt6rf4Mp9d1BfrvHdFUzKjxZuPPPVAjQtMFE/PtfRIDLgQ==
X-Received: by 2002:a05:620a:4046:b0:7c5:4463:29aa with SMTP id af79cd13be357-7ceecbe07a7mr230615385a.40.1748049042441;
        Fri, 23 May 2025 18:10:42 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467d8140sm1261220585a.37.2025.05.23.18.10.40
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:10:41 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH][scarthgap 3/3] sphinx-lint: unbalanced inline literal markup
Date: Fri, 23 May 2025 21:10:32 -0400
Message-ID: <20250524011032.19679-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
In-Reply-To: <20250524011032.19679-1-twoerner@gmail.com>
References: <20250524011032.19679-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 01:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6895

Fix as many instances of unbalanced-inline-literals-delimiters as reported by
'make sphinx-lint' as possible. Sphinx and/or its linter seem to get tripped
up randomly when references contain links to heading which contain literals
enclosed in double-back-tics, and not all of them can be "fixed" to pass both
building and linting.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/brief-yoctoprojectqs/index.rst       |  2 +-
 documentation/bsp-guide/bsp.rst                    |  4 ++--
 documentation/dev-manual/debugging.rst             |  2 +-
 documentation/dev-manual/new-recipe.rst            |  2 +-
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
 15 files changed, 28 insertions(+), 28 deletions(-)

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
index 944b9627f93f..af88db937b1f 100644
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
index 062ac4ab7609..94fb89363ee8 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -953,7 +953,7 @@ package.
 
   For more information on the ``oe-pkgdata-util`` utility, see the section
   :ref:`dev-manual/debugging:Viewing Package Information with
-  \`\`oe-pkgdata-util\`\`` of the Yocto Project Development Tasks Manual.
+  ``oe-pkgdata-util``` of the Yocto Project Development Tasks Manual.
 
 To add a custom package variant of the ``${PN}`` recipe named
 ``${PN}-extra`` (name is arbitrary), one can add it to the
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index a6ea00c21031..2db2adde95d1 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -435,7 +435,7 @@ You can read more on the ``devtool upgrade`` workflow in the
 ":ref:`sdk-manual/extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
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
index 5cd23449fab5..cf6b9876ca56 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -727,7 +727,7 @@ tool, which you then use to modify the kernel configuration.
            $ bitbake linux-yocto -c menuconfig
 
 
-See the ":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
+See the ":ref:`kernel-dev/common:using ``menuconfig```"
 section in the Yocto Project Linux Kernel Development Manual for more
 information on this configuration tool.
 
@@ -751,7 +751,7 @@ which can then be applied by subsequent tasks such as
 
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
index 20dc7f09509f..e43dc38f32e7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2199,7 +2199,7 @@ system and gives an overview of their function and contents.
       resides within the :term:`Build Directory` as ``${TMPDIR}/deploy``.
 
       For more information on the structure of the Build Directory, see
-      ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory --- ``build/```" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`",
       ":ref:`overview-manual/concepts:package feeds`", and
@@ -2241,7 +2241,7 @@ system and gives an overview of their function and contents.
       contents of :term:`IMGDEPLOYDIR` by the :ref:`ref-classes-image` class.
 
       For more information on the structure of the :term:`Build Directory`, see
-      ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory --- ``build/```" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`" and
       ":ref:`overview-manual/concepts:application development sdk`" sections both in
@@ -6730,7 +6730,7 @@ system and gives an overview of their function and contents.
       For examples of how this data is used, see the
       ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual and the
-      ":ref:`dev-manual/debugging:viewing package information with \`\`oe-pkgdata-util\`\``"
+      ":ref:`dev-manual/debugging:viewing package information with ``oe-pkgdata-util```"
       section in the Yocto Project Development Tasks Manual. For more
       information on the shared, global-state directory, see
       :term:`STAGING_DIR_HOST`.
@@ -6784,7 +6784,7 @@ system and gives an overview of their function and contents.
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


