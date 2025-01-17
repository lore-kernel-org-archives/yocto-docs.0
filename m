Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F141BC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 09:48:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.7357.1737107327751384696
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 01:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fjCCZlS4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BDC2FF80C;
	Fri, 17 Jan 2025 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737107325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZRYPsYxZapwItrcWO10FJEXKy1prg73BJtT/kZdxvc=;
	b=fjCCZlS4OGaZmWROjxi4nhmolnVemJKf0v+lGBf1hOIUTXtRq2RtkstLQP8ZW6SXkI59+A
	wVI2aoc/3zEcAOCYMr9HS+fT5mwvRTLN7Y5c29cH+MEoJ2o0UU2ylgmuY1oaknJfFunU4n
	tbvhuh44FgmHYb+MwME7HNVhTvFxTgOQdm/7FPIdObsJPSISpBvLo+OYRNk4SVSdN+WzPP
	fBZ1187HABbLsSB+KcmssCAwsLg3ZJJKVFwcVy6NCN+t2CuZKXkAyB+2Q2UGgYyl1D8rxQ
	IU7OHjpUBeDna6G6EZIWBHM3dp4Wyhr+RwoExXhsCz4drZZZERFtIGIJZIgQQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 10:48:45 +0100
Message-Id: <D7495KGYVVV7.14EUQUSB9E2CJ@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] sdk-manual: extensible.rst: devtool ide-sdk
 improve
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250114212545.5950-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250114212545.5950-1-adrian.freihofer@siemens.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 09:48:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6121

Hi Adrian,

On Tue Jan 14, 2025 at 10:25 PM CET, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> The devtool ide-sdk section is reformulated to be independent of the
> eSDK installer. In fact, ide-sdk does not even support the execution
> of an installer-based setup.

Just so that others reading this know: the devtool documentation will be
moved to its dedicated section in another patch series (WIP).

> It should be clarified that devtool ide-sdk starts the SDK directly
> from the bitbake environment. It is therefore an alternative to
> bitbake -c populate_sdk_ext and installing an SDK installer.
>
> A warning is added that explains some workarounds for some nasty
> behavior of VSCode when running it in a bitbake environment.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/sdk-manual/extensible.rst | 192 +++++++++++++++++-------
>  1 file changed, 137 insertions(+), 55 deletions(-)
>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-=
manual/extensible.rst
> index 1cb1bb47c2c..73ce509c3bb 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -622,28 +622,85 @@ command:
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
> +``devtool ide-sdk`` is supposed to configure IDEs for working on the sou=
rce

How about "The ``devtool ide-sdk`` command can provide an IDE configuration
for..."?

> +code of one or more recipes.
> +Depending on the programming language, and the build system used by the =
recipe,
> +the tools required for cross-development and remote debugging are differ=
ent.

Formatting wise, I would add "For example:" here, followed by a list:

"""
-  A C/C++ project...
-  A Python project...
...
"""

> +A C/C++ project usually uses CMake or Meson.
> +A Python project uses setuptools or one of its successors.
> +A Rust project uses Cargo.
> +Also, the IDE plugins needed for the integration of a build system with =
the
> +IDE and the corresponding settings are usually specific to these buildsy=
stems.

s/buildsystems/build systems/

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
> +
> +-  ``devtool ide-sdk`` aims to support multiple programming languages an=
d
> +   multiple IDEs natively. "Natively" means that the IDE is configured t=
o call
> +   the build tool (e.g. CMake or Meson) directly. This has several advan=
tages.
> +   First of all, it is usually much faster to call for example ``cmake``=
 than
> +   ``devtool build``.
> +   It also allows to benefit from the very good integration that IDEs li=
ke
> +   VSCode offer for tools like CMAke or GDB.

s/CMAke/CMake/

> +  =20
> +   However, supporting many programming languages and multiple
> +   IDEs is quite an elaborate and constantly evolving thing. Support for=
 IDEs
> +   is therefore implemented as plugins. Plugins can also be provided by
> +   optional layers.
> =20
> -The extensible SDK supports two different development modes.
> -``devtool ide-sdk`` supports both of them:
> +So much about the introduction to the default mode of ``devtool sdk-ide`=
` which
> +is called the "modified" mode because it uses the workspace created by
> +``devtool modify`` and the per recipe sysroots of bitbake.

Some comments:

*  When "bitbake" is not meant as a command but as the project, you should =
use the
   "BitBake" instead of "bitbake" (several occurences here)

* Likewise, "devtool" occurences should be replaced by "``devtool``"

*  s/sysroots/:term:`Sysroots <Sysroot>`/

> +
> +For some recipes and use cases, this default behavior of ``devtool ide-s=
dk``
> +with full devtool and bitbake integration might not be suitable.
> +To offer full feature parity with the SDK and the eSDK, ``devtool ide-sd=
k`` has
> +a second mode called "shared" mode.
> +If ``devtool ide-sdk`` is called with the ``--mode=3Dshared`` option, it
> +bootstraps an SDK directly from the bitbake environment, which offers th=
e same
> +Environment Setup script as described in :ref:`running_the_ext_sdk_env`.
> +In addition to the (e)SDK installer-based setup, the IDE gets configured
> +to use the shared sysroots and the tools from the SDK.
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
> =20
>  #. *Modified mode*:
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
> -
> -   In order to use the tool, a few settings are needed. As a starting ex=
ample,
> -   the following lines of code can be added to the ``local.conf`` file::
> +   In order to use the ``devtool ide-sdk``, a few settings are needed. A=
s a
> +   starting example, the following lines of code can be added to the
> +   ``local.conf`` file::
> =20
>        # Build the companion debug file system
>        IMAGE_GEN_DEBUGFS =3D "1"
> @@ -675,9 +732,10 @@ The extensible SDK supports two different developmen=
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
> +   It is possible to pass multiple package recipes.

How? Like this?

$ devtool ide-sdk my-recipe1 my-recipe2 core-image-minimal --target root@19=
2.168.7.2

Maybe add an example

>     ``devtool ide-sdk`` tries to create an IDE configuration for all pack=
age
>     recipes.
> =20
> @@ -702,23 +760,53 @@ The extensible SDK supports two different developme=
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
> +   -  VSCode can be used to work on the bitbake recipes as well as for t=
he work
> +      on the application source code. Usually there is one instance of V=
SCode

I would rephrase to "VSCode can be used to work on the BitBake recipes or t=
he
application source code".

> +      running in the folder where the bitbake recipes are. This instance=
 has
> +      the
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
> +      When the workspace folder is opened in VSCode for the first time, =
a

You mean the source code folder present in the workspace?

> +      pop-up message recommends installing the required plugins.
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
> @@ -731,10 +819,9 @@ The extensible SDK supports two different developmen=
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
>
>     -  For the deployment to the target device, just press ``Ctrl + Shift=
 + p``,
>        type ``task``.  Select ``install && deploy-target``.
> @@ -745,23 +832,23 @@ The extensible SDK supports two different developme=
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
> @@ -863,16 +950,9 @@ The extensible SDK supports two different developmen=
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
> +   Creating a SDK with shared sysroots that contains all the dependencie=
s

I believe "an SDK" is more often used in the docs.

> +   needed to work with ``my-recipe`` is possible with the following exam=
ple
> +   command::
> =20
>        $ devtool ide-sdk --mode=3Dshared my-recipe
> =20
> @@ -886,12 +966,14 @@ The extensible SDK supports two different developme=
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

Thanks for the patch,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

