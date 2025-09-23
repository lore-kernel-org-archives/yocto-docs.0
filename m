Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF81CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 16:06:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.1595.1758643571062877513
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 09:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Oq8KXFs/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1CDC94E40C31
	for <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 16:06:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCB8B60690;
	Tue, 23 Sep 2025 16:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83EB7102F1960;
	Tue, 23 Sep 2025 18:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758643568; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZDbs5R8Ph+YoGCRztg5QbSYzS7eTRnBbG9k18imJPZQ=;
	b=Oq8KXFs/ySYU8aEMezHVUWZXKabp6+gntOpELPi5PrV2p4pCC4uU4XRM+n55UFalTyK1xr
	zIYqCWX42gYHTNDopbftrXP2GPnPuH2YfH+OGhOx9oKharLfci853dZRZh0dpEv98ESSck
	nS2QceQKqeRvTjev7eQXo3J88cFa5/vnjk3UDyl1MGINqrHA9kQXT9XXpFTunXlqNefqpi
	7cn9ZKmGYy/WLsRcCrNh9RHogdZCclnHKYi/zoGiIQpW0jTRrNgzOvTzod53cWXrs8a2+8
	4E3Kqd/Wgh1P97SGTWACxMhQz7P4UP9YmsdEUfTHbl8ZYB6aeh3ghygGqpyAhQ==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 18:06:03 +0200
Message-Id: <DD0B43YZK3LO.1TVXDXSLGVPIU@bootlin.com>
Subject: Re: [docs] [RFC][PATCH v2] brief-yoctoprojectqs: add bitbake-setup
 info
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <tim.orling@konsulko.com>, <docs@lists.yoctoproject.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20250819213530.3616042-1-tim.orling@konsulko.com>
In-Reply-To: <20250819213530.3616042-1-tim.orling@konsulko.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 16:06:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7583

Hi Tim,

As said in the call earlier, here are some reviews. I know the tool has cha=
nged
quite a bit since then, but some of the comments probably apply. Some comme=
nts
are just formatting related.

From our earlier discussion, we want to document an alternate way of settin=
gs
things up, where we instruct to clone each repository manually  and source =
the
oe-init-build-env script instead. Do you want to work on that too? If not t=
hat's
completely fine - this patch can be limited on bitbake-setup only and I wil=
l
work on the other "legacy" part.

On Tue Aug 19, 2025 at 11:34 PM CEST, Tim Orling via lists.yoctoproject.org=
 wrote:
> From: Tim Orling <tim.orling@konsulko.com>
>
> Largely replace the original Poky instructions with
> example instructions to use bitbake-setup.
>
> Introduce the concept of OE_FRAGMENTS and how it is
> used by bitbake-setup to setup SSTATE_MIRRORS, etc.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Changes in v2:
>   - fix typos/grammar errors
>   - use commas instead of en dash
>
>  documentation/brief-yoctoprojectqs/index.rst | 221 ++++++++++---------
>  1 file changed, 121 insertions(+), 100 deletions(-)
>
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation=
/brief-yoctoprojectqs/index.rst
> index 4a6f13d7e..8ef1f5bf5 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -87,75 +87,112 @@ distribution:
>     see the :ref:`ref-manual/system-requirements:required packages for th=
e build host`
>     section in the Yocto Project Reference Manual.
> =20
> -Use Git to Clone Poky
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Use Git to Clone bitbake-setup
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> =20
>  Once you complete the setup instructions for your machine, you need to
> -get a copy of the Poky repository on your build host. Use the following
> -commands to clone the Poky repository.
> +get a copy of the bitbake-setup tool to setup the Poky reference

s/bitbake-setup/``bitbake-setup``/

> +distribution on your build host. Use the following commands to clone

s/commands/command/

> +the bitbake repository.

s/repository./repository:/
> =20
>  .. code-block:: shell
> =20
> -   $ git clone git://git.yoctoproject.org/poky
> -   Cloning into 'poky'...
> -   remote: Counting
> -   objects: 432160, done. remote: Compressing objects: 100%
> -   (102056/102056), done. remote: Total 432160 (delta 323116), reused
> -   432037 (delta 323000) Receiving objects: 100% (432160/432160), 153.81=
 MiB | 8.54 MiB/s, done.
> -   Resolving deltas: 100% (323116/323116), done.
> -   Checking connectivity... done.
> +   $ git clone git://git.openembedded.org/bitbake bitbake-setup
> +   Cloning into 'bitbake-setup'...
> +   remote: Enumerating objects: 68454, done.
> +   remote: Counting objects: 100% (49/49), done.
> +   remote: Compressing objects: 100% (44/44), done.
> +   remote: Total 68454 (delta 31), reused 5 (delta 5), pack-reused 68405=
 (from 1)
> +   Receiving objects: 100% (68454/68454), 14.17 MiB | 10.56 MiB/s, done.
> +   Resolving deltas: 100% (51776/51776), done.

As Alex said, I also agree on just showing the commands. That's really easi=
er to
maintain and makes the docs a bit clearer / less noisy.

> =20
> -Go to :yocto_wiki:`Releases wiki page </Releases>`, and choose a release
> -codename (such as ``&DISTRO_NAME_NO_CAP;``), corresponding to either the
> -latest stable release or a Long Term Support release.
> +Setup a build environment with the following command:
> =20
> -Then move to the ``poky`` directory and take a look at existing branches=
:
> +.. code-block:: shell
> +
> +   $ ./bitbake-setup/bin/bitbake-setup init
> +
> +By default, this will setup in $HOME/bitbake-builds. If you prefer to
> +setup your builds in a different directory, for example the current
> +directory, you can instead use the ``--top-dir`` argument:

This has not changed but we do have the ~/.config/bitbake-setup/ directory =
where
to put a default value for this. We should mention it here.

> =20
>  .. code-block:: shell
> =20
> -   $ cd poky
> -   $ git branch -a
> -   .
> -   .
> -   .
> -   remotes/origin/HEAD -> origin/master
> -   remotes/origin/dunfell
> -   remotes/origin/dunfell-next
> -   .
> -   .
> -   .
> -   remotes/origin/gatesgarth
> -   remotes/origin/gatesgarth-next
> -   .
> -   .
> -   .
> -   remotes/origin/master
> -   remotes/origin/master-next
> -   .
> -   .
> -   .
> -
> -
> -For this example, check out the ``&DISTRO_NAME_NO_CAP;`` branch based on=
 the
> -``&DISTRO_NAME;`` release:
> +  $ ./bitbake-setup/bin/bitbake-setup init --top-dir $PWD
> +
> +`bitbake-setup init` is an interactive program by default and will ask

We need to user double tick here (``bitbake-setup init``).

> +you to make some decisions. Depending on your answers, the choices may
> +differ from the examples below.
> +
> +#. Choose a configuration (for example, ``yocto-master-options``):
> +
> +   .. code-block:: shell
> +
> +      Available configurations:
> +      0. yocto-master-nested-configs	(future) Official Yocto configurati=
ons: poky, poky-altcfg, poky-tiny, for qemux86-64 and arm64 (defined with n=
ested configurations)
> +      1. yocto-master-options	(future) Official Yocto configurations: po=
ky, poky-altcfg, poky-tiny, for qemux86-64, riscv64 and arm64 (defined with=
 options)
> +
> +      Please select one of the above configurations by its number:
> +      1
> +
> +#. Choose a target machine (for example, ``qemux86-64``):
> +
> +   .. code-block:: shell
> +
> +      Selecting the only available bitbake configuration poky
> +      Available target machines:
> +      0. machine/qemux86-64
> +      1. machine/qemuarm64
> +      2. machine/qemuriscv64
> +      Please select one of the above options by its number:
> +      0
> +
> +#. Choose a distribution (for example, ``poky``):
> +
> +   .. code-block:: shell
> +
> +      Available distributions:
> +      0. distro/poky
> +      1. distro/poky-altcfg
> +      2. distro/poky-tiny
> +      Please select one of the above options by its number:
> +      0
> +      Run 'bitbake-setup yocto-master-options poky distro/poky machine/q=
emux86-64' to select this configuration non-interactively.
> +      Initializing a build in /path/to/top-dir/yocto-master-options-poky=
-distro_poky-machine_qemux86-64
> +      Fetching layer/tool repository bitbake into /path/to/top-dir/yocto=
-master-options-poky-distro_poky-machine_qemux86-64/layers/bitbake
> +      Fetching layer/tool repository openembedded-core into /path/to/top=
-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/layers/openem=
bedded-core
> +      Fetching layer/tool repository meta-yocto into /path/to/top-dir/yo=
cto-master-options-poky-distro_poky-machine_qemux86-64/layers/meta-yocto
> +      Fetching layer/tool repository yocto-docs into /path/to/top-dir/yo=
cto-master-options-poky-distro_poky-machine_qemux86-64/layers/yocto-docs
> +      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +      Setting up bitbake configuration in /path/to/top-dir/yocto-master-=
options-poky-distro_poky-machine_qemux86-64/build
> +      This bitbake configuration provides: Poky reference distro build
> +      Usage instructions and additional information are in /path/to/top-=
dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/README
> +
> +If you prefer to run non-interactively, you could use a command
> +like the following:
> =20
>  .. code-block:: shell
> =20
> -   $ git checkout -t origin/&DISTRO_NAME_NO_CAP; -b my-&DISTRO_NAME_NO_C=
AP;
> -   Branch 'my-&DISTRO_NAME_NO_CAP;' set up to track remote branch '&DIST=
RO_NAME_NO_CAP;' from 'origin'.
> -   Switched to a new branch 'my-&DISTRO_NAME_NO_CAP;'
> +   $ bitbake-setup yocto-master-options poky distro/poky machine/qemux86=
-64

Now it's:

  bitbake-setup init --non-interactive ...

> =20
> -The previous Git checkout command creates a local branch named
> -``my-&DISTRO_NAME_NO_CAP;``. The files available to you in that branch
> -exactly match the repository's files in the ``&DISTRO_NAME_NO_CAP;``
> -release branch.
> +Among other things, the script creates the :term:`Build Directory`, whic=
h is
> +``build`` in this case and is located in the "top-dir" directory.  The s=
cript
> +also clones the layers needed to build the Poky reference distribution, =
in the
> +``layers`` subdirectory. After the script runs, your current working dir=
ectory
> +is set to the :term:`Build Directory`. Later, when the build completes, =
the
> +:term:`Build Directory` contains all the files created during the build.
> =20
> -Note that you can regularly type the following command in the same direc=
tory
> -to keep your local files in sync with the release branch:
> +
> +Information about the build environment can be found in ``/path/to/top-d=
ir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/README`` =
which should look something like the following:
> =20
>  .. code-block:: shell
> =20
> -   $ git pull
> +   Poky reference distro build
> +
> +   Additional information is in /path/to/top-dir/yocto-master-options-po=
ky-distro_poky-machine_qemux86-64/build/conf/conf-summary.txt and /path/to/=
top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/conf=
/conf-notes.txt
> +
> +   Source the environment using '. /path/to/top-dir/yocto-master-options=
-poky-distro_poky-machine_qemux86-64/build/init-build-env' to run builds fr=
om the command line.
> +   The bitbake configuration files (local.conf, bblayers.conf and more) =
can be found in /path/to/top-dir/yocto-master-options-poky-distro_poky-mach=
ine_qemux86-64/build/conf
> =20
>  For more options and information about accessing Yocto Project related
>  repositories, see the
> @@ -182,61 +219,47 @@ an entire Linux distribution, including the toolcha=
in, from source.
>        ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Ne=
twork_Proxy>`"
>        page of the Yocto Project Wiki.
> =20
> -#. **Initialize the Build Environment:** From within the ``poky``
> -   directory, run the :ref:`ref-manual/structure:``oe-init-build-env```
> -   environment
> -   setup script to define Yocto Project's build environment on your
> -   build host.
> +#. **Initialize the Build Environment:**
> +   Run the ``init-build-env`` environment setup script within the build =
directory

s/Run/Source/

> +   to define Yocto Project's build environment on your build host.
> =20
>     .. code-block:: shell
> =20
> -      $ cd poky
> -      $ source oe-init-build-env
> -      You had no conf/local.conf file. This configuration file has there=
fore been
> -      created for you with some default values. You may wish to edit it =
to, for
> -      example, select a different MACHINE (target hardware). See conf/lo=
cal.conf
> -      for more information as common configuration options are commented=
.
> -
> -      You had no conf/bblayers.conf file. This configuration file has th=
erefore
> -      been created for you with some default values. To add additional m=
etadata
> -      layers into your configuration please add entries to conf/bblayers=
.conf.
> -
> -      The Yocto Project has extensive documentation about OE including a=
 reference
> -      manual which can be found at:
> -          https://docs.yoctoproject.org
> +      $ source /path/to/top-dir/yocto-master-options-poky-distro_poky-ma=
chine_qemux86-64/build/init-build-env
> +      Poky reference distro build
> =20
> -      For more information about OpenEmbedded see their website:
> -          https://www.openembedded.org/
> +#. **Examine Your Auto Configuration File:** When you set up the build
> +   environment, an auto configuration file named ``auto.conf`` becomes
> +   available in aa ``conf`` subdirectory of the :term:`Build Directory`.=
 For this

s/aa/a/

> +   example, the defaults are set to include three ``OE_FRAGMENTS``:
> +   ``core/yocto/sstate-mirror-cdn``, ``machine/qemux86-64`` and ``distro=
/poky``.

This might be subject to change a so a bit of a maintenance burden. Can we
rephrase to:=20

"""
Fragments of configurations are listed in the :term:`OE_FRAGMENTS` variable=
.
"""

OE_FRAGMENTS would need to be documented too ideally

> +   These set up the environment similar to what was previously in the lo=
cal
> +   configuration file named ``local.conf`` which is now largely empty.
> +   For more information on fragments, see :ref:`bitbake-user-manual/bitb=
ake-user-manual-metadata:\`\`addfragments\`\` directive` in the Bitbake Use=
r Manual.
> =20
> -      ### Shell environment set up for builds. ###
> +   ``core/yocto/sstate-mirror-cdn`` sets up :term:`BB_HASHSERVE_UPSTREAM=
` and
> +   :term:`SSTATE_MIRRORS`. The definition can be found in
> +   ``../layers/openembedded-core/meta/conf/fragments/yocto/sstate-mirror=
-cdn.conf``.

Do we want to list this here? I feel like this could distract from the poin=
t of
this section, which is to showcase how to use bitbake-setup. I think we nee=
d a
separate section on fragments that we could link from here. I know this is
additional work: we can merge this as-is but probably a task for later.

> =20
> -      You can now run 'bitbake <target>'
> -
> -      Common targets are:
> -          core-image-minimal
> -          core-image-full-cmdline
> -          core-image-sato
> -          core-image-weston
> -          meta-toolchain
> -          meta-ide-support
> -
> -      You can also run generated QEMU images with a command like 'runqem=
u qemux86-64'
> +   .. code-block:: shell
> =20
> -      Other commonly useful commands are:
> -       - 'devtool' and 'recipetool' handle common recipe tasks
> -       - 'bitbake-layers' handles common layer tasks
> -       - 'oe-pkgdata-util' handles common target package tasks
> +      BB_CONF_FRAGMENT_SUMMARY =3D "Use prebuilt sstate artifacts for st=
andard Yocto build configurations."
> +      BB_CONF_FRAGMENT_DESCRIPTION =3D "The Yocto Project has prebuilt a=
rtefacts available for standard build configurations. \
> +      This fragment enables their use. This will mean the build will que=
ry the \
> +      the network to check for artefacts at the start of builds, which d=
oes slow it down \
> +      initially but it will then speed up the builds by not having to bu=
ild things if they are \
> +      present in the cache. It assumes you can download something faster=
 than you can build it \
> +      which will depend on your network. \
> +      Note: For this to work you also need hash-equivalence passthrough =
to the matching server \
> +      "
> =20
> -   Among other things, the script creates the :term:`Build Directory`, w=
hich is
> -   ``build`` in this case and is located in the :term:`Source Directory`=
.  After
> -   the script runs, your current working directory is set to the
> -   :term:`Build Directory`. Later, when the build completes, the
> -   :term:`Build Directory` contains all the files created during the bui=
ld.
> +      BB_HASHSERVE_UPSTREAM =3D 'wss://hashserv.yoctoproject.org/ws'
> +      SSTATE_MIRRORS ?=3D "file://.* http://sstate.yoctoproject.org/all/=
PATH;downloadfilename=3DPATH"

This can be printed with `bitbake-config-build show-fragment
core/yocto/sstate-mirror-cdn` now.

> =20
>  #. **Examine Your Local Configuration File:** When you set up the build
>     environment, a local configuration file named ``local.conf`` becomes
>     available in a ``conf`` subdirectory of the :term:`Build Directory`. =
For this
> -   example, the defaults are set to build for a ``qemux86`` target,
> +   example, the defaults are set to build for a ``qemux86-64`` target,
>     which is suitable for emulation. The package manager used is set to
>     the RPM package manager.
> =20
> @@ -249,13 +272,11 @@ an entire Linux distribution, including the toolcha=
in, from source.
>        This is relevant only when your network and the server that you us=
e
>        can download these artifacts faster than you would be able to buil=
d them.
> =20
> -      To use such mirrors, uncomment the below lines in your ``conf/loca=
l.conf``
> -      file in the :term:`Build Directory`::
> +      To use such mirrors, ``bitbake-setup`` includes the following in y=
our
> +	  ``conf/auto.conf`` file (or you can add it to ``conf/local.conf``) in
> +	  the :term:`Build Directory`::
> =20
> -         BB_HASHSERVE_UPSTREAM =3D "wss://hashserv.yoctoproject.org/ws"
> -         SSTATE_MIRRORS ?=3D "file://.* http://sstate.yoctoproject.org/a=
ll/PATH;downloadfilename=3DPATH"
> -         BB_HASHSERVE =3D "auto"
> -         BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> +            OE_FRAGMENTS +=3D "core/yocto/sstate-mirror-cdn"
> =20
>        The hash equivalence server needs the websockets python module ver=
sion 9.1
>        or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS=
 Stream

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


