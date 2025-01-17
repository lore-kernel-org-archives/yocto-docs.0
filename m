Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E3CC02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 16:01:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.14092.1737129676769677249
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 08:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mBsynsbi;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so24940985e9.0
        for <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 08:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737129675; x=1737734475; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1oh6I9BGXhLIqsz0AvDJK+2MNx0vaS+eGIHxRH1mCFc=;
        b=mBsynsbiDezEkMJw+BT81KWtIrjnx6D3AP6zd72ugmOThmldGwRKxWgZmN7uX/TtOr
         l7BgBchapZQkFzzJFahy8/KE9avUg37mg+royM3l1/4BARnPvCMapVVXWVb0Z5/jQdO4
         aaKbZyTPULTJTndEgQFOrMlSP2QlLLcwvI/THnxN6wCbnw2lFIKmDlAzpnbBb8CoS/dd
         Baf6i58Tn9EkCWXqY10Ar4W6VShiHW9LhkWWGOUYMdewzpCe0tSP086ns4G2EbRLdl33
         uG7hTWzVj21UGsyNy+Hdqhm36rB77yk7eZ1KDcWCijW0Ypy9ahZ8+DZ/8FvnkKe5IW0D
         Z28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129675; x=1737734475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oh6I9BGXhLIqsz0AvDJK+2MNx0vaS+eGIHxRH1mCFc=;
        b=aTW+h6rvWnWZkpPF7uVkrZLVlikbkUKZpIep57Ua/jIKPw/PUHsGzJhZuusZCIFbjy
         RWRErOEUT9FGizwjcSkn9jEPc/LutjhFlon+ycVJz19h5nf1BwSaoqIFKxEQfQ+dOjVz
         HNcFfgLu27gu3qlzsG+mMVW9EPH7UdtVfFiauQxTW58xOzkQww3Yd0XsKf9zqB2UZAek
         hTePr2H9QEEAN3sRscIWnSflR5GzxYz3FATYKZuiA1whchvB0u9UpWTwoFPpztI0zhP9
         JcJFMX6Jb5iyZA6ulgqKTGDc57Kv0WEYixeWxNBwAu1azj8OUmwmLR9WMUzsKe3InylA
         3wtA==
X-Gm-Message-State: AOJu0YwIYYb9dc5XUsmyQHldFggxSi3I0B73r0U/i3a519Oa4aM5jT9f
	8Q/bSD/rAXqomsAiY+d+MM+DS1CYXDRMZTEosTiUgZpy9f/3XY4kLuJkHw==
X-Gm-Gg: ASbGncupSO6oqDtPDr1qSFIc6KCL9qRlSxoTYS0wvXuimkg+JuKgI3wt8uDfj6zFnBr
	sMZjHSnHdmN0vDQGQ82ywPlmCTe6Nlm6/zJkbeX6YnzmLC6T5zw9FK0kXfvaNuNEfI2oXKiUmCN
	72GwsCGzygKwPHgk2F+SMSR0wARPCzCFygbGpvOarY4tXOi4p+3HLhlX0OdYPnWq/K/i4g28rjM
	CZjWAoHiqLzw2KUBUO7y/WIDX/wZvqFPVxAs81/2O/+VWmHsrOMqK/PaATTs/R3N3Rb91qkLjSr
	An0=
X-Google-Smtp-Source: AGHT+IHRgZyKArjlUe83qvkwDjCnR2GjCdBX/dZoj6QajUH3Eyo3Xi2pddFfNVpG6v9TKf6ozTDU9g==
X-Received: by 2002:a05:600c:a45:b0:436:6460:e680 with SMTP id 5b1f17b1804b1-438913e0af8mr36231315e9.16.1737129674065;
        Fri, 17 Jan 2025 08:01:14 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890367b48sm37697405e9.0.2025.01.17.08.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:13 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2] sdk-manual: extensible.rst: devtool ide-sdk improve
Date: Fri, 17 Jan 2025 17:01:03 +0100
Message-ID: <20250117160103.2193408-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 16:01:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6142

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
 documentation/sdk-manual/extensible.rst | 214 +++++++++++++++++-------
 1 file changed, 153 insertions(+), 61 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 1cb1bb47c2c..3033f0bc365 100644
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
+The ``devtool ide-sdk`` command can provide an IDE configuration for IDEs for
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
+``devtool modify`` and the per recipe :term:`Sysroots <Sysroot>` of bitbake.
+
+For some recipes and use cases, this default behavior of ``devtool ide-sdk``
+with full devtool and bitbake integration might not be suitable.
+To offer full feature parity with the SDK and the eSDK, ``devtool ide-sdk`` has
+a second mode called "shared" mode.
+If ``devtool ide-sdk`` is called with the ``--mode=shared`` option, it
+bootstraps an SDK directly from the bitbake environment, which offers the same
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
@@ -1512,10 +1604,10 @@ can simply be executed directly::
 
    $ bitbake curl-native
    # Add newly built native items to native sysroot
-   $ bitbake build-sysroots -c build_native_sysroot
+   $ bitbake build-:term:`Sysroots <Sysroot>` -c build_native_sysroot
    $ bitbake mesa
    # Add newly built target items to target sysroot
-   $ bitbake build-sysroots -c build_target_sysroot
+   $ bitbake build-:term:`Sysroots <Sysroot>` -c build_target_sysroot
 
 When using a standalone installer for the Extensible SDK
 --------------------------------------------------------
-- 
2.47.1


