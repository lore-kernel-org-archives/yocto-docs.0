Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.4216.1607031547904264937
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NYOT31Hc;
 spf=pass (domain: linaro.org, ip: 209.85.128.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f50.google.com with SMTP id e25so5350197wme.0
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1CZmFQF3gghFJfkgnWUrHjXZu5wh499Br7F8byDqAyY=;
        b=NYOT31HcS+88qRVwh4IbSaAEL0f2cMWK4rpcVDjmMwYgqFofccGFtewD87Z6PFELmP
         E4XsYYLDOfHWlD9I4YvZm9m41WAKCX9cxjN2tNJB19NCzziK38qjXYbil0PN+LMqlZ9g
         FOTpqhGpVqj2Suw/J7S5SNyBRndb0qBVitt59eZ48hxKaTtU8lwWXgiahJFdZ/6j1epL
         aPU8cc9fkQpiWUX8XAkT/Wzvbu1Ax3PaQpZq3HVHcgrhBC4SVU666eLi1PzO4sJRvNEz
         jYN0f5g9NzRw+CC++avHg4kOZmTSQnzhFXW8HndzFvP4Bemr3IU3+aCcK4nvONPm6jMD
         JMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1CZmFQF3gghFJfkgnWUrHjXZu5wh499Br7F8byDqAyY=;
        b=eVvgCChooUbYC9NW8c3TC+EJqBrl4mjuJ5gSpiVimx7u7dNcNf9PFnHuu2QP5e/GM7
         8vcomt1xuF3ybHejtrWAN7k70eX2ibUiXq8dszAUFYIiTCa9IvkQXGhd88kAiIriUtP+
         ax7fg2+79qksvlrChdaVbWRUvb08OJJPSeQ6YjzYsVEgqf3VhXtNjEnfbkjcwxVE7JSR
         0WFXQAjiX9quNiLzwpUU9zVFScsru/Vuew3gniYEKnppYhhQ+dIwsXxx7jkomRBeeDaC
         1rLC6jfT/2+N1KPQ5dcPKhKUXKTC8RZzOqC/mQfxOzbgQfC2Km8kruT1rpS+NIMOhOXp
         qutw==
X-Gm-Message-State: AOAM530hRgO0KRPItjJhYF9X3IkOcbhwSv6RXNQMc8Bub6FZ7dZpD4lm
	sNUvSUdyk12QxjaxyzIA7oW8+rV25TratARm
X-Google-Smtp-Source: ABdhPJzv2vToFFxcCs97Za4Lm5Dtm8ag6LOEZFAxAy5O8ev6SIlR984EAyRQT7/adudrNRkKAxmkQQ==
X-Received: by 2002:a7b:c406:: with SMTP id k6mr832154wmi.90.1607031545272;
        Thu, 03 Dec 2020 13:39:05 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:39:04 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 09/10] sdk-manual: remove 'sdk' from filenames
Date: Thu,  3 Dec 2020 22:38:42 +0100
Message-Id: <20201203213843.347671-10-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
References: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All filenames duplicate the 'manual name', which is not needed, and
make all references longer than they should. Rename all files to be as
consise as possible, and fix all references

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/dev-manual/common-tasks.rst     |  8 ++++----
 documentation/dev-manual/qemu.rst             |  4 ++--
 documentation/dev-manual/start.rst            |  6 +++---
 documentation/kernel-dev/common.rst           |  2 +-
 documentation/kernel-dev/intro.rst            |  2 +-
 documentation/overview-manual/concepts.rst    |  8 ++++----
 documentation/overview-manual/yp-intro.rst    |  2 +-
 documentation/ref-manual/migration-2.1.rst    |  6 +++---
 documentation/ref-manual/ref-classes.rst      |  4 ++--
 .../ref-manual/ref-devtool-reference.rst      |  4 ++--
 documentation/ref-manual/ref-features.rst     |  2 +-
 documentation/ref-manual/ref-structure.rst    |  2 +-
 documentation/ref-manual/ref-variables.rst    | 20 +++++++++----------
 ....rst => appendix-customizing-standard.rst} |  0
 ...stomizing.rst => appendix-customizing.rst} |  0
 ...ppendix-obtain.rst => appendix-obtain.rst} |  2 +-
 .../{sdk-extensible.rst => extensible.rst}    |  0
 documentation/sdk-manual/index.rst            | 14 ++++++-------
 .../sdk-manual/{sdk-intro.rst => intro.rst}   |  0
 .../sdk-manual/{sdk-using.rst => using.rst}   |  0
 ...king-projects.rst => working-projects.rst} |  2 +-
 .../transitioning-to-a-custom-environment.rst |  2 +-
 documentation/what-i-wish-id-known.rst        |  6 +++---
 23 files changed, 48 insertions(+), 48 deletions(-)
 rename documentation/sdk-manual/{sdk-appendix-customizing-standard.rst => appendix-customizing-standard.rst} (100%)
 rename documentation/sdk-manual/{sdk-appendix-customizing.rst => appendix-customizing.rst} (100%)
 rename documentation/sdk-manual/{sdk-appendix-obtain.rst => appendix-obtain.rst} (99%)
 rename documentation/sdk-manual/{sdk-extensible.rst => extensible.rst} (100%)
 rename documentation/sdk-manual/{sdk-intro.rst => intro.rst} (100%)
 rename documentation/sdk-manual/{sdk-using.rst => using.rst} (100%)
 rename documentation/sdk-manual/{sdk-working-projects.rst => working-projects.rst} (99%)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index abeb1ed9c..6c4220dd5 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -1119,7 +1119,7 @@ necessary when adding a recipe to build a new piece of software to be
 included in a build.
 
 You can find a complete description of the ``devtool add`` command in
-the ":ref:`sdk-manual/sdk-extensible:a closer look at \`\`devtool add\`\``" section
+the ":ref:`sdk-manual/extensible:a closer look at \`\`devtool add\`\``" section
 in the Yocto Project Application Development and the Extensible Software
 Development Kit (eSDK) manual.
 
@@ -3129,7 +3129,7 @@ As mentioned earlier, an alternative method for upgrading recipes to
 newer versions is to use
 :doc:`devtool upgrade </ref-manual/ref-devtool-reference>`.
 You can read about ``devtool upgrade`` in general in the
-":ref:`sdk-manual/sdk-extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
+":ref:`sdk-manual/extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) Manual.
 
@@ -3413,7 +3413,7 @@ form of a patch all using Quilt.
 
    With regard to preserving changes to source files, if you clean a
    recipe or have ``rm_work`` enabled, the
-   :ref:`devtool workflow <sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow>`
+   :ref:`devtool workflow <sdk-manual/extensible:using \`\`devtool\`\` in your sdk workflow>`
    as described in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual is a safer
    development flow than the flow that uses Quilt.
@@ -3647,7 +3647,7 @@ build host running Linux.
       :doc:`/toaster-manual/index`.
 
    -  For information on how to use ``devtool`` to build images, see the
-      ":ref:`sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow`"
+      ":ref:`sdk-manual/extensible:using \`\`devtool\`\` in your sdk workflow`"
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 4e58fc1b6..766691b97 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -46,7 +46,7 @@ available. Follow these general steps to run QEMU:
 
 1. *Install QEMU:* QEMU is made available with the Yocto Project a
    number of ways. One method is to install a Software Development Kit
-   (SDK). See ":ref:`sdk-manual/sdk-intro:the qemu emulator`" section in the
+   (SDK). See ":ref:`sdk-manual/intro:the qemu emulator`" section in the
    Yocto Project Application Development and the Extensible Software
    Development Kit (eSDK) manual for information on how to install QEMU.
 
@@ -81,7 +81,7 @@ available. Follow these general steps to run QEMU:
       pre-built image that matches your architecture and can be run on
       QEMU.
 
-   See the ":ref:`sdk-manual/sdk-appendix-obtain:extracting the root filesystem`"
+   See the ":ref:`sdk-manual/appendix-obtain:extracting the root filesystem`"
    section in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual for information on
    how to extract a root filesystem.
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index a26d2a3ea..6fad4c9b4 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -342,7 +342,7 @@ using a given development path on your native Linux machine. If you are
 going to use BitBake, see the
 ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
 section. If you are going
-to use the Extensible SDK, see the ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
+to use the Extensible SDK, see the ":doc:`/sdk-manual/extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`/kernel-dev/index`. If you are going to use
 Toaster, see the ":doc:`/toaster-manual/setup-and-use`"
@@ -442,7 +442,7 @@ as if you were running on a native Linux machine. If you are going to
 use the Poky container, see the
 ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
 section. If you are going to use the Extensible SDK container, see the
-":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
+":doc:`/sdk-manual/extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
 the ":doc:`/toaster-manual/setup-and-use`"
@@ -557,7 +557,7 @@ your Yocto Project build host:
 
 Once you have WSLv2 set up, everything is in place to develop just as if
 you were running on a native Linux machine. If you are going to use the
-Extensible SDK container, see the ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
+Extensible SDK container, see the ":doc:`/sdk-manual/extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
 the ":doc:`/toaster-manual/setup-and-use`"
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 67f8777c4..6691da448 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -39,7 +39,7 @@ Source Directory.
    sections in the Yocto Project Development Tasks Manual for more information.
 
 Kernel development is best accomplished using
-:ref:`devtool <sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow>`
+:ref:`devtool <sdk-manual/extensible:using \`\`devtool\`\` in your sdk workflow>`
 and not through traditional kernel workflow methods. The remainder of
 this section provides information for both scenarios.
 
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index 2b60616df..c95d2f7cb 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -84,7 +84,7 @@ understand the following documentation:
 -  :doc:`/overview-manual/index`.
 
 -  :ref:`devtool
-   workflow <sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow>`
+   workflow <sdk-manual/extensible:using \`\`devtool\`\` in your sdk workflow>`
    as described in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 8aa86c06e..019ead85c 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -830,7 +830,7 @@ processes patches, see the
 ":ref:`dev-manual/common-tasks:patching code`"
 section in the
 Yocto Project Development Tasks Manual. You can also see the
-":ref:`sdk-manual/sdk-extensible:use \`\`devtool modify\`\` to modify the source of an existing component`"
+":ref:`sdk-manual/extensible:use \`\`devtool modify\`\` to modify the source of an existing component`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (SDK) manual and the
 ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
@@ -1112,7 +1112,7 @@ the extensible SDK (eSDK):
    see the ":ref:`overview-manual/concepts:cross-development toolchain generation`"
    section. For information on advantages gained when building a
    cross-development toolchain using the do_populate_sdk task, see the
-   ":ref:`sdk-manual/sdk-appendix-obtain:building an sdk installer`" section in
+   ":ref:`sdk-manual/appendix-obtain:building an sdk installer`" section in
    the Yocto Project Application Development and the Extensible Software
    Development Kit (eSDK) manual.
 
@@ -1443,7 +1443,7 @@ Cross-Development Toolchain Generation
 ======================================
 
 The Yocto Project does most of the work for you when it comes to
-creating :ref:`sdk-manual/sdk-intro:the cross-development toolchain`. This
+creating :ref:`sdk-manual/intro:the cross-development toolchain`. This
 section provides some technical background on how cross-development
 toolchains are created and used. For more information on toolchains, you
 can also see the :doc:`/sdk-manual/index` manual.
@@ -1573,7 +1573,7 @@ Here is the bootstrap process for the relocatable toolchain:
 
    For information on advantages gained when building a
    cross-development toolchain installer, see the
-   ":ref:`sdk-manual/sdk-appendix-obtain:building an sdk installer`" appendix
+   ":ref:`sdk-manual/appendix-obtain:building an sdk installer`" appendix
    in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual.
 
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 3afbb9378..c66b4b5da 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -327,7 +327,7 @@ applications using the Yocto Project:
    You can read about the ``devtool`` workflow in the Yocto Project
    Application Development and Extensible Software Development Kit
    (eSDK) Manual in the 
-   ":ref:`sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow`"
+   ":ref:`sdk-manual/extensible:using \`\`devtool\`\` in your sdk workflow`"
    section.
 
 -  *Extensible Software Development Kit (eSDK):* The eSDK provides a
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index 678a767e1..a1d7b9a2d 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -231,8 +231,8 @@ ADT Removed
 
 The Application Development Toolkit (ADT) has been removed because its
 functionality almost completely overlapped with the :ref:`standard
-SDK <sdk-manual/sdk-using:using the standard sdk>` and the
-:ref:`extensible SDK <sdk-manual/sdk-extensible:using the extensible sdk>`. For
+SDK <sdk-manual/using:using the standard sdk>` and the
+:ref:`extensible SDK <sdk-manual/extensible:using the extensible sdk>`. For
 information on these SDKs and how to build and use them, see the
 :doc:`/sdk-manual/index` manual.
 
@@ -386,7 +386,7 @@ These additional changes exist:
    removed at runtime).
 
 -  The
-   :ref:`devtool modify <sdk-manual/sdk-extensible:use \`\`devtool modify\`\` to modify the source of an existing component>`
+   :ref:`devtool modify <sdk-manual/extensible:use \`\`devtool modify\`\` to modify the source of an existing component>`
    command now defaults to extracting the source since that is most
    commonly expected. The "-x" or "--extract" options are now no-ops. If
    you wish to provide your own existing source tree, you will now need
diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 900341e5a..37ab4992e 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -1986,7 +1986,7 @@ files.
 The ``populate_sdk`` class provides support for SDK-only recipes. For
 information on advantages gained when building a cross-development
 toolchain using the :ref:`ref-tasks-populate_sdk`
-task, see the ":ref:`sdk-manual/sdk-appendix-obtain:building an sdk installer`"
+task, see the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual.
 
@@ -2044,7 +2044,7 @@ section in the Yocto Project Overview and Concepts Manual. For
 information on advantages gained when building a cross-development
 toolchain using the :ref:`ref-tasks-populate_sdk`
 task, see the
-":ref:`sdk-manual/sdk-appendix-obtain:building an sdk installer`"
+":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual.
 
diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
index 11b4cb5d5..2b97bb460 100644
--- a/documentation/ref-manual/ref-devtool-reference.rst
+++ b/documentation/ref-manual/ref-devtool-reference.rst
@@ -11,7 +11,7 @@ is a key part of the extensible SDK.
 
 This chapter provides a Quick Reference for the ``devtool`` command. For
 more information on how to apply the command when using the extensible
-SDK, see the ":doc:`/sdk-manual/sdk-extensible`" chapter in the Yocto
+SDK, see the ":doc:`/sdk-manual/extensible`" chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual.
 
@@ -438,7 +438,7 @@ revision to which you want to upgrade (i.e. the
 forth.
 
 You can read more on the ``devtool upgrade`` workflow in the
-":ref:`sdk-manual/sdk-extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
+":ref:`sdk-manual/extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual. You can also see an example of
 how to use ``devtool upgrade`` in the ":ref:`dev-manual/common-tasks:using \`\`devtool upgrade\`\``"
diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
index cb4b57436..89c06eb65 100644
--- a/documentation/ref-manual/ref-features.rst
+++ b/documentation/ref-manual/ref-features.rst
@@ -118,7 +118,7 @@ metadata:
 -  *api-documentation:* Enables generation of API documentation during
    recipe builds. The resulting documentation is added to SDK tarballs
    when the ``bitbake -c populate_sdk`` command is used. See the
-   ":ref:`sdk-manual/sdk-appendix-customizing-standard:adding api documentation to the standard sdk`"
+   ":ref:`sdk-manual/appendix-customizing-standard:adding api documentation to the standard sdk`"
    section in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual.
 
diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index 606a77c7f..ab9075b9c 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
@@ -477,7 +477,7 @@ the kernel files:
 The OpenEmbedded build system creates this directory to hold toolchain
 installer scripts which, when executed, install the sysroot that matches
 your target hardware. You can find out more about these installers in
-the ":ref:`sdk-manual/sdk-appendix-obtain:building an sdk installer`"
+the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual.
 
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index a8a949b92..865d17c1f 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -6542,7 +6542,7 @@ system and gives an overview of their function and contents.
 
       For additional information on how to customize the extensible SDK's
       configuration, see the
-      ":ref:`sdk-manual/sdk-appendix-customizing:configuring the extensible sdk`"
+      ":ref:`sdk-manual/appendix-customizing:configuring the extensible sdk`"
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
@@ -6568,7 +6568,7 @@ system and gives an overview of their function and contents.
 
       For additional information on how to customize the extensible SDK's
       configuration, see the
-      ":ref:`sdk-manual/sdk-appendix-customizing:configuring the extensible sdk`"
+      ":ref:`sdk-manual/appendix-customizing:configuring the extensible sdk`"
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
@@ -6587,7 +6587,7 @@ system and gives an overview of their function and contents.
 
       For additional information on how to customize the extensible SDK's
       configuration, see the
-      ":ref:`sdk-manual/sdk-appendix-customizing:configuring the extensible sdk`"
+      ":ref:`sdk-manual/appendix-customizing:configuring the extensible sdk`"
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
@@ -6710,7 +6710,7 @@ system and gives an overview of their function and contents.
       ``SDK_TITLE`` is set to "Poky (Yocto Project Reference Distro)".
 
       For information on how to change this default title, see the
-      ":ref:`sdk-manual/sdk-appendix-customizing:changing the extensible sdk installer title`"
+      ":ref:`sdk-manual/appendix-customizing:changing the extensible sdk installer title`"
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
@@ -6748,7 +6748,7 @@ system and gives an overview of their function and contents.
       default distribution "poky", the ``SDKEXTPATH`` is set to "poky_sdk".
 
       For information on how to change this default directory, see the
-      ":ref:`sdk-manual/sdk-appendix-customizing:changing the default sdk installation directory`"
+      ":ref:`sdk-manual/appendix-customizing:changing the default sdk installation directory`"
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
@@ -7314,7 +7314,7 @@ system and gives an overview of their function and contents.
 
       For information on how staging for recipe-specific sysroots occurs,
       see the :ref:`ref-tasks-populate_sysroot`
-      task, the ":ref:`sdk-manual/sdk-extensible:sharing files between recipes`"
+      task, the ":ref:`sdk-manual/extensible:sharing files between recipes`"
       section in the Yocto Project Development Tasks Manual, the
       ":ref:`overview-manual/concepts:configuration, compilation, and staging`"
       section in the Yocto Project Overview and Concepts Manual, and the
@@ -8145,13 +8145,13 @@ system and gives an overview of their function and contents.
       In this case, a default list of packages is
       set in this variable, but you can add additional packages to the
       list. See the
-      ":ref:`sdk-manual/sdk-appendix-customizing-standard:adding individual packages to the standard sdk`" section
+      ":ref:`sdk-manual/appendix-customizing-standard:adding individual packages to the standard sdk`" section
       in the Yocto Project Application Development and the Extensible
       Software Development Kit (eSDK) manual for more information.
 
       For background information on cross-development toolchains in the
       Yocto Project development environment, see the
-      ":ref:`sdk-manual/sdk-intro:the cross-development toolchain`"
+      ":ref:`sdk-manual/intro:the cross-development toolchain`"
       section in the Yocto Project Overview and Concepts Manual. For
       information on setting up a cross-development environment, see the
       :doc:`/sdk-manual/index` manual.
@@ -8175,13 +8175,13 @@ system and gives an overview of their function and contents.
       target hardware), which includes libraries and headers. Use this
       variable to add individual packages to the part of the SDK that runs
       on the target. See the
-      ":ref:`sdk-manual/sdk-appendix-customizing-standard:adding individual packages to the standard sdk`" section
+      ":ref:`sdk-manual/appendix-customizing-standard:adding individual packages to the standard sdk`" section
       in the Yocto Project Application Development and the Extensible
       Software Development Kit (eSDK) manual for more information.
 
       For background information on cross-development toolchains in the
       Yocto Project development environment, see the
-      ":ref:`sdk-manual/sdk-intro:the cross-development toolchain`"
+      ":ref:`sdk-manual/intro:the cross-development toolchain`"
       section in the Yocto Project Overview and Concepts Manual. For
       information on setting up a cross-development environment, see the
       :doc:`/sdk-manual/index` manual.
diff --git a/documentation/sdk-manual/sdk-appendix-customizing-standard.rst b/documentation/sdk-manual/appendix-customizing-standard.rst
similarity index 100%
rename from documentation/sdk-manual/sdk-appendix-customizing-standard.rst
rename to documentation/sdk-manual/appendix-customizing-standard.rst
diff --git a/documentation/sdk-manual/sdk-appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
similarity index 100%
rename from documentation/sdk-manual/sdk-appendix-customizing.rst
rename to documentation/sdk-manual/appendix-customizing.rst
diff --git a/documentation/sdk-manual/sdk-appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
similarity index 99%
rename from documentation/sdk-manual/sdk-appendix-obtain.rst
rename to documentation/sdk-manual/appendix-obtain.rst
index 8d4fe0964..cdfe2cc85 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -246,7 +246,7 @@ Follow these steps to extract the root filesystem:
    installed the toolchain (e.g. ``poky_sdk``).
 
    Following is an example based on the toolchain installed in the
-   ":ref:`sdk-manual/sdk-appendix-obtain:locating pre-built sdk installers`" section:
+   ":ref:`sdk-manual/appendix-obtain:locating pre-built sdk installers`" section:
    ::
 
       $ source ~/poky_sdk/environment-setup-core2-64-poky-linux
diff --git a/documentation/sdk-manual/sdk-extensible.rst b/documentation/sdk-manual/extensible.rst
similarity index 100%
rename from documentation/sdk-manual/sdk-extensible.rst
rename to documentation/sdk-manual/extensible.rst
diff --git a/documentation/sdk-manual/index.rst b/documentation/sdk-manual/index.rst
index 177826edf..fce2b199c 100644
--- a/documentation/sdk-manual/index.rst
+++ b/documentation/sdk-manual/index.rst
@@ -10,13 +10,13 @@ Yocto Project Application Development and the Extensible Software Development Ki
    :caption: Table of Contents
    :numbered:
 
-   sdk-intro
-   sdk-extensible
-   sdk-using
-   sdk-working-projects
-   sdk-appendix-obtain
-   sdk-appendix-customizing
-   sdk-appendix-customizing-standard
+   intro
+   extensible
+   using
+   working-projects
+   appendix-obtain
+   appendix-customizing
+   appendix-customizing-standard
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/sdk-manual/sdk-intro.rst b/documentation/sdk-manual/intro.rst
similarity index 100%
rename from documentation/sdk-manual/sdk-intro.rst
rename to documentation/sdk-manual/intro.rst
diff --git a/documentation/sdk-manual/sdk-using.rst b/documentation/sdk-manual/using.rst
similarity index 100%
rename from documentation/sdk-manual/sdk-using.rst
rename to documentation/sdk-manual/using.rst
diff --git a/documentation/sdk-manual/sdk-working-projects.rst b/documentation/sdk-manual/working-projects.rst
similarity index 99%
rename from documentation/sdk-manual/sdk-working-projects.rst
rename to documentation/sdk-manual/working-projects.rst
index 4f9764032..3e40936ff 100644
--- a/documentation/sdk-manual/sdk-working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -10,7 +10,7 @@ projects.
 Autotools-Based Projects
 ========================
 
-Once you have a suitable :ref:`sdk-manual/sdk-intro:the cross-development toolchain`
+Once you have a suitable :ref:`sdk-manual/intro:the cross-development toolchain`
 installed, it is very easy to develop a project using the `GNU
 Autotools-based <https://en.wikipedia.org/wiki/GNU_Build_System>`__
 workflow, which is outside of the :term:`OpenEmbedded Build System`.
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 997f599f5..415f295b3 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -90,7 +90,7 @@ Transitioning to a custom environment for systems development
 
 #. **Build your image and refine it**.
    Add what's missing and fix anything that's broken using your knowledge of the
-   :ref:`workflow <sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk
+   :ref:`workflow <sdk-manual/extensible:using \`\`devtool\`\` in your sdk
    workflow>` to identify where issues might be occurring.
 
 #. **Consider creating your own distribution**.
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index a8902c0be..a051036bb 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -135,7 +135,7 @@ contact us with other suggestions.
    valuable links: :ref:`dev-manual/common-tasks:Using a Development
    Shell` for information on how to build and run a specific task using
    devshell. Also, the :ref:`SDK manual shows how to build out a specific recipe
-   <sdk-manual/sdk-extensible:use \`\`devtool modify\`\` to modify the source of an existing component>`.
+   <sdk-manual/extensible:use \`\`devtool modify\`\` to modify the source of an existing component>`.
 
 #. **An ambiguous definition: Package vs Recipe:**
    A recipe contains instructions the build system uses to create
@@ -195,9 +195,9 @@ contact us with other suggestions.
    * **Look Through the Yocto Project Application Development and the Extensible
      Software Development Kit (eSDK) manual**: This manual describes how to use
      both the standard SDK and the extensible SDK, which are used primarily for
-     application development. The :doc:`/sdk-manual/sdk-extensible` also provides
+     application development. The :doc:`/sdk-manual/extensible` also provides
      example workflows that use devtool. See the section
-     :ref:`sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow`
+     :ref:`sdk-manual/extensible:using \`\`devtool\`\` in your sdk workflow`
      for more information.
 
    * **Learn About Kernel Development**: If you want to see how to work with the
-- 
2.29.2

