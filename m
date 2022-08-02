Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6B3C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 08:38:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.3790.1659429502090140153
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 01:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pllsXA2Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id m13so12993126wrq.6
        for <docs@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2CM0ZG0qUK1B39xkSZyOzWgBjqOQ6ll0lTZLXxJZ8U=;
        b=pllsXA2Yutw5L85pTG2pcFcItLrfFraTIoS+u9/wL+18xYrTIwekf1KCPjuLUNwFof
         L1SRNg0/TgxsottfTkYyh+9vmUVlU/XcE81le98zX2Bbc1ETYGXL1oGwoxpAuGOfXhdy
         HJnRWFQc0zIFWx9DwHA83AHOar06j0eeCbar/ZRP3waz9Bbs0QpQlnqTEFQ2+wi8yfGN
         tVNBdOya7bAAU016x4ns1vF7PPMs2Dy5NpVfW+9mvOZl3TybTFD/6VaK7H6oOFOIicMJ
         U2BYm47ci9OXOX/m7fDnlpecYIRdstaEJuVxOq5w5FFI9LAhnTgFZjNRmppyHDF/Cm0s
         qfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2CM0ZG0qUK1B39xkSZyOzWgBjqOQ6ll0lTZLXxJZ8U=;
        b=gSrDCuLvIiy3c8lJT5uMBjiM7AH/+1l+XvUV0NiqzL2B7cOziP+sk2z8m4QDQ0mShF
         SMdhYUmrKNk9D12oA37LDMRZZx5z40ToVBhYdX6lXikqIUEMW9DoWng5SDp8fLdhnJ/p
         FJgNTDR3joUQFYUjIaDprT5wxG7hFu2pflIpY465CyeWUmnY4Eud8uzwMVOBLmkj6dPj
         yXGY9wVbGAomjcjLvg/oeUW74Kp46VtStHGGDwaNIdQvhYwsVDjo0TWIEMXuhjID02Oz
         u7T+gVsuT/LodLj2Z4UfnZMGRVayDpkhwo8b28NS7GdBDXx9/hH0A40xUOq/gnq1rOp5
         rGrg==
X-Gm-Message-State: ACgBeo1e2soV9wCDpZkyfiFnjZ51uNACiJB7LBxAeQD3pzePfmrz7AZV
	zuVcX1+TiERoCPrwKv1exsBnhgdheK0=
X-Google-Smtp-Source: 
 AA6agR59uDrq3YK7FZJSo9jErxviKdyfir8AavNtctd0Xa7i5fgSSZaVLcwPdF+SmykqJ43ZaqCyWA==
X-Received: by 2002:adf:fd4f:0:b0:220:60bc:3fc9 with SMTP id
 h15-20020adffd4f000000b0022060bc3fc9mr6454275wrs.398.1659429500206;
        Tue, 02 Aug 2022 01:38:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003a2e1883a27sm28092350wmq.18.2022.08.02.01.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 01:38:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] kernel-dev: working with kernel using devtool does not
 require building and installing eSDK
Date: Tue,  2 Aug 2022 10:38:02 +0200
Message-Id: <20220802083803.2773818-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Aug 2022 08:38:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3101

In fact, all the same tasks can be done directly from a Yocto build. Let's just
drop the steps to produce and install the eSDK - if someone wants it, the SDK
manual covers everything.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/kernel-dev/common.rst | 84 +++++------------------------
 documentation/kernel-dev/intro.rst  |  8 +--
 2 files changed, 16 insertions(+), 76 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index dc3345a52..16ef6453b 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -52,8 +52,8 @@ image and ready to make modifications as described in the
 ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 section:
 
-1. *Initialize the BitBake Environment:* Before building an extensible
-   SDK, you need to initialize the BitBake build environment by sourcing
+1. *Initialize the BitBake Environment:*
+   you need to initialize the BitBake build environment by sourcing
    the build environment script (i.e. :ref:`structure-core-script`)::
 
       $ cd poky
@@ -120,67 +120,10 @@ section:
       NOTE: Starting bitbake server...
       $
 
-5. *Build the Extensible SDK:* Use BitBake to build the extensible SDK
-   specifically for use with images to be run using QEMU::
+5. *Build the Clean Image:* The final step in preparing to work on the
+   kernel is to build an initial image using ``bitbake``::
 
-      $ cd poky/build
-      $ bitbake core-image-minimal -c populate_sdk_ext
-
-   Once
-   the build finishes, you can find the SDK installer file (i.e.
-   ``*.sh`` file) in the following directory::
-
-      poky/build/tmp/deploy/sdk
-
-   For this example, the installer file is named
-   ``poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-&DISTRO;.sh``.
-
-6. *Install the Extensible SDK:* Use the following command to install
-   the SDK. For this example, install the SDK in the default
-   ``poky_sdk`` directory::
-
-      $ cd poky/build/tmp/deploy/sdk
-      $ ./poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-&DISTRO;.sh
-      Poky (Yocto Project Reference Distro) Extensible SDK installer version &DISTRO;
-      ============================================================================
-      Enter target directory for SDK (default: poky_sdk):
-      You are about to install the SDK to "/home/scottrif/poky_sdk". Proceed [Y/n]? Y
-      Extracting SDK......................................done
-      Setting it up...
-      Extracting buildtools...
-      Preparing build system...
-      Parsing recipes: 100% |#################################################################| Time: 0:00:52
-      Initializing tasks: 100% |############## ###############################################| Time: 0:00:04
-      Checking sstate mirror object availability: 100% |######################################| Time: 0:00:00
-      Parsing recipes: 100% |#################################################################| Time: 0:00:33
-      Initializing tasks: 100% |##############################################################| Time: 0:00:00
-      done
-      SDK has been successfully set up and is ready to be used.
-      Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
-       $ . /home/scottrif/poky_sdk/environment-setup-i586-poky-linux
-
-
-7. *Set Up a New Terminal to Work With the Extensible SDK:* You must set
-   up a new terminal to work with the SDK. You cannot use the same
-   BitBake shell used to build the installer.
-
-   After opening a new shell, run the SDK environment setup script as
-   directed by the output from installing the SDK::
-
-      $ source poky_sdk/environment-setup-i586-poky-linux
-      "SDK environment now set up; additionally you may now run devtool to perform development tasks.
-      Run devtool --help for further details.
-
-   .. note::
-
-      If you get a warning about attempting to use the extensible SDK in
-      an environment set up to run BitBake, you did not use a new shell.
-
-8. *Build the Clean Image:* The final step in preparing to work on the
-   kernel is to build an initial image using ``devtool`` in the new
-   terminal you just set up and initialized for SDK work::
-
-      $ devtool build-image
+      $ bitbake core-image-minimal
       Parsing recipes: 100% |##########################################| Time: 0:00:05
       Parsing of 830 .bb files complete (0 cached, 830 parsed). 1299 targets, 47 skipped, 0 masked, 0 errors.
       WARNING: No packages to add, building image core-image-minimal unmodified
@@ -192,7 +135,6 @@ section:
       NOTE: Executing SetScene Tasks
       NOTE: Executing RunQueue Tasks
       NOTE: Tasks Summary: Attempted 2866 tasks of which 2604 didn't need to be rerun and all succeeded.
-      NOTE: Successfully built core-image-minimal. You can find output files in /home/scottrif/poky_sdk/tmp/deploy/images/qemux86
 
    If you were
    building for actual hardware and not for emulation, you could flash
@@ -202,7 +144,7 @@ section:
    Wiki page.
 
 At this point you have set up to start making modifications to the
-kernel by using the extensible SDK. For a continued example, see the
+kernel. For a continued example, see the
 ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 section.
 
@@ -744,7 +686,7 @@ Using ``devtool`` to Patch the Kernel
 =====================================
 
 The steps in this procedure show you how you can patch the kernel using
-the extensible SDK and ``devtool``.
+``devtool``.
 
 .. note::
 
@@ -766,8 +708,7 @@ console. The example is a continuation of the setup procedure found in
 the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Section.
 
 1. *Check Out the Kernel Source Files:* First you must use ``devtool``
-   to checkout the kernel source code in its workspace. Be sure you are
-   in the terminal set up to do work with the extensible SDK.
+   to checkout the kernel source code in its workspace.
 
    .. note::
 
@@ -867,7 +808,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
       the results of your ``printk`` statements as part of the output
       when you scroll down the console window.
 
-6. *Stage and commit your changes*: Within your eSDK terminal, change
+6. *Stage and commit your changes*: Change
    your working directory to where you modified the ``calibrate.c`` file
    and use these Git commands to stage and commit your changes::
 
@@ -878,8 +819,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
 
 7. *Export the Patches and Create an Append File:* To export your
    commits as patches and create a ``.bbappend`` file, use the following
-   command in the terminal used to work with the extensible SDK. This
-   example uses the previously established layer named ``meta-mylayer``.
+   command. This example uses the previously established layer named ``meta-mylayer``.
    ::
 
       $ devtool finish linux-yocto ~/meta-mylayer
@@ -907,8 +847,8 @@ Using Traditional Kernel Development to Patch the Kernel
 ========================================================
 
 The steps in this procedure show you how you can patch the kernel using
-traditional kernel development (i.e. not using ``devtool`` and the
-extensible SDK as described in the
+traditional kernel development (i.e. not using ``devtool``
+as described in the
 ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 section).
 
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index b9ce7f241..4ff4dc7d3 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -114,13 +114,13 @@ general information and references for further information.
    a build host ready to use the Yocto Project.
 
 2. *Set Up Your Host Development System for Kernel Development:* It is
-   recommended that you use ``devtool`` and an extensible SDK for kernel
+   recommended that you use ``devtool`` for kernel
    development. Alternatively, you can use traditional kernel
    development methods with the Yocto Project. Either way, there are
    steps you need to take to get the development environment ready.
 
-   Using ``devtool`` and the eSDK requires that you have a clean build
-   of the image and that you are set up with the appropriate eSDK. For
+   Using ``devtool`` requires that you have a clean build
+   of the image. For
    more information, see the
    ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
    section.
@@ -134,7 +134,7 @@ general information and references for further information.
 3. *Make Changes to the Kernel Source Code if applicable:* Modifying the
    kernel does not always mean directly changing source files. However,
    if you have to do this, you make the changes to the files in the
-   eSDK's Build Directory if you are using ``devtool``. For more
+   Yocto's Build Directory if you are using ``devtool``. For more
    information, see the
    ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
    section.
-- 
2.30.2


