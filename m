Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB124C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 22:30:38 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.11.1698964235766749375
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 15:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HoFFDavH;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9dbb3d12aefso177830066b.0
        for <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 15:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698964234; x=1699569034; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iVw/TeDroDuX04sD56lTs6lzK8typmovVDwwWI6M4o=;
        b=HoFFDavHE2eNlt7MXJ+bEBviq9CVX/sUo9piZ3VZRZLXXK+UnfHZ7sKViWYMf1ghMV
         EFSJD3Dit6klx9M2+2Q+UZqyYEcPSbs0zrA7kiKDT6lV/VnLSQFvFX51iYcNT3VvJZsF
         xtYcX8oSbcsJdlNCu1wUWcG6qYcu4HTb3nA3bTO+nwNieXgazfZhUxv8DcH6I0vXfYOw
         QCaFmWAMD4wxM8e7zoNtST8EbuZ02mymdW4kokeVjgQOGzqAxYHFVAWQjPHKsJaFSENO
         dST71iqOREkCnY235o7fesH0JeqpShq/nHO8EUfQgCPTLZdM4iyT3YgCTZKI3RExBQW2
         qSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698964234; x=1699569034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iVw/TeDroDuX04sD56lTs6lzK8typmovVDwwWI6M4o=;
        b=sJdzXRxMRH00RtP7M2FIjeghErqZBPq/eLGJ1EElVn/VsWIA/2M+AQcHCqCIm56lJV
         4Zne6Ok6cjedusti3dk8Hkqc+qwo2KSH2WHHfGcryKHA+c4GwXlX929syktujcWlSYGl
         xDDdxpqZ+VAxFbal4f4B6vLHEdUa/RlNnui+CJqeu9qn6qfFLGq3kRckfgKUj40iOsYH
         sj+1B+l2Eax56miKUeVfbVrpyOc/yvNgdyUAIJ5081WwHqJyWlkM1+ndllP8+iNOnNBA
         Yu4cg7PoRb1w0ZnQxLS24w66H3ZYfc/2isQKGFW+SNb7P8W8Sh3tXuLqpzvfj7P9fUmL
         ZicA==
X-Gm-Message-State: AOJu0YwHyEHt7daLydhoiNY3e795CpSIzXyuoS5SOoA9tKlfblJC44mR
	HpSW5swMUBGRL5b6UDYO1Ze1BH042mSYEQ==
X-Google-Smtp-Source: AGHT+IH7N76GuojWmA4tuSd7/FC+lCwjVbKJgGe9oIaXMETWNNjm+rxq8NlCrfJWM41wbVPHYypcBQ==
X-Received: by 2002:a17:907:3203:b0:9bf:4915:22ca with SMTP id xg3-20020a170907320300b009bf491522camr5122356ejb.45.1698964233505;
        Thu, 02 Nov 2023 15:30:33 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id kq20-20020a170906abd400b009c5c5c2c59csm207472ejb.149.2023.11.02.15.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 15:30:33 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v8] docs: cover devtool ide
Date: Thu,  2 Nov 2023 23:29:33 +0100
Message-ID: <20231102222933.2758532-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 22:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4578

Cover the new devtool ide plugin in the extensible sdk section.

Many thanks to Enguerrand de Ribaucourt for his re-view and
contributions.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 121 +++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 355c6cb0e4a..21eff792a27 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -63,6 +63,8 @@ their own pros and cons:
    need to provide a well-functioning binary artefact cache over the network
    for developers with underpowered laptops.
 
+.. _setting_up_ext_sdk_in_build:
+
 Setting up the Extensible SDK environment directly in a Yocto build
 -------------------------------------------------------------------
 
@@ -230,13 +232,15 @@ all the commands.
    See the ":doc:`/ref-manual/devtool-reference`"
    section in the Yocto Project Reference Manual.
 
-Three ``devtool`` subcommands provide entry-points into development:
+``devtool`` subcommands provide entry-points into development:
 
 -  *devtool add*: Assists in adding new software to be built.
 
 -  *devtool modify*: Sets up an environment to enable you to modify
    the source of an existing component.
 
+-  *devtool ide*: Generates a configuration for an IDE.
+
 -  *devtool upgrade*: Updates an existing recipe so that you can
    build it for an updated set of source files.
 
@@ -614,6 +618,121 @@ command:
       decide you do not want to proceed with your work. If you do use this
       command, realize that the source tree is preserved.
 
+Use ``devtool ide`` to generate a configuration for the IDE
+-----------------------------------------------------------
+
+``devtool ide`` automatically configures IDEs for cross-compiling and remote debugging.
+To make sure that all parts of the eSDK required by the generated IDE configuration are
+available, ``devtool ide`` uses bitbake in the background to bootstrap the SDK.
+
+#. *Recipe mode*: Generate the IDE configuration for a workspace created by ``devtool modify``.
+
+   In order to use the tool, a few settings must be made.
+   As a starting example, the following lines of code can be added to the ``local.conf`` file::
+
+      # Build the companion debug file system
+      IMAGE_GEN_DEBUGFS = "1"
+      # Optimize build time: with devtool ide the dbg tar is not needed
+      IMAGE_FSTYPES_DEBUGFS = ""
+
+      # ssh is mandatory, no password simplifies the usage
+      EXTRA_IMAGE_FEATURES += "\
+         ssh-server-openssh \
+         debug-tweaks \
+      "
+
+      # Remote debugging needs the gdbserver on the target device
+      IMAGE_INSTALL:append = " gdbserver"
+
+   Assuming the development environment is set up correctly and a workspace has been created
+   for the recipe using ``devtool modify recipe``, the following command can create the
+   SDK and the configuration for VSCode in the recipe workspace::
+
+      $ devtool ide recipe core-image-minimal --target root@192.168.7.2
+
+   The command requires an image recipe that is used to create the SDK.
+   This firmware image should also be installed on the target device.
+   It is possible to pass multiple package recipes.
+   ``devtool ide`` tries to create an IDE configuration for all package recipes.
+
+   Exactly what this command does depends on the recipe respectively on the build tool used by
+   the recipe. The basic idea is to configure the IDE so that it calls the build tool exactly
+   as ``bitbake`` does.
+
+   For example, a CMake preset is created for a recipe that inherits :ref:`ref-classes-cmake`.
+   In the case of VSCode, CMake presets are supported by the CMake Tools plugin.
+   This is an example of how the build configuration used by ``bitbake`` is exported to an IDE
+   configuration that gives exactly the same build results.
+
+   Support for remote debugging with seamless integration into the IDE is important for a cross-SDK.
+   ``devtool ide`` automatically generates the necessary helper scripts for deploying the compiled
+   artifacts to the target device as well as the necessary configuration for the debugger and the IDE.
+
+   .. note::
+
+      To ensure that the debug symbols on the build machine match the binaries running on the target device,
+      it is essential that the image built by ``devtool ide`` is running on the target device.
+
+   ``devtool ide`` aims to support multiple programming languages and multiple IDEs natively.
+   Native means that the IDE is configured to call the build tool (e.g. CMake or Meson) directly.
+   This has several advantages. First of all, it is much faster than ``devtool build``, for example.
+   But it also allows to use the very good integration of tools like CMake or GDB directly with VSCode or other IDEs.
+   However, supporting many programming languages and multiple IDEs is quite an elaborate and constantly evolving thing.
+   To handle combinations that are not natively supported, ``devtool ide`` creates a configuration that falls back
+   to ``devtool build`` and ``devtool deploy-target`` if there is no native support available.
+
+   The default IDE is VSCode. Some hints about using VSCode:
+
+   - To work with CMake press ``Ctrl + Shift + p``, type ``cmake``.
+     This will show some possible commands like selecting a CMake preset, compiling or running CTest.
+     Cross-compiled unit tests are executed transparently with qemu-user.
+
+   - To work with Meson press ``Ctrl + Shift + p``, type ``meson``.
+     This will show some possible commands like compiling or executing the unit tests.
+
+   - For the deployment to the target device, just press ``Ctrl + Shift + p``, type ``task``.
+     Select the ``install & deploy task``.
+
+   - For remote debugging, switch to the debugging view by pressing the "play" button with the ``bug icon`` on the left side.
+     This will provide a green play button with a drop-down list where a debug configuration can be selected.
+     After selecting one of the generated configurations, press the "play" button.
+
+     Starting a remote debugging sesssion automatically initiates the deployment to the target device.
+     If this is not desired, the ``"dependsOn": ["install && deploy-target...]`` parameter of the tasks
+     with ``"label": "gdbserver start...`` can be removed from the ``tasks.json`` file.
+
+   Additionally ``--ide=none`` is supported.
+   With the none IDE parameter some generic configurations files like ``.gdbinit`` files and some helper scripts
+   starting the gdbserver remotely on the target device as well as the gdb client on the host are generated.
+
+#. *Shared sysroots mode*: Generate the IDE configuration for using a cross-toolchain as provided by
+   ``bitbake meta-ide-support build-sysroots``.
+
+   For some special recipes and use cases a per-recipe sysroot based SDK is not suitable.
+   Therefore ``devtool ide`` also supports setting up the shared sysroots environment and generating
+   IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot
+   are for example ``meta-ide-support`` or ``shared-sysroots``.
+   Also passing ``none`` as a recipe name leads to a shared sysroot SDK::
+
+      $ devtool ide none core-image-minimal
+
+   For VSCode the cross-tool-chain is exposed as a CMake kit. CMake kits are defined in
+   ``~/.local/share/CMakeTools/cmake-tools-kits.json``.
+   The following example shows how the cross-toolchain can be selected in VSCode.
+   Fist of all we create a CMake project and start VSCode::
+
+      mkdir kit-test
+      echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
+      code kit-test
+
+   If there is a CMake project in the workspace cross-compilation is supported:
+
+   - Press ``Ctrl + Shift + P``, type ``CMake: Scan for Kits``
+   - Press ``Ctrl + Shift + P``, type ``CMake: Select a Kit``
+
+   For other IDEs than VSCode ``devtool ide none ...`` is just a simple wrapper for the
+   setup of the extensible SDK as described in :ref:`setting_up_ext_sdk_in_build`.
+
 Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
 -------------------------------------------------------------------------------------------------------
 
-- 
2.41.0


