Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AA6C02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 16:47:19 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.15532.1737132434677014288
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 08:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cDWNmyjM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A393E240006;
	Fri, 17 Jan 2025 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737132433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MyNs9WlLp/F62QGpm5BUhGSGvD5Dz0C2AFhDhEmxfRQ=;
	b=cDWNmyjMlkDTeqrEf2y0jA956QpAu7VW8JyA+LEv/DhjrNxZ4cOBENhaMPi0Xcu0hpGOh/
	EOUsym9mRpOlInDY/nP+gbjZBCYfN461xNRRV/YOO98WektdB7yLMeEOIF5/H1ePWF1QD7
	9HxhGoyRHYy/91729JXqMJ+IuVj32Es5IVpWp2098cIsPtp+1q26zqVj2rPia7OJWCcKOD
	dFQ+eRwhpA1rI6kXKrXtxp3dk5A9auzGFwtZurrroCMB9zDRZv9382h29SsIYdzytIWugU
	DUwQsc62lSyazyF63aRiRNw6XAR05WvzSD9i2oSuwa3iqdG+KrMXHdCQWXMPSQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 17:47:12 +0100
Message-Id: <D74I1YJ1P2SP.2EQC2MNXZR608@bootlin.com>
Subject: Re: [docs] [PATCH v2] sdk-manual: extensible.rst: devtool ide-sdk
 improve
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250117160103.2193408-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250117160103.2193408-1-adrian.freihofer@siemens.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 16:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6144

Hi Adrian,

On Fri Jan 17, 2025 at 5:01 PM CET, Adrian Freihofer via lists.yoctoproject=
.org wrote:
> The devtool ide-sdk section is reformulated to be independent of the
> eSDK installer. In fact, ide-sdk does not even support the execution
> of an installer-based setup.
> This reformulation is also a preparation for moving the devtool
> documentation to a dedicated devtool section which is independent from
> the eSDK documentation.
> It should be clarified that devtool ide-sdk starts the SDK directly
> from the bitbake environment. It is therefore an alternative to
> bitbake -c populate_sdk_ext and installing an SDK installer.
>
> A warning is added that explains some workarounds for some nasty
> behavior of VSCode when running it in a bitbake environment.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/sdk-manual/extensible.rst | 214 +++++++++++++++++-------
>  1 file changed, 153 insertions(+), 61 deletions(-)
>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-=
manual/extensible.rst
> index 1cb1bb47c2c..3033f0bc365 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -178,7 +178,7 @@ Running the Extensible SDK Environment Setup Script
>  Once you have the SDK installed, you must run the SDK environment setup
>  script before you can actually use the SDK.
> =20
> -When using a SDK directly in a Yocto build, you will find the script in
> +When using an SDK directly in a Yocto build, you will find the script in
>  ``tmp/deploy/images/qemux86-64/`` in your :term:`Build Directory`.
> =20
>  When using a standalone SDK installer, this setup script resides in
> @@ -622,28 +622,91 @@ command:
>        decide you do not want to proceed with your work. If you do use th=
is
>        command, realize that the source tree is preserved.
> =20
> -``devtool ide-sdk`` configures IDEs for the extensible SDK
> -----------------------------------------------------------
> +``devtool ide-sdk`` configures IDEs and bootstraps SDKs
> +-------------------------------------------------------
> =20
> -``devtool ide-sdk`` automatically configures IDEs to use the extensible =
SDK.
> -To make sure that all parts of the extensible SDK required by the genera=
ted
> -IDE configuration are available, ``devtool ide-sdk`` uses BitBake in the
> -background to bootstrap the extensible SDK.
> +The ``devtool ide-sdk`` command can provide an IDE configuration for IDE=
s for

The second "for" could be replaced by "when" to avoid the double "for"

> +working on the source code of one or more recipes.
> +Depending on the programming language, and the build system used by the =
recipe,
> +the tools required for cross-development and remote debugging are differ=
ent.
> +For example:
> =20
> -The extensible SDK supports two different development modes.
> -``devtool ide-sdk`` supports both of them:
> +-  A C/C++ project usually uses CMake or Meson.
> =20
> -#. *Modified mode*:
> +-  A Python project uses setuptools or one of its successors.
> +
> +-  A Rust project uses Cargo.
> +
> +Also, the IDE plugins needed for the integration of a build system with =
the
> +IDE and the corresponding settings are usually specific to these build-s=
ystems.
> +To hide all these details from the user, ``devtool ide-sdk`` does two th=
ings:
> +
> +-  It generates any kind of SDK needed for cross-development and remote
> +   debugging of the specified recipes.
> +
> +-  It generates the configuration for the IDE (and the IDE plugins) for =
using
> +   the cross-toolchain and remote debugging tools provided by the SDK di=
rectly
> +   from the IDE.
> +
> +For supported build systems the configurations generated by ``devtool id=
e-sdk``
> +combine the advantages of the ``devtool modify`` based workflow
> +(see :ref:`using_devtool`) with the advantages of the simple Environment=
 Setup
> +script based workflow (see :ref:`running_the_ext_sdk_env`) provided by Y=
octo's
> +SDK or eSDK:
> +
> +-  The source code of the recipe is in the workspace created by
> +   ``devtool modify`` or ``devtool add``.
> +   Using ``devtool build``, ``devtool build-image``,
> +   ``devtool deploy-target`` or ``bitbake`` is possible.
> +   Also ``devtool ide-sdk`` can be used to update the SDK and the IDE
> +   configuration at any time.
> =20
> -   By default ``devtool ide-sdk`` generates IDE configurations for recip=
es in
> -   workspaces created by ``devtool modify`` or ``devtool add`` as descri=
bed in
> -   :ref:`using_devtool`.  This mode creates IDE configurations with supp=
ort for
> -   advanced features, such as deploying the binaries to the remote targe=
t
> -   device and performing remote debugging sessions. The generated IDE
> -   configurations use the per recipe sysroots as Bitbake does internally=
.
> +-  ``devtool ide-sdk`` aims to support multiple programming languages an=
d
> +   multiple IDEs natively. "Natively" means that the IDE is configured t=
o call
> +   the build tool (e.g. ``cmake`` or ``meson``) directly. This has sever=
al
> +   advantages.
> +   First of all, it is usually much faster to call for example ``cmake``=
 than
> +   ``devtool build``.
> +   It also allows to benefit from the very good integration that IDEs li=
ke
> +   VSCode offer for tools like CMake or GDB.
> +  =20
> +   However, supporting many programming languages and multiple
> +   IDEs is quite an elaborate and constantly evolving thing. Support for=
 IDEs
> +   is therefore implemented as plugins. Plugins can also be provided by
> +   optional layers.
> =20
> -   In order to use the tool, a few settings are needed. As a starting ex=
ample,
> -   the following lines of code can be added to the ``local.conf`` file::
> +So much about the introduction to the default mode of ``devtool sdk-ide`=
` which
> +is called the "modified" mode because it uses the workspace created by
> +``devtool modify`` and the per recipe :term:`Sysroots <Sysroot>` of bitb=
ake.

s/bitbake/BitBake/ (occurrences below too)

> +
> +For some recipes and use cases, this default behavior of ``devtool ide-s=
dk``
> +with full devtool and bitbake integration might not be suitable.

s/devtool/``devtool``/ (occurrences below too)

> +To offer full feature parity with the SDK and the eSDK, ``devtool ide-sd=
k`` has
> +a second mode called "shared" mode.
> +If ``devtool ide-sdk`` is called with the ``--mode=3Dshared`` option, it
> +bootstraps an SDK directly from the bitbake environment, which offers th=
e same
> +Environment Setup script as described in :ref:`running_the_ext_sdk_env`.
> +In addition to the (e)SDK installer-based setup, the IDE gets configured
> +to use the shared :term:`Sysroots <Sysroot>` and the tools from the SDK.
> +``devtool ide-sdk --mode=3Dshared`` is basically a wrapper for the setup=
 of the
> +extensible SDK as described in :ref:`setting_up_ext_sdk_in_build`.
> +
> +The use of ``devtool ide-sdk`` is an alternative to using one of the SDK
> +installers.
> +``devtool ide-sdk`` allows the creation of SDKs that offer all the
> +functionality of the SDK and the eSDK installers. Compared to the instal=
lers,
> +however, the SDK created with ``devtool ide-sdk`` is much more flexible.
> +For example, it is very easy to change the :term:`MACHINE` in the
> +``local.conf`` file, update the layer meta data and then regenerate the =
SDK.
> +
> +Let's take a look at an example of how to use ``devtool ide-sdk`` in eac=
h of
> +the two modes:
> +
> +#. *Modified mode*:
> +
> +   In order to use the ``devtool ide-sdk``, a few settings are needed. A=
s a
> +   starting example, the following lines of code can be added to the
> +   ``local.conf`` file::
> =20
>        # Build the companion debug file system
>        IMAGE_GEN_DEBUGFS =3D "1"
> @@ -675,9 +738,13 @@ The extensible SDK supports two different developmen=
t modes.
> =20
>        $ devtool ide-sdk my-recipe core-image-minimal --target root@192.1=
68.7.2
> =20
> -   The command requires an image recipe (``core-image-minimal`` for this=
 example)
> -   that is used to create the SDK. This firmware image should also be in=
stalled
> -   on the target device.  It is possible to pass multiple package recipe=
s.
> +   The command requires an image recipe (``core-image-minimal`` for this
> +   example) that is used to create the SDK.
> +   This firmware image should also be installed on the target device.
> +   It is possible to pass multiple package recipes::
> +
> +      $ devtool ide-sdk my-recipe-1 my-recipe-2 core-image-minimal --tar=
get root@192.168.7.2
> +
>     ``devtool ide-sdk`` tries to create an IDE configuration for all pack=
age
>     recipes.
> =20
> @@ -687,9 +754,9 @@ The extensible SDK supports two different development=
 modes.
> =20
>     For example, a CMake preset is created for a recipe that inherits
>     :ref:`ref-classes-cmake`. In the case of VSCode, CMake presets are su=
pported
> -   by the CMake Tools plugin.  This is an example of how the build
> -   configuration used by ``bitbake`` is exported to an IDE configuration=
 that
> -   gives exactly the same build results.
> +   by the CMake Tools plugin. This is an example of how the build config=
uration
> +   used by ``bitbake`` is exported to an IDE configuration that gives ex=
actly
> +   the same build results.
> =20
>     Support for remote debugging with seamless integration into the IDE i=
s
>     important for a cross-SDK. ``devtool ide-sdk`` automatically generate=
s the
> @@ -702,23 +769,54 @@ The extensible SDK supports two different developme=
nt modes.
>        running on the target device, it is essential that the image built=
 by
>        ``devtool ide-sdk`` is running on the target device.
> =20
> -   ``devtool ide-sdk`` aims to support multiple programming languages an=
d
> -   multiple IDEs natively. "Natively" means that the IDE is configured t=
o call
> -   the build tool (e.g. CMake or Meson) directly. This has several advan=
tages.
> -   First of all, it is much faster than ``devtool build``, but it also a=
llows
> -   to use the very good integration of tools like CMake or GDB in VSCode=
 and
> -   other IDEs. However, supporting many programming languages and multip=
le
> -   IDEs is quite an elaborate and constantly evolving thing. Support for=
 IDEs
> -   is therefore implemented as plugins. Plugins can also be provided by
> -   optional layers.
> -
>     The default IDE is VSCode. Some hints about using VSCode:
> =20
> -   -  To work on the source code of a recipe an instance of VSCode is st=
arted in
> -      the recipe's workspace. Example::
> +   -  VSCode can be used to work on the BitBake recipes or the applicati=
on
> +      source code.
> +      Usually there is one instance of VSCode running in the folder wher=
e the
> +      BitBake recipes are. This instance has the
> +      `Yocto Project BitBake plugin <https://marketplace.visualstudio.co=
m/items?itemName=3Dyocto-project.yocto-bitbake>`_
> +      running.
> +
> +      .. warning::
> +
> +         Some VSCode plugins (Python, BitBake and others) need a reasona=
ble
> +         configuration to work as expected. Otherwise, some plugins try =
to
> +         index the build directory of BitBake, which keeps your system q=
uite
> +         busy until an out of memory exception stops this nonsense.
> +         Other plugins, such as the BitBake plugin, do not behave as exp=
ected.
> +
> +         To work around such issues, the ``oe-init-build-env`` script cr=
eates
> +         an initial ``.vscode/settings.json`` file if ``code`` can be fo=
und
> +         and the ``.vscode`` folder does not yet exist.
> +         It is best to run ``oe-init-build-env`` once before starting VS=
Code.
> +         An alternative approach is to use a build folder outside the la=
yers,
> +         e.g. ``oe-init-build-env ../build``.
> +
> +      The BitBake plugin also offers to create devtool workspaces and ru=
n
> +      ``devtool ide-sdk`` with a few mouse clicks.
> +      Of course, issuing commands in the terminal works as well.
> +
> +   -  To work on the source code of a recipe another instance of VSCode =
is
> +      started in the recipe's workspace. Example::
> =20
>           code build/workspace/sources/my-recipe
> =20
> +      This instance of VSCode uses plugins that are useful for the devel=
opment
> +      of the application. ``devtool ide-sdk`` generates the necessary
> +      ``extensions.json``, ``settings.json``, ``tasks.json``and ``launch=
.json``
> +      configuration files for all the involved plugins.
> +
> +      When the source code folder present in the workspace folder is ope=
ned in
> +      VSCode for the first time, a pop-up message recommends installing =
the
> +      required plugins.
> +      After accepting the installation of the plugins, working with the =
source
> +      code or some debugging tasks should work as usual with VSCode.
> +
> +      Starting the VSCode instances in the recipe workspace folders can =
also be
> +      done by a mouse click on the recipe workspaces in the first VSCode
> +      instance.
> +
>     -  To work with CMake press ``Ctrl + Shift + p``, type ``cmake``. Thi=
s will
>        show some possible commands like selecting a CMake preset, compili=
ng or
>        running CTest.
> @@ -731,10 +829,9 @@ The extensible SDK supports two different developmen=
t modes.
>        show some possible commands like compiling or executing the unit t=
ests.
> =20
>        A note on running cross-compiled unit tests on the host: Meson ena=
bles
> -      support for QEMU user-mode by default. It is expected that the exe=
cution
> -      of the unit tests from the IDE will work easily without any additi=
onal
> -      steps, provided that the code is suitable for execution on the hos=
t
> -      machine.
> +      support for QEMU user mode by default. It is expected that the exe=
cution
> +      of the unit tests from the IDE will work without any additional st=
eps,
> +      given that the code is suitable for the execution on the host mach=
ine.
> =20
>     -  For the deployment to the target device, just press ``Ctrl + Shift=
 + p``,
>        type ``task``.  Select ``install && deploy-target``.
> @@ -745,23 +842,23 @@ The extensible SDK supports two different developme=
nt modes.
>        selected.  After selecting one of the generated configurations, pr=
ess the
>        "play" button.
> =20
> -      Starting a remote debugging session automatically initiates the de=
ployment
> -      to the target device. If this is not desired, the
> +      Starting a remote debugging session automatically initiates the
> +      deployment to the target device. If this is not desired, the
>        ``"dependsOn": ["install && deploy-target...]`` parameter of the t=
asks
>        with ``"label": "gdbserver start...`` can be removed from the
>        ``tasks.json`` file.
> =20
> -      VSCode supports GDB with many different setups and configurations =
for many
> -      different use cases.  However, most of these setups have some limi=
tations
> -      when it comes to cross-development, support only a few target
> +      VSCode supports GDB with many different setups and configurations =
for
> +      many different use cases.  However, most of these setups have some
> +      limitations when it comes to cross-development, support only a few=
 target
>        architectures or require a high performance target device. Therefo=
re
>        ``devtool ide-sdk`` supports the classic, generic setup with GDB o=
n the
>        development host and gdbserver on the target device.
> =20
>        Roughly summarized, this means:
> =20
> -      -  The binaries are copied via SSH to the remote target device by =
a script
> -         referred by ``tasks.json``.
> +      -  The binaries are copied via SSH to the remote target device by =
a
> +         script referred by ``tasks.json``.
> =20
>        -  gdbserver is started on the remote target device via SSH by a s=
cript
>           referred by ``tasks.json``.
> @@ -863,16 +960,9 @@ The extensible SDK supports two different developmen=
t modes.
> =20
>  #. *Shared sysroots mode*
> =20
> -   For some recipes and use cases a per-recipe sysroot based SDK is not
> -   suitable.  Optionally ``devtool ide-sdk`` configures the IDE to use t=
he
> -   toolchain provided by the extensible SDK as described in
> -   :ref:`running_the_ext_sdk_env`. ``devtool ide-sdk --mode=3Dshared`` i=
s
> -   basically a wrapper for the setup of the extensible SDK as described =
in
> -   :ref:`setting_up_ext_sdk_in_build`. The IDE gets a configuration to u=
se the
> -   shared sysroots.
> -
> -   Creating a SDK with shared sysroots that contains all the dependencie=
s needed
> -   to work with ``my-recipe`` is possible with the following example com=
mand::
> +   Creating an SDK with shared :term:`Sysroots <Sysroot>` that contains =
all the
> +   dependencies needed to work with ``my-recipe`` is possible with the f=
ollowing
> +   example command::
> =20
>        $ devtool ide-sdk --mode=3Dshared my-recipe
> =20
> @@ -886,12 +976,14 @@ The extensible SDK supports two different developme=
nt modes.
>        echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
>        code kit-test
> =20
> -   If there is a CMake project in the workspace, cross-compilation is su=
pported:
> +   If there is a CMake project in the workspace, cross-compilation is
> +   supported:
> =20
>     - Press ``Ctrl + Shift + P``, type ``CMake: Scan for Kits``
>     - Press ``Ctrl + Shift + P``, type ``CMake: Select a Kit``
> =20
> -   Finally most of the features provided by CMake and the IDE should be =
available.
> +   Finally most of the features provided by CMake and the IDE should be
> +   available.
> =20
>     Other IDEs than VSCode are supported as well. However,
>     ``devtool ide-sdk --mode=3Dshared --ide=3Dnone my-recipe`` is current=
ly
> @@ -1512,10 +1604,10 @@ can simply be executed directly::
> =20
>     $ bitbake curl-native
>     # Add newly built native items to native sysroot
> -   $ bitbake build-sysroots -c build_native_sysroot
> +   $ bitbake build-:term:`Sysroots <Sysroot>` -c build_native_sysroot

I think this was added by error, same for below

>     $ bitbake mesa
>     # Add newly built target items to target sysroot
> -   $ bitbake build-sysroots -c build_target_sysroot
> +   $ bitbake build-:term:`Sysroots <Sysroot>` -c build_target_sysroot
> =20
>  When using a standalone installer for the Extensible SDK
>  --------------------------------------------------------

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

