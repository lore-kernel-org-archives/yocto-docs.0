Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.2897.1606384127179728028
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 01:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BuBDOlAR;
 spf=pass (domain: linaro.org, ip: 209.85.128.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f53.google.com with SMTP id p19so3286772wmg.0
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2020 01:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NwrO1X92jxrp9rdaeJvmEUFAat7urY1lHMoYznuU2RU=;
        b=BuBDOlAR1//7YEev5xv8gL8bG6eCxE/vyuy4g/vHCixrYLb0LMeHf6D4WPxjx3qJv0
         zfaj7ns37D8zD8oBfcqmJPnnvuQmxe5qBDEoKR1BpHyBAmeokQvqQo1LX6ODZ/vw6CD3
         rxAL5FJmO07drXgaOCaaAXjOegJLhukKIrssezghQi2MjKTLGZPhhv81CmX7oqfFyYkq
         JlAQvjmXB+h0Jw6DrmRegy8cyosojIeTyqaP9o9f6HWZgogprQTJrDmj3HQtz2L7svDu
         Qpx3RxBOIzJWx62VGCwgMIJeGsj41mSsniDtc4LpvRV6tS8DdA9GKypvAlzmzcDVYiOb
         Bnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NwrO1X92jxrp9rdaeJvmEUFAat7urY1lHMoYznuU2RU=;
        b=YDD3AXnfwtOpHhX94VDRrkLw3AZHXcVMQeP5khX+K5fzMKnzjPTNt1zRA0AgX+nw2V
         nW89GxINZiewvTn8PT4fbJyvF1w6sQn2vZG5cN5dQQFm6XfI2iO1XRW3FBNb84uUOARD
         VsKZBLijjtb47j3Te5EqmGMusEZsXGv69U3Mk1wXJYa9y/mlJXfRmULAf7Ve0lyRUsRJ
         3/NMr0vOjSek8YoXfginFRNSeY4sUQ/ZkILjYmwfHMBx/7YyiW+m/Xt8ovSNxPdMSlLp
         s95/mwlHt8XV0eL1hmLZcjkTYnykht5pAZrpFP1pNfsgFqOcf6PElQui64n3Mgb8XuMe
         jl7Q==
X-Gm-Message-State: AOAM532cFzsWo7CHcxzflvAM+hKBO9F6Ipcl7md6/F00ImPlYBn6DWec
	Z0+jEo71/m0STni1wHibuvGj4zhE2s+O7v57
X-Google-Smtp-Source: ABdhPJwj0l4TepN0jqcU7/kExDh7q5yF8JM1t8x11/BkTIljesmZKEvNQ0O22BvOOmKdqdVRoMMnhw==
X-Received: by 2002:a1c:6184:: with SMTP id v126mr2409707wmb.64.1606384123931;
        Thu, 26 Nov 2020 01:48:43 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id a12sm8759590wrq.58.2020.11.26.01.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 01:48:43 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 4/7] ref-manual: replace labels with references to section title
Date: Thu, 26 Nov 2020 10:48:24 +0100
Message-Id: <20201126094827.95641-5-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
References: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 documentation/ref-manual/ref-classes.rst      | 16 ++--
 .../ref-manual/ref-devtool-reference.rst      |  4 +-
 documentation/ref-manual/ref-features.rst     |  2 +-
 documentation/ref-manual/ref-structure.rst    |  6 +-
 documentation/ref-manual/ref-tasks.rst        | 30 ++++----
 documentation/ref-manual/ref-variables.rst    | 74 +++++++++----------
 documentation/ref-manual/resources.rst        |  2 +-
 7 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 249b58e60..62876194d 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -86,7 +86,7 @@ standardization. This class defines a set of tasks (e.g. ``configure``,
 should usually be enough to define a few standard variables and then
 simply ``inherit autotools``. These classes can also work with software
 that emulates Autotools. For more information, see the
-":ref:`new-recipe-autotooled-package`" section
+":ref:`dev-manual/dev-manual-common-tasks:autotooled package`" section
 in the Yocto Project Development Tasks Manual.
 
 By default, the ``autotools*`` classes use out-of-tree builds (i.e.
@@ -458,7 +458,7 @@ staging the files from ``DEPLOYDIR`` to ``DEPLOY_DIR_IMAGE``.
 ====================
 
 The ``devshell`` class adds the ``do_devshell`` task. Distribution
-policy dictates whether to include this class. See the ":ref:`platdev-appdev-devshell`"
+policy dictates whether to include this class. See the ":ref:`dev-manual/dev-manual-common-tasks:using a development shell`"
 section in the Yocto Project Development Tasks Manual for more
 information about using ``devshell``.
 
@@ -927,10 +927,10 @@ then one or more image files are created.
    install into the image.
 
 For information on customizing images, see the
-":ref:`usingpoky-extend-customimage`" section
+":ref:`dev-manual/dev-manual-common-tasks:customizing images`" section
 in the Yocto Project Development Tasks Manual. For information on how
 images are created, see the
-":ref:`images-dev-environment`" section in the
+":ref:`overview-manual/overview-manual-concepts:images`" section in the
 Yocto Project Overview and Concpets Manual.
 
 .. _ref-classes-image-buildinfo:
@@ -1344,7 +1344,7 @@ packages such as ``kernel-vmlinux``.
 The ``kernel`` class contains logic that allows you to embed an initial
 RAM filesystem (initramfs) image when you build the kernel image. For
 information on how to build an initramfs, see the
-":ref:`building-an-initramfs-image`" section in
+":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section in
 the Yocto Project Development Tasks Manual.
 
 Various other classes are used by the ``kernel`` and ``module`` classes
@@ -1620,7 +1620,7 @@ different target optimizations or target architectures and installing
 them side-by-side in the same image.
 
 For more information on using the Multilib feature, see the
-":ref:`combining-multiple-versions-library-files-into-one-image`"
+":ref:`dev-manual/dev-manual-common-tasks:combining multiple versions of library files into one image`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-native:
@@ -1921,7 +1921,7 @@ so forth). It is highly recommended that all package group recipes
 inherit this class.
 
 For information on how to use this class, see the
-":ref:`usingpoky-extend-customimage-customtasks`"
+":ref:`dev-manual/dev-manual-common-tasks:customizing images using custom package groups`"
 section in the Yocto Project Development Tasks Manual.
 
 Previously, this class was called the ``task`` class.
@@ -2268,7 +2268,7 @@ The root filesystem is created from packages using one of the
 :term:`PACKAGE_CLASSES` variable.
 
 For information on how root filesystem images are created, see the
-":ref:`image-generation-dev-environment`"
+":ref:`overview-manual/overview-manual-concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-sanity:
diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
index 3f95f8d70..93fd1465f 100644
--- a/documentation/ref-manual/ref-devtool-reference.rst
+++ b/documentation/ref-manual/ref-devtool-reference.rst
@@ -413,7 +413,7 @@ Upgrading a Recipe
 As software matures, upstream recipes are upgraded to newer versions. As
 a developer, you need to keep your local recipes up-to-date with the
 upstream version releases. Several methods exist by which you can
-upgrade recipes. You can read about them in the ":ref:`gs-upgrading-recipes`"
+upgrade recipes. You can read about them in the ":ref:`dev-manual/dev-manual-common-tasks:upgrading recipes`"
 section of the Yocto Project Development Tasks Manual. This section
 overviews the ``devtool upgrade`` command.
 
@@ -441,7 +441,7 @@ You can read more on the ``devtool upgrade`` workflow in the
 ":ref:`sdk-manual/sdk-extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual. You can also see an example of
-how to use ``devtool upgrade`` in the ":ref:`gs-using-devtool-upgrade`"
+how to use ``devtool upgrade`` in the ":ref:`dev-manual/dev-manual-common-tasks:using \`\`devtool upgrade\`\``"
 section in the Yocto Project Development Tasks Manual.
 
 .. _devtool-resetting-a-recipe:
diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
index f28ad2bb4..a16460e91 100644
--- a/documentation/ref-manual/ref-features.rst
+++ b/documentation/ref-manual/ref-features.rst
@@ -273,7 +273,7 @@ these valid features is as follows:
 
 -  *tools-debug:* Installs debugging tools such as ``strace`` and
    ``gdb``. For information on GDB, see the
-   ":ref:`platdev-gdb-remotedebug`" section
+   ":ref:`dev-manual/dev-manual-common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
    in the Yocto Project Development Tasks Manual. For information on
    tracing and profiling, see the :doc:`../profile-manual/profile-manual`.
 
diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index db1ea9797..5d17f0e5c 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
@@ -399,8 +399,8 @@ This directory contains any "end result" output from the OpenEmbedded
 build process. The :term:`DEPLOY_DIR` variable points
 to this directory. For more detail on the contents of the ``deploy``
 directory, see the
-":ref:`images-dev-environment`" and
-":ref:`sdk-dev-environment`" sections in the Yocto
+":ref:`overview-manual/overview-manual-concepts:images`" and
+":ref:`overview-manual/overview-manual-concepts:application development sdk`" sections in the Yocto
 Project Overview and Concepts Manual.
 
 .. _structure-build-tmp-deploy-deb:
@@ -577,7 +577,7 @@ built within the Yocto Project. For this package, a work directory of
 ``tmp/work/qemux86-poky-linux/linux-yocto/3.0+git1+<.....>``, referred
 to as the ``WORKDIR``, is created. Within this directory, the source is
 unpacked to ``linux-qemux86-standard-build`` and then patched by Quilt.
-(See the ":ref:`using-a-quilt-workflow`" section in
+(See the ":ref:`dev-manual/dev-manual-common-tasks:using quilt in your workflow`" section in
 the Yocto Project Development Tasks Manual for more information.) Within
 the ``linux-qemux86-standard-build`` directory, standard Quilt
 directories ``linux-3.0/patches`` and ``linux-3.0/.pc`` are created, and
diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index 88b285d76..299e8f7d6 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -140,7 +140,7 @@ The ``do_image`` task performs pre-processing on the image through the
 :term:`IMAGE_PREPROCESS_COMMAND` and
 dynamically generates supporting ``do_image_*`` tasks as needed.
 
-For more information on image creation, see the ":ref:`image-generation-dev-environment`"
+For more information on image creation, see the ":ref:`overview-manual/overview-manual-concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-image-complete:
@@ -159,7 +159,7 @@ through the
 :term:`IMAGE_POSTPROCESS_COMMAND`.
 
 For more information on image creation, see the
-":ref:`image-generation-dev-environment`"
+":ref:`overview-manual/overview-manual-concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-install:
@@ -237,7 +237,7 @@ see the :ref:`insane <ref-classes-insane>` class.
 Creates Debian packages (i.e. ``*.deb`` files) and places them in the
 ``${``\ :term:`DEPLOY_DIR_DEB`\ ``}`` directory in
 the package feeds area. For more information, see the
-":ref:`package-feeds-dev-environment`" section in
+":ref:`overview-manual/overview-manual-concepts:package feeds`" section in
 the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-package_write_ipk:
@@ -248,7 +248,7 @@ the Yocto Project Overview and Concepts Manual.
 Creates IPK packages (i.e. ``*.ipk`` files) and places them in the
 ``${``\ :term:`DEPLOY_DIR_IPK`\ ``}`` directory in
 the package feeds area. For more information, see the
-":ref:`package-feeds-dev-environment`" section in
+":ref:`overview-manual/overview-manual-concepts:package feeds`" section in
 the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-package_write_rpm:
@@ -259,7 +259,7 @@ the Yocto Project Overview and Concepts Manual.
 Creates RPM packages (i.e. ``*.rpm`` files) and places them in the
 ``${``\ :term:`DEPLOY_DIR_RPM`\ ``}`` directory in
 the package feeds area. For more information, see the
-":ref:`package-feeds-dev-environment`" section in
+":ref:`overview-manual/overview-manual-concepts:package feeds`" section in
 the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-package_write_tar:
@@ -270,7 +270,7 @@ the Yocto Project Overview and Concepts Manual.
 Creates tarballs and places them in the
 ``${``\ :term:`DEPLOY_DIR_TAR`\ ``}`` directory in
 the package feeds area. For more information, see the
-":ref:`package-feeds-dev-environment`" section in
+":ref:`overview-manual/overview-manual-concepts:package feeds`" section in
 the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-packagedata:
@@ -349,9 +349,9 @@ patch files end with either ``.patch`` or ``.diff``, every file would be
 applied as a patch by default except for the ``patch_file5`` patch.
 
 You can find out more about the patching process in the
-":ref:`patching-dev-environment`" section in
+":ref:`overview-manual/overview-manual-concepts:patching`" section in
 the Yocto Project Overview and Concepts Manual and the
-":ref:`new-recipe-patching-code`" section in the
+":ref:`dev-manual/dev-manual-common-tasks:patching code`" section in the
 Yocto Project Development Tasks Manual.
 
 .. _ref-tasks-populate_lic:
@@ -368,7 +368,7 @@ the image is constructed.
 -------------------
 
 Creates the file and directory structure for an installable SDK. See the
-":ref:`sdk-generation-dev-environment`"
+":ref:`overview-manual/overview-manual-concepts:sdk generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 information.
 
@@ -378,7 +378,7 @@ information.
 -----------------------
 
 Creates the file and directory structure for an installable extensible 
-SDK (eSDK). See the ":ref:`sdk-generation-dev-environment`"
+SDK (eSDK). See the ":ref:`overview-manual/overview-manual-concepts:sdk generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 information.
 
@@ -434,7 +434,7 @@ Unpacks the source code into a working directory pointed to by
 ``${``\ :term:`WORKDIR`\ ``}``. The :term:`S`
 variable also plays a role in where unpacked source files ultimately
 reside. For more information on how source files are unpacked, see the
-":ref:`source-fetching-dev-environment`"
+":ref:`overview-manual/overview-manual-concepts:source fetching`"
 section in the Yocto Project Overview and Concepts Manual and also see
 the ``WORKDIR`` and ``S`` variable descriptions.
 
@@ -567,7 +567,7 @@ scratch is guaranteed.
 Starts a shell in which an interactive Python interpreter allows you to
 interact with the BitBake build environment. From within this shell, you
 can directly examine and set bits from the data store and execute
-functions as if within the BitBake environment. See the ":ref:`platdev-appdev-devpyshell`" section in
+functions as if within the BitBake environment. See the ":ref:`dev-manual/dev-manual-common-tasks:using a development python shell`" section in
 the Yocto Project Development Tasks Manual for more information about
 using ``devpyshell``.
 
@@ -577,7 +577,7 @@ using ``devpyshell``.
 ---------------
 
 Starts a shell whose environment is set up for development, debugging,
-or both. See the ":ref:`platdev-appdev-devshell`" section in the
+or both. See the ":ref:`dev-manual/dev-manual-common-tasks:using a development shell`" section in the
 Yocto Project Development Tasks Manual for more information about using
 ``devshell``.
 
@@ -593,7 +593,7 @@ Lists all defined tasks for a target.
 ``do_package_index``
 --------------------
 
-Creates or updates the index in the :ref:`package-feeds-dev-environment` area.
+Creates or updates the index in the :ref:`overview-manual/overview-manual-concepts:package feeds` area.
 
 .. note::
 
@@ -631,7 +631,7 @@ has some more information about these types of images.
 -------------
 
 Creates the root filesystem (file and directory structure) for an image.
-See the ":ref:`image-generation-dev-environment`"
+See the ":ref:`overview-manual/overview-manual-concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 information on how the root filesystem is created.
 
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 56aeb583a..b24e1fa39 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -746,7 +746,7 @@ system and gives an overview of their function and contents.
 
       For information on how to use ``BBMULTICONFIG`` in an environment
       that supports building targets with multiple configurations, see the
-      ":ref:`dev-building-images-for-multiple-targets-using-multiple-configurations`"
+      ":ref:`dev-manual/dev-manual-common-tasks:building images for multiple targets using multiple configurations`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`BBPATH`
@@ -1299,7 +1299,7 @@ system and gives an overview of their function and contents.
       will be the aggregate of all of them.
 
       For information on creating an initramfs, see the
-      ":ref:`building-an-initramfs-image`" section
+      ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`CONFIG_SITE`
@@ -1672,9 +1672,9 @@ system and gives an overview of their function and contents.
       For more information on the structure of the Build Directory, see
       ":ref:`ref-manual/ref-structure:the build directory - \`\`build/\`\``" section.
       For more detail on the contents of the ``deploy`` directory, see the
-      ":ref:`Images <images-dev-environment>`", ":ref:`Package
-      Feeds <package-feeds-dev-environment>`", and
-      ":ref:`sdk-dev-environment`" sections all in the
+      ":ref:`overview-manual/overview-manual-concepts:images`",
+      ":ref:`overview-manual/overview-manual-concepts:package feeds`", and
+      ":ref:`overview-manual/overview-manual-concepts:application development sdk`" sections all in the
       Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_DEB`
@@ -1695,8 +1695,8 @@ system and gives an overview of their function and contents.
       ``DEPLOY_DIR_DEB`` variable to make sure the
       :ref:`ref-tasks-package_write_deb` task
       writes Debian packages into the appropriate folder. For more
-      information on how packaging works, see the ":ref:`Package
-      Feeds <package-feeds-dev-environment>`" section
+      information on how packaging works, see the
+      ":ref:`overview-manual/overview-manual-concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_IMAGE`
@@ -1710,8 +1710,8 @@ system and gives an overview of their function and contents.
       For more information on the structure of the Build Directory, see
       ":ref:`ref-manual/ref-structure:the build directory - \`\`build/\`\``" section.
       For more detail on the contents of the ``deploy`` directory, see the
-      ":ref:`Images <images-dev-environment>`" and
-      ":ref:`sdk-dev-environment`" sections both in
+      ":ref:`overview-manual/overview-manual-concepts:images`" and
+      ":ref:`overview-manual/overview-manual-concepts:application development sdk`" sections both in
       the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_IPK`
@@ -1731,8 +1731,8 @@ system and gives an overview of their function and contents.
       ``DEPLOY_DIR_IPK`` variable to make sure the
       :ref:`ref-tasks-package_write_ipk` task
       writes IPK packages into the appropriate folder. For more information
-      on how packaging works, see the ":ref:`Package
-      Feeds <package-feeds-dev-environment>`" section
+      on how packaging works, see the
+      ":ref:`overview-manual/overview-manual-concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_RPM`
@@ -1752,8 +1752,8 @@ system and gives an overview of their function and contents.
       ``DEPLOY_DIR_RPM`` variable to make sure the
       :ref:`ref-tasks-package_write_rpm` task
       writes RPM packages into the appropriate folder. For more information
-      on how packaging works, see the ":ref:`Package
-      Feeds <package-feeds-dev-environment>`" section
+      on how packaging works, see the
+      ":ref:`overview-manual/overview-manual-concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_TAR`
@@ -1773,8 +1773,8 @@ system and gives an overview of their function and contents.
       ``DEPLOY_DIR_TAR`` variable to make sure the
       :ref:`ref-tasks-package_write_tar` task
       writes TAR packages into the appropriate folder. For more information
-      on how packaging works, see the ":ref:`Package
-      Feeds <package-feeds-dev-environment>`" section
+      on how packaging works, see the
+      ":ref:`overview-manual/overview-manual-concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOYDIR`
@@ -2194,7 +2194,7 @@ system and gives an overview of their function and contents.
       Project, see the ":ref:`ref-features-image`" section.
 
       For an example that shows how to customize your image by using this
-      variable, see the ":ref:`usingpoky-extend-customimage-imagefeatures`"
+      variable, see the ":ref:`dev-manual/dev-manual-common-tasks:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`EXTRA_IMAGECMD`
@@ -2509,9 +2509,9 @@ system and gives an overview of their function and contents.
       build system uses files from ``files/defconfig``.
 
       You can find out more about the patching process in the
-      ":ref:`patching-dev-environment`" section
+      ":ref:`overview-manual/overview-manual-concepts:patching`" section
       in the Yocto Project Overview and Concepts Manual and the
-      ":ref:`new-recipe-patching-code`" section in
+      ":ref:`dev-manual/dev-manual-common-tasks:patching code`" section in
       the Yocto Project Development Tasks Manual. See the
       :ref:`ref-tasks-patch` task as well.
 
@@ -3000,7 +3000,7 @@ system and gives an overview of their function and contents.
       the ":ref:`ref-features-image`" section.
 
       For an example that shows how to customize your image by using this
-      variable, see the ":ref:`usingpoky-extend-customimage-imagefeatures`"
+      variable, see the ":ref:`dev-manual/dev-manual-common-tasks:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`IMAGE_FSTYPES`
@@ -3058,7 +3058,7 @@ system and gives an overview of their function and contents.
             allows the initial RAM filesystem (initramfs) recipe to use a
             fixed set of packages and not be affected by ``IMAGE_INSTALL``.
             For information on creating an initramfs, see the
-            ":ref:`building-an-initramfs-image`"
+            ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`"
             section in the Yocto Project Development Tasks Manual.
 
          -  Using ``IMAGE_INSTALL`` with the
@@ -3126,7 +3126,7 @@ system and gives an overview of their function and contents.
       The location is
       derived using the :term:`DEPLOY_DIR_IMAGE`
       and :term:`IMAGE_NAME` variables. You can find
-      information on how the image is created in the ":ref:`image-generation-dev-environment`"
+      information on how the image is created in the ":ref:`overview-manual/overview-manual-concepts:image generation`"
       section in the Yocto Project Overview and Concepts Manual.
 
    :term:`IMAGE_NAME`
@@ -3554,7 +3554,7 @@ system and gives an overview of their function and contents.
       :term:`INITRAMFS_IMAGE_BUNDLE`
       variable, which allows the generated image to be bundled inside the
       kernel image. Additionally, for information on creating an initramfs
-      image, see the ":ref:`building-an-initramfs-image`" section
+      image, see the ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_IMAGE_BUNDLE`
@@ -3602,7 +3602,7 @@ system and gives an overview of their function and contents.
       See the
       :yocto_git:`local.conf.sample.extended </cgit/cgit.cgi/poky/tree/meta-poky/conf/local.conf.sample.extended>`
       file for additional information. Also, for information on creating an
-      initramfs, see the ":ref:`building-an-initramfs-image`" section
+      initramfs, see the ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_LINK_NAME`
@@ -4240,7 +4240,7 @@ system and gives an overview of their function and contents.
       This variable must be defined for all recipes (unless
       :term:`LICENSE` is set to "CLOSED").
 
-      For more information, see the ":ref:`usingpoky-configuring-lic_files_chksum`"
+      For more information, see the ":ref:`dev-manual/dev-manual-common-tasks:tracking license changes`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE`
@@ -4890,7 +4890,7 @@ system and gives an overview of their function and contents.
       Controls how the OpenEmbedded build system spawns interactive
       terminals on the host development system (e.g. using the BitBake
       command with the ``-c devshell`` command-line option). For more
-      information, see the ":ref:`platdev-appdev-devshell`" section in
+      information, see the ":ref:`dev-manual/dev-manual-common-tasks:using a development shell`" section in
       the Yocto Project Development Tasks Manual.
 
       You can use the following values for the ``OE_TERMINAL`` variable:
@@ -4959,7 +4959,7 @@ system and gives an overview of their function and contents.
 
          An easy way to see what overrides apply is to search for ``OVERRIDES``
          in the output of the ``bitbake -e`` command. See the
-         ":ref:`dev-debugging-viewing-variable-values`" section in the Yocto
+         ":ref:`dev-manual/dev-manual-common-tasks:viewing variable values`" section in the Yocto
          Project Development Tasks Manual for more information.
 
    :term:`P`
@@ -5079,7 +5079,7 @@ system and gives an overview of their function and contents.
          separate ``*-src`` pkg. This is the default behavior.
 
       You can find out more about debugging using GDB by reading the
-      ":ref:`platdev-gdb-remotedebug`" section
+      ":ref:`dev-manual/dev-manual-common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGE_EXCLUDE_COMPLEMENTARY`
@@ -5243,7 +5243,7 @@ system and gives an overview of their function and contents.
       the :ref:`core-image-minimal-initramfs <ref-manual/ref-images:images>`
       image. When working with an initial RAM filesystem (initramfs) image,
       use the ``PACKAGE_INSTALL`` variable. For information on creating an
-      initramfs, see the ":ref:`building-an-initramfs-image`" section
+      initramfs, see the ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGE_INSTALL_ATTEMPTONLY`
@@ -5691,7 +5691,7 @@ system and gives an overview of their function and contents.
 
          The OpenEmbedded build system does not need the aid of ``PR``
          to know when to rebuild a recipe. The build system uses the task
-         :ref:`input checksums <overview-checksums>` along with the
+         :ref:`input checksums <overview-manual/overview-manual-concepts:checksums (signatures)>` along with the
          :ref:`stamp <structure-build-tmp-stamps>` and
          :ref:`overview-manual/overview-manual-concepts:shared state cache`
          mechanisms.
@@ -5738,7 +5738,7 @@ system and gives an overview of their function and contents.
          PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 
       For more
-      information, see the ":ref:`metadata-virtual-providers`"
+      information, see the ":ref:`dev-manual/dev-manual-common-tasks:using virtual providers`"
       section in the Yocto Project Development Tasks Manual.
 
       .. note::
@@ -7023,7 +7023,7 @@ system and gives an overview of their function and contents.
 
       -  ``file://`` - Fetches files, which are usually files shipped
          with the :term:`Metadata`, from the local machine (e.g.
-         :ref:`patch <patching-dev-environment>` files).
+         :ref:`patch <overview-manual/overview-manual-concepts:patching>` files).
          The path is relative to the :term:`FILESPATH`
          variable. Thus, the build system searches, in order, from the
          following directories, which are assumed to be a subdirectories of
@@ -7200,7 +7200,7 @@ system and gives an overview of their function and contents.
          For information on limitations when inheriting the latest revision
          of software using ``SRCREV``, see the :term:`AUTOREV` variable
          description and the
-         ":ref:`automatically-incrementing-a-binary-package-revision-number`"
+         ":ref:`dev-manual/dev-manual-common-tasks:automatically incrementing a package version number`"
          section, which is in the Yocto Project Development Tasks Manual.
 
    :term:`SSTATE_DIR`
@@ -7316,7 +7316,7 @@ system and gives an overview of their function and contents.
       see the :ref:`ref-tasks-populate_sysroot`
       task, the ":ref:`sdk-manual/sdk-extensible:sharing files between recipes`"
       section in the Yocto Project Development Tasks Manual, the
-      ":ref:`configuration-compilation-and-staging-dev-environment`"
+      ":ref:`overview-manual/overview-manual-concepts:configuration, compilation, and staging`"
       section in the Yocto Project Overview and Concepts Manual, and the
       :term:`SYSROOT_DIRS` variable.
 
@@ -8042,7 +8042,7 @@ system and gives an overview of their function and contents.
       You can provide the following arguments with ``TEST_TARGET``:
 
       -  *"qemu":* Boots a QEMU image and runs the tests. See the
-         ":ref:`qemu-image-enabling-tests`" section
+         ":ref:`dev-manual/dev-manual-common-tasks:enabling runtime tests on qemu`" section
          in the Yocto Project Development Tasks Manual for more
          information.
 
@@ -8058,7 +8058,7 @@ system and gives an overview of their function and contents.
             ``meta/lib/oeqa/controllers/simpleremote.py``.
 
       For information on running tests on hardware, see the
-      ":ref:`hardware-image-enabling-tests`"
+      ":ref:`dev-manual/dev-manual-common-tasks:enabling runtime tests on hardware`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`TEST_TARGET_IP`
@@ -8554,13 +8554,13 @@ system and gives an overview of their function and contents.
       specifically set. Typically, you would set ``USE_DEVFS`` to "0" for a
       statically populated ``/dev`` directory.
 
-      See the ":ref:`selecting-dev-manager`" section in
+      See the ":ref:`dev-manual/dev-manual-common-tasks:selecting a device manager`" section in
       the Yocto Project Development Tasks Manual for information on how to
       use this variable.
 
    :term:`USE_VT`
       When using
-      :ref:`SysVinit <new-recipe-enabling-system-services>`,
+      :ref:`SysVinit <dev-manual/dev-manual-common-tasks:enabling system services>`,
       determines whether or not to run a
       `getty <http://en.wikipedia.org/wiki/Getty_%28Unix%29>`__ on any
       virtual terminals in order to enable logging in through those
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 2ef182fb1..c172aab25 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -23,7 +23,7 @@ The Yocto Project gladly accepts contributions. You can submit changes
 to the project either by creating and sending pull requests, or by
 submitting patches through email. For information on how to do both as
 well as information on how to identify the maintainer for each area of
-code, see the ":ref:`how-to-submit-a-change`" section in the
+code, see the ":ref:`dev-manual/dev-manual-common-tasks:submitting a change to the yocto project`" section in the
 Yocto Project Development Tasks Manual.
 
 .. _resources-bugtracker:
-- 
2.29.2

