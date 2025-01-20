Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CEBC02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 07:16:30 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.32162.1737357389196980526
 for <docs@lists.yoctoproject.org>;
 Sun, 19 Jan 2025 23:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bj1sloFI;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3309791f8f.1
        for <docs@lists.yoctoproject.org>; Sun, 19 Jan 2025 23:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737357387; x=1737962187; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QnxCXgpdC0poz84+vU4pWlMCcJf2csB9qjgiJ5j4RAE=;
        b=Bj1sloFIHK7s36lUZ+7iOcYSEj15JSF9hsNlfgDX3ZZZjxNyBFMi8MtaDQlE47fly5
         MjohWx42x5FAvCEiLH5X0B/GdZzPj8abDjs7I4RvBp+M4hzWIiaQEXxHn2XUwJSC5ya5
         TgXJgHmP1hjL20mCKWm+VWuZZjb/w5rRWqLHzU/97QZ1amvF0YK9WCsjp9ZXEniM7l3s
         gEfW+Mn33GOiihjWVtEIwzZ7/Jrjti2xibu9PlrVwEtnJYCzl2QCeKcr+eFdiYgrJUle
         /rObp/8L8LbFFWrSCp0cTYuPRvwtDhMMefGHq7KJlZaPbaHv4NMuuauuAuaTTuXnYLTW
         T2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737357387; x=1737962187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnxCXgpdC0poz84+vU4pWlMCcJf2csB9qjgiJ5j4RAE=;
        b=tG7/r/q3++yAxyPI/xGmLk1DIab4ZptPNueO6QXbWOsFPGsVcmzVUXw3So/Sbk9aek
         j63Ep8YefEzdiqLfpoC9jfc6nYPW0CZyAqJCFLawkttqwVN0h5QYVRoyEMsrTW2yDYQc
         SeucuQUlC/18qtl/KdJhoOZNqgbMGH5iXAt5PqT0w3hLdZvV2/9AtYiSofawN9eBCeZV
         kDNIuHSUJSOhPAoljrKH4ehHs7C3aYvxV/1E2bOqyOaPI06eIcRncYiUcPdF0FgGJcQ0
         3Y5pkIZOXhMzy4X8RNKAG3bn4eEKTzW29cbiEcm9ix/xTWRWKDOIi68Vfx6eGzHGYzWM
         rpGA==
X-Gm-Message-State: AOJu0Yyv84mccrbmkSa1G45oM17Tk+JtBDvrVsuW0Vy6cVgn+BH4POTo
	QycLGxdcLAv5PbEXIisJZStZXC0RsyXphLtmyOr2g3YXLHLBesehW/MZAQ==
X-Gm-Gg: ASbGncuXNCiFypUErsgQ4WiJFB//4ZKp5LrX4cHZ61jfSUuInP/dW/xdsLx5FmpbYYA
	AE/09toB53vFK7kZd2Ps/L8fsJYEyG6sougEU4So/HLgSBH+xS+NTw7DNFFkVz7ozP5bAgKtTfr
	l7s5h5bY2rzKCXufz+ELLTdv6nCR8GOYTkK1Sfx+i3I6ZDO9NSpkiDuselezuOUXH+EQv2ITb/d
	TWIEWNE4j/uczUL4wIELKJ3Dm2t7Byn5X9aeFjCGTgTLnorHqeb0BInV3DxueudvyFxYAA9Y8vP
	fBvdw4iP2LjD/Mon
X-Google-Smtp-Source: AGHT+IHbiNPPolv+iPlkLtMRWaOteBERAHTSwZxwFTqg0EWgEw4lvVhnXljmg98JjpUwu56e6R62yQ==
X-Received: by 2002:a05:6000:1788:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38bf56633damr11233166f8f.16.1737357386649;
        Sun, 19 Jan 2025 23:16:26 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e118sm9322727f8f.82.2025.01.19.23.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 23:16:26 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3] sdk-manual: extensible.rst: devtool ide-sdk improve
Date: Mon, 20 Jan 2025 08:16:19 +0100
Message-ID: <20250120071619.2005696-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jan 2025 07:16:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6146

The devtool ide-sdk section is reformulated to be independent of the
eSDK installer. In fact, ide-sdk does not even support the execution
of an installer-based setup.
This reformulation is also a preparation for moving the devtool
documentation to a dedicated devtool section which is independent from
the eSDK documentation.
It should be clarified that devtool ide-sdk starts the SDK directly
from the bitbake environment. It is therefore an alternative to
bitbake -c populate_sdk_ext and installing an SDK installer.

A warning is added that explains some workarounds for some nasty
behavior of VSCode when running it in a bitbake environment.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
Cc: Antonin Godard <antonin.godard@bootlin.com>
---
v3: findings from https://lists.yoctoproject.org/g/docs/message/6144
---
 documentation/sdk-manual/extensible.rst | 210 +++++++++++++++++-------
 1 file changed, 151 insertions(+), 59 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 1cb1bb47c2c..8483951bef9 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -178,7 +178,7 @@ Running the Extensible SDK Environment Setup Script
 Once you have the SDK installed, you must run the SDK environment setup
 script before you can actually use the SDK.
 
-When using a SDK directly in a Yocto build, you will find the script in
+When using an SDK directly in a Yocto build, you will find the script in
 ``tmp/deploy/images/qemux86-64/`` in your :term:`Build Directory`.
 
 When using a standalone SDK installer, this setup script resides in
@@ -622,28 +622,91 @@ command:
       decide you do not want to proceed with your work. If you do use this
       command, realize that the source tree is preserved.
 
-``devtool ide-sdk`` configures IDEs for the extensible SDK
-----------------------------------------------------------
+``devtool ide-sdk`` configures IDEs and bootstraps SDKs
+-------------------------------------------------------
 
-``devtool ide-sdk`` automatically configures IDEs to use the extensible SDK.
-To make sure that all parts of the extensible SDK required by the generated
-IDE configuration are available, ``devtool ide-sdk`` uses BitBake in the
-background to bootstrap the extensible SDK.
+The ``devtool ide-sdk`` command can provide an IDE configuration for IDEs when
+working on the source code of one or more recipes.
+Depending on the programming language, and the build system used by the recipe,
+the tools required for cross-development and remote debugging are different.
+For example:
 
-The extensible SDK supports two different development modes.
-``devtool ide-sdk`` supports both of them:
+-  A C/C++ project usually uses CMake or Meson.
 
-#. *Modified mode*:
+-  A Python project uses setuptools or one of its successors.
+
+-  A Rust project uses Cargo.
+
+Also, the IDE plugins needed for the integration of a build system with the
+IDE and the corresponding settings are usually specific to these build-systems.
+To hide all these details from the user, ``devtool ide-sdk`` does two things:
+
+-  It generates any kind of SDK needed for cross-development and remote
+   debugging of the specified recipes.
+
+-  It generates the configuration for the IDE (and the IDE plugins) for using
+   the cross-toolchain and remote debugging tools provided by the SDK directly
+   from the IDE.
+
+For supported build systems the configurations generated by ``devtool ide-sdk``
+combine the advantages of the ``devtool modify`` based workflow
+(see :ref:`using_devtool`) with the advantages of the simple Environment Setup
+script based workflow (see :ref:`running_the_ext_sdk_env`) provided by Yocto's
+SDK or eSDK:
+
+-  The source code of the recipe is in the workspace created by
+   ``devtool modify`` or ``devtool add``.
+   Using ``devtool build``, ``devtool build-image``,
+   ``devtool deploy-target`` or ``bitbake`` is possible.
+   Also ``devtool ide-sdk`` can be used to update the SDK and the IDE
+   configuration at any time.
 
-   By default ``devtool ide-sdk`` generates IDE configurations for recipes in
-   workspaces created by ``devtool modify`` or ``devtool add`` as described in
-   :ref:`using_devtool`.  This mode creates IDE configurations with support for
-   advanced features, such as deploying the binaries to the remote target
-   device and performing remote debugging sessions. The generated IDE
-   configurations use the per recipe sysroots as Bitbake does internally.
+-  ``devtool ide-sdk`` aims to support multiple programming languages and
+   multiple IDEs natively. "Natively" means that the IDE is configured to call
+   the build tool (e.g. ``cmake`` or ``meson``) directly. This has several
+   advantages.
+   First of all, it is usually much faster to call for example ``cmake`` than
+   ``devtool build``.
+   It also allows to benefit from the very good integration that IDEs like
+   VSCode offer for tools like CMake or GDB.
+   
+   However, supporting many programming languages and multiple
+   IDEs is quite an elaborate and constantly evolving thing. Support for IDEs
+   is therefore implemented as plugins. Plugins can also be provided by
+   optional layers.
 
-   In order to use the tool, a few settings are needed. As a starting example,
-   the following lines of code can be added to the ``local.conf`` file::
+So much about the introduction to the default mode of ``devtool sdk-ide`` which
+is called the "modified" mode because it uses the workspace created by
+``devtool modify`` and the per recipe :term:`Sysroots <Sysroot>` of BitBake.
+
+For some recipes and use cases, this default behavior of ``devtool ide-sdk``
+with full ``devtool`` and ``bitbake`` integration might not be suitable.
+To offer full feature parity with the SDK and the eSDK, ``devtool ide-sdk`` has
+a second mode called "shared" mode.
+If ``devtool ide-sdk`` is called with the ``--mode=shared`` option, it
+bootstraps an SDK directly from the BitBake environment, which offers the same
+Environment Setup script as described in :ref:`running_the_ext_sdk_env`.
+In addition to the (e)SDK installer-based setup, the IDE gets configured
+to use the shared :term:`Sysroots <Sysroot>` and the tools from the SDK.
+``devtool ide-sdk --mode=shared`` is basically a wrapper for the setup of the
+extensible SDK as described in :ref:`setting_up_ext_sdk_in_build`.
+
+The use of ``devtool ide-sdk`` is an alternative to using one of the SDK
+installers.
+``devtool ide-sdk`` allows the creation of SDKs that offer all the
+functionality of the SDK and the eSDK installers. Compared to the installers,
+however, the SDK created with ``devtool ide-sdk`` is much more flexible.
+For example, it is very easy to change the :term:`MACHINE` in the
+``local.conf`` file, update the layer meta data and then regenerate the SDK.
+
+Let's take a look at an example of how to use ``devtool ide-sdk`` in each of
+the two modes:
+
+#. *Modified mode*:
+
+   In order to use the ``devtool ide-sdk``, a few settings are needed. As a
+   starting example, the following lines of code can be added to the
+   ``local.conf`` file::
 
       # Build the companion debug file system
       IMAGE_GEN_DEBUGFS = "1"
@@ -675,9 +738,13 @@ The extensible SDK supports two different development modes.
 
       $ devtool ide-sdk my-recipe core-image-minimal --target root@192.168.7.2
 
-   The command requires an image recipe (``core-image-minimal`` for this example)
-   that is used to create the SDK. This firmware image should also be installed
-   on the target device.  It is possible to pass multiple package recipes.
+   The command requires an image recipe (``core-image-minimal`` for this
+   example) that is used to create the SDK.
+   This firmware image should also be installed on the target device.
+   It is possible to pass multiple package recipes::
+
+      $ devtool ide-sdk my-recipe-1 my-recipe-2 core-image-minimal --target root@192.168.7.2
+
    ``devtool ide-sdk`` tries to create an IDE configuration for all package
    recipes.
 
@@ -687,9 +754,9 @@ The extensible SDK supports two different development modes.
 
    For example, a CMake preset is created for a recipe that inherits
    :ref:`ref-classes-cmake`. In the case of VSCode, CMake presets are supported
-   by the CMake Tools plugin.  This is an example of how the build
-   configuration used by ``bitbake`` is exported to an IDE configuration that
-   gives exactly the same build results.
+   by the CMake Tools plugin. This is an example of how the build configuration
+   used by ``bitbake`` is exported to an IDE configuration that gives exactly
+   the same build results.
 
    Support for remote debugging with seamless integration into the IDE is
    important for a cross-SDK. ``devtool ide-sdk`` automatically generates the
@@ -702,23 +769,54 @@ The extensible SDK supports two different development modes.
       running on the target device, it is essential that the image built by
       ``devtool ide-sdk`` is running on the target device.
 
-   ``devtool ide-sdk`` aims to support multiple programming languages and
-   multiple IDEs natively. "Natively" means that the IDE is configured to call
-   the build tool (e.g. CMake or Meson) directly. This has several advantages.
-   First of all, it is much faster than ``devtool build``, but it also allows
-   to use the very good integration of tools like CMake or GDB in VSCode and
-   other IDEs. However, supporting many programming languages and multiple
-   IDEs is quite an elaborate and constantly evolving thing. Support for IDEs
-   is therefore implemented as plugins. Plugins can also be provided by
-   optional layers.
-
    The default IDE is VSCode. Some hints about using VSCode:
 
-   -  To work on the source code of a recipe an instance of VSCode is started in
-      the recipe's workspace. Example::
+   -  VSCode can be used to work on the BitBake recipes or the application
+      source code.
+      Usually there is one instance of VSCode running in the folder where the
+      BitBake recipes are. This instance has the
+      `Yocto Project BitBake plugin <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`_
+      running.
+
+      .. warning::
+
+         Some VSCode plugins (Python, BitBake and others) need a reasonable
+         configuration to work as expected. Otherwise, some plugins try to
+         index the build directory of BitBake, which keeps your system quite
+         busy until an out of memory exception stops this nonsense.
+         Other plugins, such as the BitBake plugin, do not behave as expected.
+
+         To work around such issues, the ``oe-init-build-env`` script creates
+         an initial ``.vscode/settings.json`` file if ``code`` can be found
+         and the ``.vscode`` folder does not yet exist.
+         It is best to run ``oe-init-build-env`` once before starting VSCode.
+         An alternative approach is to use a build folder outside the layers,
+         e.g. ``oe-init-build-env ../build``.
+
+      The BitBake plugin also offers to create devtool workspaces and run
+      ``devtool ide-sdk`` with a few mouse clicks.
+      Of course, issuing commands in the terminal works as well.
+
+   -  To work on the source code of a recipe another instance of VSCode is
+      started in the recipe's workspace. Example::
 
          code build/workspace/sources/my-recipe
 
+      This instance of VSCode uses plugins that are useful for the development
+      of the application. ``devtool ide-sdk`` generates the necessary
+      ``extensions.json``, ``settings.json``, ``tasks.json``and ``launch.json``
+      configuration files for all the involved plugins.
+
+      When the source code folder present in the workspace folder is opened in
+      VSCode for the first time, a pop-up message recommends installing the
+      required plugins.
+      After accepting the installation of the plugins, working with the source
+      code or some debugging tasks should work as usual with VSCode.
+
+      Starting the VSCode instances in the recipe workspace folders can also be
+      done by a mouse click on the recipe workspaces in the first VSCode
+      instance.
+
    -  To work with CMake press ``Ctrl + Shift + p``, type ``cmake``. This will
       show some possible commands like selecting a CMake preset, compiling or
       running CTest.
@@ -731,10 +829,9 @@ The extensible SDK supports two different development modes.
       show some possible commands like compiling or executing the unit tests.
 
       A note on running cross-compiled unit tests on the host: Meson enables
-      support for QEMU user-mode by default. It is expected that the execution
-      of the unit tests from the IDE will work easily without any additional
-      steps, provided that the code is suitable for execution on the host
-      machine.
+      support for QEMU user mode by default. It is expected that the execution
+      of the unit tests from the IDE will work without any additional steps,
+      given that the code is suitable for the execution on the host machine.
 
    -  For the deployment to the target device, just press ``Ctrl + Shift + p``,
       type ``task``.  Select ``install && deploy-target``.
@@ -745,23 +842,23 @@ The extensible SDK supports two different development modes.
       selected.  After selecting one of the generated configurations, press the
       "play" button.
 
-      Starting a remote debugging session automatically initiates the deployment
-      to the target device. If this is not desired, the
+      Starting a remote debugging session automatically initiates the
+      deployment to the target device. If this is not desired, the
       ``"dependsOn": ["install && deploy-target...]`` parameter of the tasks
       with ``"label": "gdbserver start...`` can be removed from the
       ``tasks.json`` file.
 
-      VSCode supports GDB with many different setups and configurations for many
-      different use cases.  However, most of these setups have some limitations
-      when it comes to cross-development, support only a few target
+      VSCode supports GDB with many different setups and configurations for
+      many different use cases.  However, most of these setups have some
+      limitations when it comes to cross-development, support only a few target
       architectures or require a high performance target device. Therefore
       ``devtool ide-sdk`` supports the classic, generic setup with GDB on the
       development host and gdbserver on the target device.
 
       Roughly summarized, this means:
 
-      -  The binaries are copied via SSH to the remote target device by a script
-         referred by ``tasks.json``.
+      -  The binaries are copied via SSH to the remote target device by a
+         script referred by ``tasks.json``.
 
       -  gdbserver is started on the remote target device via SSH by a script
          referred by ``tasks.json``.
@@ -863,16 +960,9 @@ The extensible SDK supports two different development modes.
 
 #. *Shared sysroots mode*
 
-   For some recipes and use cases a per-recipe sysroot based SDK is not
-   suitable.  Optionally ``devtool ide-sdk`` configures the IDE to use the
-   toolchain provided by the extensible SDK as described in
-   :ref:`running_the_ext_sdk_env`. ``devtool ide-sdk --mode=shared`` is
-   basically a wrapper for the setup of the extensible SDK as described in
-   :ref:`setting_up_ext_sdk_in_build`. The IDE gets a configuration to use the
-   shared sysroots.
-
-   Creating a SDK with shared sysroots that contains all the dependencies needed
-   to work with ``my-recipe`` is possible with the following example command::
+   Creating an SDK with shared :term:`Sysroots <Sysroot>` that contains all the
+   dependencies needed to work with ``my-recipe`` is possible with the following
+   example command::
 
       $ devtool ide-sdk --mode=shared my-recipe
 
@@ -886,12 +976,14 @@ The extensible SDK supports two different development modes.
       echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
       code kit-test
 
-   If there is a CMake project in the workspace, cross-compilation is supported:
+   If there is a CMake project in the workspace, cross-compilation is
+   supported:
 
    - Press ``Ctrl + Shift + P``, type ``CMake: Scan for Kits``
    - Press ``Ctrl + Shift + P``, type ``CMake: Select a Kit``
 
-   Finally most of the features provided by CMake and the IDE should be available.
+   Finally most of the features provided by CMake and the IDE should be
+   available.
 
    Other IDEs than VSCode are supported as well. However,
    ``devtool ide-sdk --mode=shared --ide=none my-recipe`` is currently
-- 
2.47.1


