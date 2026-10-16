Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2276CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 12:32:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20638.1792153953207128890
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 05:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ktHxp6x8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4D11C4E41262
	for <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 12:32:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 209216075D;
	Fri, 16 Oct 2026 12:32:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E86C103281F4;
	Fri, 16 Oct 2026 14:32:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792153950; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ubQASCOpPInoRdn3hPaX7gHzt1z5wIMMr3M/0lILuXw=;
	b=ktHxp6x8Ymdbq94f05GvYk7MARkmDOsr26Crr4DiALQQNNmMoyUITprtg+SBkKLZVHbShP
	wjILzfjZi7FwlvQT3efkidltrGXSNS6wZIx6TTKTYggOwcvRXqhfb+6kydEKA0h/cGIVsR
	NE+rOIHb3Bo56CgNHQhmFi9SJgGq3EQqyNv3jAPTQBRXbDoi2WHwpLVVxTdCTlcVvPuXRO
	uYpc8JxsMdtn836jWKNaA7jl0Ske/EUsurMOjJdd1TdQ96yQoXX0qTiwf0SZ3zUBibFVzR
	tgqEJ6olwPnbM3E67U0XMim98+Tqdc1vtD76TIYAyNOHItoQslCJ1d62sEtkCw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 14:32:23 +0200
Message-Id: <DM69JVY4DK5H.1HVLE4IMSUK85@bootlin.com>
Subject: Re: [docs] [PATCH v3 2/4] dev-manual/devtool: update devtool
 ide-sdk section for recent features
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
References: <20261015200726.2391599-1-adrian.freihofer@siemens.com>
 <20261015200726.2391599-3-adrian.freihofer@siemens.com>
In-Reply-To: <20261015200726.2391599-3-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 12:32:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10692

On Thu Oct 15, 2026 at 10:06 PM CEST, Adrian Freihofer via lists.yoctoproje=
ct.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Document the devtool ide-sdk features added since this section was last
> updated: automatic image debug settings, --nfs, --package/--file-glob,
> combining modified and shared mode, IntelliSense selection and further
> native tools.
>
> Also document the local rootfs path and --package/--file-glob support of
> "devtool deploy-target".
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/dev-manual/devtool.rst          | 971 ++++++++++++------
>  .../ref-manual/devtool-reference.rst          |   3 +
>  2 files changed, 660 insertions(+), 314 deletions(-)
>
> diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-man=
ual/devtool.rst
> index 1f22fb799..e182b427b 100644
> --- a/documentation/dev-manual/devtool.rst
> +++ b/documentation/dev-manual/devtool.rst
> @@ -107,6 +107,14 @@ command:
>     From within the editor, you can make modifications to the recipe that
>     take effect when you build it later.
> =20
> +   .. note::
> +
> +      As an alternative to the ``edit-recipe``/``build``/``deploy-target=
``
> +      loop, you can use :ref:`devtool-ide-sdk-section` to generate an SD=
K
> +      and an IDE configuration once, and then edit, build and deploy
> +      directly from the IDE, without going through ``devtool`` or
> +      ``bitbake`` for every change.
> +
>  #. *Build the Recipe or Rebuild the Image*: The next step you take
>     depends on what you are going to do with the new code.
> =20
> @@ -141,6 +149,19 @@ command:
>        $ devtool deploy-target recipe target
> =20
>     The target is a live target machine running as an SSH server.
> +   Alternatively, ``target`` can be an absolute path to a local
> +   pseudo-managed rootfs directory (e.g. one extracted by
> +   ``runqemu-extract-sdk``, see
> +   :ref:`dev-manual/qemu:running under a network file system (nfs) serve=
r`),
> +   in which case the files are copied into it directly, without SSH.
> +
> +   By default, every file installed by the recipe is deployed (except fi=
les
> +   that only end up in a ``-staticdev``, ``-dbg`` or ``-src`` package, w=
hich
> +   are not useful on a live target). Use the ``--package`` and/or
> +   ``--file-glob`` options to deploy only a subset of the installed file=
s
> +   instead, for example ``--package my-recipe-tests`` or
> +   ``--file-glob "/usr/bin/*"``. Both options may be given multiple time=
s and
> +   combined.
> =20
>     You can, of course, also deploy the image you build to actual
>     hardware by using the ``devtool build-image`` command. However,
> @@ -315,6 +336,14 @@ command:
>     you are free to make changes to the source files. You can use any
>     editor you like to make and save your source code modifications.
> =20
> +   .. note::
> +
> +      As an alternative to the manual edit/``build``/``deploy-target``
> +      loop, you can use :ref:`devtool-ide-sdk-section` to generate an SD=
K
> +      and an IDE configuration once, and then edit, build and deploy
> +      directly from the IDE, without going through ``devtool`` or
> +      ``bitbake`` for every change.
> +
>  #. *Build the Recipe or Rebuild the Image*: The next step you take
>     depends on what you are going to do with the new code.
> =20
> @@ -349,6 +378,9 @@ command:
>        $ devtool deploy-target recipe target
> =20
>     The target is a live target machine running as an SSH server.
> +   Alternatively, ``target`` can be an absolute path to a local
> +   pseudo-managed rootfs directory, in which case the files are copied
> +   into it directly, without SSH.
> =20
>     You can, of course, use other methods to deploy the image you built
>     using the ``devtool build-image`` command to actual hardware.
> @@ -388,14 +420,15 @@ command:
>        decide you do not want to proceed with your work. If you do use th=
is
>        command, realize that the source tree is preserved.
> =20
> +.. _devtool-ide-sdk-section:
> +
>  ``devtool ide-sdk`` configures IDEs and bootstraps SDKs
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> =20
> -The ``devtool ide-sdk`` command can provide an IDE configuration for IDE=
s when
> -working on the source code of one or more recipes.
> -Depending on the programming language, and the build system used by the =
recipe,
> -the tools required for cross-development and remote debugging are differ=
ent.
> -For example:
> +The ``devtool ide-sdk`` command configures an IDE for working on the sou=
rce
> +code of one or more recipes. The tools required for cross-development an=
d
> +remote debugging depend on the recipe's programming language and build
> +system. For example:
> =20
>  -  A C/C++ project usually uses CMake or Meson.
> =20
> @@ -403,9 +436,9 @@ For example:
> =20
>  -  A Rust project uses Cargo.
> =20
> -Also, the IDE plugins needed for the integration of a build system with =
the
> -IDE and the corresponding settings are usually specific to these build-s=
ystems.
> -To hide all these details from the user, ``devtool ide-sdk`` does two th=
ings:
> +The IDE plugins needed to integrate a build system with the IDE, and the=
ir
> +corresponding settings, are usually specific to that build system too. T=
o
> +hide these details from the user, ``devtool ide-sdk`` does two things:
> =20
>  -  It generates any kind of SDK needed for cross-development and remote
>     debugging of the specified recipes.
> @@ -414,11 +447,104 @@ To hide all these details from the user, ``devtool=
 ide-sdk`` does two things:
>     the cross-toolchain and remote debugging tools provided by the SDK di=
rectly
>     from the IDE.
> =20
> -For supported build systems the configurations generated by ``devtool id=
e-sdk``
> -combine the advantages of the ``devtool modify`` based workflow
> -(see :ref:`using_devtool`) with the advantages of the simple Environment=
 Setup
> -script based workflow (see :ref:`running_the_ext_sdk_env`) provided by Y=
octo's
> -SDK or eSDK:
> +``devtool ide-sdk`` can do this in one of two modes: the default
> +:ref:`"modified" <dev-manual/devtool:modified mode>` mode, which uses th=
e
> +workspace created by ``devtool modify`` together with BitBake's per-reci=
pe
> +:term:`Sysroots <Sysroot>`; and
> +:ref:`"shared" <dev-manual/devtool:shared sysroots mode>` mode
> +(``--mode=3Dshared``), which instead bootstraps a full SDK/eSDK-like
> +environment with shared :term:`Sysroots <Sysroot>`, for cases where the
> +default ``devtool``/``bitbake`` integration is not suitable. Both modes =
can
> +also be :ref:`combined <dev-manual/devtool:combining modified and shared=
 mode>`
> +by repeating the ``--mode`` option. All of this is covered in more detai=
l
> +below.
> +
> +Modified mode
> +-------------
> +
> +Design and architecture
> +^^^^^^^^^^^^^^^^^^^^^^^^

There is slightly too many ^ here, and actually those should be ~. This wil=
l
also change the underline for the lower sections below. As a helper this is=
 the
layout:

    Book                =3D> overline =3D=3D=3D   (Title)
      Chapter           =3D> overline ***   (1.)
        Section         =3D> =3D=3D=3D=3D           (1.1)
          Section       =3D> ----           (1.1.1)
            Section     =3D> ~~~~           (1.1.1.1)
              Section   =3D> ^^^^           (1.1.1.1.1)

> +
> +A key point of this design is that generating the SDK and the IDE
> +configuration is a separate step from actually working on the code. This=
 is
> +what sets ``devtool ide-sdk`` apart from the ``devtool build`` based wor=
kflow
> +(see :ref:`using_devtool`), where every edit/build/deploy/test iteration=
 goes
> +through ``devtool build`` and
> +``devtool deploy-target``, and therefore through ``bitbake``, every time=
.
> +``devtool ide-sdk`` is itself a ``bitbake`` ``tinfoil`` client, but it d=
rives
> +``bitbake`` only to generate the SDK, i.e. to build the recipe (and the
> +image) so that their :term:`WORKDIR` is fully populated. Once the SDK is
> +there, editing the source code, building, deploying and debugging all ha=
ppen
> +directly in the IDE, independently of ``devtool ide-sdk`` and without ca=
lling
> +``bitbake`` for every change: ``devtool ide-sdk`` generates an IDE
> +configuration that points the IDE directly at the build tool, the
> +cross-toolchain and the debugger provided by the SDK. ``devtool ide-sdk`=
`
> +only needs to be re-run later on, e.g. if a recipe's dependencies or its
> +build configuration change.
> +
> +Let's now take a closer look at how ``devtool ide-sdk`` and the generate=
d IDE
> +configuration make use of a regular ``bitbake`` environment as a SDK to
> +achieve this, covering both the build and the remote debug session.
> +``devtool ide-sdk`` needs at least one recipe in ``devtool modify`` stat=
e
> +(i.e. using :ref:`ref-classes-externalsrc` to build from the workspace) =
and
> +an image recipe that is used for the development. ``devtool ide-sdk`` re=
ads
> +all the details of how ``bitbake`` builds the recipe via the ``tinfoil``
> +API, and uses this information to:
> +
> +-  Call ``bitbake`` to compile all the parts of the SDK.
> +
> +-  Replicate ``bitbake``'s exact build configuration into an IDE configu=
ration
> +   for working on that recipe's source; a separate IDE configuration, i.=
e. a
> +   separate recipe workspace instance (see below), is generated for ever=
y
> +   recipe.
> +
> +The recipe's :term:`WORKDIR` already contains everything needed for
> +cross-development. Let's briefly recap how ``bitbake`` normally builds a
> +recipe, up to :ref:`ref-tasks-install`:
> +
> +-  :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` build the
> +   sources into :term:`B`, the build directory, using the native,
> +   host-runnable tools in :term:`RECIPE_SYSROOT_NATIVE`
> +   (``recipe-sysroot-native``) --- e.g. the build tool (``cmake``), the
> +   cross-compiler, and the debugger (``gdb``) --- against the target
> +   headers and libraries in :term:`RECIPE_SYSROOT` (``recipe-sysroot``).
> +
> +-  :ref:`ref-tasks-install` installs the compiled output (``make install=
``)
> +   into :term:`D` (``image``), where the unstripped, but relocated binar=
ies,
> +   as well as additionally installed files, end up.
> +
> +The exact same tools and locations are used by an IDE configured by
> +``devtool ide-sdk``. The source code itself, :term:`S`, is not
> +part of ``WORKDIR`` in this workflow: it is the source tree extracted by

s/``WORKDIR``/:term:`WORKDIR`/

> +``devtool modify`` into the ``devtool`` workspace, which is exactly wher=
e
> +the IDE opens and edits it. From this, ``devtool ide-sdk``
> +generates an IDE configuration (e.g. a build tool preset and a debugger
> +launch configuration) that simply points the IDE at the existing build
> +tool binary in ``recipe-sysroot-native``. From then on, the IDE calls
> +that build tool directly, without going through ``devtool ide-sdk`` or
> +``bitbake`` again, but with the exact same configuration ``bitbake`` or
> +``devtool build`` would use, e.g. a generated CMakePreset or Meson cross
> +file that points to the cross-compiler in
> +``recipe-sysroot-native`` and the target sysroot in ``recipe-sysroot``.
> +
> +For remote debugging, the IDE manages a debugger (e.g. GDB) on the host
> +instead --- the debugger itself is one of those native tools in
> +``recipe-sysroot-native`` too. The debugger gets its debug symbols for
> +the recipe's own binary from ``D``, and for every other shared library o=
n
> +the target from the ``rootfs-dbg`` directory in the image recipe's
> +``WORKDIR`` (see the note above about ``image-combined-dbg``). The

s/``WORKDIR``/:term:`WORKDIR`/

There is no note about image-combined-dbg above this. Where did you want to=
 link
to? Could we xref instead using rST :ref:?

> +debugger then connects to a debug-server (e.g. ``gdbserver``) running on
> +the target device, which launches or attaches to the actual application
> +binary there.
> +
> +The same architecture also allows the IDE to be configured to use furthe=
r
> +tools beyond the build tool, cross-compiler and debugger, e.g.
> +``clang-tidy``: any such tool just needs to be added as a native tool in
> +``recipe-sysroot-native``, in the Yocto reproducible way, for
> +``devtool ide-sdk`` to be able to point the IDE at it.
> +
> +To summarize the design described above, for supported build systems
> +modified mode brings two key benefits:
> =20
>  -  The source code of the recipe is in the workspace created by
>     ``devtool modify`` or ``devtool add``.
> @@ -428,333 +554,547 @@ SDK or eSDK:
>     configuration at any time.
> =20
>  -  ``devtool ide-sdk`` aims to support multiple programming languages an=
d
> -   multiple IDEs natively. "Natively" means that the IDE is configured t=
o call
> -   the build tool (e.g. ``cmake`` or ``meson``) directly. This has sever=
al
> -   advantages.
> -   First of all, it is usually much faster to call for example ``cmake``=
 than
> -   ``devtool build``.
> -   It also allows to benefit from the very good integration that IDEs li=
ke
> -   VSCode offer for tools like CMake or GDB.
> -
> -   However, supporting many programming languages and multiple
> -   IDEs is quite an elaborate and constantly evolving thing. Support for=
 IDEs
> -   is therefore implemented as plugins. Plugins can also be provided by
> -   optional layers.
> -
> -So much about the introduction to the default mode of ``devtool sdk-ide`=
` which
> -is called the "modified" mode because it uses the workspace created by
> -``devtool modify`` and the per recipe :term:`Sysroots <Sysroot>` of BitB=
ake.
> -
> -For some recipes and use cases, this default behavior of ``devtool ide-s=
dk``
> -with full ``devtool`` and ``bitbake`` integration might not be suitable.
> -To offer full feature parity with the SDK and the eSDK, ``devtool ide-sd=
k`` has
> -a second mode called "shared" mode.
> -If ``devtool ide-sdk`` is called with the ``--mode=3Dshared`` option, it
> -bootstraps an SDK directly from the BitBake environment, which offers th=
e same
> -Environment Setup script as described in :ref:`running_the_ext_sdk_env`.
> -In addition to the (e)SDK installer-based setup, the IDE gets configured
> -to use the shared :term:`Sysroots <Sysroot>` and the tools from the SDK.
> -``devtool ide-sdk --mode=3Dshared`` is basically a wrapper for the setup=
 of the
> -extensible SDK as described in :ref:`setting_up_ext_sdk_in_build`.
> -
> -The use of ``devtool ide-sdk`` is an alternative to using one of the SDK
> -installers.
> -``devtool ide-sdk`` allows the creation of SDKs that offer all the
> -functionality of the SDK and the eSDK installers. Compared to the instal=
lers,
> -however, the SDK created with ``devtool ide-sdk`` is much more flexible.
> -For example, it is very easy to change the :term:`MACHINE` in the
> -:ref:`structure-build-conf-local.conf` file, update the layer meta data =
and then regenerate the SDK.
> -
> -Let's take a look at an example of how to use ``devtool ide-sdk`` in eac=
h of
> -the two modes:
> -
> -#. *Modified mode*:
> -
> -   In order to use the ``devtool ide-sdk``, a few settings are needed. A=
s a
> -   starting example, the following lines of code can be added to the
> -   :ref:`structure-build-conf-local.conf` file::
> -
> -      # Build the companion debug file system
> -      IMAGE_GEN_DEBUGFS =3D "1"
> -      # Optimize build time: with devtool ide-sdk the dbg tar is not nee=
ded
> -      IMAGE_FSTYPES_DEBUGFS =3D ""
> -      # Without copying the binaries into roofs-dbg, GDB does not find a=
ll source files.
> -      IMAGE_CLASSES +=3D "image-combined-dbg"
> -
> -      # SSH is mandatory, no password simplifies the usage
> -      EXTRA_IMAGE_FEATURES +=3D "\
> -         ssh-server-openssh \
> -         allow-empty-password \
> -         allow-root-login \
> -         empty-root-password \
> -      "
> -
> -      # Remote debugging needs gdbserver on the target device
> -      IMAGE_INSTALL:append =3D " gdbserver"
> -
> -      # Add the recipes which should be modified to the image
> -      # Otherwise some dependencies might be missing.
> -      IMAGE_INSTALL:append =3D " my-recipe"
> -
> -   Assuming the BitBake environment is set up correctly and a workspace =
has
> -   been created for the recipe using ``devtool modify my-recipe`` or pro=
bably
> -   even better by using ``devtool modify my-recipe --debug-build``, the
> -   following command can create the SDK and the configuration for VSCode=
 in
> -   the recipe workspace::
> -
> -      $ devtool ide-sdk my-recipe core-image-minimal --target root@192.1=
68.7.2
> -
> -   The command requires an image recipe (``core-image-minimal`` for this
> -   example) that is used to create the SDK.
> -   This firmware image should also be installed on the target device.
> -   It is possible to pass multiple package recipes::
> -
> -      $ devtool ide-sdk my-recipe-1 my-recipe-2 core-image-minimal --tar=
get root@192.168.7.2
> -
> -   ``devtool ide-sdk`` tries to create an IDE configuration for all pack=
age
> -   recipes.
> -
> -   What this command does exactly depends on the recipe, more precisely =
on the
> -   build tool used by the recipe. The basic idea is to configure the IDE=
 so
> -   that it calls the build tool exactly as ``bitbake`` does.
> -
> -   For example, a CMake preset is created for a recipe that inherits
> -   :ref:`ref-classes-cmake`. In the case of VSCode, CMake presets are su=
pported
> -   by the CMake Tools plugin. This is an example of how the build config=
uration
> -   used by ``bitbake`` is exported to an IDE configuration that gives ex=
actly
> -   the same build results.
> -
> -   Support for remote debugging with seamless integration into the IDE i=
s
> -   important for a cross-SDK. ``devtool ide-sdk`` automatically generate=
s the
> -   necessary helper scripts for deploying the compiled artifacts to the =
target
> -   device as well as the necessary configuration for the debugger and th=
e IDE.
> -
> -   .. note::
> -
> -      To ensure that the debug symbols on the build machine match the bi=
naries
> -      running on the target device, it is essential that the image built=
 by
> -      ``devtool ide-sdk`` is running on the target device.
> -
> -   The default IDE is VSCode. Some hints about using VSCode:
> -
> -   -  VSCode can be used to work on the BitBake recipes or the applicati=
on
> -      source code.
> -      Usually there is one instance of VSCode running in the folder wher=
e the
> -      BitBake recipes are. This instance has the
> -      `Yocto Project BitBake plugin <https://marketplace.visualstudio.co=
m/items?itemName=3Dyocto-project.yocto-bitbake>`_
> -      running.
> -
> -      .. warning::
> -
> -         Some VSCode plugins (Python, BitBake and others) need a reasona=
ble
> -         configuration to work as expected. Otherwise, some plugins try =
to
> -         index the build directory of BitBake, which keeps your system q=
uite
> -         busy until an out of memory exception stops this nonsense.
> -         Other plugins, such as the BitBake plugin, do not behave as exp=
ected.
> -
> -         To work around such issues, the ``oe-init-build-env`` script cr=
eates
> -         an initial ``.vscode/settings.json`` file if ``code`` can be fo=
und
> -         and the ``.vscode`` folder does not yet exist.
> -         It is best to run ``oe-init-build-env`` once before starting VS=
Code.
> -         An alternative approach is to use a build folder outside the la=
yers,
> -         e.g. ``oe-init-build-env ../build``.
> -
> -      The BitBake plugin also offers to create devtool workspaces and ru=
n
> -      ``devtool ide-sdk`` with a few mouse clicks.
> -      Of course, issuing commands in the terminal works as well.
> -
> -   -  To work on the source code of a recipe another instance of VSCode =
is
> -      started in the recipe's workspace. Example::
> -
> -         code build/workspace/sources/my-recipe
> +   multiple IDEs natively, meaning the IDE is configured to call the bui=
ld
> +   tool (e.g. ``cmake`` or ``meson``) directly. This has two main advant=
ages:
> +   it is usually much faster than calling ``devtool build``, and it lets=
 you
> +   benefit from the integration that IDEs like VSCode offer for tools su=
ch as
> +   CMake or GDB.
> +
> +   Supporting many programming languages and IDEs is an elaborate,
> +   constantly evolving task, so support for IDEs is implemented as plugi=
ns.
> +   Optional layers can also provide plugins.
> +
> +   For recipes using a programming language or build system not yet supp=
orted
> +   by ``devtool ide-sdk``, an IDE configuration which uses the
> +   ``devtool build`` based workflow described above is generated as a
> +   fallback.
> +
> +``devtool ide-sdk`` is an alternative to using one of the SDK installers=
,
> +i.e. the standard SDK built by the :ref:`ref-classes-populate-sdk` class
> +(``bitbake -c populate_sdk``) or the extensible SDK (eSDK) built by the
> +:ref:`populate_sdk_ext <ref-classes-populate-sdk-*>` class
> +(``bitbake -c populate_sdk_ext``): it can create SDKs offering all the
> +functionality of the SDK and eSDK installers, but is much more flexible.
> +For example, it is very easy to change :term:`MACHINE` in the
> +:ref:`structure-build-conf-local.conf` file, update the layer metadata, =
and then regenerate the
> +SDK. When a :ref:`overview-manual/concepts:shared state cache` is
> +available, e.g. shared between developers or with the autobuilder,
> +building an SDK installer becomes less important in the first place, as
> +:doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-env=
ironment-setup>`
> +can quickly replicate the layers and build configuration, and
> +``devtool ide-sdk`` can then quickly regenerate an equivalent SDK straig=
ht
> +from that cache.
> +
> +Let's take a look at an example of how to use ``devtool ide-sdk``.
> +
> +Setting up SSH access
> +^^^^^^^^^^^^^^^^^^^^^^

There is slightly too many ^ here

> +
> +In order to use ``devtool ide-sdk``, SSH access to the target is needed,=
 i.e.
> +the image needs an SSH server (``ssh-server-dropbear`` or
> +``ssh-server-openssh``). See the
> +":ref:`dev-manual/customizing-images:Customizing Images Using Custom \`\=
`IMAGE_FEATURES\`\` and \`\`EXTRA_IMAGE_FEATURES\`\``"
> +section for how to add it, and the ":ref:`ref-manual/features:image feat=
ures`"
> +section of the Yocto Project Reference Manual for the related
> +``allow-root-login``, ``allow-empty-password`` and ``empty-root-password=
``
> +features. To simplify usage during development, the
> +:ref:`ref-fragments-root-login-with-empty-password` configuration fragme=
nt
> +enables a passwordless root login over SSH.
> +
> +.. note::
> +
> +   ``devtool ide-sdk`` automatically adds everything else needed for
> +   debugging, e.g. ``IMAGE_GEN_DEBUGFS``, ``IMAGE_FSTYPES_DEBUGFS``, the

:term:`IMAGE_GEN_DEBUGFS` and :term:`IMAGE_FSTYPES_DEBUGFS` could be used h=
ere I
believe.

> +   :oecore_path:`image-combined-dbg <meta/classes-recipe/image-combined-=
dbg.bbclass>`
> +   class, ``gdbserver``/``lldb-server``, and the
> +   recipes being worked on. It writes only the settings it still needs
> +   into the image recipe's ``.bbappend`` file in the workspace, and

s/in the workspace/in the ``devtool`` workspace/

> +   removes them again once they are no longer required, so there is no
> +   need to add any of this to ``local.conf`` manually.
> +
> +Generating the SDK and IDE configuration
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There is slightly too many ^ here

> +
> +Assuming the BitBake environment is set up correctly and a workspace has
> +been created for the recipe using ``devtool modify my-recipe`` (or, for =
a
> +more useful debug build, ``devtool modify my-recipe --debug-build``), th=
e
> +following command can create the SDK and the configuration for VSCode in

The command below doesn't really match what the --ide option says:

  -i, --ide {none,code,all} IDE to setup the configuration for. May be spec=
ified
  multiple times to set up more than one IDE. "all" sets up every supported=
 IDE
  (choices: none, code, all, default: none)

As the default is "none" I would assume the command below doesn't configure=
 an
IDE at all, but you said it configured it for VSCode?

> +the recipe workspace::

s/the recipe workspace/the recipe's ``devtool`` workspace/

> +
> +   $ devtool ide-sdk my-recipe core-image-minimal --target root@192.168.=
7.2
> +
> +The command requires an image recipe (``core-image-minimal`` for this
> +example) that is used to create the SDK.
> +This firmware image should also be installed on the target device.
> +It is possible to pass multiple package recipes::

s/package recipes/recipes/

I believe we're not talking about package names here

> +
> +   $ devtool ide-sdk my-recipe-1 my-recipe-2 core-image-minimal --target=
 root@192.168.7.2
> +
> +If only an image recipe is passed, all recipes currently modified in the
> +workspace (i.e. everything with a ``<workspace>/appends/*.bbappend`` fil=
e)

s/workspace/``devtool`` workspace/

I'm just trying to be non-ambiguous here as workspace could mean lots of th=
ings=E2=80=A6
but this might already be used as-is in other places of the devtool
documentation. It doesn't hurt to be clear here at least. Please check in t=
he
rest of the patch if other occurrences could be replaced to mention "``devt=
ool``
workspace".

> +are used automatically, so the above is usually equivalent to just::
> +
> +   $ devtool ide-sdk core-image-minimal --target root@192.168.7.2
> +
> +What exactly this command does depends on the build tool used by the
> +recipe. The basic idea is to configure the IDE to call the build tool
> +exactly as ``bitbake`` does.
> +
> +For example, for a recipe that inherits :ref:`ref-classes-cmake`, a CMak=
e
> +preset is created; VSCode's CMake Tools plugin supports these presets
> +directly. This shows how the build configuration used by ``bitbake`` is
> +exported to an IDE configuration that produces exactly the same build
> +results.
> +
> +Seamless remote debugging support is important for a cross-SDK.
> +``devtool ide-sdk`` automatically generates the helper scripts needed to
> +deploy compiled artifacts to the target device, as well as the
> +configuration needed for the debugger and the IDE.
> +
> +.. note::
> +
> +   To ensure that the debug symbols on the build machine match the binar=
ies
> +   running on the target device, it is essential that the image built by
> +   ``devtool ide-sdk`` is running on the target device.
> +
> +Debugging on a target
> +^^^^^^^^^^^^^^^^^^^^^^
> +
> +The target is selected with ``--target``, which takes an SSH destination
> +(``[user@]host``, default ``root@192.168.7.2``), and ``--port`` if SSH l=
istens
> +on a port other than 22. It can be a real device, a :doc:`QEMU <qemu>` i=
nstance or any other
> +device running the image built by ``devtool ide-sdk``.
> +
> +Every debug configuration consumes one debug server port on the target,
> +counting up from ``1234``. Use ``--gdbserver-port-start`` to start at a
> +different port, e.g. to run several ``devtool ide-sdk`` instances on the=
 same
> +host at the same time. The option applies to all debug servers, i.e. to
> +``gdbserver`` as well as ``lldb-server``.
> +
> +If the ssh host key of the target changes frequently, e.g. because the t=
arget
> +is re-flashed often, use ``--no-host-check`` to disable ssh host key che=
cking.
> +
> +QEMU target with slirp networking
> +"""""""""""""""""""""""""""""""""
> +
> +A QEMU target started with ``runqemu slirp`` (see the ``slirp`` option i=
n
> +":ref:`dev-manual/qemu:\`\`runqemu\`\` command-line options`") needs no =
root
> +privileges, but is only reachable through forwarded host ports.
> +``devtool ide-sdk`` supports this
> +setup: it adds the port forwards required by the debug servers to
> +``QB_SLIRP_OPT`` in the image's ``.bbappend`` file, so that ``runqemu`` =
reads
> +them from the image's ``.qemuboot.conf`` file::
> +
> +   $ devtool ide-sdk my-recipe core-image-minimal --target root@localhos=
t --port 2222
> +   $ runqemu slirp serialstdio snapshot
> +
> +QEMU instances reached through slirp get a new ssh host key on every boo=
t.
> +Therefore, ssh host key checking is disabled automatically for the loopb=
ack
> +targets ``localhost``, ``127.0.0.1`` and ``::1``, and ``--no-host-check`=
` is
> +not needed.
> +
> +Booting the target from an NFS-exported root filesystem
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There is slightly too many ^ here

> +
> +As an alternative to installing the image and deploying build output ove=
r
> +SSH for every debug session, ``devtool ide-sdk`` can boot the target fro=
m
> +an NFS-exported root filesystem, automating the manual
> +:ref:`dev-manual/qemu:running under a network file system (nfs) server`
> +workflow. Passing ``--nfs=3Drootfs`` (or ``--nfs=3Drootfs-dbg`` to also =
include
> +the debug filesystem) extracts the selected root filesystem below
> +``<workspace>/nfs-exports/<image-recipe>/`` and generates a
> +``runqemu-rootfs``/``runqemu-rootfs-dbg`` helper script to boot QEMU wit=
h
> +that root filesystem mounted over NFS::
> +
> +   $ devtool ide-sdk my-recipe core-image-minimal --nfs=3Drootfs-dbg --t=
arget root@192.168.7.2
> +   $ build/workspace/nfs-exports/core-image-minimal/runqemu-rootfs-dbg n=
ographic
> +
> +This changes the relationship between the SDK, the target device and the
> +debug symbols compared to the architecture described above: instead of a
> +separate ``rootfs`` booted by the target and a ``rootfs-dbg`` only
> +consulted by the debugger on the host, both the target and the debugger
> +now use the same NFS-exported ``rootfs-dbg``.
> +
> +Use ``--nfs-extract-dir=3DDIR`` to extract below ``DIR/<image-recipe>/``
> +instead of the default location in the workspace, for example when the N=
FS
> +server may only export a particular directory. Note that every
> +``devtool ide-sdk --nfs`` run re-extracts the root filesystem from scrat=
ch,
> +which discards everything previously deployed into it.
> +
> +To boot a real hardware target instead of QEMU, ``devtool ide-sdk --nfs`=
`
> +also generates an ``export-hw-rootfs`` (or ``export-hw-rootfs-dbg``) hel=
per
> +script next to the ``runqemu`` helper. It exports the root filesystem wi=
th
> +``runqemu-export-rootfs`` and serves :term:`DEPLOY_DIR_IMAGE` over HTTP
> +(port 8080 by default, set the ``PORT`` environment variable to change i=
t),
> +so that a boot loader (e.g. U-Boot with its ``wget`` command) can fetch =
the
> +kernel while the root filesystem is mounted over NFS. Since the target
> +hardware and boot loader setup differ widely, this script covers the typ=
ical
> +case and is meant to be adapted as needed. Like the ``runqemu`` helper, =
it
> +requires the build environment to be sourced.

I didn't really understand where this script was deployed, what do you mean=
 by
"deployed next to the ``runqemu`` helper"? runqemu in under scripts/ in OE-=
Core,
this is not the case for export-hw-rootfs{,-dbg} as far as I can see.

> +
> +Deploying build output then copies the recipe's build artifacts directly

This sentence feels off. Not sure I get what is deployed/deploying here.

> +into the exported directory on the host, without any SSH transfer: since
> +that directory already lives on the build machine rather than on a remot=
e
> +target, ``devtool deploy-target`` only needs a local file copy there.

Ok, but what the `devtool deploy-target` command the user is supposed to ru=
n,
then? Can you add an example?

something like:

  devtool deploy-target my-recipe workspace/nfs-exports/<image-recipe>/root=
fs-dbg

?

> +
> +Without ``--nfs=3Drootfs-dbg``, the debugger looks up the debug symbols =
and
> +source files of other recipes' shared libraries (i.e. everything besides
> +the recipe(s) being worked on) inside the ``rootfs-dbg`` folder of the
> +image's build directory, which is only refreshed by rebuilding the whole
> +image. With ``--nfs=3Drootfs-dbg``, those same lookups are pointed at th=
e
> +NFS-exported ``rootfs-dbg`` instead --- the same directory the target
> +already boots from and that ``devtool deploy-target`` writes into. This
> +avoids rebuilding the whole image just to refresh debug information afte=
r
> +an incremental change, speeding up the edit/build/debug cycle.

To me this almost feels like this should be default behavior, I don't see w=
hy
one would not pass --nfs=3Drootfs-dbg (would they pass --nfs=3Drootfs inste=
ad?)

> +
> +Since the target is booted directly from ``rootfs-dbg``, the debug symbo=
ls
> +are also present on the target itself, not just on the development host.
> +This relies on the
> +:oecore_path:`image-combined-dbg <meta/classes-recipe/image-combined-dbg=
.bbclass>`
> +class (see the note above, enabled automatically), which combines the
> +unstripped binaries and their debug symbols into ``rootfs-dbg``, unlike =
a
> +plain ``rootfs`` where symbols are split out into separate ``-dbg``
> +packages that are not installed.
> +Having them together on the target makes tools like ``perf`` or
> +``trace-cmd``, run directly on the target, produce properly symbolicated
> +output. The same debug symbols are also useful to obtain test code
> +coverage.
> +
> +Using VSCode
> +^^^^^^^^^^^^
> +
> +The default IDE is VSCode. Some hints about using VSCode:

Ha, I guess I got my answer for the question above=E2=80=A6 so the current =
option
description for --ide is wrong (it says it default to --ide=3Dnone)?

> +
> +-  VSCode can be used to work on the BitBake recipes or the application
> +   source code.
> +   Usually there is one instance of VSCode running in the folder where t=
he
> +   BitBake recipes are. This instance has the
> +   `Yocto Project BitBake plugin <https://marketplace.visualstudio.com/i=
tems?itemName=3Dyocto-project.yocto-bitbake>`_
> +   running.
> +
> +   .. warning::
> +
> +      Some VSCode plugins (Python, BitBake and others) try to index ever=
y
> +      file in the workspace, which can make your system unusable while i=
t
> +      churns through large generated directories. A build environment se=
t
> +      up with ``bitbake-setup`` avoids this for this "meta" instance: it
> +      generates (and keeps updated) a ``bitbake.code-workspace`` multi-r=
oot
> +      workspace file with appropriate excludes for the layers and
> +      ``build/conf``. For each per-recipe workspace instance (see below)=
,
> +      ``devtool ide-sdk`` generates its own ``settings.json`` with a
> +      similar ignore list, excluding directories such as ``oe-workdir``
> +      and ``oe-logs``.
> +
> +   The BitBake plugin also offers to create devtool workspaces and run
> +   ``devtool ide-sdk`` with a few mouse clicks.
> +   Of course, issuing commands in the terminal works as well.
> +
> +-  To work on the source code of a recipe another instance of VSCode is
> +   started in the recipe's workspace. Example::
> +
> +      code build/workspace/sources/my-recipe
> +
> +   This instance of VSCode uses plugins that are useful for the developm=
ent
> +   of the application. ``devtool ide-sdk`` generates the necessary
> +   ``extensions.json``, ``settings.json``, ``tasks.json`` and ``launch.j=
son``
> +   configuration files for all the involved plugins.
> +
> +   When the source code folder present in the workspace folder is opened=
 in
> +   VSCode for the first time, a pop-up message recommends installing the
> +   required plugins.
> +   After accepting the installation of the plugins, working with the sou=
rce
> +   code or some debugging tasks should work as usual with VSCode.
> +
> +   Starting the VSCode instances in the recipe workspace folders can als=
o be
> +   done by a mouse click on the recipe workspaces in the first VSCode
> +   instance.
> +
> +-  To work with CMake press ``Ctrl + Shift + p``, type ``cmake``. This w=
ill
> +   show some possible commands like selecting a CMake preset, compiling =
or
> +   running CTest.
> +
> +   For recipes inheriting :ref:`ref-classes-cmake-qemu` rather than
> +   :ref:`ref-classes-cmake`, executing cross-compiled unit tests on the =
host
> +   can be supported transparently with QEMU user-mode.
> +
> +-  To work with Meson press ``Ctrl + Shift + p``, type ``meson``. This w=
ill
> +   show some possible commands like compiling or executing the unit test=
s.
> +
> +   A note on running cross-compiled unit tests on the host: Meson enable=
s
> +   support for QEMU user mode by default. It is expected that the execut=
ion
> +   of the unit tests from the IDE will work without any additional steps=
,
> +   given that the code is suitable for the execution on the host machine=
.
> +
> +-  For C/C++ IntelliSense (code completion, navigation and diagnostics),
> +   ``devtool ide-sdk`` configures either the ``clangd`` language server =
or
> +   Microsoft's C/C++ extension (``cpptools``), matched to the recipe's r=
eal
> +   cross-compiler via the generated ``compile_commands.json``. ``clangd`=
`
> +   is used automatically for recipes built with the LLVM/clang toolchain=
;
> +   other recipes default to ``cpptools``, but can opt into ``clangd`` to=
o
> +   by setting the recipe's ``IDE_SDK_INTELLISENSE`` variable to "clangd"=
.
> +   When ``clangd`` is used and the recipe's source tree contains a
> +   ``.clang-format`` file, ``devtool ide-sdk`` also configures VSCode to
> +   format C/C++ files with ``clangd`` on save, honoring that style file.
> +
> +-  For the deployment to the target device, just press ``Ctrl + Shift + =
p``,
> +   type ``task``.  Select ``install && deploy-target``. This runs only
> +   :ref:`ref-tasks-install` through BitBake, so that the build results
> +   produced by the IDE are kept, and then deploys its output.
> +
> +   By default, every file installed by the recipe is deployed (except
> +   files that only end up in a ``-staticdev``, ``-dbg`` or ``-src``
> +   package, which are not useful on a live target). Use the ``--package`=
`
> +   and/or ``--file-glob`` options of ``devtool ide-sdk`` (or
> +   ``devtool deploy-target``) to deploy only a subset of the installed
> +   files, for example ``--package my-recipe-tests`` or
> +   ``--file-glob "/usr/bin/*"``. Both options may be given multiple time=
s
> +   and combined, and may be prefixed with ``RECIPE:`` (e.g.
> +   ``--package "RECIPE:,-doc"``) to scope the option to one of several
> +   recipes being processed by a single ``devtool ide-sdk`` invocation.
> +
> +-  For remote debugging, switch to the debugging view by pressing the "p=
lay"
> +   button with the ``bug icon`` on the left side. This will provide a gr=
een
> +   play button with a drop-down list where a debug configuration can be
> +   selected.  After selecting one of the generated configurations, press=
 the
> +   "play" button.
> +
> +   Starting a remote debugging session automatically initiates the
> +   deployment to the target device. If this is not desired, the
> +   ``"dependsOn": ["install && deploy-target...]`` parameter of the task=
s
> +   with ``"label": "gdbserver start...`` can be removed from the
> +   ``tasks.json`` file.
> +
> +   VSCode supports GDB in many different setups and configurations for
> +   many different use cases. However, most of these have limitations for
> +   cross-development: they support only a few target architectures, or
> +   require a high performance target device. ``devtool ide-sdk``
> +   therefore uses the classic, generic setup: GDB on the development hos=
t
> +   and gdbserver on the target device.
> +
> +   For recipes built with the LLVM/clang toolchain (:term:`TOOLCHAIN` se=
t
> +   to "clang"), ``devtool ide-sdk`` automatically uses LLDB and
> +   ``lldb-server`` instead of GDB and ``gdbserver``, with no extra
> +   command-line option needed. GDB and LLDB can be used side by side whe=
n
> +   several recipes using different toolchains are processed by the same
> +   ``devtool ide-sdk`` invocation.
> +
> +   For a recipe whose binary is started by ``systemd`` or a SysV init

I feel like this should be a separate bullet point and not attached to the
GBB/LLDB not above.

> +   script (i.e. it runs as a persistent service rather than being starte=
d
> +   directly by the debugger), an additional "Attach" debug configuration
> +   is generated alongside the regular one. Selecting it attaches the
> +   debugger to the already-running instance of the service on the target
> +   instead of starting a new one.
> +
> +   Roughly summarized, this means:
> +
> +   -  The binaries are copied via SSH to the remote target device by a
> +      script referred by ``tasks.json``.
> +
> +   -  gdbserver is started on the remote target device via SSH by a scri=
pt
> +      referred by ``tasks.json``.
> +
> +      Changing the parameters that are passed to the debugging executabl=
e
> +      requires modifying the generated script. The script is located at
> +      ``oe-scripts/gdbserver_*``. Defining the parameters in the ``args`=
`
> +      field in the ``launch.json`` file does not work.
> +
> +   -  VSCode connects to gdbserver as documented in
> +      `Remote debugging or debugging with a local debugger server
> +      <https://code.visualstudio.com/docs/cpp/launch-json-reference#_rem=
ote-debugging-or-debugging-with-a-local-debugger-server>`__.
> +
> +Selecting the IDE
> +^^^^^^^^^^^^^^^^^
> +
> +The ``--ide`` option selects the IDE plugin. It can be given multiple ti=
mes
> +to configure several IDEs in one invocation, and ``--ide=3Dall`` configu=
res
> +every supported IDE::
> +
> +   $ devtool ide-sdk my-recipe core-image-minimal --ide=3Dcode --ide=3Dn=
one
> +   $ devtool ide-sdk my-recipe core-image-minimal --ide=3Dall
> +
> +Support for further IDEs is implemented as plugins, which optional layer=
s
> +can provide as well.
> +
> +Debugging without an IDE
> +^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Additionally ``--ide=3Dnone`` is supported. With the ``none`` IDE parame=
ter,
> +some generic configuration files like ``gdbinit`` files and some helper
> +scripts starting gdbserver remotely on the target device as well as the =
GDB
> +client on the host are generated.
> +
> +Example: ``cmake-example`` walkthrough
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Here is a usage example for the ``cmake-example`` recipe from the
> +``meta-selftest`` layer which inherits :ref:`ref-classes-cmake-qemu`:
> +
> +.. code-block:: sh

Nitpick, but this should be .. code-block:: console, and commands should be
prefixed with "$ ", e.g.:

.. code-block:: console

   # Create the SDK
   $ devtool modify cmake-example --debug-build
   $ devtool ide-sdk cmake-example core-image-minimal -c --ide=3Dnone

> +
> +   # Create the SDK
> +   devtool modify cmake-example --debug-build
> +   devtool ide-sdk cmake-example core-image-minimal -c --ide=3Dnone
> +
> +   # Install the firmware on a target device or start QEMU
> +   runqemu
> +
> +   # From exploring the workspace of cmake-example
> +   cd build/workspace/sources/cmake-example
> +
> +   # Find cmake-native and save the path into a variable
> +   # Note: using just cmake instead of $CMAKE_NATIVE would work in many =
cases
> +   CMAKE_NATIVE=3D"$(jq -r '.configurePresets[0] | "\(.cmakeExecutable)"=
' CMakeUserPresets.json)"
> +
> +   # List available CMake presets
> +   "$CMAKE_NATIVE" --list-presets
> +   Available configure presets:
> +
> +     "cmake-example-cortexa57" - cmake-example: cortexa57
> +
> +   # Re-compile the already compiled sources
> +   "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57
> +   ninja: no work to do.
> +   # Do a clean re-build
> +   "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target cle=
an
> +   [1/1] Cleaning all built files...
> +   Cleaning... 8 files.
> +   "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target all
> +   [7/7] Linking CXX executable cmake-example
> =20
> -      This instance of VSCode uses plugins that are useful for the devel=
opment
> -      of the application. ``devtool ide-sdk`` generates the necessary
> -      ``extensions.json``, ``settings.json``, ``tasks.json`` and ``launc=
h.json``
> -      configuration files for all the involved plugins.
> -
> -      When the source code folder present in the workspace folder is ope=
ned in
> -      VSCode for the first time, a pop-up message recommends installing =
the
> -      required plugins.
> -      After accepting the installation of the plugins, working with the =
source
> -      code or some debugging tasks should work as usual with VSCode.
> -
> -      Starting the VSCode instances in the recipe workspace folders can =
also be
> -      done by a mouse click on the recipe workspaces in the first VSCode
> -      instance.
> -
> -   -  To work with CMake press ``Ctrl + Shift + p``, type ``cmake``. Thi=
s will
> -      show some possible commands like selecting a CMake preset, compili=
ng or
> -      running CTest.
> -
> -      For recipes inheriting :ref:`ref-classes-cmake-qemu` rather than
> -      :ref:`ref-classes-cmake`, executing cross-compiled unit tests on t=
he host
> -      can be supported transparently with QEMU user-mode.
> -
> -   -  To work with Meson press ``Ctrl + Shift + p``, type ``meson``. Thi=
s will
> -      show some possible commands like compiling or executing the unit t=
ests.
> -
> -      A note on running cross-compiled unit tests on the host: Meson ena=
bles
> -      support for QEMU user mode by default. It is expected that the exe=
cution
> -      of the unit tests from the IDE will work without any additional st=
eps,
> -      given that the code is suitable for the execution on the host mach=
ine.
> +   # Run the cross-compiled unit tests with QEMU user-mode
> +   "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target tes=
t
> +   [0/1] Running tests...
> +   Test project .../build/tmp/work/cortexa57-poky-linux/cmake-example/1.=
0/cmake-example-1.0
> +       Start 1: test-cmake-example
> +   1/1 Test #1: test-cmake-example ...............   Passed    0.03 sec
> =20
> -   -  For the deployment to the target device, just press ``Ctrl + Shift=
 + p``,
> -      type ``task``.  Select ``install && deploy-target``.
> +   100% tests passed, 0 tests failed out of 1
> =20
> -   -  For remote debugging, switch to the debugging view by pressing the=
 "play"
> -      button with the ``bug icon`` on the left side. This will provide a=
 green
> -      play button with a drop-down list where a debug configuration can =
be
> -      selected.  After selecting one of the generated configurations, pr=
ess the
> -      "play" button.
> +   Total Test time (real) =3D   0.03 sec
> =20
> -      Starting a remote debugging session automatically initiates the
> -      deployment to the target device. If this is not desired, the
> -      ``"dependsOn": ["install && deploy-target...]`` parameter of the t=
asks
> -      with ``"label": "gdbserver start...`` can be removed from the
> -      ``tasks.json`` file.
> +   # Using CTest directly is possible as well
> +   CTEST_NATIVE=3D"$(dirname "$CMAKE_NATIVE")/ctest"
> =20
> -      VSCode supports GDB with many different setups and configurations =
for
> -      many different use cases.  However, most of these setups have some
> -      limitations when it comes to cross-development, support only a few=
 target
> -      architectures or require a high performance target device. Therefo=
re
> -      ``devtool ide-sdk`` supports the classic, generic setup with GDB o=
n the
> -      development host and gdbserver on the target device.
> -
> -      Roughly summarized, this means:
> -
> -      -  The binaries are copied via SSH to the remote target device by =
a
> -         script referred by ``tasks.json``.
> +   # List available CMake presets
> +   "$CTEST_NATIVE" --list-presets
> +   Available test presets:
> =20
> -      -  gdbserver is started on the remote target device via SSH by a s=
cript
> -         referred by ``tasks.json``.
> +     "cmake-example-cortexa57" - cmake-example: cortexa57
> =20
> -         Changing the parameters that are passed to the debugging execut=
able
> -         requires modifying the generated script. The script is located =
at
> -         ``oe-scripts/gdbserver_*``. Defining the parameters in the ``ar=
gs``
> -         field in the ``launch.json`` file does not work.
> +   # Run the cross-compiled unit tests with QEMU user-mode
> +   "$CTEST_NATIVE" --preset "cmake-example-cortexa57"
> +   Test project ...build/tmp/work/cortexa57-poky-linux/cmake-example/1.0=
/cmake-example-1.0
> +       Start 1: test-cmake-example
> +   1/1 Test #1: test-cmake-example ...............   Passed    0.03 sec
> =20
> -      -  VSCode connects to gdbserver as documented in
> -         `Remote debugging or debugging with a local debugger server
> -         <https://code.visualstudio.com/docs/cpp/launch-json-reference#_=
remote-debugging-or-debugging-with-a-local-debugger-server>`__.
> -
> -   Additionally ``--ide=3Dnone`` is supported. With the ``none`` IDE par=
ameter,
> -   some generic configuration files like ``gdbinit`` files and some help=
er
> -   scripts starting gdbserver remotely on the target device as well as t=
he GDB
> -   client on the host are generated.
> +   100% tests passed, 0 tests failed out of 1
> =20
> -   Here is a usage example for the ``cmake-example`` recipe from the
> -   ``meta-selftest`` layer which inherits :ref:`ref-classes-cmake-qemu`:
> +   Total Test time (real) =3D   0.03 sec
> =20
> -   .. code-block:: sh
> +   # Deploying the new build to the target device (default is QEUM at 19=
2.168.7.2)

s/QEUM/QEMU/

> +   oe-scripts/install_and_deploy_cmake-example-cortexa57
> =20
> -      # Create the SDK
> -      devtool modify cmake-example --debug-build
> -      devtool ide-sdk cmake-example core-image-minimal -c --ide=3Dnone
> +   # Start a remote debugging session with gdbserver on the target and G=
DB on the host
> +   oe-scripts/gdbserver_1234_usr-bin-cmake-example_m
> +   oe-scripts/gdb_1234_usr-bin-cmake-example
> +   break main
> +   run
> +   step
> +   stepi
> +   continue
> +   quit
> =20
> -      # Install the firmware on a target device or start QEMU
> -      runqemu
> +   # Stop gdbserver on the target device
> +   oe-scripts/gdbserver_1234_usr-bin-cmake-example_m stop
> =20
> -      # From exploring the workspace of cmake-example
> -      cd build/workspace/sources/cmake-example
> +Shared sysroots mode
> +--------------------
> =20
> -      # Find cmake-native and save the path into a variable
> -      # Note: using just cmake instead of $CMAKE_NATIVE would work in ma=
ny cases
> -      CMAKE_NATIVE=3D"$(jq -r '.configurePresets[0] | "\(.cmakeExecutabl=
e)"' CMakeUserPresets.json)"
> +Concept
> +^^^^^^^

Again this should be ~ not ^ underline

> =20
> -      # List available CMake presets
> -      "$CMAKE_NATIVE" --list-presets
> -      Available configure presets:
> +For some recipes and use cases, modified mode's full ``devtool``/``bitba=
ke``
> +integration might not be suitable. To offer full feature parity with the
> +SDK and the eSDK instead, ``--mode=3Dshared`` bootstraps an SDK directly
> +from the BitBake environment, offering the same Environment Setup script
> +as described in :ref:`running_the_ext_sdk_env`. The IDE is then configur=
ed
> +to use the shared :term:`Sysroots <Sysroot>` and tools from that SDK.
> +``devtool ide-sdk --mode=3Dshared`` is basically a wrapper around the se=
tup
> +of the extensible SDK as described in :ref:`setting_up_ext_sdk_in_build`=
.
> =20
> -        "cmake-example-cortexa57" - cmake-example: cortexa57
> +Shared mode can also be given an image recipe. The image is then built a=
s
> +part of the SDK, and IDE plugins can use it to generate image-based
> +configurations, e.g. for debugging with the debug symbols and sources of=
 the
> +image's ``rootfs-dbg``. As in modified mode, ``--nfs`` exports the image=
's
> +root filesystem (see
> +:ref:`dev-manual/devtool:booting the target from an nfs-exported root fi=
lesystem`),
> +which requires an image recipe::
> =20
> -      # Re-compile the already compiled sources
> -      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57
> -      ninja: no work to do.
> -      # Do a clean re-build
> -      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target =
clean
> -      [1/1] Cleaning all built files...
> -      Cleaning... 8 files.
> -      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target =
all
> -      [7/7] Linking CXX executable cmake-example
> +   $ devtool ide-sdk --mode=3Dshared core-image-minimal --nfs=3Drootfs-d=
bg --target root@192.168.7.2

Nit: use ".. code-block:: console" here instead (keep the "$ ").

> +
> +Example
> +^^^^^^^
> =20
> -      # Run the cross-compiled unit tests with QEMU user-mode
> -      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target =
test
> -      [0/1] Running tests...
> -      Test project .../build/tmp/work/cortexa57-poky-linux/cmake-example=
/1.0/cmake-example-1.0
> -          Start 1: test-cmake-example
> -      1/1 Test #1: test-cmake-example ...............   Passed    0.03 s=
ec
> +Creating an SDK with shared :term:`Sysroots <Sysroot>` that contains all=
 the
> +dependencies needed to work with ``my-recipe`` is possible with the foll=
owing
> +example command::
> +
> +   $ devtool ide-sdk --mode=3Dshared my-recipe
> =20
> -      100% tests passed, 0 tests failed out of 1
> +For VSCode the cross-toolchain is exposed as a CMake kit. CMake kits are

Add a link here to https://github.com/microsoft/vscode-cmake-tools/blob/390=
e3a0cd17f648cbfdaf8f2d4f56b8312428453/docs/kits.md?

> +defined in ``~/.local/share/CMakeTools/cmake-tools-kits.json``.
> +The following example shows how the cross-toolchain can be selected in
> +VSCode. First of all we need a folder containing a CMake project.
> +For this example, let's create a CMake project and start VSCode::
> +
> +   mkdir kit-test
> +   echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
> +   code kit-test
> +
> +If there is a CMake project in the workspace, cross-compilation is
> +supported:
> +
> +- Press ``Ctrl + Shift + P``, type ``CMake: Scan for Kits``
> +- Press ``Ctrl + Shift + P``, type ``CMake: Select a Kit``
> =20
> -      Total Test time (real) =3D   0.03 sec
> +Finally most of the features provided by CMake and the IDE should be
> +available.
> =20
> -      # Using CTest directly is possible as well
> -      CTEST_NATIVE=3D"$(dirname "$CMAKE_NATIVE")/ctest"
> +Other IDEs than VSCode are supported as well. However,
> +``devtool ide-sdk --mode=3Dshared --ide=3Dnone my-recipe`` is currently
> +just a simple wrapper for the setup of the extensible SDK, as described =
in
> +:ref:`setting_up_ext_sdk_in_build`.
> =20
> -      # List available CMake presets
> -      "$CTEST_NATIVE" --list-presets
> -      Available test presets:
> +Combining modified and shared mode
> +----------------------------------
> =20
> -        "cmake-example-cortexa57" - cmake-example: cortexa57
> +Modified mode configures the IDE for recipes in ``devtool modify`` state=
,
> +while shared mode provides a standalone cross-toolchain and shared
> +:term:`Sysroots <Sysroot>` for working on other source code. Repeating t=
he
> +``--mode`` option runs both workflows in a single invocation, so the ima=
ge
> +is built only once::
> =20
> -      # Run the cross-compiled unit tests with QEMU user-mode
> -      "$CTEST_NATIVE" --preset "cmake-example-cortexa57"
> -      Test project ...build/tmp/work/cortexa57-poky-linux/cmake-example/=
1.0/cmake-example-1.0
> -          Start 1: test-cmake-example
> -      1/1 Test #1: test-cmake-example ...............   Passed    0.03 s=
ec
> +   $ devtool modify my-recipe
> +   $ devtool ide-sdk --mode=3Dmodified --mode=3Dshared my-recipe other-r=
ecipe core-image-minimal
> =20
> -      100% tests passed, 0 tests failed out of 1
> +In this example:
> =20
> -      Total Test time (real) =3D   0.03 sec
> -
> -      # Deploying the new build to the target device (default is QEUM at=
 192.168.7.2)
> -      oe-scripts/install_and_deploy_cmake-example-cortexa57
> -
> -      # Start a remote debugging session with gdbserver on the target an=
d GDB on the host
> -      oe-scripts/gdbserver_1234_usr-bin-cmake-example_m
> -      oe-scripts/gdb_1234_usr-bin-cmake-example
> -      break main
> -      run
> -      step
> -      stepi
> -      continue
> -      quit
> -
> -      # Stop gdbserver on the target device
> -      oe-scripts/gdbserver_1234_usr-bin-cmake-example_m stop
> -
> -#. *Shared sysroots mode*
> -
> -   Creating an SDK with shared :term:`Sysroots <Sysroot>` that contains =
all the
> -   dependencies needed to work with ``my-recipe`` is possible with the f=
ollowing
> -   example command::
> -
> -      $ devtool ide-sdk --mode=3Dshared my-recipe
> -
> -   For VSCode the cross-toolchain is exposed as a CMake kit. CMake kits =
are
> -   defined in ``~/.local/share/CMakeTools/cmake-tools-kits.json``.
> -   The following example shows how the cross-toolchain can be selected i=
n
> -   VSCode. First of all we need a folder containing a CMake project.
> -   For this example, let's create a CMake project and start VSCode::
> -
> -      mkdir kit-test
> -      echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
> -      code kit-test
> -
> -   If there is a CMake project in the workspace, cross-compilation is
> -   supported:
> -
> -   - Press ``Ctrl + Shift + P``, type ``CMake: Scan for Kits``
> -   - Press ``Ctrl + Shift + P``, type ``CMake: Select a Kit``
> -
> -   Finally most of the features provided by CMake and the IDE should be
> -   available.
> -
> -   Other IDEs than VSCode are supported as well. However,
> -   ``devtool ide-sdk --mode=3Dshared --ide=3Dnone my-recipe`` is current=
ly
> -   just a simple wrapper for the setup of the extensible SDK, as describ=
ed in
> -   :ref:`setting_up_ext_sdk_in_build`.
> +-  ``my-recipe`` is in ``devtool modify`` state and gets its recipe-spec=
ific
> +   IDE configuration in its workspace, as described in
> +   :ref:`dev-manual/devtool:modified mode`.
> +
> +-  ``other-recipe`` is not modified. It is added to the shared sysroots,

To reuse the same wording: "``other-recipe`` is not in ``devtool modify`` s=
tate"

> +   which provide the environment setup script to build other source code=
 with
> +   the cross-toolchain, as described in
> +   :ref:`dev-manual/devtool:shared sysroots mode`.
> +
> +-  ``core-image-minimal`` provides the root filesystem for the remote
> +   debugging of both. Its ``rootfs-dbg`` provides the debug symbols and
> +   sources, and ``--nfs`` can export its root filesystem for the target.
> +
> +Without ``--mode=3Dmodified`` in the invocation, modified recipes are re=
jected,
> +and without ``--mode=3Dshared`` in the invocation, recipes that are not
> +modified are rejected. If ``--mode`` is omitted, modified mode is used.
> =20
>  Use ``devtool upgrade`` to Create a Version of the Recipe that Supports =
a Newer Version of the Software
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> @@ -895,6 +1235,9 @@ The following diagram shows the common development f=
low used with the
>        $ devtool deploy-target recipe target
> =20
>     The target is a live target machine running as an SSH server.
> +   Alternatively, ``target`` can be an absolute path to a local
> +   pseudo-managed rootfs directory, in which case the files are copied
> +   into it directly, without SSH.
> =20
>     You can, of course, also deploy the image you build using the
>     ``devtool build-image`` command to actual hardware. However,
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentati=
on/ref-manual/devtool-reference.rst
> index d2e80611a..13319beda 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -681,6 +681,9 @@ of SDKs are generated:
>  -  ``shared`` mode: this creates a cross-compiling toolchain and the
>     corresponding shared sysroot directories of the supplied recipe(s).
> =20
> +The ``--mode`` option can be repeated to combine both modes, for example
> +``--mode=3Dmodified --mode=3Dshared``.

xref to the "Combining modified and shared mode" here?

> +
>  The ``--target`` option can be used to specify a ``username@hostname`` s=
tring
>  and create a remote debugging configuration for the recipe. Similarly to
>  ``devtool deploy-target``, it requires an SSH server running on the targ=
et.

Thanks a lot for the docs!
Antonin

