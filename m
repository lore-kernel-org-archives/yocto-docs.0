Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86D4CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 15:41:31 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.1090.1755704490294024942
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Aug 2025 08:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=k2dXPHyf;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afca3e71009so175046766b.0
        for <docs@lists.yoctoproject.org>; Wed, 20 Aug 2025 08:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1755704489; x=1756309289; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gb6MOoudO7UlhWlFoGW73rHKw8/UJ6rYN2VkG7YZ6ug=;
        b=k2dXPHyf3kkqCic4GoCdVj3Zz+4CHh+W1MTHkzaIcxBllGsQFE3tQMGz/lsZQvhDKR
         A4czHAfaGd04Oc7ChJ46mpxqTMc9WtbJa9X/Fj8pAFOBkAvqbNkM5Aq7OmPLTcloVj+M
         MVIf0CizRDLospz5Qs/muoZxBvPDv1hE3R9HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755704489; x=1756309289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gb6MOoudO7UlhWlFoGW73rHKw8/UJ6rYN2VkG7YZ6ug=;
        b=Sqo710ivP9hLVvSoXYj2plUhxmmD7cmj0ihhnKKas5YZWwRkkCX/E+j8WF+IHEn7hl
         YTJs3n+X6F7OOaY5UJ8bdu4idAqmJYnGk89UO2fzOqRq/6DZ1/u46NMz4b5YUs/0zgE5
         O8uMy3mO3ejKOhzsORW3BkjAgeoH0OpBgW6n12kGN1gzHfjhIHlLke0e8NixS3MIhWSj
         SssruOSMVHf7uiynCcz3S/kcX0aODnS2RtzubJK7qx5Qtksua1jNt9trEBDtdEWT+Ytr
         7rB4K8GKdWcn9/NawqA8bZiwDzc5dt9rEJIbLRe57ouy3XdN++xFiRngVCPH/yMCpl9p
         7esA==
X-Gm-Message-State: AOJu0Yzi2mMC46h5mLunYZQSh+0kfW4i3jAJATanXUGRXHdRlu0qfVIt
	OcmJoPIIk/S27pAiZLorT9RBbRTa7QZowrJ4r+3pBdwfJ/gb2Al9VI1BtudBCZM2dvrySMDnHRP
	wW4Yo7dGJXrlf0IFrDfUpZSVl2Zgvf8q8gR0bzMm30Q==
X-Gm-Gg: ASbGncuLeytcad35maYC/OX5b4AU0DsKkZAiwIwpAWkxJihy3liJeve3YJAx2CRyHnA
	shT2iJXhbQ+6lM3T4gVVSnYkaxvXF/AcB12prqhmdMh6S6r9od/eywCEwxHLH2O7yc34Sh18b+Q
	EP3trSkBkEM+goy4VKYA5anR6TSzzMVx+MrLeOkUac9qp5fB6IpQkAYsVO2BuwWobQd1q3Oq7GR
	nJMeSM=
X-Google-Smtp-Source: AGHT+IFTY2+Kz9pGBNr1/CBGPYRxqYpXidvv2XyQH+Ddog33DDs2faeZzstAzaKdolTczZSzsCDPoGqpILJsGEJVj88=
X-Received: by 2002:a17:907:868b:b0:af9:a381:aee1 with SMTP id
 a640c23a62f3a-afe02718d83mr9697066b.0.1755704488290; Wed, 20 Aug 2025
 08:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250819213530.3616042-1-tim.orling@konsulko.com> <CANNYZj9kcLqBGYg-Eay58fwviqxuASbAVCK0MQ3ZcseCCN+3Cw@mail.gmail.com>
In-Reply-To: <CANNYZj9kcLqBGYg-Eay58fwviqxuASbAVCK0MQ3ZcseCCN+3Cw@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Wed, 20 Aug 2025 08:41:17 -0700
X-Gm-Features: Ac12FXxO3xL7T7ugfHSxIO0YY4qkjVtLyrGPom0jE6r5XFUvavLzsBPdRNqH7k8
Message-ID: <CAOyo-85XHV0b2v27GbNAQkb6kbdgNxp0fuHxMYCvnxRmD7i2mA@mail.gmail.com>
Subject: Re: [docs] [RFC][PATCH v2] brief-yoctoprojectqs: add bitbake-setup info
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005b0096063ccdcee0"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Aug 2025 15:41:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7459

--0000000000005b0096063ccdcee0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 12:46=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> Thanks Tim, this is basically fine, but has to be held until
> bitbake-setup actually lands (and then adjusted to match that
> version).
>
Absolutely, this is why I put it out as an RFC. Plus I think (see the next
paragraph) there needs to be some more discussion/thought about the
documentation. We need to add more documentation about OE fragments and
more about bitbake-setup configuration, etc.

>
> I also wonder if the documentation needs to show exactly what the tool
> outputs, as that is prone to becoming out of sync, and the users will
> see it for themselves anyway.
>

I definitely agree and was on the fence about that. I was mostly following
the pattern that was already in the quick start guide. Plus links to
metadata don't exist yet, so that wasn't an option either. We should
continue to discuss what will work best for the quick start guide and what
else is needed elsewhere in the reference manual, etc.

>
> --top-dir value can also be set from an environment variable, so you
> don't have to pass it in every time (and end up creating bogus top dir
> if forgetting to do so).
>

Good point. Perhaps I can document that in v3 instead of showing the
command line.

I look forward to more discussion about all of this.


> Alex
>
> On Tue, 19 Aug 2025 at 23:35, Tim Orling via lists.yoctoproject.org
> <tim.orling=3Dkonsulko.com@lists.yoctoproject.org> wrote:
> >
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > Largely replace the original Poky instructions with
> > example instructions to use bitbake-setup.
> >
> > Introduce the concept of OE_FRAGMENTS and how it is
> > used by bitbake-setup to setup SSTATE_MIRRORS, etc.
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> > Changes in v2:
> >   - fix typos/grammar errors
> >   - use commas instead of en dash
> >
> >  documentation/brief-yoctoprojectqs/index.rst | 221 ++++++++++---------
> >  1 file changed, 121 insertions(+), 100 deletions(-)
> >
> > diff --git a/documentation/brief-yoctoprojectqs/index.rst
> b/documentation/brief-yoctoprojectqs/index.rst
> > index 4a6f13d7e..8ef1f5bf5 100644
> > --- a/documentation/brief-yoctoprojectqs/index.rst
> > +++ b/documentation/brief-yoctoprojectqs/index.rst
> > @@ -87,75 +87,112 @@ distribution:
> >     see the :ref:`ref-manual/system-requirements:required packages for
> the build host`
> >     section in the Yocto Project Reference Manual.
> >
> > -Use Git to Clone Poky
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Use Git to Clone bitbake-setup
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >
> >  Once you complete the setup instructions for your machine, you need to
> > -get a copy of the Poky repository on your build host. Use the followin=
g
> > -commands to clone the Poky repository.
> > +get a copy of the bitbake-setup tool to setup the Poky reference
> > +distribution on your build host. Use the following commands to clone
> > +the bitbake repository.
> >
> >  .. code-block:: shell
> >
> > -   $ git clone git://git.yoctoproject.org/poky
> > -   Cloning into 'poky'...
> > -   remote: Counting
> > -   objects: 432160, done. remote: Compressing objects: 100%
> > -   (102056/102056), done. remote: Total 432160 (delta 323116), reused
> > -   432037 (delta 323000) Receiving objects: 100% (432160/432160),
> 153.81 MiB | 8.54 MiB/s, done.
> > -   Resolving deltas: 100% (323116/323116), done.
> > -   Checking connectivity... done.
> > +   $ git clone git://git.openembedded.org/bitbake bitbake-setup
> > +   Cloning into 'bitbake-setup'...
> > +   remote: Enumerating objects: 68454, done.
> > +   remote: Counting objects: 100% (49/49), done.
> > +   remote: Compressing objects: 100% (44/44), done.
> > +   remote: Total 68454 (delta 31), reused 5 (delta 5), pack-reused
> 68405 (from 1)
> > +   Receiving objects: 100% (68454/68454), 14.17 MiB | 10.56 MiB/s, don=
e.
> > +   Resolving deltas: 100% (51776/51776), done.
> >
> > -Go to :yocto_wiki:`Releases wiki page </Releases>`, and choose a relea=
se
> > -codename (such as ``&DISTRO_NAME_NO_CAP;``), corresponding to either t=
he
> > -latest stable release or a Long Term Support release.
> > +Setup a build environment with the following command:
> >
> > -Then move to the ``poky`` directory and take a look at existing
> branches:
> > +.. code-block:: shell
> > +
> > +   $ ./bitbake-setup/bin/bitbake-setup init
> > +
> > +By default, this will setup in $HOME/bitbake-builds. If you prefer to
> > +setup your builds in a different directory, for example the current
> > +directory, you can instead use the ``--top-dir`` argument:
> >
> >  .. code-block:: shell
> >
> > -   $ cd poky
> > -   $ git branch -a
> > -   .
> > -   .
> > -   .
> > -   remotes/origin/HEAD -> origin/master
> > -   remotes/origin/dunfell
> > -   remotes/origin/dunfell-next
> > -   .
> > -   .
> > -   .
> > -   remotes/origin/gatesgarth
> > -   remotes/origin/gatesgarth-next
> > -   .
> > -   .
> > -   .
> > -   remotes/origin/master
> > -   remotes/origin/master-next
> > -   .
> > -   .
> > -   .
> > -
> > -
> > -For this example, check out the ``&DISTRO_NAME_NO_CAP;`` branch based
> on the
> > -``&DISTRO_NAME;`` release:
> > +  $ ./bitbake-setup/bin/bitbake-setup init --top-dir $PWD
> > +
> > +`bitbake-setup init` is an interactive program by default and will ask
> > +you to make some decisions. Depending on your answers, the choices may
> > +differ from the examples below.
> > +
> > +#. Choose a configuration (for example, ``yocto-master-options``):
> > +
> > +   .. code-block:: shell
> > +
> > +      Available configurations:
> > +      0. yocto-master-nested-configs   (future) Official Yocto
> configurations: poky, poky-altcfg, poky-tiny, for qemux86-64 and arm64
> (defined with nested configurations)
> > +      1. yocto-master-options  (future) Official Yocto configurations:
> poky, poky-altcfg, poky-tiny, for qemux86-64, riscv64 and arm64 (defined
> with options)
> > +
> > +      Please select one of the above configurations by its number:
> > +      1
> > +
> > +#. Choose a target machine (for example, ``qemux86-64``):
> > +
> > +   .. code-block:: shell
> > +
> > +      Selecting the only available bitbake configuration poky
> > +      Available target machines:
> > +      0. machine/qemux86-64
> > +      1. machine/qemuarm64
> > +      2. machine/qemuriscv64
> > +      Please select one of the above options by its number:
> > +      0
> > +
> > +#. Choose a distribution (for example, ``poky``):
> > +
> > +   .. code-block:: shell
> > +
> > +      Available distributions:
> > +      0. distro/poky
> > +      1. distro/poky-altcfg
> > +      2. distro/poky-tiny
> > +      Please select one of the above options by its number:
> > +      0
> > +      Run 'bitbake-setup yocto-master-options poky distro/poky
> machine/qemux86-64' to select this configuration non-interactively.
> > +      Initializing a build in
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64
> > +      Fetching layer/tool repository bitbake into
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/layers/bitbake
> > +      Fetching layer/tool repository openembedded-core into
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/layers/openembedded-core
> > +      Fetching layer/tool repository meta-yocto into
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/layers/meta-yocto
> > +      Fetching layer/tool repository yocto-docs into
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/layers/yocto-docs
> > +      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +      Setting up bitbake configuration in
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/build
> > +      This bitbake configuration provides: Poky reference distro build
> > +      Usage instructions and additional information are in
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/build/README
> > +
> > +If you prefer to run non-interactively, you could use a command
> > +like the following:
> >
> >  .. code-block:: shell
> >
> > -   $ git checkout -t origin/&DISTRO_NAME_NO_CAP; -b
> my-&DISTRO_NAME_NO_CAP;
> > -   Branch 'my-&DISTRO_NAME_NO_CAP;' set up to track remote branch
> '&DISTRO_NAME_NO_CAP;' from 'origin'.
> > -   Switched to a new branch 'my-&DISTRO_NAME_NO_CAP;'
> > +   $ bitbake-setup yocto-master-options poky distro/poky
> machine/qemux86-64
> >
> > -The previous Git checkout command creates a local branch named
> > -``my-&DISTRO_NAME_NO_CAP;``. The files available to you in that branch
> > -exactly match the repository's files in the ``&DISTRO_NAME_NO_CAP;``
> > -release branch.
> > +Among other things, the script creates the :term:`Build Directory`,
> which is
> > +``build`` in this case and is located in the "top-dir" directory.  The
> script
> > +also clones the layers needed to build the Poky reference distribution=
,
> in the
> > +``layers`` subdirectory. After the script runs, your current working
> directory
> > +is set to the :term:`Build Directory`. Later, when the build completes=
,
> the
> > +:term:`Build Directory` contains all the files created during the buil=
d.
> >
> > -Note that you can regularly type the following command in the same
> directory
> > -to keep your local files in sync with the release branch:
> > +
> > +Information about the build environment can be found in
> ``/path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-=
64/build/README``
> which should look something like the following:
> >
> >  .. code-block:: shell
> >
> > -   $ git pull
> > +   Poky reference distro build
> > +
> > +   Additional information is in
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/build/conf/conf-summary.txt
> and
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/build/conf/conf-notes.txt
> > +
> > +   Source the environment using '.
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/build/init-build-env'
> to run builds from the command line.
> > +   The bitbake configuration files (local.conf, bblayers.conf and more=
)
> can be found in
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/build/conf
> >
> >  For more options and information about accessing Yocto Project related
> >  repositories, see the
> > @@ -182,61 +219,47 @@ an entire Linux distribution, including the
> toolchain, from source.
> >        ":yocto_wiki:`Working Behind a Network Proxy
> </Working_Behind_a_Network_Proxy>`"
> >        page of the Yocto Project Wiki.
> >
> > -#. **Initialize the Build Environment:** From within the ``poky``
> > -   directory, run the :ref:`ref-manual/structure:``oe-init-build-env``=
`
> > -   environment
> > -   setup script to define Yocto Project's build environment on your
> > -   build host.
> > +#. **Initialize the Build Environment:**
> > +   Run the ``init-build-env`` environment setup script within the buil=
d
> directory
> > +   to define Yocto Project's build environment on your build host.
> >
> >     .. code-block:: shell
> >
> > -      $ cd poky
> > -      $ source oe-init-build-env
> > -      You had no conf/local.conf file. This configuration file has
> therefore been
> > -      created for you with some default values. You may wish to edit i=
t
> to, for
> > -      example, select a different MACHINE (target hardware). See
> conf/local.conf
> > -      for more information as common configuration options are
> commented.
> > -
> > -      You had no conf/bblayers.conf file. This configuration file has
> therefore
> > -      been created for you with some default values. To add additional
> metadata
> > -      layers into your configuration please add entries to
> conf/bblayers.conf.
> > -
> > -      The Yocto Project has extensive documentation about OE including
> a reference
> > -      manual which can be found at:
> > -          https://docs.yoctoproject.org
> > +      $ source
> /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64=
/build/init-build-env
> > +      Poky reference distro build
> >
> > -      For more information about OpenEmbedded see their website:
> > -          https://www.openembedded.org/
> > +#. **Examine Your Auto Configuration File:** When you set up the build
> > +   environment, an auto configuration file named ``auto.conf`` becomes
> > +   available in aa ``conf`` subdirectory of the :term:`Build
> Directory`. For this
> > +   example, the defaults are set to include three ``OE_FRAGMENTS``:
> > +   ``core/yocto/sstate-mirror-cdn``, ``machine/qemux86-64`` and
> ``distro/poky``.
> > +   These set up the environment similar to what was previously in the
> local
> > +   configuration file named ``local.conf`` which is now largely empty.
> > +   For more information on fragments, see
> :ref:`bitbake-user-manual/bitbake-user-manual-metadata:\`\`addfragments\`=
\`
> directive` in the Bitbake User Manual.
> >
> > -      ### Shell environment set up for builds. ###
> > +   ``core/yocto/sstate-mirror-cdn`` sets up
> :term:`BB_HASHSERVE_UPSTREAM` and
> > +   :term:`SSTATE_MIRRORS`. The definition can be found in
> > +
>  ``../layers/openembedded-core/meta/conf/fragments/yocto/sstate-mirror-cd=
n.conf``.
> >
> > -      You can now run 'bitbake <target>'
> > -
> > -      Common targets are:
> > -          core-image-minimal
> > -          core-image-full-cmdline
> > -          core-image-sato
> > -          core-image-weston
> > -          meta-toolchain
> > -          meta-ide-support
> > -
> > -      You can also run generated QEMU images with a command like
> 'runqemu qemux86-64'
> > +   .. code-block:: shell
> >
> > -      Other commonly useful commands are:
> > -       - 'devtool' and 'recipetool' handle common recipe tasks
> > -       - 'bitbake-layers' handles common layer tasks
> > -       - 'oe-pkgdata-util' handles common target package tasks
> > +      BB_CONF_FRAGMENT_SUMMARY =3D "Use prebuilt sstate artifacts for
> standard Yocto build configurations."
> > +      BB_CONF_FRAGMENT_DESCRIPTION =3D "The Yocto Project has prebuilt
> artefacts available for standard build configurations. \
> > +      This fragment enables their use. This will mean the build will
> query the \
> > +      the network to check for artefacts at the start of builds, which
> does slow it down \
> > +      initially but it will then speed up the builds by not having to
> build things if they are \
> > +      present in the cache. It assumes you can download something
> faster than you can build it \
> > +      which will depend on your network. \
> > +      Note: For this to work you also need hash-equivalence passthroug=
h
> to the matching server \
> > +      "
> >
> > -   Among other things, the script creates the :term:`Build Directory`,
> which is
> > -   ``build`` in this case and is located in the :term:`Source
> Directory`.  After
> > -   the script runs, your current working directory is set to the
> > -   :term:`Build Directory`. Later, when the build completes, the
> > -   :term:`Build Directory` contains all the files created during the
> build.
> > +      BB_HASHSERVE_UPSTREAM =3D 'wss://hashserv.yoctoproject.org/ws'
> > +      SSTATE_MIRRORS ?=3D "file://.*
> http://sstate.yoctoproject.org/all/PATH;downloadfilename=3DPATH"
> >
> >  #. **Examine Your Local Configuration File:** When you set up the buil=
d
> >     environment, a local configuration file named ``local.conf`` become=
s
> >     available in a ``conf`` subdirectory of the :term:`Build Directory`=
.
> For this
> > -   example, the defaults are set to build for a ``qemux86`` target,
> > +   example, the defaults are set to build for a ``qemux86-64`` target,
> >     which is suitable for emulation. The package manager used is set to
> >     the RPM package manager.
> >
> > @@ -249,13 +272,11 @@ an entire Linux distribution, including the
> toolchain, from source.
> >        This is relevant only when your network and the server that you
> use
> >        can download these artifacts faster than you would be able to
> build them.
> >
> > -      To use such mirrors, uncomment the below lines in your
> ``conf/local.conf``
> > -      file in the :term:`Build Directory`::
> > +      To use such mirrors, ``bitbake-setup`` includes the following in
> your
> > +         ``conf/auto.conf`` file (or you can add it to
> ``conf/local.conf``) in
> > +         the :term:`Build Directory`::
> >
> > -         BB_HASHSERVE_UPSTREAM =3D "wss://hashserv.yoctoproject.org/ws=
"
> > -         SSTATE_MIRRORS ?=3D "file://.*
> http://sstate.yoctoproject.org/all/PATH;downloadfilename=3DPATH"
> > -         BB_HASHSERVE =3D "auto"
> > -         BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> > +            OE_FRAGMENTS +=3D "core/yocto/sstate-mirror-cdn"
> >
> >        The hash equivalence server needs the websockets python module
> version 9.1
> >        or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora,
> CentOS Stream
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7457):
> https://lists.yoctoproject.org/g/docs/message/7457
> > Mute This Topic: https://lists.yoctoproject.org/mt/114789217/1686489
> > Group Owner: docs+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000005b0096063ccdcee0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 20,=
 2025 at 12:46=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Thanks Tim, this is basically fine, bu=
t has to be held until<br>
bitbake-setup actually lands (and then adjusted to match that<br>
version).<br></blockquote><div>Absolutely, this is why I put it out as an R=
FC. Plus I think (see the next paragraph) there needs to be some more discu=
ssion/thought about the documentation. We need to add more documentation ab=
out OE fragments and more about bitbake-setup configuration, etc.=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I also wonder if the documentation needs to show exactly what the tool<br>
outputs, as that is prone to becoming out of sync, and the users will<br>
see it for themselves anyway.<br></blockquote><div>=C2=A0</div><div>I defin=
itely agree and was on the fence about that. I was mostly following the pat=
tern that was already in the quick start guide. Plus links to metadata don&=
#39;t exist yet, so that wasn&#39;t an option either. We should continue to=
 discuss what will work best for the quick start guide and what else is nee=
ded elsewhere in the reference manual, etc.=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
--top-dir value can also be set from an environment variable, so you<br>
don&#39;t have to pass it in every time (and end up creating bogus top dir<=
br>
if forgetting to do so).<br></blockquote><div>=C2=A0</div><div>Good point. =
Perhaps I can document that in v3 instead of showing the command line.</div=
><div><br></div><div>I look forward to more discussion about all of this.</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
On Tue, 19 Aug 2025 at 23:35, Tim Orling via <a href=3D"http://lists.yoctop=
roject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a>=
<br>
&lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.yoctoproject.org" tar=
get=3D"_blank">konsulko.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;<br>
&gt; Largely replace the original Poky instructions with<br>
&gt; example instructions to use bitbake-setup.<br>
&gt;<br>
&gt; Introduce the concept of OE_FRAGMENTS and how it is<br>
&gt; used by bitbake-setup to setup SSTATE_MIRRORS, etc.<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0- fix typos/grammar errors<br>
&gt;=C2=A0 =C2=A0- use commas instead of en dash<br>
&gt;<br>
&gt;=C2=A0 documentation/brief-yoctoprojectqs/index.rst | 221 ++++++++++---=
------<br>
&gt;=C2=A0 1 file changed, 121 insertions(+), 100 deletions(-)<br>
&gt;<br>
&gt; diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentat=
ion/brief-yoctoprojectqs/index.rst<br>
&gt; index 4a6f13d7e..8ef1f5bf5 100644<br>
&gt; --- a/documentation/brief-yoctoprojectqs/index.rst<br>
&gt; +++ b/documentation/brief-yoctoprojectqs/index.rst<br>
&gt; @@ -87,75 +87,112 @@ distribution:<br>
&gt;=C2=A0 =C2=A0 =C2=A0see the :ref:`ref-manual/system-requirements:requir=
ed packages for the build host`<br>
&gt;=C2=A0 =C2=A0 =C2=A0section in the Yocto Project Reference Manual.<br>
&gt;<br>
&gt; -Use Git to Clone Poky<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +Use Git to Clone bitbake-setup<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
&gt;<br>
&gt;=C2=A0 Once you complete the setup instructions for your machine, you n=
eed to<br>
&gt; -get a copy of the Poky repository on your build host. Use the followi=
ng<br>
&gt; -commands to clone the Poky repository.<br>
&gt; +get a copy of the bitbake-setup tool to setup the Poky reference<br>
&gt; +distribution on your build host. Use the following commands to clone<=
br>
&gt; +the bitbake repository.<br>
&gt;<br>
&gt;=C2=A0 .. code-block:: shell<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0$ git clone git://<a href=3D"http://git.yoctoproject.org=
/poky" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/poky</a><b=
r>
&gt; -=C2=A0 =C2=A0Cloning into &#39;poky&#39;...<br>
&gt; -=C2=A0 =C2=A0remote: Counting<br>
&gt; -=C2=A0 =C2=A0objects: 432160, done. remote: Compressing objects: 100%=
<br>
&gt; -=C2=A0 =C2=A0(102056/102056), done. remote: Total 432160 (delta 32311=
6), reused<br>
&gt; -=C2=A0 =C2=A0432037 (delta 323000) Receiving objects: 100% (432160/43=
2160), 153.81 MiB | 8.54 MiB/s, done.<br>
&gt; -=C2=A0 =C2=A0Resolving deltas: 100% (323116/323116), done.<br>
&gt; -=C2=A0 =C2=A0Checking connectivity... done.<br>
&gt; +=C2=A0 =C2=A0$ git clone git://<a href=3D"http://git.openembedded.org=
/bitbake" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/bitbake=
</a> bitbake-setup<br>
&gt; +=C2=A0 =C2=A0Cloning into &#39;bitbake-setup&#39;...<br>
&gt; +=C2=A0 =C2=A0remote: Enumerating objects: 68454, done.<br>
&gt; +=C2=A0 =C2=A0remote: Counting objects: 100% (49/49), done.<br>
&gt; +=C2=A0 =C2=A0remote: Compressing objects: 100% (44/44), done.<br>
&gt; +=C2=A0 =C2=A0remote: Total 68454 (delta 31), reused 5 (delta 5), pack=
-reused 68405 (from 1)<br>
&gt; +=C2=A0 =C2=A0Receiving objects: 100% (68454/68454), 14.17 MiB | 10.56=
 MiB/s, done.<br>
&gt; +=C2=A0 =C2=A0Resolving deltas: 100% (51776/51776), done.<br>
&gt;<br>
&gt; -Go to :yocto_wiki:`Releases wiki page &lt;/Releases&gt;`, and choose =
a release<br>
&gt; -codename (such as ``&amp;DISTRO_NAME_NO_CAP;``), corresponding to eit=
her the<br>
&gt; -latest stable release or a Long Term Support release.<br>
&gt; +Setup a build environment with the following command:<br>
&gt;<br>
&gt; -Then move to the ``poky`` directory and take a look at existing branc=
hes:<br>
&gt; +.. code-block:: shell<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0$ ./bitbake-setup/bin/bitbake-setup init<br>
&gt; +<br>
&gt; +By default, this will setup in $HOME/bitbake-builds. If you prefer to=
<br>
&gt; +setup your builds in a different directory, for example the current<b=
r>
&gt; +directory, you can instead use the ``--top-dir`` argument:<br>
&gt;<br>
&gt;=C2=A0 .. code-block:: shell<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0$ cd poky<br>
&gt; -=C2=A0 =C2=A0$ git branch -a<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0remotes/origin/HEAD -&gt; origin/master<br>
&gt; -=C2=A0 =C2=A0remotes/origin/dunfell<br>
&gt; -=C2=A0 =C2=A0remotes/origin/dunfell-next<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0remotes/origin/gatesgarth<br>
&gt; -=C2=A0 =C2=A0remotes/origin/gatesgarth-next<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0remotes/origin/master<br>
&gt; -=C2=A0 =C2=A0remotes/origin/master-next<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -=C2=A0 =C2=A0.<br>
&gt; -<br>
&gt; -<br>
&gt; -For this example, check out the ``&amp;DISTRO_NAME_NO_CAP;`` branch b=
ased on the<br>
&gt; -``&amp;DISTRO_NAME;`` release:<br>
&gt; +=C2=A0 $ ./bitbake-setup/bin/bitbake-setup init --top-dir $PWD<br>
&gt; +<br>
&gt; +`bitbake-setup init` is an interactive program by default and will as=
k<br>
&gt; +you to make some decisions. Depending on your answers, the choices ma=
y<br>
&gt; +differ from the examples below.<br>
&gt; +<br>
&gt; +#. Choose a configuration (for example, ``yocto-master-options``):<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0.. code-block:: shell<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Available configurations:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 0. yocto-master-nested-configs=C2=A0 =C2=A0(futu=
re) Official Yocto configurations: poky, poky-altcfg, poky-tiny, for qemux8=
6-64 and arm64 (defined with nested configurations)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 1. yocto-master-options=C2=A0 (future) Official =
Yocto configurations: poky, poky-altcfg, poky-tiny, for qemux86-64, riscv64=
 and arm64 (defined with options)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Please select one of the above configurations by=
 its number:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 1<br>
&gt; +<br>
&gt; +#. Choose a target machine (for example, ``qemux86-64``):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0.. code-block:: shell<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Selecting the only available bitbake configurati=
on poky<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Available target machines:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 0. machine/qemux86-64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 1. machine/qemuarm64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 2. machine/qemuriscv64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Please select one of the above options by its nu=
mber:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 0<br>
&gt; +<br>
&gt; +#. Choose a distribution (for example, ``poky``):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0.. code-block:: shell<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Available distributions:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 0. distro/poky<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 1. distro/poky-altcfg<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 2. distro/poky-tiny<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Please select one of the above options by its nu=
mber:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Run &#39;bitbake-setup yocto-master-options poky=
 distro/poky machine/qemux86-64&#39; to select this configuration non-inter=
actively.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Initializing a build in /path/to/top-dir/yocto-m=
aster-options-poky-distro_poky-machine_qemux86-64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Fetching layer/tool repository bitbake into /pat=
h/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/layer=
s/bitbake<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Fetching layer/tool repository openembedded-core=
 into /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux8=
6-64/layers/openembedded-core<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Fetching layer/tool repository meta-yocto into /=
path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/la=
yers/meta-yocto<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Fetching layer/tool repository yocto-docs into /=
path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/la=
yers/yocto-docs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Setting up bitbake configuration in /path/to/top=
-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 This bitbake configuration provides: Poky refere=
nce distro build<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Usage instructions and additional information ar=
e in /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86=
-64/build/README<br>
&gt; +<br>
&gt; +If you prefer to run non-interactively, you could use a command<br>
&gt; +like the following:<br>
&gt;<br>
&gt;=C2=A0 .. code-block:: shell<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0$ git checkout -t origin/&amp;DISTRO_NAME_NO_CAP; -b my-=
&amp;DISTRO_NAME_NO_CAP;<br>
&gt; -=C2=A0 =C2=A0Branch &#39;my-&amp;DISTRO_NAME_NO_CAP;&#39; set up to t=
rack remote branch &#39;&amp;DISTRO_NAME_NO_CAP;&#39; from &#39;origin&#39;=
.<br>
&gt; -=C2=A0 =C2=A0Switched to a new branch &#39;my-&amp;DISTRO_NAME_NO_CAP=
;&#39;<br>
&gt; +=C2=A0 =C2=A0$ bitbake-setup yocto-master-options poky distro/poky ma=
chine/qemux86-64<br>
&gt;<br>
&gt; -The previous Git checkout command creates a local branch named<br>
&gt; -``my-&amp;DISTRO_NAME_NO_CAP;``. The files available to you in that b=
ranch<br>
&gt; -exactly match the repository&#39;s files in the ``&amp;DISTRO_NAME_NO=
_CAP;``<br>
&gt; -release branch.<br>
&gt; +Among other things, the script creates the :term:`Build Directory`, w=
hich is<br>
&gt; +``build`` in this case and is located in the &quot;top-dir&quot; dire=
ctory.=C2=A0 The script<br>
&gt; +also clones the layers needed to build the Poky reference distributio=
n, in the<br>
&gt; +``layers`` subdirectory. After the script runs, your current working =
directory<br>
&gt; +is set to the :term:`Build Directory`. Later, when the build complete=
s, the<br>
&gt; +:term:`Build Directory` contains all the files created during the bui=
ld.<br>
&gt;<br>
&gt; -Note that you can regularly type the following command in the same di=
rectory<br>
&gt; -to keep your local files in sync with the release branch:<br>
&gt; +<br>
&gt; +Information about the build environment can be found in ``/path/to/to=
p-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/README=
`` which should look something like the following:<br>
&gt;<br>
&gt;=C2=A0 .. code-block:: shell<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0$ git pull<br>
&gt; +=C2=A0 =C2=A0Poky reference distro build<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0Additional information is in /path/to/top-dir/yocto-mast=
er-options-poky-distro_poky-machine_qemux86-64/build/conf/conf-summary.txt =
and /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-=
64/build/conf/conf-notes.txt<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0Source the environment using &#39;. /path/to/top-dir/yoc=
to-master-options-poky-distro_poky-machine_qemux86-64/build/init-build-env&=
#39; to run builds from the command line.<br>
&gt; +=C2=A0 =C2=A0The bitbake configuration files (local.conf, bblayers.co=
nf and more) can be found in /path/to/top-dir/yocto-master-options-poky-dis=
tro_poky-machine_qemux86-64/build/conf<br>
&gt;<br>
&gt;=C2=A0 For more options and information about accessing Yocto Project r=
elated<br>
&gt;=C2=A0 repositories, see the<br>
&gt; @@ -182,61 +219,47 @@ an entire Linux distribution, including the tool=
chain, from source.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;:yocto_wiki:`Working Behind a Network=
 Proxy &lt;/Working_Behind_a_Network_Proxy&gt;`&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 page of the Yocto Project Wiki.<br>
&gt;<br>
&gt; -#. **Initialize the Build Environment:** From within the ``poky``<br>
&gt; -=C2=A0 =C2=A0directory, run the :ref:`ref-manual/structure:``oe-init-=
build-env```<br>
&gt; -=C2=A0 =C2=A0environment<br>
&gt; -=C2=A0 =C2=A0setup script to define Yocto Project&#39;s build environ=
ment on your<br>
&gt; -=C2=A0 =C2=A0build host.<br>
&gt; +#. **Initialize the Build Environment:**<br>
&gt; +=C2=A0 =C2=A0Run the ``init-build-env`` environment setup script with=
in the build directory<br>
&gt; +=C2=A0 =C2=A0to define Yocto Project&#39;s build environment on your =
build host.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0.. code-block:: shell<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 $ cd poky<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 $ source oe-init-build-env<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 You had no conf/local.conf file. This configurat=
ion file has therefore been<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 created for you with some default values. You ma=
y wish to edit it to, for<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 example, select a different MACHINE (target hard=
ware). See conf/local.conf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 for more information as common configuration opt=
ions are commented.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 You had no conf/bblayers.conf file. This configu=
ration file has therefore<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 been created for you with some default values. T=
o add additional metadata<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 layers into your configuration please add entrie=
s to conf/bblayers.conf.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 The Yocto Project has extensive documentation ab=
out OE including a reference<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 manual which can be found at:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://docs.yoctoproje=
ct.org" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org<=
/a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 $ source /path/to/top-dir/yocto-master-options-p=
oky-distro_poky-machine_qemux86-64/build/init-build-env<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Poky reference distro build<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 For more information about OpenEmbedded see thei=
r website:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.openembedde=
d.org/" rel=3D"noreferrer" target=3D"_blank">https://www.openembedded.org/<=
/a><br>
&gt; +#. **Examine Your Auto Configuration File:** When you set up the buil=
d<br>
&gt; +=C2=A0 =C2=A0environment, an auto configuration file named ``auto.con=
f`` becomes<br>
&gt; +=C2=A0 =C2=A0available in aa ``conf`` subdirectory of the :term:`Buil=
d Directory`. For this<br>
&gt; +=C2=A0 =C2=A0example, the defaults are set to include three ``OE_FRAG=
MENTS``:<br>
&gt; +=C2=A0 =C2=A0``core/yocto/sstate-mirror-cdn``, ``machine/qemux86-64``=
 and ``distro/poky``.<br>
&gt; +=C2=A0 =C2=A0These set up the environment similar to what was previou=
sly in the local<br>
&gt; +=C2=A0 =C2=A0configuration file named ``local.conf`` which is now lar=
gely empty.<br>
&gt; +=C2=A0 =C2=A0For more information on fragments, see :ref:`bitbake-use=
r-manual/bitbake-user-manual-metadata:\`\`addfragments\`\` directive` in th=
e Bitbake User Manual.<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ### Shell environment set up for builds. ###<br>
&gt; +=C2=A0 =C2=A0``core/yocto/sstate-mirror-cdn`` sets up :term:`BB_HASHS=
ERVE_UPSTREAM` and<br>
&gt; +=C2=A0 =C2=A0:term:`SSTATE_MIRRORS`. The definition can be found in<b=
r>
&gt; +=C2=A0 =C2=A0``../layers/openembedded-core/meta/conf/fragments/yocto/=
sstate-mirror-cdn.conf``.<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 You can now run &#39;bitbake &lt;target&gt;&#39;=
<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 Common targets are:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 core-image-minimal<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 core-image-full-cmdline<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 core-image-sato<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 core-image-weston<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-toolchain<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-ide-support<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 You can also run generated QEMU images with a co=
mmand like &#39;runqemu qemux86-64&#39;<br>
&gt; +=C2=A0 =C2=A0.. code-block:: shell<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 Other commonly useful commands are:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0- &#39;devtool&#39; and &#39;recipetool&#3=
9; handle common recipe tasks<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0- &#39;bitbake-layers&#39; handles common =
layer tasks<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0- &#39;oe-pkgdata-util&#39; handles common=
 target package tasks<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 BB_CONF_FRAGMENT_SUMMARY =3D &quot;Use prebuilt =
sstate artifacts for standard Yocto build configurations.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 BB_CONF_FRAGMENT_DESCRIPTION =3D &quot;The Yocto=
 Project has prebuilt artefacts available for standard build configurations=
. \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 This fragment enables their use. This will mean =
the build will query the \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 the network to check for artefacts at the start =
of builds, which does slow it down \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 initially but it will then speed up the builds b=
y not having to build things if they are \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 present in the cache. It assumes you can downloa=
d something faster than you can build it \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 which will depend on your network. \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Note: For this to work you also need hash-equiva=
lence passthrough to the matching server \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0Among other things, the script creates the :term:`Build =
Directory`, which is<br>
&gt; -=C2=A0 =C2=A0``build`` in this case and is located in the :term:`Sour=
ce Directory`.=C2=A0 After<br>
&gt; -=C2=A0 =C2=A0the script runs, your current working directory is set t=
o the<br>
&gt; -=C2=A0 =C2=A0:term:`Build Directory`. Later, when the build completes=
, the<br>
&gt; -=C2=A0 =C2=A0:term:`Build Directory` contains all the files created d=
uring the build.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 BB_HASHSERVE_UPSTREAM =3D &#39;wss://<a href=3D"=
http://hashserv.yoctoproject.org/ws" rel=3D"noreferrer" target=3D"_blank">h=
ashserv.yoctoproject.org/ws</a>&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 SSTATE_MIRRORS ?=3D &quot;file://.* <a href=3D"h=
ttp://sstate.yoctoproject.org/all/PATH;downloadfilename=3DPATH" rel=3D"nore=
ferrer" target=3D"_blank">http://sstate.yoctoproject.org/all/PATH;downloadf=
ilename=3DPATH</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 #. **Examine Your Local Configuration File:** When you set up th=
e build<br>
&gt;=C2=A0 =C2=A0 =C2=A0environment, a local configuration file named ``loc=
al.conf`` becomes<br>
&gt;=C2=A0 =C2=A0 =C2=A0available in a ``conf`` subdirectory of the :term:`=
Build Directory`. For this<br>
&gt; -=C2=A0 =C2=A0example, the defaults are set to build for a ``qemux86``=
 target,<br>
&gt; +=C2=A0 =C2=A0example, the defaults are set to build for a ``qemux86-6=
4`` target,<br>
&gt;=C2=A0 =C2=A0 =C2=A0which is suitable for emulation. The package manage=
r used is set to<br>
&gt;=C2=A0 =C2=A0 =C2=A0the RPM package manager.<br>
&gt;<br>
&gt; @@ -249,13 +272,11 @@ an entire Linux distribution, including the tool=
chain, from source.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 This is relevant only when your network and=
 the server that you use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 can download these artifacts faster than yo=
u would be able to build them.<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 To use such mirrors, uncomment the below lines i=
n your ``conf/local.conf``<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 file in the :term:`Build Directory`::<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 To use such mirrors, ``bitbake-setup`` includes =
the following in your<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0``conf/auto.conf`` file (or you can=
 add it to ``conf/local.conf``) in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the :term:`Build Directory`::<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BB_HASHSERVE_UPSTREAM =3D &quot;wss=
://<a href=3D"http://hashserv.yoctoproject.org/ws" rel=3D"noreferrer" targe=
t=3D"_blank">hashserv.yoctoproject.org/ws</a>&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SSTATE_MIRRORS ?=3D &quot;file://.*=
 <a href=3D"http://sstate.yoctoproject.org/all/PATH;downloadfilename=3DPATH=
" rel=3D"noreferrer" target=3D"_blank">http://sstate.yoctoproject.org/all/P=
ATH;downloadfilename=3DPATH</a>&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BB_HASHSERVE =3D &quot;auto&quot;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BB_SIGNATURE_HANDLER =3D &quot;OEEq=
uivHash&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OE_FRAGMENTS +=3D &quot;cor=
e/yocto/sstate-mirror-cdn&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 The hash equivalence server needs the webso=
ckets python module version 9.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 or later. Debian GNU/Linux 12 (Bookworm) an=
d later, Fedora, CentOS Stream<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7457): <a href=3D"https://lists.yoctoproject.org/g=
/docs/message/7457" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/docs/message/7457</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11478921=
7/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/114789217/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" ta=
rget=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" r=
el=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/u=
nsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000005b0096063ccdcee0--

