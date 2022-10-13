Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BB3C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 09:44:42 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web12.5588.1665654277796132078
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 02:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GhWz5/+X;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id u2so679438ilv.6
        for <docs@lists.yoctoproject.org>; Thu, 13 Oct 2022 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dmqz0oxq3uJt+ePDnFOPAJPThLNzZBFjwWiANZchvcw=;
        b=GhWz5/+XfjSLMhLtvquZTG/5cn14f1aD31b7x76L2FcPY6YnHeEInbCIHj2/02O2Hb
         1U62zkqWlNNvt7GOiQMc7oetOTrRYCLSXe7OPulYMDMn0SzYmNOVj7dKXfAnZsx44Sky
         GbZEs/ovTJzh+Fb+ByuuXHxlY8mTbN0ROhcIcxIJno9V+i+T0h21pdqhbhQpwRJsGFXj
         qPAYPJ0ymdelIDBUV94vEZlP9O9SnZbZDb1Ka/RTMzmKZ3uAFAG8kWmqzeTa0sSfUE2H
         gits8azj0HdgJhEN6Pj8aqG8FF2x7Tps2OSTzNYzaja5mgAeYDPVWc4jcqjZ3I2rAweY
         4xcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dmqz0oxq3uJt+ePDnFOPAJPThLNzZBFjwWiANZchvcw=;
        b=rtRsiA5PkiQOgDmus/mxZ2NtcmYadxlduWdeyEkfzGUCOADGlq/79PwtImw267wTEI
         3suAQ+wuB/8yHlDaJraenv4NbCaxL6PEw1vsGZx7o6qLJG+PE92bNjNt60pCNgx6KLRd
         EhYD6xMcJZJgR0fLO9x/o531tdOK9DCsuJKU8M75pZK2612c8HfGdwEHRZMwTjJCr8VT
         tumzhrO/udZHKUu0ljqNLT029ZTTKj59sYY6+MYxMU9d96a+tzLMz8pFP3JOj5cAsLH3
         vhxlMuxZ1r/vjoplxgMBLk5lSWhCORQeT20QNV8u/5L6T3n4+q88NoQMj35NlXUtUpM8
         eglw==
X-Gm-Message-State: ACrzQf3TLtGUJPcvT/V8lBXFOVq2k7LJhgDdd0CJPiSrtzPwRBMzTjIT
	U32e7g3zeV1nNseiy/hIgcs/wAwG5s4hnF+l5hU=
X-Google-Smtp-Source: AMsMyM75mh/ZgsU8lMi92IyNzwsQd61LGYw3Q9Z0NqTaXV4MRFhTmOIwXM/oOAFb1Lbhmq1AcHuOou0c6Z3XdReMzdU=
X-Received: by 2002:a05:6e02:164c:b0:2fc:681a:6aad with SMTP id
 v12-20020a056e02164c00b002fc681a6aadmr8271225ilu.209.1665654276994; Thu, 13
 Oct 2022 02:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221013093349.2967708-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20221013093349.2967708-1-michael.opdenacker@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Oct 2022 11:44:25 +0200
Message-ID: <CANNYZj8c5XDjYTD4Ec47tGdRECd454qDBniJGs2RH8R=PYQONA@mail.gmail.com>
Subject: Re: [docs] [PATCH] RFC: stop advising to build from the source directory
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Oct 2022 09:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3361

I would wait until the proposed oe-setup-build tool lands in master,
and then adjust the documentation to recommend that to set up builds.

The tool already does what you suggest, e.g. makes sensible choices
for build directories, and without requiring users to make those
decisions.
Do you have a moment to review that?

https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/package-version-updates&id=7659896ce5ea0bfea3a2c04b83915a48f70a5af9

Alex

On Thu, 13 Oct 2022 at 11:33, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Recommending to build typically from the parent directory in which
> poky was cloned, or another directory.
>
> ---
>
> I'm proposing to guide users to avoid building from the source
> directory. That's already recommended in dev-manual/common-tasks.rst:
>
>    In any event, it's typically cleaner to locate the build directory
>    somewhere outside of your source directory.
>
> I've only made quick changes so far, but if we agree to go in this
> direction, I will cautiously adapt the instructions so that they
> look natural (not asking to run "cd poky/.." for example).
>
> What do you think? Wouldn't it be cleaner?
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst   | 12 +++++-------
>  documentation/bsp-guide/bsp.rst                |  6 +++---
>  documentation/dev-manual/common-tasks.rst      |  5 ++---
>  documentation/dev-manual/qemu.rst              |  3 +--
>  documentation/kernel-dev/common.rst            | 10 +++++-----
>  documentation/profile-manual/usage.rst         |  4 ++--
>  documentation/ref-manual/structure.rst         |  4 ++--
>  documentation/ref-manual/terms.rst             |  8 --------
>  documentation/sdk-manual/appendix-obtain.rst   |  4 ++--
>  documentation/toaster-manual/setup-and-use.rst | 12 ++++++------
>  10 files changed, 28 insertions(+), 40 deletions(-)
>
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 7ae0ddc349..a7b7703a8f 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -184,16 +184,14 @@ an entire Linux distribution, including the toolchain, from source.
>        ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
>        page of the Yocto Project Wiki.
>
> -#. **Initialize the Build Environment:** From within the ``poky``
> -   directory, run the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``
> -   environment
> -   setup script to define Yocto Project's build environment on your
> +#. **Initialize the Build Environment:** From within the parent directory of
> +   the ``poky`` directory, run the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``
> +   environment setup script to define Yocto Project's build environment on your
>     build host.
>
>     .. code-block:: shell
>
> -      $ cd poky
> -      $ source oe-init-build-env
> +      $ source poky/oe-init-build-env
>        You had no conf/local.conf file. This configuration file has therefore been
>        created for you with some default values. You may wish to edit it to, for
>        example, select a different MACHINE (target hardware). See conf/local.conf
> @@ -361,7 +359,7 @@ Follow these steps to add a hardware layer:
>
>     .. code-block:: shell
>
> -      $ cd poky/build
> +      $ cd build
>        $ bitbake-layers add-layer ../meta-altera
>        NOTE: Starting bitbake server...
>        Parsing recipes: 100% |##################################################################| Time: 0:00:32
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 7e17b42886..42c0baf2e7 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -228,13 +228,13 @@ section.
>        Resolving deltas: 100% (2447/2447), done.
>        Checking connectivity... done.
>
> -#. *Initialize the Build Environment:* While in the root directory of
> -   the Source Directory (i.e. ``poky``), run the
> +#. *Initialize the Build Environment:* Outside of the the Source Directory
> +   (i.e. ``poky``), for example in the parent directory, run the
>     :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
>     setup script to define the OpenEmbedded build environment on your
>     build host. ::
>
> -      $ source oe-init-build-env
> +      $ source poky/oe-init-build-env
>
>     Among other things, the script creates the :term:`Build Directory`, which is
>     ``build`` in this case and is located in the :term:`Source Directory`.  After
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 0d4e814f66..fbfd6a6a18 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -3022,8 +3022,7 @@ The following steps describe how to set up the AUH utility:
>     script to create a fresh build directory that you use exclusively for
>     running the AUH utility::
>
> -      $ cd poky
> -      $ source oe-init-build-env your_AUH_build_directory
> +      $ source poky/oe-init-build-env your_AUH_build_directory
>
>     Re-using an existing build directory and its configurations is not
>     recommended as existing settings could cause AUH to fail or behave
> @@ -3667,7 +3666,7 @@ The following figure and list overviews the build process:
>     by sourcing the build environment script (i.e.
>     :ref:`structure-core-script`)::
>
> -      $ source oe-init-build-env [build_dir]
> +      $ source poky/oe-init-build-env [build_dir]
>
>     When you use the initialization script, the OpenEmbedded build system
>     uses ``build`` as the default :term:`Build Directory` in your current work
> diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
> index 9f4bc264a3..a57a290c52 100644
> --- a/documentation/dev-manual/qemu.rst
> +++ b/documentation/dev-manual/qemu.rst
> @@ -57,8 +57,7 @@ available. Follow these general steps to run QEMU:
>        unpacked a Yocto Project release tarball, you can source the build
>        environment script (i.e. :ref:`structure-core-script`)::
>
> -         $ cd poky
> -         $ source oe-init-build-env
> +         $ source poky/oe-init-build-env
>
>     -  If you installed a cross-toolchain, you can run the script that
>        initializes the toolchain. For example, the following commands run
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> index 0a1819ceae..be0d4291d5 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -56,8 +56,7 @@ section:
>     you need to initialize the BitBake build environment by sourcing
>     the build environment script (i.e. :ref:`structure-core-script`)::
>
> -      $ cd poky
> -      $ source oe-init-build-env
> +      $ source poky/oe-init-build-env
>
>     .. note::
>
> @@ -177,7 +176,8 @@ section:
>        $ git branch
>        master
>        * &DISTRO_NAME_NO_CAP;
> -      $ source oe-init-build-env
> +      $ cd ..
> +      $ source poky/oe-init-build-env
>
>     .. note::
>
> @@ -1074,8 +1074,8 @@ The following commands initialize the BitBake environment, run the
>  task, and launch ``menuconfig``. These commands assume the Source
>  Directory's top-level folder is ``poky``::
>
> -   $ cd poky
> -   $ source oe-init-build-env
> +   $ cd poky/..
> +   $ source poky/oe-init-build-env
>     $ bitbake linux-yocto -c kernel_configme -f
>     $ bitbake linux-yocto -c menuconfig
>
> diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
> index 49f8af4a74..60b9ecdb66 100644
> --- a/documentation/profile-manual/usage.rst
> +++ b/documentation/profile-manual/usage.rst
> @@ -1907,8 +1907,8 @@ Running a Script on a Target
>  Once you've done that, you should be able to run a systemtap script on
>  the target::
>
> -   $ cd /path/to/yocto
> -   $ source oe-init-build-env
> +   $ cd /path/to/poky/..
> +   $ source poky/oe-init-build-env
>
>     ### Shell environment set up for builds. ###
>
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index fe27d17caa..4440ac4f3d 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -158,7 +158,7 @@ directory becomes the Build Directory, and you are presented with some
>  simple suggestions as to what to do next, including a list of some
>  possible targets to build. Here is an example::
>
> -   $ source oe-init-build-env
> +   $ source poky/oe-init-build-env
>
>     ### Shell environment set up for builds. ###
>
> @@ -189,7 +189,7 @@ you direct the OpenEmbedded build system to create a Build Directory of
>  your choice. For example, the following command creates a Build
>  Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`::
>
> -   $ source oe-init-build-env ~/mybuilds
> +   $ source poky/oe-init-build-env ~/mybuilds
>
>  The OpenEmbedded build system uses the template configuration files, which
>  are found by default in the ``meta-poky/conf/templates/default`` directory in the Source
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index 1e3f718a8f..6af2eb6385 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -70,14 +70,6 @@ universal, the list includes them just in case:
>        Following are some examples that show how to create the directory.  The
>        examples assume your :term:`Source Directory` is named ``poky``:
>
> -         -  Create the Build Directory inside your Source Directory and let
> -            the name of the Build Directory default to ``build``:
> -
> -            .. code-block:: shell
> -
> -               $ cd poky
> -               $ source oe-init-build-env
> -
>           -  Create the Build Directory inside your home directory and
>              specifically name it ``test-builds``:
>
> diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
> index 7a09a83af8..5568d3cc34 100644
> --- a/documentation/sdk-manual/appendix-obtain.rst
> +++ b/documentation/sdk-manual/appendix-obtain.rst
> @@ -107,14 +107,14 @@ build the SDK installer. Follow these steps:
>     how to clone the ``poky`` repository and check out the appropriate
>     branch for your work.
>
> -3. *Initialize the Build Environment:* While in the root directory of
> +3. *Initialize the Build Environment:* While in the parent directory of
>     the Source Directory (i.e. ``poky``), run the
>     :ref:`structure-core-script` environment
>     setup script to define the OpenEmbedded build environment on your
>     build host.
>     ::
>
> -      $ source oe-init-build-env
> +      $ source poky/oe-init-build-env
>
>     Among other things, the script
>     creates the :term:`Build Directory`,
> diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
> index 72a15b5f2d..14fc23ce4d 100644
> --- a/documentation/toaster-manual/setup-and-use.rst
> +++ b/documentation/toaster-manual/setup-and-use.rst
> @@ -14,14 +14,14 @@ dependencies as described in the ":ref:`toaster-manual/start:Preparing to Use
>  Toaster`" chapter, you are ready to start
>  Toaster.
>
> -Navigate to the root of your
> +Navigate to the parent directory of the root of your
>  :term:`Source Directory` (e.g. ``poky``)::
>
> -   $ cd poky
> +   $ cd poky/..
>
>  Once in that directory, source the build environment script::
>
> -   $ source oe-init-build-env
> +   $ source poky/oe-init-build-env
>
>  Next, from the build directory (e.g.
>  ``poky/build``), start Toaster using this command::
> @@ -437,9 +437,9 @@ Perform the following steps to install Toaster:
>        #export http_proxy=http://proxy.host.com:8080
>        #export https_proxy=http://proxy.host.com:8080
>        #export GIT_PROXY_COMMAND=$HOME/bin/gitproxy
> -      cd poky/
> -      source ./oe-init-build-env build
> -      source ../bitbake/bin/toaster $1 noweb
> +      cd poky/..
> +      source poky/oe-init-build-env build
> +      source ../poky/bitbake/bin/toaster $1 noweb
>        [ "$1" == 'start' ] && /bin/bash
>
>  #.  Run the service::
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3360): https://lists.yoctoproject.org/g/docs/message/3360
> Mute This Topic: https://lists.yoctoproject.org/mt/94300257/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

