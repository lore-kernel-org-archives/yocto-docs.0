Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9F3C98324
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 19:29:51 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6671.1790278183695110001
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 12:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=GyEoUuid;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202609241929404b7042a44b0002070e-m0us5t@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202609241929404b7042a44b0002070e
        for <docs@lists.yoctoproject.org>;
        Thu, 24 Sep 2026 21:29:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nUUhzASbmn8GRQ3SDqrZv2lyuP2GejTSTZXxxmzwHXE=;
 b=GyEoUuidxqrUs4HImoF0Dfsqxmqz0IDlU6dyfhnprMuMWC0X1KG+v7EftReT3G2NG1VdN8
 9BXK7TGpi5C/X26F6Rr/qe7Qd0hxUnvnCfdmz99tmCviB3NUbaaO3RYi+kpTt5FOOla/WyQ/
 2qssefQENC5PeDl0XyBfvoygx0lryYEYSLT7Cpl5MwBIq1jTkhxIH/66ZjFcsJeFgiZPBr1m
 jtyolhqZ+zK3u5BuwHauyl+4Gucm2jwRzVmUI4k9mUCj2KvvJq69ghh3aDPaLlInWgPGTeE3
 rrIKDqr/UEm+J91SpT+dMZddzwb9QHakfXmqB6g0CFDTxlFsM5jPNR/g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/5] dev-manual/devtool: update devtool ide-sdk section for recent features
Date: Thu, 24 Sep 2026 21:29:04 +0200
Message-ID: <20260924192929.907566-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260924192929.907566-1-adrian.freihofer@siemens.com>
References: <20260924192929.907566-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 19:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10637

From: Adrian Freihofer <adrian.freihofer@siemens.com>

devtool ide-sdk gained several features since this section was last
updated. Document them, and restructure the section for readability:

- Automatic image debug settings (IMAGE_GEN_DEBUGFS/image-combined-dbg/
gdbserver/lldb-server), no more manual local.conf edits.
- Default to all modified workspace recipes when only the image recipe
is given.
- --nfs to boot the target from an NFS-exported rootfs, avoiding SSH
deploys and speeding up debug symbol refreshes with rootfs-dbg.
- --package/--file-glob deploy filtering, automatic GDB/LLDB selection,
and an "Attach" configuration for systemd/SysV-managed services.
- clangd/cpptools IntelliSense selection (IDE_SDK_INTELLISENSE) and
exposing further recipe-sysroot-native tools, e.g. clang-tidy.

Turn "Modified mode" and "Shared sysroots mode" into proper
subsections, split "Modified mode" further, clarify how devtool
ide-sdk relates to the SDK/eSDK installers, recommend
"bitbake-config-build enable-fragment
yocto/root-login-with-empty-password" for passwordless SSH login, and
fix a "devtool sdk-ide" typo.

Also cross-link the classic devtool add/modify workflows to the new
ide-sdk section, and document that "devtool deploy-target" accepts a
local rootfs path (no SSH needed) and --package/--file-glob filtering.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/dev-manual/devtool.rst | 896 +++++++++++++++++----------
 1 file changed, 572 insertions(+), 324 deletions(-)

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index 1f22fb799..de2d5fef0 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -107,6 +107,14 @@ command:
    From within the editor, you can make modifications to the recipe that
    take effect when you build it later.
 
+   .. note::
+
+      As an alternative to the ``edit-recipe``/``build``/``deploy-target``
+      loop, you can use :ref:`devtool-ide-sdk-section` to generate an SDK
+      and an IDE configuration once, and then edit, build and deploy
+      directly from the IDE, without going through ``devtool`` or
+      ``bitbake`` for every change.
+
 #. *Build the Recipe or Rebuild the Image*: The next step you take
    depends on what you are going to do with the new code.
 
@@ -141,6 +149,19 @@ command:
       $ devtool deploy-target recipe target
 
    The target is a live target machine running as an SSH server.
+   Alternatively, ``target`` can be an absolute path to a local
+   pseudo-managed rootfs directory (e.g. one extracted by
+   ``runqemu-extract-sdk``, see
+   :ref:`dev-manual/qemu:running under a network file system (nfs) server`),
+   in which case the files are copied into it directly, without SSH.
+
+   By default, every file installed by the recipe is deployed (except files
+   that only end up in a ``-staticdev``, ``-dbg`` or ``-src`` package, which
+   are not useful on a live target). Use the ``--package`` and/or
+   ``--file-glob`` options to deploy only a subset of the installed files
+   instead, for example ``--package my-recipe-tests`` or
+   ``--file-glob "/usr/bin/*"``. Both options may be given multiple times and
+   combined.
 
    You can, of course, also deploy the image you build to actual
    hardware by using the ``devtool build-image`` command. However,
@@ -315,6 +336,14 @@ command:
    you are free to make changes to the source files. You can use any
    editor you like to make and save your source code modifications.
 
+   .. note::
+
+      As an alternative to the manual edit/``build``/``deploy-target``
+      loop, you can use :ref:`devtool-ide-sdk-section` to generate an SDK
+      and an IDE configuration once, and then edit, build and deploy
+      directly from the IDE, without going through ``devtool`` or
+      ``bitbake`` for every change.
+
 #. *Build the Recipe or Rebuild the Image*: The next step you take
    depends on what you are going to do with the new code.
 
@@ -349,6 +378,9 @@ command:
       $ devtool deploy-target recipe target
 
    The target is a live target machine running as an SSH server.
+   Alternatively, ``target`` can be an absolute path to a local
+   pseudo-managed rootfs directory, in which case the files are copied
+   into it directly, without SSH.
 
    You can, of course, use other methods to deploy the image you built
    using the ``devtool build-image`` command to actual hardware.
@@ -388,14 +420,15 @@ command:
       decide you do not want to proceed with your work. If you do use this
       command, realize that the source tree is preserved.
 
+.. _devtool-ide-sdk-section:
+
 ``devtool ide-sdk`` configures IDEs and bootstraps SDKs
 =======================================================
 
-The ``devtool ide-sdk`` command can provide an IDE configuration for IDEs when
-working on the source code of one or more recipes.
-Depending on the programming language, and the build system used by the recipe,
-the tools required for cross-development and remote debugging are different.
-For example:
+The ``devtool ide-sdk`` command configures an IDE for working on the source
+code of one or more recipes. The tools required for cross-development and
+remote debugging depend on the recipe's programming language and build
+system. For example:
 
 -  A C/C++ project usually uses CMake or Meson.
 
@@ -403,9 +436,9 @@ For example:
 
 -  A Rust project uses Cargo.
 
-Also, the IDE plugins needed for the integration of a build system with the
-IDE and the corresponding settings are usually specific to these build-systems.
-To hide all these details from the user, ``devtool ide-sdk`` does two things:
+The IDE plugins needed to integrate a build system with the IDE, and their
+corresponding settings, are usually specific to that build system too. To
+hide these details from the user, ``devtool ide-sdk`` does two things:
 
 -  It generates any kind of SDK needed for cross-development and remote
    debugging of the specified recipes.
@@ -414,11 +447,102 @@ To hide all these details from the user, ``devtool ide-sdk`` does two things:
    the cross-toolchain and remote debugging tools provided by the SDK directly
    from the IDE.
 
-For supported build systems the configurations generated by ``devtool ide-sdk``
-combine the advantages of the ``devtool modify`` based workflow
-(see :ref:`using_devtool`) with the advantages of the simple Environment Setup
-script based workflow (see :ref:`running_the_ext_sdk_env`) provided by Yocto's
-SDK or eSDK:
+``devtool ide-sdk`` can do this in one of two modes: the default
+:ref:`"modified" <dev-manual/devtool:modified mode>` mode, which uses the
+workspace created by ``devtool modify`` together with BitBake's per-recipe
+:term:`Sysroots <Sysroot>`; and
+:ref:`"shared" <dev-manual/devtool:shared sysroots mode>` mode
+(``--mode=shared``), which instead bootstraps a full SDK/eSDK-like
+environment with shared :term:`Sysroots <Sysroot>`, for cases where the
+default ``devtool``/``bitbake`` integration is not suitable. Both modes are
+covered in more detail below.
+
+Modified mode
+-------------
+
+Design and architecture
+^^^^^^^^^^^^^^^^^^^^^^^^
+
+A key point of this design is that generating the SDK and the IDE
+configuration is a separate step from actually working on the code. This is
+what sets ``devtool ide-sdk`` apart from the ``devtool build`` based workflow
+(see :ref:`using_devtool`), where every edit/build/deploy/test iteration goes
+through ``devtool build``, ``devtool build-image`` and
+``devtool deploy-target``, and therefore through ``bitbake``, every time.
+``devtool ide-sdk`` is itself a ``bitbake`` ``tinfoil`` client, but it drives
+``bitbake`` only to generate the SDK, i.e. to build the recipe (and the
+image) so that their :term:`WORKDIR` is fully populated. Once the SDK is
+there, editing the source code, building, deploying and debugging all happen
+directly in the IDE, independently of ``devtool ide-sdk`` and without calling
+``bitbake`` for every change: ``devtool ide-sdk`` generates an IDE
+configuration that points the IDE directly at the build tool, the
+cross-toolchain and the debugger provided by the SDK. ``devtool ide-sdk``
+only needs to be re-run later on, e.g. if a recipe's dependencies or its
+build configuration change.
+
+Let's now take a closer look at how ``devtool ide-sdk`` and the generated IDE
+configuration make use of a regular ``bitbake`` environment as a SDK to
+achieve this, covering both the build and the remote debug session.
+``devtool ide-sdk`` needs at least one recipe in ``devtool modify`` state
+(i.e. using :ref:`ref-classes-externalsrc` to build from the workspace) and
+an image recipe that is used for the development. ``devtool ide-sdk`` reads
+all the details of how ``bitbake`` builds the recipe via the ``tinfoil``
+API, and uses this information to:
+
+-  Call ``bitbake`` to compile all the parts of the SDK.
+
+-  Replicate ``bitbake``'s exact build configuration into an IDE configuration
+   for working on that recipe's source; a separate IDE configuration, i.e. a
+   separate recipe workspace instance (see below), is generated for every
+   recipe.
+
+The recipe's :term:`WORKDIR` already contains everything needed for
+cross-development. Let's briefly recap how ``bitbake`` normally builds a
+recipe, up to :ref:`ref-tasks-install`:
+
+-  :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` build the
+   sources into :term:`B`, the build directory, using the native,
+   host-runnable tools in :term:`RECIPE_SYSROOT_NATIVE`
+   (``recipe-sysroot-native``) --- e.g. the build tool (``cmake``), the
+   cross-compiler, and the debugger (``gdb``) --- against the target
+   headers and libraries in :term:`RECIPE_SYSROOT` (``recipe-sysroot``).
+
+-  :ref:`ref-tasks-install` installs the compiled output (``make install``)
+   into :term:`D` (``image``), where the unstripped, but relocated binaries,
+   as well as additionally installed files, end up.
+
+The exact same tools and locations are used by an IDE configured by
+``devtool ide-sdk``. The source code itself, :term:`S`, is not
+part of ``WORKDIR`` in this workflow: it is the source tree extracted by
+``devtool modify`` into the ``devtool`` workspace, which is exactly where
+the IDE opens and edits it. From this, ``devtool ide-sdk``
+generates an IDE configuration (e.g. a build tool preset and a debugger
+launch configuration) that simply points the IDE at the existing build
+tool binary in ``recipe-sysroot-native``. From then on, the IDE calls
+that build tool directly, without going through ``devtool ide-sdk`` or
+``bitbake`` again, but with the exact same configuration ``bitbake`` or
+``devtool build`` would use, e.g. a generated CMakePreset or Meson cross
+file that points to the cross-compiler in
+``recipe-sysroot-native`` and the target sysroot in ``recipe-sysroot``.
+
+For remote debugging, the IDE manages a debugger (e.g. GDB) on the host
+instead --- the debugger itself is one of those native tools in
+``recipe-sysroot-native`` too. The debugger gets its debug symbols for
+the recipe's own binary from ``D``, and for every other shared library on
+the target from the ``rootfs-dbg`` directory in the image recipe's
+``WORKDIR`` (see the note above about ``image-combined-dbg``). The
+debugger then connects to a debug-server (e.g. ``gdbserver``) running on
+the target device, which launches or attaches to the actual application
+binary there.
+
+The same architecture also allows the IDE to be configured to use further
+tools beyond the build tool, cross-compiler and debugger, e.g.
+``clang-tidy``: any such tool just needs to be added as a native tool in
+``recipe-sysroot-native``, in the Yocto reproducible way, for
+``devtool ide-sdk`` to be able to point the IDE at it.
+
+To summarize the design described above, for supported build systems
+modified mode brings two key benefits:
 
 -  The source code of the recipe is in the workspace created by
    ``devtool modify`` or ``devtool add``.
@@ -428,333 +552,454 @@ SDK or eSDK:
    configuration at any time.
 
 -  ``devtool ide-sdk`` aims to support multiple programming languages and
-   multiple IDEs natively. "Natively" means that the IDE is configured to call
-   the build tool (e.g. ``cmake`` or ``meson``) directly. This has several
-   advantages.
-   First of all, it is usually much faster to call for example ``cmake`` than
-   ``devtool build``.
-   It also allows to benefit from the very good integration that IDEs like
-   VSCode offer for tools like CMake or GDB.
-
-   However, supporting many programming languages and multiple
-   IDEs is quite an elaborate and constantly evolving thing. Support for IDEs
-   is therefore implemented as plugins. Plugins can also be provided by
-   optional layers.
-
-So much about the introduction to the default mode of ``devtool sdk-ide`` which
-is called the "modified" mode because it uses the workspace created by
-``devtool modify`` and the per recipe :term:`Sysroots <Sysroot>` of BitBake.
-
-For some recipes and use cases, this default behavior of ``devtool ide-sdk``
-with full ``devtool`` and ``bitbake`` integration might not be suitable.
-To offer full feature parity with the SDK and the eSDK, ``devtool ide-sdk`` has
-a second mode called "shared" mode.
-If ``devtool ide-sdk`` is called with the ``--mode=shared`` option, it
-bootstraps an SDK directly from the BitBake environment, which offers the same
-Environment Setup script as described in :ref:`running_the_ext_sdk_env`.
-In addition to the (e)SDK installer-based setup, the IDE gets configured
-to use the shared :term:`Sysroots <Sysroot>` and the tools from the SDK.
-``devtool ide-sdk --mode=shared`` is basically a wrapper for the setup of the
-extensible SDK as described in :ref:`setting_up_ext_sdk_in_build`.
-
-The use of ``devtool ide-sdk`` is an alternative to using one of the SDK
-installers.
-``devtool ide-sdk`` allows the creation of SDKs that offer all the
-functionality of the SDK and the eSDK installers. Compared to the installers,
-however, the SDK created with ``devtool ide-sdk`` is much more flexible.
-For example, it is very easy to change the :term:`MACHINE` in the
-:ref:`structure-build-conf-local.conf` file, update the layer meta data and then regenerate the SDK.
-
-Let's take a look at an example of how to use ``devtool ide-sdk`` in each of
-the two modes:
-
-#. *Modified mode*:
-
-   In order to use the ``devtool ide-sdk``, a few settings are needed. As a
-   starting example, the following lines of code can be added to the
-   :ref:`structure-build-conf-local.conf` file::
-
-      # Build the companion debug file system
-      IMAGE_GEN_DEBUGFS = "1"
-      # Optimize build time: with devtool ide-sdk the dbg tar is not needed
-      IMAGE_FSTYPES_DEBUGFS = ""
-      # Without copying the binaries into roofs-dbg, GDB does not find all source files.
-      IMAGE_CLASSES += "image-combined-dbg"
-
-      # SSH is mandatory, no password simplifies the usage
-      EXTRA_IMAGE_FEATURES += "\
-         ssh-server-openssh \
-         allow-empty-password \
-         allow-root-login \
-         empty-root-password \
-      "
-
-      # Remote debugging needs gdbserver on the target device
-      IMAGE_INSTALL:append = " gdbserver"
-
-      # Add the recipes which should be modified to the image
-      # Otherwise some dependencies might be missing.
-      IMAGE_INSTALL:append = " my-recipe"
-
-   Assuming the BitBake environment is set up correctly and a workspace has
-   been created for the recipe using ``devtool modify my-recipe`` or probably
-   even better by using ``devtool modify my-recipe --debug-build``, the
-   following command can create the SDK and the configuration for VSCode in
-   the recipe workspace::
-
-      $ devtool ide-sdk my-recipe core-image-minimal --target root@192.168.7.2
-
-   The command requires an image recipe (``core-image-minimal`` for this
-   example) that is used to create the SDK.
-   This firmware image should also be installed on the target device.
-   It is possible to pass multiple package recipes::
-
-      $ devtool ide-sdk my-recipe-1 my-recipe-2 core-image-minimal --target root@192.168.7.2
-
-   ``devtool ide-sdk`` tries to create an IDE configuration for all package
-   recipes.
-
-   What this command does exactly depends on the recipe, more precisely on the
-   build tool used by the recipe. The basic idea is to configure the IDE so
-   that it calls the build tool exactly as ``bitbake`` does.
-
-   For example, a CMake preset is created for a recipe that inherits
-   :ref:`ref-classes-cmake`. In the case of VSCode, CMake presets are supported
-   by the CMake Tools plugin. This is an example of how the build configuration
-   used by ``bitbake`` is exported to an IDE configuration that gives exactly
-   the same build results.
-
-   Support for remote debugging with seamless integration into the IDE is
-   important for a cross-SDK. ``devtool ide-sdk`` automatically generates the
-   necessary helper scripts for deploying the compiled artifacts to the target
-   device as well as the necessary configuration for the debugger and the IDE.
-
-   .. note::
-
-      To ensure that the debug symbols on the build machine match the binaries
-      running on the target device, it is essential that the image built by
-      ``devtool ide-sdk`` is running on the target device.
-
-   The default IDE is VSCode. Some hints about using VSCode:
-
-   -  VSCode can be used to work on the BitBake recipes or the application
-      source code.
-      Usually there is one instance of VSCode running in the folder where the
-      BitBake recipes are. This instance has the
-      `Yocto Project BitBake plugin <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`_
-      running.
-
-      .. warning::
-
-         Some VSCode plugins (Python, BitBake and others) need a reasonable
-         configuration to work as expected. Otherwise, some plugins try to
-         index the build directory of BitBake, which keeps your system quite
-         busy until an out of memory exception stops this nonsense.
-         Other plugins, such as the BitBake plugin, do not behave as expected.
-
-         To work around such issues, the ``oe-init-build-env`` script creates
-         an initial ``.vscode/settings.json`` file if ``code`` can be found
-         and the ``.vscode`` folder does not yet exist.
-         It is best to run ``oe-init-build-env`` once before starting VSCode.
-         An alternative approach is to use a build folder outside the layers,
-         e.g. ``oe-init-build-env ../build``.
-
-      The BitBake plugin also offers to create devtool workspaces and run
-      ``devtool ide-sdk`` with a few mouse clicks.
-      Of course, issuing commands in the terminal works as well.
-
-   -  To work on the source code of a recipe another instance of VSCode is
-      started in the recipe's workspace. Example::
-
-         code build/workspace/sources/my-recipe
+   multiple IDEs natively, meaning the IDE is configured to call the build
+   tool (e.g. ``cmake`` or ``meson``) directly. This has two main advantages:
+   it is usually much faster than calling ``devtool build``, and it lets you
+   benefit from the integration that IDEs like VSCode offer for tools such as
+   CMake or GDB.
+
+   Supporting many programming languages and IDEs is an elaborate,
+   constantly evolving task, so support for IDEs is implemented as plugins.
+   Optional layers can also provide plugins.
+
+   For recipes using a programming language or build system not yet supported
+   by ``devtool ide-sdk``, an IDE configuration which uses the
+   ``devtool build`` based workflow described above is generated as a
+   fallback.
+
+``devtool ide-sdk`` is an alternative to using one of the SDK installers,
+i.e. the standard SDK built by the :ref:`ref-classes-populate-sdk` class
+(``bitbake -c populate_sdk``) or the extensible SDK (eSDK) built by the
+:ref:`populate_sdk_ext <ref-classes-populate-sdk-*>` class
+(``bitbake -c populate_sdk_ext``): it can create SDKs offering all the
+functionality of the SDK and eSDK installers, but is much more flexible.
+For example, it is very easy to change :term:`MACHINE` in the
+:ref:`structure-build-conf-local.conf` file, update the layer metadata, and then regenerate the
+SDK. When a :ref:`overview-manual/concepts:shared state cache` is
+available, e.g. shared between developers or with the autobuilder,
+building an SDK installer becomes less important in the first place, as
+:doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
+can quickly replicate the layers and build configuration, and
+``devtool ide-sdk`` can then quickly regenerate an equivalent SDK straight
+from that cache.
+
+Let's take a look at an example of how to use ``devtool ide-sdk``.
+
+Setting up SSH access
+^^^^^^^^^^^^^^^^^^^^^^
+
+In order to use ``devtool ide-sdk``, SSH access to the target is needed.
+For example, this can be enabled by adding ``ssh-server-openssh`` to
+:term:`EXTRA_IMAGE_FEATURES` in the :ref:`structure-build-conf-local.conf` file, and, to simplify
+usage during development, enabling the
+``yocto/root-login-with-empty-password`` configuration fragment to allow a
+passwordless root login over ssh::
+
+   $ bitbake-config-build enable-fragment yocto/root-login-with-empty-password
+
+Alternatively, the same result can be achieved without that fragment by
+adding the following lines to the ``local.conf`` file or the image recipe
+directly::
+
+   # SSH is mandatory, no password simplifies the usage
+   EXTRA_IMAGE_FEATURES += "\
+      ssh-server-openssh \
+      allow-empty-password \
+      allow-root-login \
+      empty-root-password \
+   "
+
+.. note::
+
+   ``devtool ide-sdk`` automatically adds everything else needed for
+   debugging, e.g. ``IMAGE_GEN_DEBUGFS``, ``IMAGE_FSTYPES_DEBUGFS``, the
+   :oecore_path:`image-combined-dbg <meta/classes-recipe/image-combined-dbg.bbclass>`
+   class, ``gdbserver``/``lldb-server``, and the
+   recipes being worked on. It writes only the settings it still needs
+   into the image recipe's ``.bbappend`` file in the workspace, and
+   removes them again once they are no longer required, so there is no
+   need to add any of this to ``local.conf`` manually.
+
+Generating the SDK and IDE configuration
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Assuming the BitBake environment is set up correctly and a workspace has
+been created for the recipe using ``devtool modify my-recipe`` (or, for a
+more useful debug build, ``devtool modify my-recipe --debug-build``), the
+following command can create the SDK and the configuration for VSCode in
+the recipe workspace::
+
+   $ devtool ide-sdk my-recipe core-image-minimal --target root@192.168.7.2
+
+The command requires an image recipe (``core-image-minimal`` for this
+example) that is used to create the SDK.
+This firmware image should also be installed on the target device.
+It is possible to pass multiple package recipes::
+
+   $ devtool ide-sdk my-recipe-1 my-recipe-2 core-image-minimal --target root@192.168.7.2
+
+If only an image recipe is passed, all recipes currently modified in the
+workspace (i.e. everything with a ``<workspace>/appends/*.bbappend`` file)
+are used automatically, so the above is usually equivalent to just::
+
+   $ devtool ide-sdk core-image-minimal --target root@192.168.7.2
+
+What exactly this command does depends on the build tool used by the
+recipe. The basic idea is to configure the IDE to call the build tool
+exactly as ``bitbake`` does.
+
+For example, for a recipe that inherits :ref:`ref-classes-cmake`, a CMake
+preset is created; VSCode's CMake Tools plugin supports these presets
+directly. This shows how the build configuration used by ``bitbake`` is
+exported to an IDE configuration that produces exactly the same build
+results.
+
+Seamless remote debugging support is important for a cross-SDK.
+``devtool ide-sdk`` automatically generates the helper scripts needed to
+deploy compiled artifacts to the target device, as well as the
+configuration needed for the debugger and the IDE.
+
+.. note::
+
+   To ensure that the debug symbols on the build machine match the binaries
+   running on the target device, it is essential that the image built by
+   ``devtool ide-sdk`` is running on the target device.
+
+Booting the target from an NFS-exported root filesystem
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+As an alternative to installing the image and deploying build output over
+SSH for every debug session, ``devtool ide-sdk`` can boot the target from
+an NFS-exported root filesystem, automating the manual
+:ref:`dev-manual/qemu:running under a network file system (nfs) server`
+workflow. Passing ``--nfs=rootfs`` (or ``--nfs=rootfs-dbg`` to also include
+the debug filesystem) extracts the selected root filesystem below
+``<workspace>/nfs-exports/<image-recipe>/`` and generates a
+``runqemu-rootfs``/``runqemu-rootfs-dbg`` helper script to boot QEMU with
+that root filesystem mounted over NFS::
+
+   $ devtool ide-sdk my-recipe core-image-minimal --nfs=rootfs-dbg
+   $ build/workspace/nfs-exports/core-image-minimal/runqemu-rootfs-dbg nographic
+
+This changes the relationship between the SDK, the target device and the
+debug symbols compared to the architecture described above: instead of a
+separate ``rootfs`` booted by the target and a ``rootfs-dbg`` only
+consulted by the debugger on the host, both the target and the debugger
+now use the same NFS-exported ``rootfs-dbg``.
+
+Use ``--nfs-extract-dir=DIR`` to extract below ``DIR/<image-recipe>/``
+instead of the default location in the workspace, for example when the NFS
+server may only export a particular directory. Note that every
+``devtool ide-sdk --nfs`` run re-extracts the root filesystem from scratch,
+which discards everything previously deployed into it.
+
+Deploying build output then copies the recipe's build artifacts directly
+into the exported directory on the host, without any SSH transfer: since
+that directory already lives on the build machine rather than on a remote
+target, ``devtool deploy-target`` only needs a local file copy there.
+
+Without ``--nfs=rootfs-dbg``, the debugger looks up the debug symbols and
+source files of other recipes' shared libraries (i.e. everything besides
+the recipe(s) being worked on) inside the ``rootfs-dbg`` folder of the
+image's build directory, which is only refreshed by rebuilding the whole
+image. With ``--nfs=rootfs-dbg``, those same lookups are pointed at the
+NFS-exported ``rootfs-dbg`` instead --- the same directory the target
+already boots from and that ``devtool deploy-target`` writes into. This
+avoids rebuilding the whole image just to refresh debug information after
+an incremental change, speeding up the edit/build/debug cycle.
+
+Since the target is booted directly from ``rootfs-dbg``, the debug symbols
+are also present on the target itself, not just on the development host.
+This relies on the
+:oecore_path:`image-combined-dbg <meta/classes-recipe/image-combined-dbg.bbclass>`
+class (see the note above, enabled automatically), which combines the
+unstripped binaries and their debug symbols into ``rootfs-dbg``, unlike a
+plain ``rootfs`` where symbols are split out into separate ``-dbg``
+packages that are not installed.
+Having them together on the target makes tools like ``perf`` or
+``trace-cmd``, run directly on the target, produce properly symbolicated
+output. The same debug symbols are also useful to obtain test code
+coverage.
+
+Using VSCode
+^^^^^^^^^^^^
+
+The default IDE is VSCode. Some hints about using VSCode:
+
+-  VSCode can be used to work on the BitBake recipes or the application
+   source code.
+   Usually there is one instance of VSCode running in the folder where the
+   BitBake recipes are. This instance has the
+   `Yocto Project BitBake plugin <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`_
+   running.
+
+   .. warning::
+
+      Some VSCode plugins (Python, BitBake and others) try to index every
+      file in the workspace, which can make your system unusable while it
+      churns through large generated directories. A build environment set
+      up with ``bitbake-setup`` avoids this for this "meta" instance: it
+      generates (and keeps updated) a ``bitbake.code-workspace`` multi-root
+      workspace file with appropriate excludes for the layers and
+      ``build/conf``. For each per-recipe workspace instance (see below),
+      ``devtool ide-sdk`` generates its own ``settings.json`` with a
+      similar ignore list, excluding directories such as ``oe-workdir``
+      and ``oe-logs``.
+
+   The BitBake plugin also offers to create devtool workspaces and run
+   ``devtool ide-sdk`` with a few mouse clicks.
+   Of course, issuing commands in the terminal works as well.
+
+-  To work on the source code of a recipe another instance of VSCode is
+   started in the recipe's workspace. Example::
+
+      code build/workspace/sources/my-recipe
+
+   This instance of VSCode uses plugins that are useful for the development
+   of the application. ``devtool ide-sdk`` generates the necessary
+   ``extensions.json``, ``settings.json``, ``tasks.json`` and ``launch.json``
+   configuration files for all the involved plugins.
+
+   When the source code folder present in the workspace folder is opened in
+   VSCode for the first time, a pop-up message recommends installing the
+   required plugins.
+   After accepting the installation of the plugins, working with the source
+   code or some debugging tasks should work as usual with VSCode.
+
+   Starting the VSCode instances in the recipe workspace folders can also be
+   done by a mouse click on the recipe workspaces in the first VSCode
+   instance.
+
+-  To work with CMake press ``Ctrl + Shift + p``, type ``cmake``. This will
+   show some possible commands like selecting a CMake preset, compiling or
+   running CTest.
+
+   For recipes inheriting :ref:`ref-classes-cmake-qemu` rather than
+   :ref:`ref-classes-cmake`, executing cross-compiled unit tests on the host
+   can be supported transparently with QEMU user-mode.
+
+-  To work with Meson press ``Ctrl + Shift + p``, type ``meson``. This will
+   show some possible commands like compiling or executing the unit tests.
+
+   A note on running cross-compiled unit tests on the host: Meson enables
+   support for QEMU user mode by default. It is expected that the execution
+   of the unit tests from the IDE will work without any additional steps,
+   given that the code is suitable for the execution on the host machine.
+
+-  For C/C++ IntelliSense (code completion, navigation and diagnostics),
+   ``devtool ide-sdk`` configures either the ``clangd`` language server or
+   Microsoft's C/C++ extension (``cpptools``), matched to the recipe's real
+   cross-compiler via the generated ``compile_commands.json``. ``clangd``
+   is used automatically for recipes built with the LLVM/clang toolchain;
+   other recipes default to ``cpptools``, but can opt into ``clangd`` too
+   by setting the recipe's ``IDE_SDK_INTELLISENSE`` variable to "clangd".
+   When ``clangd`` is used and the recipe's source tree contains a
+   ``.clang-format`` file, ``devtool ide-sdk`` also configures VSCode to
+   format C/C++ files with ``clangd`` on save, honoring that style file.
+
+-  For the deployment to the target device, just press ``Ctrl + Shift + p``,
+   type ``task``.  Select ``install && deploy-target``.
+
+   By default, every file installed by the recipe is deployed (except
+   files that only end up in a ``-staticdev``, ``-dbg`` or ``-src``
+   package, which are not useful on a live target). Use the ``--package``
+   and/or ``--file-glob`` options of ``devtool ide-sdk`` (or
+   ``devtool deploy-target``) to deploy only a subset of the installed
+   files, for example ``--package my-recipe-tests`` or
+   ``--file-glob "/usr/bin/*"``. Both options may be given multiple times
+   and combined, and may be prefixed with ``RECIPE:`` (e.g.
+   ``--package "RECIPE:,-doc"``) to scope the option to one of several
+   recipes being processed by a single ``devtool ide-sdk`` invocation.
+
+-  For remote debugging, switch to the debugging view by pressing the "play"
+   button with the ``bug icon`` on the left side. This will provide a green
+   play button with a drop-down list where a debug configuration can be
+   selected.  After selecting one of the generated configurations, press the
+   "play" button.
+
+   Starting a remote debugging session automatically initiates the
+   deployment to the target device. If this is not desired, the
+   ``"dependsOn": ["install && deploy-target...]`` parameter of the tasks
+   with ``"label": "gdbserver start...`` can be removed from the
+   ``tasks.json`` file.
+
+   VSCode supports GDB in many different setups and configurations for
+   many different use cases. However, most of these have limitations for
+   cross-development: they support only a few target architectures, or
+   require a high performance target device. ``devtool ide-sdk``
+   therefore uses the classic, generic setup: GDB on the development host
+   and gdbserver on the target device.
+
+   For recipes built with the LLVM/clang toolchain (:term:`TOOLCHAIN` set
+   to "clang"), ``devtool ide-sdk`` automatically uses LLDB and
+   ``lldb-server`` instead of GDB and ``gdbserver``, with no extra
+   command-line option needed. GDB and LLDB can be used side by side when
+   several recipes using different toolchains are processed by the same
+   ``devtool ide-sdk`` invocation.
+
+   For a recipe whose binary is started by ``systemd`` or a SysV init
+   script (i.e. it runs as a persistent service rather than being started
+   directly by the debugger), an additional "Attach" debug configuration
+   is generated alongside the regular one. Selecting it attaches the
+   debugger to the already-running instance of the service on the target
+   instead of starting a new one.
+
+   Roughly summarized, this means:
+
+   -  The binaries are copied via SSH to the remote target device by a
+      script referred by ``tasks.json``.
+
+   -  gdbserver is started on the remote target device via SSH by a script
+      referred by ``tasks.json``.
+
+      Changing the parameters that are passed to the debugging executable
+      requires modifying the generated script. The script is located at
+      ``oe-scripts/gdbserver_*``. Defining the parameters in the ``args``
+      field in the ``launch.json`` file does not work.
+
+   -  VSCode connects to gdbserver as documented in
+      `Remote debugging or debugging with a local debugger server
+      <https://code.visualstudio.com/docs/cpp/launch-json-reference#_remote-debugging-or-debugging-with-a-local-debugger-server>`__.
+
+Debugging without an IDE
+^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Additionally ``--ide=none`` is supported. With the ``none`` IDE parameter,
+some generic configuration files like ``gdbinit`` files and some helper
+scripts starting gdbserver remotely on the target device as well as the GDB
+client on the host are generated.
+
+Example: ``cmake-example`` walkthrough
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Here is a usage example for the ``cmake-example`` recipe from the
+``meta-selftest`` layer which inherits :ref:`ref-classes-cmake-qemu`:
+
+.. code-block:: sh
+
+   # Create the SDK
+   devtool modify cmake-example --debug-build
+   devtool ide-sdk cmake-example core-image-minimal -c --ide=none
+
+   # Install the firmware on a target device or start QEMU
+   runqemu
+
+   # From exploring the workspace of cmake-example
+   cd build/workspace/sources/cmake-example
+
+   # Find cmake-native and save the path into a variable
+   # Note: using just cmake instead of $CMAKE_NATIVE would work in many cases
+   CMAKE_NATIVE="$(jq -r '.configurePresets[0] | "\(.cmakeExecutable)"' CMakeUserPresets.json)"
+
+   # List available CMake presets
+   "$CMAKE_NATIVE" --list-presets
+   Available configure presets:
+
+     "cmake-example-cortexa57" - cmake-example: cortexa57
+
+   # Re-compile the already compiled sources
+   "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57
+   ninja: no work to do.
+   # Do a clean re-build
+   "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target clean
+   [1/1] Cleaning all built files...
+   Cleaning... 8 files.
+   "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target all
+   [7/7] Linking CXX executable cmake-example
+
+   # Run the cross-compiled unit tests with QEMU user-mode
+   "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target test
+   [0/1] Running tests...
+   Test project .../build/tmp/work/cortexa57-poky-linux/cmake-example/1.0/cmake-example-1.0
+       Start 1: test-cmake-example
+   1/1 Test #1: test-cmake-example ...............   Passed    0.03 sec
+
+   100% tests passed, 0 tests failed out of 1
+
+   Total Test time (real) =   0.03 sec
+
+   # Using CTest directly is possible as well
+   CTEST_NATIVE="$(dirname "$CMAKE_NATIVE")/ctest"
+
+   # List available CMake presets
+   "$CTEST_NATIVE" --list-presets
+   Available test presets:
+
+     "cmake-example-cortexa57" - cmake-example: cortexa57
 
-      This instance of VSCode uses plugins that are useful for the development
-      of the application. ``devtool ide-sdk`` generates the necessary
-      ``extensions.json``, ``settings.json``, ``tasks.json`` and ``launch.json``
-      configuration files for all the involved plugins.
-
-      When the source code folder present in the workspace folder is opened in
-      VSCode for the first time, a pop-up message recommends installing the
-      required plugins.
-      After accepting the installation of the plugins, working with the source
-      code or some debugging tasks should work as usual with VSCode.
-
-      Starting the VSCode instances in the recipe workspace folders can also be
-      done by a mouse click on the recipe workspaces in the first VSCode
-      instance.
-
-   -  To work with CMake press ``Ctrl + Shift + p``, type ``cmake``. This will
-      show some possible commands like selecting a CMake preset, compiling or
-      running CTest.
-
-      For recipes inheriting :ref:`ref-classes-cmake-qemu` rather than
-      :ref:`ref-classes-cmake`, executing cross-compiled unit tests on the host
-      can be supported transparently with QEMU user-mode.
-
-   -  To work with Meson press ``Ctrl + Shift + p``, type ``meson``. This will
-      show some possible commands like compiling or executing the unit tests.
-
-      A note on running cross-compiled unit tests on the host: Meson enables
-      support for QEMU user mode by default. It is expected that the execution
-      of the unit tests from the IDE will work without any additional steps,
-      given that the code is suitable for the execution on the host machine.
+   # Run the cross-compiled unit tests with QEMU user-mode
+   "$CTEST_NATIVE" --preset "cmake-example-cortexa57"
+   Test project ...build/tmp/work/cortexa57-poky-linux/cmake-example/1.0/cmake-example-1.0
+       Start 1: test-cmake-example
+   1/1 Test #1: test-cmake-example ...............   Passed    0.03 sec
 
-   -  For the deployment to the target device, just press ``Ctrl + Shift + p``,
-      type ``task``.  Select ``install && deploy-target``.
+   100% tests passed, 0 tests failed out of 1
 
-   -  For remote debugging, switch to the debugging view by pressing the "play"
-      button with the ``bug icon`` on the left side. This will provide a green
-      play button with a drop-down list where a debug configuration can be
-      selected.  After selecting one of the generated configurations, press the
-      "play" button.
+   Total Test time (real) =   0.03 sec
 
-      Starting a remote debugging session automatically initiates the
-      deployment to the target device. If this is not desired, the
-      ``"dependsOn": ["install && deploy-target...]`` parameter of the tasks
-      with ``"label": "gdbserver start...`` can be removed from the
-      ``tasks.json`` file.
+   # Deploying the new build to the target device (default is QEUM at 192.168.7.2)
+   oe-scripts/install_and_deploy_cmake-example-cortexa57
 
-      VSCode supports GDB with many different setups and configurations for
-      many different use cases.  However, most of these setups have some
-      limitations when it comes to cross-development, support only a few target
-      architectures or require a high performance target device. Therefore
-      ``devtool ide-sdk`` supports the classic, generic setup with GDB on the
-      development host and gdbserver on the target device.
-
-      Roughly summarized, this means:
-
-      -  The binaries are copied via SSH to the remote target device by a
-         script referred by ``tasks.json``.
+   # Start a remote debugging session with gdbserver on the target and GDB on the host
+   oe-scripts/gdbserver_1234_usr-bin-cmake-example_m
+   oe-scripts/gdb_1234_usr-bin-cmake-example
+   break main
+   run
+   step
+   stepi
+   continue
+   quit
 
-      -  gdbserver is started on the remote target device via SSH by a script
-         referred by ``tasks.json``.
+   # Stop gdbserver on the target device
+   oe-scripts/gdbserver_1234_usr-bin-cmake-example_m stop
 
-         Changing the parameters that are passed to the debugging executable
-         requires modifying the generated script. The script is located at
-         ``oe-scripts/gdbserver_*``. Defining the parameters in the ``args``
-         field in the ``launch.json`` file does not work.
+Shared sysroots mode
+--------------------
 
-      -  VSCode connects to gdbserver as documented in
-         `Remote debugging or debugging with a local debugger server
-         <https://code.visualstudio.com/docs/cpp/launch-json-reference#_remote-debugging-or-debugging-with-a-local-debugger-server>`__.
-
-   Additionally ``--ide=none`` is supported. With the ``none`` IDE parameter,
-   some generic configuration files like ``gdbinit`` files and some helper
-   scripts starting gdbserver remotely on the target device as well as the GDB
-   client on the host are generated.
+Concept
+^^^^^^^
 
-   Here is a usage example for the ``cmake-example`` recipe from the
-   ``meta-selftest`` layer which inherits :ref:`ref-classes-cmake-qemu`:
+For some recipes and use cases, modified mode's full ``devtool``/``bitbake``
+integration might not be suitable. To offer full feature parity with the
+SDK and the eSDK instead, ``--mode=shared`` bootstraps an SDK directly
+from the BitBake environment, offering the same Environment Setup script
+as described in :ref:`running_the_ext_sdk_env`. The IDE is then configured
+to use the shared :term:`Sysroots <Sysroot>` and tools from that SDK.
+``devtool ide-sdk --mode=shared`` is basically a wrapper around the setup
+of the extensible SDK as described in :ref:`setting_up_ext_sdk_in_build`.
 
-   .. code-block:: sh
+Example
+^^^^^^^
 
-      # Create the SDK
-      devtool modify cmake-example --debug-build
-      devtool ide-sdk cmake-example core-image-minimal -c --ide=none
+Creating an SDK with shared :term:`Sysroots <Sysroot>` that contains all the
+dependencies needed to work with ``my-recipe`` is possible with the following
+example command::
 
-      # Install the firmware on a target device or start QEMU
-      runqemu
+   $ devtool ide-sdk --mode=shared my-recipe
 
-      # From exploring the workspace of cmake-example
-      cd build/workspace/sources/cmake-example
+For VSCode the cross-toolchain is exposed as a CMake kit. CMake kits are
+defined in ``~/.local/share/CMakeTools/cmake-tools-kits.json``.
+The following example shows how the cross-toolchain can be selected in
+VSCode. First of all we need a folder containing a CMake project.
+For this example, let's create a CMake project and start VSCode::
 
-      # Find cmake-native and save the path into a variable
-      # Note: using just cmake instead of $CMAKE_NATIVE would work in many cases
-      CMAKE_NATIVE="$(jq -r '.configurePresets[0] | "\(.cmakeExecutable)"' CMakeUserPresets.json)"
+   mkdir kit-test
+   echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
+   code kit-test
 
-      # List available CMake presets
-      "$CMAKE_NATIVE" --list-presets
-      Available configure presets:
+If there is a CMake project in the workspace, cross-compilation is
+supported:
 
-        "cmake-example-cortexa57" - cmake-example: cortexa57
-
-      # Re-compile the already compiled sources
-      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57
-      ninja: no work to do.
-      # Do a clean re-build
-      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target clean
-      [1/1] Cleaning all built files...
-      Cleaning... 8 files.
-      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target all
-      [7/7] Linking CXX executable cmake-example
-
-      # Run the cross-compiled unit tests with QEMU user-mode
-      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target test
-      [0/1] Running tests...
-      Test project .../build/tmp/work/cortexa57-poky-linux/cmake-example/1.0/cmake-example-1.0
-          Start 1: test-cmake-example
-      1/1 Test #1: test-cmake-example ...............   Passed    0.03 sec
-
-      100% tests passed, 0 tests failed out of 1
-
-      Total Test time (real) =   0.03 sec
-
-      # Using CTest directly is possible as well
-      CTEST_NATIVE="$(dirname "$CMAKE_NATIVE")/ctest"
-
-      # List available CMake presets
-      "$CTEST_NATIVE" --list-presets
-      Available test presets:
-
-        "cmake-example-cortexa57" - cmake-example: cortexa57
-
-      # Run the cross-compiled unit tests with QEMU user-mode
-      "$CTEST_NATIVE" --preset "cmake-example-cortexa57"
-      Test project ...build/tmp/work/cortexa57-poky-linux/cmake-example/1.0/cmake-example-1.0
-          Start 1: test-cmake-example
-      1/1 Test #1: test-cmake-example ...............   Passed    0.03 sec
-
-      100% tests passed, 0 tests failed out of 1
-
-      Total Test time (real) =   0.03 sec
-
-      # Deploying the new build to the target device (default is QEUM at 192.168.7.2)
-      oe-scripts/install_and_deploy_cmake-example-cortexa57
-
-      # Start a remote debugging session with gdbserver on the target and GDB on the host
-      oe-scripts/gdbserver_1234_usr-bin-cmake-example_m
-      oe-scripts/gdb_1234_usr-bin-cmake-example
-      break main
-      run
-      step
-      stepi
-      continue
-      quit
-
-      # Stop gdbserver on the target device
-      oe-scripts/gdbserver_1234_usr-bin-cmake-example_m stop
-
-#. *Shared sysroots mode*
-
-   Creating an SDK with shared :term:`Sysroots <Sysroot>` that contains all the
-   dependencies needed to work with ``my-recipe`` is possible with the following
-   example command::
-
-      $ devtool ide-sdk --mode=shared my-recipe
-
-   For VSCode the cross-toolchain is exposed as a CMake kit. CMake kits are
-   defined in ``~/.local/share/CMakeTools/cmake-tools-kits.json``.
-   The following example shows how the cross-toolchain can be selected in
-   VSCode. First of all we need a folder containing a CMake project.
-   For this example, let's create a CMake project and start VSCode::
-
-      mkdir kit-test
-      echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
-      code kit-test
-
-   If there is a CMake project in the workspace, cross-compilation is
-   supported:
-
-   - Press ``Ctrl + Shift + P``, type ``CMake: Scan for Kits``
-   - Press ``Ctrl + Shift + P``, type ``CMake: Select a Kit``
-
-   Finally most of the features provided by CMake and the IDE should be
-   available.
-
-   Other IDEs than VSCode are supported as well. However,
-   ``devtool ide-sdk --mode=shared --ide=none my-recipe`` is currently
-   just a simple wrapper for the setup of the extensible SDK, as described in
-   :ref:`setting_up_ext_sdk_in_build`.
+- Press ``Ctrl + Shift + P``, type ``CMake: Scan for Kits``
+- Press ``Ctrl + Shift + P``, type ``CMake: Select a Kit``
+
+Finally most of the features provided by CMake and the IDE should be
+available.
+
+Other IDEs than VSCode are supported as well. However,
+``devtool ide-sdk --mode=shared --ide=none my-recipe`` is currently
+just a simple wrapper for the setup of the extensible SDK, as described in
+:ref:`setting_up_ext_sdk_in_build`.
 
 Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
 =======================================================================================================
@@ -895,6 +1140,9 @@ The following diagram shows the common development flow used with the
       $ devtool deploy-target recipe target
 
    The target is a live target machine running as an SSH server.
+   Alternatively, ``target`` can be an absolute path to a local
+   pseudo-managed rootfs directory, in which case the files are copied
+   into it directly, without SSH.
 
    You can, of course, also deploy the image you build using the
    ``devtool build-image`` command to actual hardware. However,
-- 
2.55.0


