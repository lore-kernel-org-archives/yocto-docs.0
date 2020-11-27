Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.20394.1606490361572882029
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2020 07:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VwUomYph;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 3so3119969wmg.4
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2020 07:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8RBf+OFx17SJSxB5QVUbFDP9mSHO0TH8P922TS/gksY=;
        b=VwUomYphw84u6HTZhxlvWOim8cBz5fPAKXPg0f3ELFx/yZTBECry97DMaSi5gckLXS
         S/zc6o+ZhDoNP9MohGhE5lIQ8vecq62ejJOCn47/KDuKwbU/Qfuz5tZAlqa1xa6oe3Vz
         mkth4bTyJGYwVNSuF+P/4yftXyJK/4O2z9C6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8RBf+OFx17SJSxB5QVUbFDP9mSHO0TH8P922TS/gksY=;
        b=UluL+RAV1SIRr0P16GfAf7eAdHg3PNWUyLCkWwCWdtm4k0Sj2WuDyzZ1et+JD3FMuc
         m35yxQltJYsc+4g0qWc4IhYL/VuGaUpXWIwNJgW27PLDoI8RSYd2Vxk/YHnW8AEaVVBI
         nNGELUeUHXEsh2qZHpLWobfyvR+MQrsARUYMiiDxnK0hJ6gQnVzchXINesCWc3Se5MFd
         kjqp08IVjOmKj/A4HibMK28DcUkd6xOziqVFQRP9YlvgdDIe+Pue5EfJSBXdh+981Ic+
         /37r4jaRJCdU5w428Ln/77v+pQeR7T3EjrZWhMDrhLmb+ktWw+lHOMq+4agDSAsj1O3+
         8xQQ==
X-Gm-Message-State: AOAM532u62PZIbmz6a4gDs+4juOcTxGFYnKfZyDtp4ZI9zJP3mhxc7fP
	ZCWEJ7JeEkzFeDql7QNGwwEPEOhTn2IR0A==
X-Google-Smtp-Source: ABdhPJwx46jBRNNTDUJq8KBLCaKeNoP9oRN58LkjkmqOSN0+6/8Q3SYV10IODt0skzvY3x6sInDo1g==
X-Received: by 2002:a1c:2203:: with SMTP id i3mr4541965wmi.6.1606490358673;
        Fri, 27 Nov 2020 07:19:18 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id n123sm8326596wmn.7.2020.11.27.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 07:19:18 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 2/3] documentation: Simplify yocto_git links
Date: Fri, 27 Nov 2020 15:19:09 +0000
Message-Id: <20201127151910.6397-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127151910.6397-1-pbarker@konsulko.com>
References: <20201127151910.6397-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The yocto_git external link directive is modified to include the
`/cgit/cgit.cgi` element of the URL so that we can simplify the links in
the text.

Manual links to git.yoctoproject.org are converted to use the yocto_git
directive where possible. Note that this directive can't be used in some
places such as example code.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/bsp-guide/bsp.rst               | 21 +++++-----
 documentation/conf.py                         |  2 +-
 .../dev-manual/dev-manual-common-tasks.rst    | 39 +++++++++----------
 documentation/dev-manual/dev-manual-start.rst |  4 +-
 .../kernel-dev/kernel-dev-advanced.rst        |  4 +-
 .../kernel-dev/kernel-dev-maint-appx.rst      |  4 +-
 .../overview-manual-concepts.rst              | 17 ++++----
 ...verview-manual-development-environment.rst |  7 ++--
 .../overview-manual-yp-intro.rst              | 12 +++---
 documentation/ref-manual/migration-1.3.rst    |  2 +-
 documentation/ref-manual/migration-1.6.rst    |  2 +-
 documentation/ref-manual/migration-2.2.rst    |  4 +-
 documentation/ref-manual/migration-2.3.rst    |  2 +-
 documentation/ref-manual/migration-2.5.rst    |  6 +--
 documentation/ref-manual/migration-3.0.rst    |  2 +-
 documentation/ref-manual/ref-classes.rst      |  2 +-
 .../ref-manual/ref-devtool-reference.rst      |  4 +-
 documentation/ref-manual/ref-tasks.rst        |  2 +-
 documentation/ref-manual/ref-terms.rst        |  4 +-
 documentation/ref-manual/ref-variables.rst    |  2 +-
 .../test-manual/test-manual-intro.rst         |  4 +-
 .../test-manual/test-manual-test-process.rst  |  6 +--
 .../toaster-manual-reference.rst              | 15 +++----
 .../toaster-manual-setup-and-use.rst          |  4 +-
 24 files changed, 80 insertions(+), 91 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index d6a4f545c..357e740a5 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -172,8 +172,7 @@ section.
 #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
    based on current Intel CPUs and devices, you can leverage this BSP
    layer. For details on the ``meta-intel`` BSP layer, see the layer's
-   `README <http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/README>`__
-   file.
+   :yocto_git:`README </meta-intel/tree/README>` file.
 
    #. *Navigate to Your Source Directory:* Typically, you set up the
       ``meta-intel`` Git repository inside the :term:`Source Directory` (e.g.
@@ -902,13 +901,13 @@ Yocto Project:
    ``meta-bsp_root_name`` directory. This license covers the BSP
    Metadata as a whole. You must specify which license to use since no
    default license exists when one is not specified. See the
-   :yocto_git:`COPYING.MIT </cgit.cgi/meta-raspberrypi/tree/COPYING.MIT>`
+   :yocto_git:`COPYING.MIT </meta-raspberrypi/tree/COPYING.MIT>`
    file for the Raspberry Pi BSP in the ``meta-raspberrypi`` BSP layer
    as an example.
 
 -  *README File:* You must include a ``README`` file in the
    ``meta-bsp_root_name`` directory. See the
-   :yocto_git:`README.md </cgit.cgi/meta-raspberrypi/tree/README.md>`
+   :yocto_git:`README.md </meta-raspberrypi/tree/README.md>`
    file for the Raspberry Pi BSP in the ``meta-raspberrypi`` BSP layer
    as an example.
 
@@ -1181,16 +1180,16 @@ Use these steps to create a BSP layer:
    :yocto_git:`Source Repositories <>`. To get examples of what you need
    in your configuration file, locate a layer (e.g. "meta-ti") and
    examine the
-   :yocto_git:`local.conf </cgit/cgit.cgi/meta-ti/tree/conf/layer.conf>`
+   :yocto_git:`local.conf </meta-ti/tree/conf/layer.conf>`
    file.
 
 -  *Create a Machine Configuration File:* Create a
    ``conf/machine/bsp_root_name.conf`` file. See
-   :yocto_git:`meta-yocto-bsp/conf/machine </cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine>`
+   :yocto_git:`meta-yocto-bsp/conf/machine </poky/tree/meta-yocto-bsp/conf/machine>`
    for sample ``bsp_root_name.conf`` files. Other samples such as
-   :yocto_git:`meta-ti </cgit/cgit.cgi/meta-ti/tree/conf/machine>`
+   :yocto_git:`meta-ti </meta-ti/tree/conf/machine>`
    and
-   :yocto_git:`meta-freescale </cgit/cgit.cgi/meta-freescale/tree/conf/machine>`
+   :yocto_git:`meta-freescale </meta-freescale/tree/conf/machine>`
    exist from other vendors that have more specific machine and tuning
    examples.
 
@@ -1204,7 +1203,7 @@ Use these steps to create a BSP layer:
 
 The remainder of this section provides a description of the Yocto
 Project reference BSP for Beaglebone, which resides in the
-:yocto_git:`meta-yocto-bsp </cgit/cgit.cgi/poky/tree/meta-yocto-bsp>`
+:yocto_git:`meta-yocto-bsp </poky/tree/meta-yocto-bsp>`
 layer.
 
 BSP Layer Configuration Example
@@ -1413,7 +1412,7 @@ Project Reference Manual.
    .. note::
 
       For more information on how the SPL variables are used, see the
-      :yocto_git:`u-boot.inc </cgit/cgit.cgi/poky/tree/meta/recipes-bsp/u-boot/u-boot.inc>`
+      :yocto_git:`u-boot.inc </poky/tree/meta/recipes-bsp/u-boot/u-boot.inc>`
       include file.
 
 -  :term:`UBOOT_* <UBOOT_ENTRYPOINT>`: Defines
@@ -1457,7 +1456,7 @@ The ``meta-yocto-bsp/recipes-kernel/linux`` directory in the layer contains
 metadata used to build the kernel. In this case, a kernel append file
 (i.e. ``linux-yocto_5.0.bbappend``) is used to override an established
 kernel recipe (i.e. ``linux-yocto_5.0.bb``), which is located in
-:yocto_git:`/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/linux`.
+:yocto_git:`/poky/tree/meta/recipes-kernel/linux`.
 
 Following is the contents of the append file: ::
 
diff --git a/documentation/conf.py b/documentation/conf.py
index c906d066a..a626b1f14 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -75,7 +75,7 @@ extlinks = {
     'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
     'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
     'yocto_docs': ('https://docs.yoctoproject.org%s', None),
-    'yocto_git': ('https://git.yoctoproject.org%s', None),
+    'yocto_git': ('https://git.yoctoproject.org/cgit/cgit.cgi%s', None),
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
     'oe_git': ('https://git.openembedded.org%s', None),
diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 4257a4bb9..891fd9b00 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -75,7 +75,7 @@ Follow these general steps to create your layer without using tools:
    ``conf`` directory and then modify the file as needed.
 
    The ``meta-yocto-bsp/conf/layer.conf`` file in the Yocto Project
-   :yocto_git:`Source Repositories </cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf>`
+   :yocto_git:`Source Repositories </poky/tree/meta-yocto-bsp/conf>`
    demonstrates the required syntax. For your layer, you need to replace
    "yoctobsp" with a unique identifier for your layer (e.g. "machinexyz"
    for a layer named "meta-machinexyz"):
@@ -2107,15 +2107,12 @@ being able to provide the ``virtual/kernel`` item.
 
 Now comes the time to actually build an image and you need a kernel
 recipe, but which one? You can configure your build to call out the
-kernel recipe you want by using the
-:term:`PREFERRED_PROVIDER`
-variable. As an example, consider the
-`x86-base.inc <https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/conf/machine/include/x86-base.inc>`_
-include file, which is a machine (i.e.
-:term:`MACHINE`) configuration file.
-This include file is the reason all x86-based machines use the
-``linux-yocto`` kernel. Here are the relevant lines from the include
-file:
+kernel recipe you want by using the :term:`PREFERRED_PROVIDER` variable. As
+an example, consider the :yocto_git:`x86-base.inc
+</poky/tree/meta/conf/machine/include/x86-base.inc>` include file, which is a
+machine (i.e. :term:`MACHINE`) configuration file. This include file is the
+reason all x86-based machines use the ``linux-yocto`` kernel. Here are the
+relevant lines from the include file:
 ::
 
    PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
@@ -3058,7 +3055,7 @@ The following steps describe how to set up the AUH utility:
 7. *Create and Edit an AUH Configuration File:* You need to have the
    ``upgrade-helper/upgrade-helper.conf`` configuration file in your
    build directory. You can find a sample configuration file in the
-   :yocto_git:`AUH source repository </cgit/cgit.cgi/auto-upgrade-helper/tree/>`.
+   :yocto_git:`AUH source repository </auto-upgrade-helper/tree/>`.
 
    Read through the sample file and make configurations as needed. For
    example, if you enabled build history in your ``local.conf`` as
@@ -3122,7 +3119,7 @@ the layer tree.
 
 You can easily set up to run the AUH utility on a regular basis by using
 a cron job. See the
-:yocto_git:`weeklyjob.sh </cgit/cgit.cgi/auto-upgrade-helper/tree/weeklyjob.sh>`
+:yocto_git:`weeklyjob.sh </auto-upgrade-helper/tree/weeklyjob.sh>`
 file distributed with the utility for an example.
 
 Using ``devtool upgrade``
@@ -4362,9 +4359,9 @@ your tunings to best consider build times and package feed maintenance.
    higher levels noted earlier can be useful. For example, consider how
    NXP (formerly Freescale) allows for the easy reuse of binary packages
    in their layer
-   :yocto_git:`meta-freescale </cgit/cgit.cgi/meta-freescale/>`.
+   :yocto_git:`meta-freescale </meta-freescale/>`.
    In this example, the
-   :yocto_git:`fsl-dynamic-packagearch </cgit/cgit.cgi/meta-freescale/tree/classes/fsl-dynamic-packagearch.bbclass>`
+   :yocto_git:`fsl-dynamic-packagearch </meta-freescale/tree/classes/fsl-dynamic-packagearch.bbclass>`
    class shares GPU packages for i.MX53 boards because all boards share
    the AMD GPU. The i.MX6-based boards can do the same because all
    boards share the Vivante GPU. This class inspects the BitBake
@@ -5564,7 +5561,7 @@ partition.
 Source plugins are subclasses defined in plugin files. As shipped, the
 Yocto Project provides several plugin files. You can see the source
 plugin files that ship with the Yocto Project
-:yocto_git:`here </cgit/cgit.cgi/poky/tree/scripts/lib/wic/plugins/source>`.
+:yocto_git:`here </poky/tree/scripts/lib/wic/plugins/source>`.
 Each of these plugin files contains source plugins that are designed to
 populate a specific Wic image partition.
 
@@ -6175,7 +6172,7 @@ system to make your images more secure:
 -  Consider enabling a Mandatory Access Control (MAC) framework such as
    SMACK or SELinux and tuning it appropriately for your device's usage.
    You can find more information in the
-   :yocto_git:`meta-selinux </cgit/cgit.cgi/meta-selinux/>` layer.
+   :yocto_git:`meta-selinux </meta-selinux/>` layer.
 
 Tools for Hardening Your Image
 ------------------------------
@@ -8436,7 +8433,7 @@ might be significant in human-readable form. Here is an example:
 
 To see changes to the build history using a web interface, follow the
 instruction in the ``README`` file
-:yocto_git:`here </cgit/cgit.cgi/buildhistory-web/>`.
+:yocto_git:`here </buildhistory-web/>`.
 
 Here is a sample screenshot of the interface:
 
@@ -9511,7 +9508,7 @@ the build system to run the task again.
 
    For an example of a commit that makes a cosmetic change to invalidate
    shared state, see this
-   :yocto_git:`commit </cgit.cgi/poky/commit/meta/classes/package.bbclass?id=737f8bbb4f27b4837047cb9b4fbfe01dfde36d54>`.
+   :yocto_git:`commit </poky/commit/meta/classes/package.bbclass?id=737f8bbb4f27b4837047cb9b4fbfe01dfde36d54>`.
 
 Running Specific Tasks
 ----------------------
@@ -10475,7 +10472,7 @@ used testing branches for OpenEmbedded-Core are as follows:
    proposed changes to the core metadata.
 
 -  *poky "master-next" branch:* This branch is part of the
-   :yocto_git:`poky </cgit/cgit.cgi/poky/>` repository and combines proposed
+   :yocto_git:`poky </poky/>` repository and combines proposed
    changes to bitbake, the core metadata and the poky distro.
 
 Similarly, stable branches maintained by the project may have corresponding
@@ -11381,7 +11378,7 @@ this function, you have to follow the following steps:
       SPDX_DEPLOY_DIR = "${DEPLOY_DIR}" //Optional
 
 For more usage information refer to :yocto_git:`the meta-spdxscanner repository
-</cgit/cgit.cgi/meta-spdxscanner/>`.
+</meta-spdxscanner/>`.
 
 
 Copying Licenses that Do Not Exist
@@ -11487,7 +11484,7 @@ Setting Up Your Own Error Reporting Server
 ------------------------------------------
 
 If you want to set up your own error reporting server, you can obtain
-the code from the Git repository at :yocto_git:`/cgit/cgit.cgi/error-report-web/`.
+the code from the Git repository at :yocto_git:`/error-report-web/`.
 Instructions on how to set it up are in the README document.
 
 Using Wayland and Weston
diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
index 86a4619f4..8cbeba5d1 100644
--- a/documentation/dev-manual/dev-manual-start.rst
+++ b/documentation/dev-manual/dev-manual-start.rst
@@ -586,7 +586,7 @@ Working from a copy of the upstream :ref:`dev-manual/dev-manual-start:accessing
 preferred method for obtaining and using a Yocto Project release. You
 can view the Yocto Project Source Repositories at
 :yocto_git:`/`. In particular, you can find the ``poky``
-repository at :yocto_git:`/cgit.cgi/poky`.
+repository at :yocto_git:`/poky`.
 
 Use the following procedure to locate the latest upstream copy of the
 ``poky`` Git repository:
@@ -600,7 +600,7 @@ Use the following procedure to locate the latest upstream copy of the
 
 3. *Find the URL Used to Clone the Repository:* At the bottom of the
    page, note the URL used to clone that repository
-   (e.g. :yocto_git:`/cgit.cgi/poky`).
+   (e.g. :yocto_git:`/poky`).
 
    .. note::
 
diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/kernel-dev-advanced.rst
index 6999057b8..db0a1eb2e 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.rst
+++ b/documentation/kernel-dev/kernel-dev-advanced.rst
@@ -200,7 +200,7 @@ either
 :term:`FILESEXTRAPATHS` if
 you are creating Metadata in `recipe-space <#recipe-space-metadata>`__,
 or the top level of
-:yocto_git:`yocto-kernel-cache </cgit/cgit.cgi/yocto-kernel-cache/tree/>`
+:yocto_git:`yocto-kernel-cache </yocto-kernel-cache/tree/>`
 if you are creating `Metadata outside of the
 recipe-space <#metadata-outside-the-recipe-space>`__.
 
@@ -469,7 +469,7 @@ supported kernel type.
    For BSPs supported by the Yocto Project, the BSP description files
    are located in the ``bsp`` directory of the ``yocto-kernel-cache``
    repository organized under the "Yocto Linux Kernel" heading in the
-   :yocto_git:`Yocto Project Source Repositories </>`.
+   :yocto_git:`Yocto Project Source Repositories <>`.
 
 This section overviews the BSP description structure, the aggregation
 concepts, and presents a detailed example using a BSP supported by the
diff --git a/documentation/kernel-dev/kernel-dev-maint-appx.rst b/documentation/kernel-dev/kernel-dev-maint-appx.rst
index 69f680688..ec1c0ac03 100644
--- a/documentation/kernel-dev/kernel-dev-maint-appx.rst
+++ b/documentation/kernel-dev/kernel-dev-maint-appx.rst
@@ -103,7 +103,7 @@ patch, or BSP:
    located by searching these system directories:
 
    -  The in-tree kernel-cache directories, which are located in the
-      :yocto_git:`yocto-kernel-cache </cgit/cgit.cgi/yocto-kernel-cache/tree/bsp>`
+      :yocto_git:`yocto-kernel-cache </yocto-kernel-cache/tree/bsp>`
       repository organized under the "Yocto Linux Kernel" heading in the
       :yocto_git:`Yocto Project Source Repositories <>`.
 
@@ -167,7 +167,7 @@ specific to some target hardware.
       The end result is a branched, clean history tree that makes up the
       kernel for a given release. You can see the script (``kgit-scc``)
       responsible for this in the
-      :yocto_git:`yocto-kernel-tools </cgit.cgi/yocto-kernel-tools/tree/tools>`
+      :yocto_git:`yocto-kernel-tools </yocto-kernel-tools/tree/tools>`
       repository.
 
    -  The steps used to construct the full kernel tree are the same
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 353a2f99f..1b522910d 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -273,7 +273,7 @@ The ``local.conf`` file provides many basic variables that define a
 build environment. Here is a list of a few. To see the default
 configurations in a ``local.conf`` file created by the build environment
 script, see the
-:yocto_git:`local.conf.sample </cgit/cgit.cgi/poky/tree/meta-poky/conf/local.conf.sample>`
+:yocto_git:`local.conf.sample </poky/tree/meta-poky/conf/local.conf.sample>`
 in the ``meta-poky`` layer:
 
 -  *Target Machine Selection:* Controlled by the
@@ -393,17 +393,17 @@ figure <#general-workflow-figure>`__:
    configurations. This type of information is specific to a particular
    target architecture. A good example of a BSP layer from the `Poky
    Reference Distribution <#gs-reference-distribution-poky>`__ is the
-   :yocto_git:`meta-yocto-bsp </cgit/cgit.cgi/poky/tree/meta-yocto-bsp>`
+   :yocto_git:`meta-yocto-bsp </poky/tree/meta-yocto-bsp>`
    layer.
 
 -  *Policy Configuration:* Distribution Layers (i.e. "Distro Layer" in
    the following figure) providing top-level or general policies for the
    images or SDKs being built for a particular distribution. For
    example, in the Poky Reference Distribution the distro layer is the
-   :yocto_git:`meta-poky </cgit/cgit.cgi/poky/tree/meta-poky>`
+   :yocto_git:`meta-poky </poky/tree/meta-poky>`
    layer. Within the distro layer is a ``conf/distro`` directory that
    contains distro configuration files (e.g.
-   :yocto_git:`poky.conf </cgit/cgit.cgi/poky/tree/meta-poky/conf/distro/poky.conf>`
+   :yocto_git:`poky.conf </poky/tree/meta-poky/conf/distro/poky.conf>`
    that contain many policy configurations for the Poky distribution.
 
 The following figure shows an expanded representation of these three
@@ -427,9 +427,8 @@ Model <#the-yocto-project-layer-model>`__" sections both earlier in this
 manual.
 
 If you explored the previous links, you discovered some areas where many
-layers that work with the Yocto Project exist. The `Source
-Repositories <http://git.yoctoproject.org/>`__ also shows layers
-categorized under "Yocto Metadata Layers."
+layers that work with the Yocto Project exist. The :yocto_git:`Source
+Repositories <>` also shows layers categorized under "Yocto Metadata Layers."
 
 .. note::
 
@@ -879,7 +878,7 @@ This step in the build process consists of the following tasks:
    variables. For information on how this variable works within that
    class, see the
    :ref:`autotools <ref-classes-autotools>` class
-   :yocto_git:`here </cgit/cgit.cgi/poky/tree/meta/classes/autotools.bbclass>`.
+   :yocto_git:`here </poky/tree/meta/classes/autotools.bbclass>`.
 
 -  *do_compile*: Once a configuration task has been satisfied,
    BitBake compiles the source using the
@@ -957,7 +956,7 @@ The :term:`FILES` variable defines the
 files that go into each package in
 :term:`PACKAGES`. If you want
 details on how this is accomplished, you can look at
-:yocto_git:`package.bbclass </cgit/cgit.cgi/poky/tree/meta/classes/package.bbclass>`.
+:yocto_git:`package.bbclass </poky/tree/meta/classes/package.bbclass>`.
 
 Depending on the type of packages being created (RPM, DEB, or IPK), the
 :ref:`do_package_write_* <ref-tasks-package_write_deb>`
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index 983e1919e..5baf08946 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -416,7 +416,7 @@ files. Git uses "branches" to organize different development efforts.
 For example, the ``poky`` repository has several branches that include
 the current "&DISTRO_NAME_NO_CAP;" branch, the "master" branch, and many
 branches for past Yocto Project releases. You can see all the branches
-by going to https://git.yoctoproject.org/cgit.cgi/poky/ and clicking on the
+by going to :yocto_git:`/poky/` and clicking on the
 ``[...]`` link beneath the "Branch" heading.
 
 Each of these branches represents a specific area of development. The
@@ -461,9 +461,8 @@ Yocto Project Release.
 Git uses "tags" to mark specific changes in a repository branch
 structure. Typically, a tag is used to mark a special point such as the
 final change (or commit) before a project is released. You can see the
-tags used with the ``poky`` Git repository by going to
-https://git.yoctoproject.org/cgit.cgi/poky/ and clicking on the ``[...]`` link
-beneath the "Tag" heading.
+tags used with the ``poky`` Git repository by going to :yocto_git:`/poky/`
+and clicking on the ``[...]`` link beneath the "Tag" heading.
 
 Some key tags for the ``poky`` repository are ``jethro-14.0.3``,
 ``morty-16.0.1``, ``pyro-17.0.0``, and
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index 83ed18a37..2b9ea9149 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -267,9 +267,8 @@ with the string ``meta-``.
    , but it is a commonly accepted standard in the Yocto Project
    community.
 
-For example, if you were to examine the `tree
-view <https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/>`__ of the
-``poky`` repository, you will see several layers: ``meta``,
+For example, if you were to examine the :yocto_git:`tree view </poky/tree/>`
+of the ``poky`` repository, you will see several layers: ``meta``,
 ``meta-skeleton``, ``meta-selftest``, ``meta-poky``, and
 ``meta-yocto-bsp``. Each of these repositories represents a distinct
 layer.
@@ -467,7 +466,7 @@ The following list consists of components associated with the
    OpenEmbedded-derived systems, which includes the Yocto Project. The
    Yocto Project and the OpenEmbedded Project both maintain the
    OpenEmbedded-Core. You can find the OE-Core metadata in the Yocto
-   Project :yocto_git:`Source Repositories </cgit/cgit.cgi/poky/tree/meta>`.
+   Project :yocto_git:`Source Repositories </poky/tree/meta>`.
 
    Historically, the Yocto Project integrated the OE-Core metadata
    throughout the Yocto Project source repository reference system
@@ -671,7 +670,7 @@ Poky is a combined repository of BitBake, OpenEmbedded-Core (which is
 found in ``meta``), ``meta-poky``, ``meta-yocto-bsp``, and documentation
 provided all together and known to work well together. You can view
 these items that make up the Poky repository in the
-:yocto_git:`Source Repositories </cgit/cgit.cgi/poky/tree/>`.
+:yocto_git:`Source Repositories </poky/tree/>`.
 
 .. note::
 
@@ -870,8 +869,7 @@ helpful for getting started:
    set of recipes.
 
    You can see the Metadata in the ``meta`` directory of the Yocto
-   Project `Source
-   Repositories <http://git.yoctoproject.org/cgit/cgit.cgi>`__.
+   Project :yocto_git:`Source Repositories <>`.
 
 -  *Packages:* In the context of the Yocto Project, this term refers to
    a recipe's packaged output produced by BitBake (i.e. a "baked
diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/ref-manual/migration-1.3.rst
index 5f975850b..12e225b14 100644
--- a/documentation/ref-manual/migration-1.3.rst
+++ b/documentation/ref-manual/migration-1.3.rst
@@ -173,7 +173,7 @@ the OpenEmbedded community layers such as ``meta-oe`` and
 ``meta-gnome``. For the remainder, you can now find them in the
 ``meta-extras`` repository, which is in the
 :yocto_git:`Source Repositories <>` at
-:yocto_git:`/cgit/cgit.cgi/meta-extras/`.
+:yocto_git:`/meta-extras/`.
 
 .. _1.3-linux-kernel-naming:
 
diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/ref-manual/migration-1.6.rst
index a6c4c8a93..822d5cfa0 100644
--- a/documentation/ref-manual/migration-1.6.rst
+++ b/documentation/ref-manual/migration-1.6.rst
@@ -411,6 +411,6 @@ The previous reference BSPs for the ``beagleboard`` and
 ``routerstationpro`` machines are still available in a new
 ``meta-yocto-bsp-old`` layer in the
 :yocto_git:`Source Repositories <>` at
-:yocto_git:`/cgit/cgit.cgi/meta-yocto-bsp-old/`.
+:yocto_git:`/meta-yocto-bsp-old/`.
 
 
diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
index 8afa8ffdd..ac247dce4 100644
--- a/documentation/ref-manual/migration-2.2.rst
+++ b/documentation/ref-manual/migration-2.2.rst
@@ -292,9 +292,9 @@ The following changes took place for BitBake:
    functionality. These changes will affect external tools that use
    BitBake's tinfoil module. For information on these changes, see the
    changes made to the scripts supplied with OpenEmbedded-Core:
-   `1 <http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=189371f8393971d00bca0fceffd67cc07784f6ee>`__
+   :yocto_git:`1 </poky/commit/?id=189371f8393971d00bca0fceffd67cc07784f6ee>`
    and
-   `2 <http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=4a5aa7ea4d07c2c90a1654b174873abb018acc67>`__.
+   :yocto_git:`2 </poky/commit/?id=4a5aa7ea4d07c2c90a1654b174873abb018acc67>`.
 
 -  The task management code has been rewritten to avoid using ID
    indirection in order to improve performance. This change is unlikely
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index 4041ad055..c0a8f0419 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -323,7 +323,7 @@ The following package management changes took place:
    .. note::
 
       For further details on this change, see the
-      :yocto_git:`commit message </cgit/cgit.cgi/poky/commit/?id=f4d4f99cfbc2396e49c1613a7d237b9e57f06f81>`.
+      :yocto_git:`commit message </poky/commit/?id=f4d4f99cfbc2396e49c1613a7d237b9e57f06f81>`.
 
 .. _migration-2.3-removed-recipes:
 
diff --git a/documentation/ref-manual/migration-2.5.rst b/documentation/ref-manual/migration-2.5.rst
index 1aeddc81c..7f1b80938 100644
--- a/documentation/ref-manual/migration-2.5.rst
+++ b/documentation/ref-manual/migration-2.5.rst
@@ -180,7 +180,7 @@ or ::
 The earlier build-time provides behavior was a quirk of the
 way the Python manifest file was created. For more information on this
 change please see :yocto_git:`this commit
-</cgit/cgit.cgi/poky/commit/?id=8d94b9db221d1def42f091b991903faa2d1651ce>`.
+</poky/commit/?id=8d94b9db221d1def42f091b991903faa2d1651ce>`.
 
 .. _migration-2.5-miscellaneous-changes:
 
@@ -293,8 +293,8 @@ The following are additional changes:
 
 -  Patches whose context does not match exactly (i.e. where patch
    reports "fuzz" when applying) will generate a warning. For an example
-   of this see `this
-   commit <http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=cc97bc08125b63821ce3f616771830f77c456f57>`__.
+   of this see :yocto_git:`this commit
+   </poky/commit/?id=cc97bc08125b63821ce3f616771830f77c456f57>`.
 
 -  Layers are expected to set ``LAYERSERIES_COMPAT_layername`` to match
    the version(s) of OpenEmbedded-Core they are compatible with. This is
diff --git a/documentation/ref-manual/migration-3.0.rst b/documentation/ref-manual/migration-3.0.rst
index 047b75526..7ef2742f8 100644
--- a/documentation/ref-manual/migration-3.0.rst
+++ b/documentation/ref-manual/migration-3.0.rst
@@ -197,7 +197,7 @@ The following BitBake changes have occurred.
 -  The arguments passed to functions used with
    :term:`bitbake:BB_HASHCHECK_FUNCTION`
    have changed. If you are using your own custom hash check function,
-   see :yocto_git:`/cgit/cgit.cgi/poky/commit/?id=40a5e193c4ba45c928fccd899415ea56b5417725`
+   see :yocto_git:`/poky/commit/?id=40a5e193c4ba45c928fccd899415ea56b5417725`
    for details.
 
 -  Task specifications in ``BB_TASKDEPDATA`` and class implementations
diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 62876194d..e0cdbe87f 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -2774,7 +2774,7 @@ To use this class, you need to define a number of variables:
 These variables list alternative commands needed by a package, provide
 pathnames for links, default links for targets, and so forth. For
 details on how to use this class, see the comments in the
-:yocto_git:`update-alternatives.bbclass </cgit/cgit.cgi/poky/tree/meta/classes/update-alternatives.bbclass>`
+:yocto_git:`update-alternatives.bbclass </poky/tree/meta/classes/update-alternatives.bbclass>`
 file.
 
 .. note::
diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
index 93fd1465f..a769b3bd4 100644
--- a/documentation/ref-manual/ref-devtool-reference.rst
+++ b/documentation/ref-manual/ref-devtool-reference.rst
@@ -349,7 +349,7 @@ particular recipe.
 .. note::
 
    -  For the ``oe-core`` layer, recipe maintainers come from the
-      `maintainers.inc <http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc>`_
+      :yocto_git:`maintainers.inc </poky/tree/meta/conf/distro/include/maintainers.inc>`
       file.
 
    -  If the recipe is using the :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:git fetcher (\`\`git://\`\`)`
@@ -388,7 +388,7 @@ satisfied.
    When a reason for not upgrading displays, the reason is usually
    written into the recipe using the ``RECIPE_NO_UPDATE_REASON``
    variable. See the
-   :yocto_git:`base-passwd.bb </cgit/cgit.cgi/poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
+   :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
    recipe for an example.
 
 ::
diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index 299e8f7d6..9fde9a837 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -301,7 +301,7 @@ to locate and apply patch files to the source code.
 Patch files, by default, are ``*.patch`` and ``*.diff`` files created
 and kept in a subdirectory of the directory holding the recipe file. For
 example, consider the
-:yocto_git:`bluez5 </cgit/cgit.cgi/poky/tree/meta/recipes-connectivity/bluez5>`
+:yocto_git:`bluez5 </poky/tree/meta/recipes-connectivity/bluez5>`
 recipe from the OE-Core layer (i.e. ``poky/meta``):
 ::
 
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index b4ceebc0b..f59aaf278 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -218,7 +218,7 @@ universal, the list includes them just in case:
 
       In the context of the kernel ("kernel Metadata"), the term refers to
       the kernel config fragments and features contained in the
-      :yocto_git:`yocto-kernel-cache </cgit/cgit.cgi/yocto-kernel-cache>`
+      :yocto_git:`yocto-kernel-cache </yocto-kernel-cache>`
       Git repository.
 
    :term:`OpenEmbedded-Core (OE-Core)`
@@ -232,7 +232,7 @@ universal, the list includes them just in case:
       core set of recipes.
 
       You can see the Metadata in the ``meta`` directory of the Yocto
-      Project :yocto_git:`Source Repositories </cgit/cgit.cgi/poky>`.
+      Project :yocto_git:`Source Repositories </poky>`.
 
    :term:`OpenEmbedded Build System`
       The build system specific to the Yocto
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 921d19e7f..f8cd5416d 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -3600,7 +3600,7 @@ system and gives an overview of their function and contents.
          configuration file. You cannot set the variable in a recipe file.
 
       See the
-      :yocto_git:`local.conf.sample.extended </cgit/cgit.cgi/poky/tree/meta-poky/conf/local.conf.sample.extended>`
+      :yocto_git:`local.conf.sample.extended </poky/tree/meta-poky/conf/local.conf.sample.extended>`
       file for additional information. Also, for information on creating an
       initramfs, see the ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
diff --git a/documentation/test-manual/test-manual-intro.rst b/documentation/test-manual/test-manual-intro.rst
index cf511e925..b41972084 100644
--- a/documentation/test-manual/test-manual-intro.rst
+++ b/documentation/test-manual/test-manual-intro.rst
@@ -25,14 +25,14 @@ loaded with information from the README files and notes from key
 engineers:
 
 -  *yocto-autobuilder2:* This
-   :yocto_git:`README.md </cgit.cgi/yocto-autobuilder2/tree/README.md>`
+   :yocto_git:`README.md </yocto-autobuilder2/tree/README.md>`
    is the main README which detials how to set up the Yocto Project
    Autobuilder. The ``yocto-autobuilder2`` repository represents the
    Yocto Project's console UI plugin to Buildbot and the configuration
    necessary to configure Buildbot to perform the testing the project
    requires.
 
--  *yocto-autobuilder-helper:* This :yocto_git:`README </cgit.cgi/yocto-autobuilder-helper/tree/README/>`
+-  *yocto-autobuilder-helper:* This :yocto_git:`README </yocto-autobuilder-helper/tree/README/>`
    and repository contains Yocto Project Autobuilder Helper scripts and
    configuration. The ``yocto-autobuilder-helper`` repository contains
    the "glue" logic that defines which tests to run and how to run them.
diff --git a/documentation/test-manual/test-manual-test-process.rst b/documentation/test-manual/test-manual-test-process.rst
index bbf010380..8a5e29d92 100644
--- a/documentation/test-manual/test-manual-test-process.rst
+++ b/documentation/test-manual/test-manual-test-process.rst
@@ -35,9 +35,9 @@ which the result was required.
 The Autobuilder does build the ``master`` branch once daily for several
 reasons, in particular, to ensure the current ``master`` branch does
 build, but also to keep ``yocto-testresults``
-(:yocto_git:`/cgit.cgi/yocto-testresults/`),
+(:yocto_git:`/yocto-testresults/`),
 buildhistory
-(:yocto_git:`/cgit.cgi/poky-buildhistory/`), and
+(:yocto_git:`/poky-buildhistory/`), and
 our sstate up to date. On the weekend, there is a master-next build
 instead to ensure the test results are updated for the less frequently
 run targets.
@@ -45,7 +45,7 @@ run targets.
 Performance builds (buildperf-\* targets in the console) are triggered
 separately every six hours and automatically push their results to the
 buildstats repository at:
-:yocto_git:`/cgit.cgi/yocto-buildstats/`.
+:yocto_git:`/yocto-buildstats/`.
 
 The 'quick' targets have been selected to be the ones which catch the
 most failures or give the most valuable data. We run 'fast' ptests in
diff --git a/documentation/toaster-manual/toaster-manual-reference.rst b/documentation/toaster-manual/toaster-manual-reference.rst
index 2202d599f..ed0bad11b 100644
--- a/documentation/toaster-manual/toaster-manual-reference.rst
+++ b/documentation/toaster-manual/toaster-manual-reference.rst
@@ -25,8 +25,7 @@ A layer index is a web application that contains information about a set
 of custom layers. A good example of an existing layer index is the
 OpenEmbedded Layer Index. A public instance of this layer index exists
 at http://layers.openembedded.org. You can find the code for this
-layer index's web application at
-http://git.yoctoproject.org/cgit/cgit.cgi/layerindex-web/.
+layer index's web application at :yocto_git:`/layerindex-web/`.
 
 When you tie a layer source into Toaster, it can query the layer source
 through a
@@ -83,9 +82,8 @@ index.
 
 In the previous section, the code for the OpenEmbedded Metadata Index
 (i.e. http://layers.openembedded.org) was referenced. You can use
-this code, which is at
-http://git.yoctoproject.org/cgit/cgit.cgi/layerindex-web/, as a
-base to create your own layer index.
+this code, which is at :yocto_git:`/layerindex-web/`, as a base to create
+your own layer index.
 
 Use the Administration Interface
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
@@ -165,14 +163,13 @@ As shipped, Toaster is configured to work with the following releases:
 -  *Yocto Project &DISTRO; "&DISTRO_NAME;" or OpenEmbedded "&DISTRO_NAME;":*
    This release causes your Toaster projects to build against the head
    of the &DISTRO_NAME_NO_CAP; branch at
-   https://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=&DISTRO_NAME_NO_CAP; or
-   http://git.openembedded.org/openembedded-core/commit/?h=&DISTRO_NAME_NO_CAP;.
+   :yocto_git:`/poky/log/?h=&DISTRO_NAME_NO_CAP;` or
+   :oe_git:`/openembedded-core/commit/?h=&DISTRO_NAME_NO_CAP;`.
 
 -  *Yocto Project "Master" or OpenEmbedded "Master":* This release
    causes your Toaster Projects to build against the head of the master
    branch, which is where active development takes place, at
-   https://git.yoctoproject.org/cgit/cgit.cgi/poky/log/ or
-   http://git.openembedded.org/openembedded-core/log/.
+   :yocto_git:`/poky/log/` or :oe_git:`/openembedded-core/log/`.
 
 -  *Local Yocto Project or Local OpenEmbedded:* This release causes your
    Toaster Projects to build against the head of the ``poky`` or
diff --git a/documentation/toaster-manual/toaster-manual-setup-and-use.rst b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
index b73caac37..6e2ba0253 100644
--- a/documentation/toaster-manual/toaster-manual-setup-and-use.rst
+++ b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
@@ -561,8 +561,8 @@ the same clone you are using to run Toaster. Unless you manually update
 this clone, your builds will always use the same Git revision.
 
 If you select any of the other release options, Toaster will fetch the
-tip of your selected release from the upstream `Yocto Project
-repository <https://git.yoctoproject.org>`__ every time you run a build.
+tip of your selected release from the upstream :yocto_git:`Yocto Project
+repository <>` every time you run a build.
 Fetching this tip effectively means that if your selected release is
 updated upstream, the Git revision you are using for your builds will
 change. If you are doing development locally, you might not want this
-- 
2.26.2

