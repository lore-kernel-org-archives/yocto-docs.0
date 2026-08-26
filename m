Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F03C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:21 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3403.1787708117293531127
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e7WNjn/3;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92f03daaa97so21852285a.2
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708116; x=1788312916; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8tiEudje76MWH4u4545z/gdOUxrvHhOkO2l6SJNQQZI=;
        b=e7WNjn/3oc5E5nhRV5qXsiZfToFQZzSFhhmsfh/Erbmfu+3qD17rD4PZ0iyYE4ZPMw
         wUzNVlT5B2UfeH3bkDDrmQNaaBx5RVWS7IGM866TqDv5J8YLjUwbiGzCM+xQO3p+RZTX
         fcQNuuYoxgyM5I1c9ZgfdYLTX9h/XKCxXmPxT8lNc3UhaW+BW7ICZUIxp0lftTKvpnAF
         u0v3S76216EgrsTjvnKvZJOVa6R1kkJgDYgQgJcYFbS3oGs6lUrY1/uFOIbMQPzQzgvq
         No18+D8LutwCXIGvVqxjFA6yhFik8HSvMI5DMnPhrH6ZG60kGF4bUmZ0suuIJrlePNy4
         GxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708116; x=1788312916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8tiEudje76MWH4u4545z/gdOUxrvHhOkO2l6SJNQQZI=;
        b=UV3TqWQHpJRaxzWMekG+rKsrzY1utrmL5tRM4sh95XjsLaw9IxLzxxFS/zpnOrhkO4
         PEu/4qFERneqUcNexqyyLnUMlRRe+Z8fWT23ndDhcgNapMcHfgmZKR3iA8/h0D7lF41p
         Ae4PKDB0eOZr4iR3/HkE72xNnbMQp6IwFyUXE+jZgRKDG4DbUu82lLuPP0yHxyObDHCB
         f+F05IkDg3PfG5EGKar9/5Bp++yk65VvlIQdRZlJwT56Y8uymfATb+WXBbIDe3LxsKyE
         G4lCqDIjF+9c1u+YL9gwfl2n9FzvbGapPQW8YrqAqwgrbuPYZ+G4KJrPCVPH+LihaxXt
         6KHA==
X-Gm-Message-State: AFuF++mOFR0fLpJUb+P+ci4774PzAz4zMiDW+V4pUsJuyzo2AH4bA9P9
	2rbI1i6crmfustCTHR0NVbeAduaGlY6egBwhlMpntdn1+Lu2NI4nCELcDXw5Tj2S
X-Gm-Gg: AR+sD13+ljFNy9B0NPHqHZSM3xXhzQeSDAtRRcLZiSnCQzep82j1aH6OxDr6ehcML43
	xeyyS8kECMOLRKm+Z1iXaH8mXdAe3Of5aLxIrl4Q9zxl7R+MvRsP6CpBypB1BZ49GDBQCWVM7lB
	aNyTfQpbOfZjaQ+dEoOgJXthI2xfHJQScskGoVJ0iPfRF6JXQn3imbGduP5JFLjA5Iy0dbPhnl9
	Lm68+9/mC3vZg/0HO3TZDIZDDoBz3aij8qdKTOXYZky4klA7PZ7lxqo5Ni70s15dpGb8Udy0+c2
	pEqofKPSfGToWtQEB4V80gxnRGDmJXhK42aUuUbLyk2S6F2gieb6Q8uSIFbErb3e+ancMnu5a2E
	x9UDjXho0dUYaKg81M4hJ7W2zTBT8sOCnbQ0ZKYu6FDe6cEFXizx+EXf0ObNrecaqbYW8uH0lal
	+IeKW44GCS08KzF6j5qSPEgYqqiMA7/zuwFQkeh0OVg/vFLvq06TjOtK1BsR+Ow1skghOf1zH+X
	To2niv3pC4rtpaKRb70qvtDBJbi48v8+hnZeE4GDQ==
X-Received: by 2002:a05:620a:2702:b0:934:ab73:ac53 with SMTP id af79cd13be357-9377fe450a4mr311824985a.0.1787708115888;
        Tue, 25 Aug 2026 18:35:15 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.14
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 05/10] kernel-dev: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:50 -0400
Message-ID: <20260826013502.2674000-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10350

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 41 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/kernel-dev/advanced.rst | 48 +++++++++++----
 documentation/kernel-dev/common.rst   | 88 ++++++++++++++++++++-------
 documentation/kernel-dev/faq.rst      |  8 ++-
 3 files changed, 108 insertions(+), 36 deletions(-)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index b36bea67ccd2..644fa2bd0a3d 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -66,7 +66,9 @@ to indicate the branch.
 .. note::
 
    You can use the :term:`KBRANCH` value to define an alternate branch typically
-   with a machine override as shown here from the ``meta-yocto-bsp`` layer::
+   with a machine override as shown here from the ``meta-yocto-bsp`` layer:
+
+   .. code-block:: bitbake
 
       KBRANCH:beaglebone-yocto = "standard/beaglebone"
 
@@ -103,13 +105,17 @@ You can use the
 variable to include features (configuration fragments, patches, or both)
 that are not already included by the :term:`KMACHINE` and
 :term:`LINUX_KERNEL_TYPE` variable combination. For example, to include a
-feature specified as "features/netfilter/netfilter.scc", specify::
+feature specified as "features/netfilter/netfilter.scc", specify:
+
+.. code-block:: bitbake
 
    KERNEL_FEATURES += "features/netfilter/netfilter.scc"
 
 To include a
 feature called "cfg/sound.scc" just for the ``qemux86`` machine,
-specify::
+specify:
+
+.. code-block:: bitbake
 
    KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc"
 
@@ -359,13 +365,17 @@ variable in the kernel recipe selects the kernel type. For example, in the
 ``linux-yocto_4.12.bb`` kernel recipe found in ``meta/recipes-kernel/linux``, a
 :ref:`require <bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>`
 directive includes the ``meta/recipes-kernel/linux/linux-yocto.inc`` file,
-which has the following statement that defines the default kernel type::
+which has the following statement that defines the default kernel type:
+
+.. code-block:: bitbake
 
    LINUX_KERNEL_TYPE ??= "standard"
 
 Another example would be the real-time kernel (i.e.
 ``linux-yocto-rt_4.12.bb``). This kernel recipe directly sets the kernel
-type as follows::
+type as follows:
+
+.. code-block:: bitbake
 
    LINUX_KERNEL_TYPE = "preempt-rt"
 
@@ -514,7 +524,9 @@ description file match.
 
 To separate your kernel policy from your hardware configuration, you
 include a kernel type (``ktype``), such as "standard". In the previous
-example, this is done using the following::
+example, this is done using the following:
+
+.. code-block:: bitbake
 
    include ktypes/standard/standard.scc
 
@@ -524,11 +536,15 @@ policy. See the ":ref:`kernel-dev/advanced:kernel types`" section for more
 information.
 
 To aggregate common configurations and features specific to the kernel
-for `mybsp`, use the following::
+for `mybsp`, use the following:
+
+.. code-block:: bitbake
 
    include mybsp.scc
 
-You can see that in the BeagleBone example with the following::
+You can see that in the BeagleBone example with the following:
+
+.. code-block:: bitbake
 
    include beaglebone.scc
 
@@ -713,7 +729,9 @@ value when changing the content of files not explicitly listed in the
 
 If the BSP description is in recipe space, you cannot simply list the
 ``*.scc`` in the :term:`SRC_URI` statement. You need to use the following
-form from your kernel append file::
+form from your kernel append file:
+
+.. code-block:: bitbake
 
    SRC_URI:append:myplatform = " \
        file://myplatform;type=kmeta;destsuffix=myplatform \
@@ -739,7 +757,9 @@ reside in a separate repository. The OpenEmbedded build system adds the
 Metadata to the build as a "type=kmeta" repository through the
 :term:`SRC_URI` variable. As an
 example, consider the following :term:`SRC_URI` statement from the
-``linux-yocto_5.15.bb`` kernel recipe::
+``linux-yocto_5.15.bb`` kernel recipe:
+
+.. code-block:: bitbake
 
    SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
               git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
@@ -784,7 +804,9 @@ This is why a recipe-space BSP description must be delivered as a
 :term:`SRC_URI` (see the
 ":ref:`kernel-dev/advanced:recipe-space metadata`" section). To have your
 description discovered, place it in a ``type=kmeta`` directory and set
-:term:`KMACHINE` so the tools locate it::
+:term:`KMACHINE` so the tools locate it:
+
+.. code-block:: bitbake
 
    KMACHINE:myplatform ?= "myplatform"
 
@@ -868,7 +890,9 @@ patches into a feature.
 
 Once you have a new branch, you can set up your kernel Metadata to use
 the branch a couple different ways. In the recipe, you can specify the
-new branch as the :term:`KBRANCH` to use for the board as follows::
+new branch as the :term:`KBRANCH` to use for the board as follows:
+
+.. code-block:: bitbake
 
    KBRANCH = "mynewbranch"
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 948718433440..8b80a4afde59 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -60,7 +60,9 @@ section:
 
    In this example we wish to build for qemux86 so we must set the
    :term:`MACHINE` variable to "qemux86" and also add the "kernel-modules".
-   As described we do this by appending to ``conf/local.conf``::
+   As described we do this by appending to ``conf/local.conf``:
+
+   .. code-block:: bitbake
 
       MACHINE = "qemux86"
       MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
@@ -156,7 +158,9 @@ section:
 
    In this example we wish to build for qemux86 so we must set the
    :term:`MACHINE` variable to "qemux86" and also add the "kernel-modules".
-   As described we do this by appending to ``conf/local.conf``::
+   As described we do this by appending to ``conf/local.conf``:
+
+   .. code-block:: bitbake
 
       MACHINE = "qemux86"
       MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
@@ -302,7 +306,9 @@ home directory:
    ``meta-mylayer/recipes-kernel/linux`` directory and create the
    kernel's append file. This example uses the ``linux-yocto-4.12``
    kernel. Thus, the name of the append file is
-   ``linux-yocto_4.12.bbappend``::
+   ``linux-yocto_4.12.bbappend``:
+
+   .. code-block:: bitbake
 
       FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
@@ -354,7 +360,9 @@ The append file should initially extend the
 :term:`FILESPATH` search path by
 prepending the directory that contains your files to the
 :term:`FILESEXTRAPATHS`
-variable as follows::
+variable as follows:
+
+.. code-block:: bitbake
 
    FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
@@ -380,7 +388,9 @@ As an example, consider the following append file used by the BSPs in
 
 Here are the contents of this file. Be aware that the actual commit ID
 strings in this example listing might be different than the actual
-strings in the file from the ``meta-yocto-bsp`` layer upstream::
+strings in the file from the ``meta-yocto-bsp`` layer upstream:
+
+.. code-block:: bitbake
 
   KBRANCH:genericx86  = "v6.1/standard/base"
   KBRANCH:genericx86-64  = "v6.1/standard/base"
@@ -436,7 +446,9 @@ For example, suppose you had some configuration options in a file called
 ``network_configs.cfg``. You can place that file inside a directory
 named ``linux-yocto`` and then add a :term:`SRC_URI` statement such as the
 following to the append file. When the OpenEmbedded build system builds
-the kernel, the configuration options are picked up and applied::
+the kernel, the configuration options are picked up and applied:
+
+.. code-block:: bitbake
 
    SRC_URI += "file://network_configs.cfg"
 
@@ -444,7 +456,9 @@ To group related configurations into multiple files, you perform a
 similar procedure. Here is an example that groups separate
 configurations specifically for Ethernet and graphics into their own
 files and adds the configurations by using a :term:`SRC_URI` statement like
-the following in your append file::
+the following in your append file:
+
+.. code-block:: bitbake
 
    SRC_URI += "file://myconfig.cfg \
                file://eth.cfg \
@@ -488,7 +502,9 @@ reference them in :term:`SRC_URI`
 statements.
 
 For example, you can apply a three-patch series by adding the following
-lines to your linux-yocto ``.bbappend`` file in your layer::
+lines to your linux-yocto ``.bbappend`` file in your layer:
+
+.. code-block:: bitbake
 
    SRC_URI += "file://0001-first-change.patch"
    SRC_URI += "file://0002-second-change.patch"
@@ -518,7 +534,9 @@ If you have a complete, working Linux kernel ``.config`` file you want
 to use for the configuration, as before, copy that file to the
 appropriate ``${PN}`` directory in your layer's ``recipes-kernel/linux``
 directory, and rename the copied file to "defconfig". Then, add the
-following lines to the linux-yocto ``.bbappend`` file in your layer::
+following lines to the linux-yocto ``.bbappend`` file in your layer:
+
+.. code-block:: bitbake
 
    FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://defconfig"
@@ -535,7 +553,9 @@ You can also use a regular ``defconfig`` file, as generated by the
 task instead of a complete ``.config`` file. This only specifies the
 non-default configuration values.  You need to additionally set
 :term:`KCONFIG_MODE`
-in the linux-yocto ``.bbappend`` file in your layer::
+in the linux-yocto ``.bbappend`` file in your layer:
+
+.. code-block:: bitbake
 
    KCONFIG_MODE = "alldefconfig"
 
@@ -565,7 +585,9 @@ with the following content (without indentation)::
 
 Next, include this
 configuration fragment and extend the :term:`FILESPATH` variable in your
-``.bbappend`` file::
+``.bbappend`` file:
+
+.. code-block:: bitbake
 
    FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://8250.cfg"
@@ -584,7 +606,9 @@ It might be desirable to have kernel configuration fragment support
 through a ``defconfig`` file that is pulled from the kernel source tree
 for the configured machine. By default, the OpenEmbedded build system
 looks for ``defconfig`` files in the layer used for Metadata, which is
-"out-of-tree", and then configures them using the following::
+"out-of-tree", and then configures them using the following:
+
+.. code-block:: bitbake
 
    SRC_URI += "file://defconfig"
 
@@ -604,7 +628,9 @@ form::
 Here is an example that assigns the :term:`KBUILD_DEFCONFIG` variable utilizing
 an override for the "raspberrypi2" :term:`MACHINE` and provides the path to the
 "in-tree" ``defconfig`` file to be used for a Raspberry Pi 2, which is based on
-the Broadcom 2708/2709 chipset::
+the Broadcom 2708/2709 chipset:
+
+.. code-block:: bitbake
 
    KBUILD_DEFCONFIG:raspberrypi2 ?= "bcm2709_defconfig"
 
@@ -841,7 +867,9 @@ Section.
 
       $ cd bitbake-builds/build/conf
 
-   Add the following to the ``local.conf``::
+   Add the following to the ``local.conf``:
+
+   .. code-block:: bitbake
 
       SRC_URI:pn-linux-yocto = "git:///path-to/linux-yocto-4.12;protocol=file;name=machine;branch=standard/base; \
                                 git:///path-to/yocto-kernel-cache;protocol=file;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
@@ -912,7 +940,9 @@ Section.
    the OpenEmbedded build system to find the patch. The append file
    needs to be in your layer's ``recipes-kernel/linux`` directory and it
    must be named ``linux-yocto_4.12.bbappend`` and have the following
-   contents::
+   contents:
+
+   .. code-block:: bitbake
 
       FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
       SRC_URI += "file://0001-calibrate.c-Added-some-printk-statements.patch"
@@ -1087,7 +1117,9 @@ your layer's ``recipes-kernel/linux`` directory, and rename the copied
 file to "defconfig" (e.g.
 ``~/meta-mylayer/recipes-kernel/linux/linux-yocto/defconfig``). Then,
 add the following lines to the linux-yocto ``.bbappend`` file in your
-layer::
+layer:
+
+.. code-block:: bitbake
 
    FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://defconfig"
@@ -1197,7 +1229,9 @@ options in a file called ``myconfig.cfg``. If you put that file inside a
 directory named ``linux-yocto`` that resides in the same directory as
 the kernel's append file within your layer and then add the following
 statements to the kernel's append file, those configuration options will
-be picked up and applied when the kernel is built::
+be picked up and applied when the kernel is built:
+
+.. code-block:: bitbake
 
    FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://myconfig.cfg"
@@ -1206,7 +1240,9 @@ As mentioned earlier, you can group related configurations into multiple
 files and name them all in the :term:`SRC_URI` statement as well. For
 example, you could group separate configurations specifically for
 Ethernet and graphics into their own files and add those by using a
-:term:`SRC_URI` statement like the following in your append file::
+:term:`SRC_URI` statement like the following in your append file:
+
+.. code-block:: bitbake
 
    SRC_URI += "file://myconfig.cfg \
                file://eth.cfg \
@@ -1510,7 +1546,9 @@ Here are some basic steps you can use to work with your own sources:
       triggers an explicit build failure. You must change it to match a
       list of the machines that your new recipe supports. For example,
       to support the ``qemux86`` and ``qemux86-64`` machines, use the
-      following form::
+      following form:
+
+      .. code-block:: bitbake
 
          COMPATIBLE_MACHINE = "qemux86|qemux86-64"
 
@@ -1622,7 +1660,9 @@ them appropriately for your machine configuration file:
 -  :term:`MACHINE_EXTRA_RRECOMMENDS`
 
 Modules are often not required for boot and can be excluded from certain
-build configurations. The following allows for the most flexibility::
+build configurations. The following allows for the most flexibility:
+
+.. code-block:: bitbake
 
    MACHINE_EXTRA_RRECOMMENDS += "kernel-module-mymodule"
 
@@ -1769,7 +1809,9 @@ build.
    a similarly named configuration fragment file ``test.cfg``.
 
 #. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
-   recipe's :term:`SRC_URI` statement::
+   recipe's :term:`SRC_URI` statement:
+
+   .. code-block:: bitbake
 
       SRC_URI += "file://test.scc"
 
@@ -1778,7 +1820,9 @@ build.
 
 #. *Specify the Feature as a Kernel Feature:* Use the
    :term:`KERNEL_FEATURES` statement to specify the feature as a kernel
-   feature::
+   feature:
+
+   .. code-block:: bitbake
 
       KERNEL_FEATURES += "test.scc"
 
diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index 4dffa90dbd03..a5cd09dcfbaa 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -57,7 +57,9 @@ These other variables are useful for installing specific modules:
 
 For example, set the following in the ``qemux86.conf`` file to include
 the ``ab123`` kernel modules with images built for the ``qemux86``
-machine::
+machine:
+
+.. code-block:: bitbake
 
    MACHINE_EXTRA_RRECOMMENDS += "kernel-module-ab123"
 
@@ -70,7 +72,9 @@ How do I change the Linux kernel command line?
 The Linux kernel command line is
 typically specified in the machine config using the :term:`APPEND` variable.
 For example, you can add some helpful debug information doing the
-following::
+following:
+
+.. code-block:: bitbake
 
    APPEND += "printk.time=y initcall_debug debug"
 

