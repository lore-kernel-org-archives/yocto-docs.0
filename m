Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3EACCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:14:19 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.19333.1761927252171278818
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 09:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L8TdGZK2;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8801f0f46b6so17043086d6.2
        for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 09:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761927251; x=1762532051; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lH2CvRQEZ3KL8ndCuM2rYwtRqs5f4iRBiI8X2bLwcw=;
        b=L8TdGZK2R80umYPunYTW9NBnezmJzd76oj5EMarrUugzkyLNf4YnlL5PPDqqar7WQr
         zxikRE/a5di/81XWuUew2HGx04uhoEY1M7PiJKi72HTe5CdBlPiXh2wwjqNtzMgATlrb
         jUmnqY+vO/gamaqKIS0sOyCGVTn0W2R/jhSqW+KoEixX8I5PWPQgf4hGvI8lotIbX3eU
         SEhDvZVfvckxHwQ8Y3tBFfkcYTSt39Zev34ah2NyIEaIY+9rQve8faR/bEkHsNpfVpTq
         76BqWbzhV05eg7x7TS6P6VrajAlIH61NfFAp5xadiO2OK1nym7cY49l+/LM/NDYIl2dH
         HLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761927251; x=1762532051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lH2CvRQEZ3KL8ndCuM2rYwtRqs5f4iRBiI8X2bLwcw=;
        b=gMiemAzwudY/Kqirx8Tg/L+iTkfneP4QJR8DbDSzXvzJbPOiakmUa0/orMmElsC/qW
         snoJkOJOg0WsIFp64HvHjqOSokXX/PRaGi44NCquME6aJT8mxtfaix1L8zlu4bG2Pjqe
         bz1go+OZQroIBlGxR6cNP+Mlc/8a4CD+bv0X+iaufLq4tYGVfd+v1JmreIMYxLi5dW1F
         2zzy//Vx329NA/NSGXqlbvOlthRyDusBnm+rkTCcWyRxZF9+Q1F2zNToOWY9BCazX16C
         twLWRrx0E0g0FEpt24hxcBUtf9OBKAqiRzgD1i2ZAai1xP4FKvSM3wAS9YCbN0xqUrL4
         aE5A==
X-Gm-Message-State: AOJu0Yw7mDo/uAQICy88AdGp7tZrqD+JawPk4kOBLGSvRURteUAqHT9p
	OJdl/4GR+LBOSwjeWfPjFZRT5lGlxbElYbq7CdSvHJZaiXiwXPxjcirMDnZgo0yYrx/VnKVbIDn
	Hyk5jYEcSTxxNH+v+umahDzkNggBb/vxmAg==
X-Gm-Gg: ASbGncvZsUVe65aYJ48BOHYDL7FcQgpyIvyPX2HX7FlAjPwxoqhFrVcsY5fobsME51K
	LgMEpLU7ahe6fUt6qCGvsGRTEQUzMdZ9U1ogqF4fgws4hTw2PSlPrvBI3JCtUCsA9HuebNV2edF
	DM2eAn3MPrM8tevnkYY8bU6nF6K//O8vciIrvyunO7ZXjDBCmBoC/MtXj3C+XCBgMDeVa9Ef46c
	S3n7LVy5IG7xBlTL7AobESRCTRKQrzJsZVpCj0RIVLx5iqQCa7jJAe1anPpuDjYBvI/LC0b0ios
	sS1S2SxRMYMqqRlVzV8CgKgesN1xgjOJAj8MJ1V8drd0g5JkPLzGRU92vA==
X-Google-Smtp-Source: AGHT+IHZ/RJhxeWL2tYXh5ROY/d0YFiLwyWGLlgll4Qm7TtJUMe4eiSlzQmts6j6VX1XgUdZvTFldvOjUMtf108FESI=
X-Received: by 2002:a05:6214:2467:b0:87c:224c:64e7 with SMTP id
 6a1803df08f44-8802f30957fmr55196606d6.20.1761927250982; Fri, 31 Oct 2025
 09:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com> <20251030-bitbake-setup-v1-5-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-5-f44a8a2b7c0b@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Oct 2025 17:13:59 +0100
X-Gm-Features: AWmQ_bmj3dZwmbH7cdbrhyZmytXDQwzzeK5gFGyZh2qhKWsrSRyt_-aLbsPhGJg
Message-ID: <CANNYZj_i+2NBjrPnmu9+i-KjOx3QZ6HCpp8a63ewbrbz+HVXdg@mail.gmail.com>
Subject: Re: [docs] [PATCH 5/6] dev-manual: add a document to setup poky manually
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 16:14:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7956

lgtm.

Alex

On Thu, 30 Oct 2025 at 17:29, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
>
> Add a new document describing how to setup the Poky reference
> distribution manually. This document is referenced in the Quick Guide,
> so that users that _know_ they want to setup Poky without bitbake-setup
> have a link to it.
>
> This document is also important to reflect the layout of the layers
> expected by the bblayers.conf.sample file, as explained in [1].
>
> [1]: https://lore.kernel.org/poky/20251028-update-bblayers-sample-v1-1-97ec54cda94e@bootlin.com/
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst   |  10 +-
>  documentation/dev-manual/index.rst             |   1 +
>  documentation/dev-manual/poky-manual-setup.rst | 125 +++++++++++++++++++++++++
>  3 files changed, 135 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index c79b53a8b..74afe638a 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -204,6 +204,12 @@ This directory contains:
>  -  A ``config`` directory, representing the current configuration used in this
>     directory.
>
> +.. note::
> +
> +   It is also possible to setup the :term:`Poky` reference distro manually. For
> +   that refer to the :doc:`/dev-manual/poky-manual-setup` section of the Yocto
> +   Project Development Tasks Manual.
> +
>  Building Your Image
>  ===================
>
> @@ -267,7 +273,9 @@ an entire Linux distribution, including the toolchain, from source.
>
>         These set up the environment similar to what was previously in the local
>         configuration file :ref:`local.conf <structure-build-conf-local.conf>`,
> -       which is now largely empty.
> +       which is now largely empty. To setup the build how it was done
> +       previously, see the :doc:`/dev-manual/poky-manual-setup` section of the
> +       Yocto Project Development Tasks Manual.
>
>      .. note::
>
> diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
> index 7a581236a..adf776e00 100644
> --- a/documentation/dev-manual/index.rst
> +++ b/documentation/dev-manual/index.rst
> @@ -17,6 +17,7 @@ Yocto Project Development Tasks Manual
>     upgrading-recipes
>     temporary-source-code
>     creating-fragments
> +   poky-manual-setup
>     quilt.rst
>     development-shell
>     python-development-shell
> diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
> new file mode 100644
> index 000000000..c760f2c2c
> --- /dev/null
> +++ b/documentation/dev-manual/poky-manual-setup.rst
> @@ -0,0 +1,125 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Setting Up the Poky Reference Distro Manually
> +*********************************************
> +
> +While the default way to setup the :term:`Poky` reference distro is to use
> +``bitbake-setup``, it is also possible to manually setup the environment. This
> +document guides through this setup step-by-step.
> +
> +.. note::
> +
> +   This document will produce a setup similar to what is described in
> +   :doc:`/brief-yoctoprojectqs/index`, which shows how to setup :term:`Poky`
> +   with ``bitbake-setup``.
> +
> +Use Git to Clone The Layers
> +===========================
> +
> +Go to :yocto_wiki:`Releases wiki page </Releases>`, and choose a release
> +(such as ``&DISTRO_REL_LATEST_TAG;``), corresponding to either the latest stable
> +release or a Long Term Support release.
> +
> +Once you complete the setup instructions for your machine (see the
> +:doc:`/ref-manual/system-requirements` section of the Yocto Project Reference
> +Manual), you need to get a copy of the different :term:`layers <Layer>` needed
> +to setup the :term:`Poky` reference distribution on your build host. Use the
> +following commands:
> +
> +.. code-block:: shell
> +
> +   $ mkdir layers/
> +   $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.openembedded.org/bitbake ./layers/bitbake
> +   $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.openembedded.org/openembedded-core ./layers/openembedded-core
> +   $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.yoctoproject.org/meta-yocto ./layers/meta-yocto
> +
> +Building Your Image
> +===================
> +
> +Use the following steps to build your image. The build process creates
> +an entire Linux distribution, including the toolchain, from source.
> +
> +.. note::
> +
> +   -  If you are working behind a firewall and your build host is not
> +      set up for proxies, you could encounter problems with the build
> +      process when fetching source code (e.g. fetcher failures or Git
> +      failures).
> +
> +   -  If you do not know your proxy settings, consult your local network
> +      infrastructure resources and get that information. A good starting
> +      point could also be to check your web browser settings. Finally,
> +      you can find more information on the
> +      ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
> +      page of the Yocto Project Wiki.
> +
> +#.  **Initialize the Build Environment:** From your current working directory,
> +    setup a build environment with the following command:
> +
> +    .. code-block:: shell
> +
> +       $ TEMPLATECONF=$PWD/layers/meta-yocto/meta-poky/conf/templates/default source ./layers/openembedded-core/oe-init-build-env
> +
> +    Among other things, the script creates the :term:`Build Directory`, which is
> +    ``build`` in this case and is located in the :term:`Source Directory`.
> +    After the script runs, your current working directory is set to the
> +    :term:`Build Directory`. Later, when the build completes, the :term:`Build
> +    Directory` contains all the files created during the build.
> +
> +#.  **Examine Your Local Configuration File:** When you set up the build
> +    environment, a local configuration file named ``local.conf`` becomes
> +    available in a ``conf`` sub-directory of the :term:`Build Directory`. For
> +    this example, the defaults are set to build for a ``qemux86-64`` target,
> +    which is suitable for emulation. The package manager used is set to the RPM
> +    package manager.
> +
> +    .. tip::
> +
> +       You can significantly speed up your build and guard against fetcher
> +       failures by using :ref:`overview-manual/concepts:shared state cache`
> +       mirrors and enabling :ref:`overview-manual/concepts:hash equivalence`.
> +       This way, you can use pre-built artifacts rather than building them.
> +       This is relevant only when your network and the server that you use
> +       can download these artifacts faster than you would be able to build them.
> +
> +       To use such mirrors, uncomment the below lines in your ``conf/local.conf``
> +       file in the :term:`Build Directory`::
> +
> +          BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
> +          SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
> +          BB_HASHSERVE = "auto"
> +          BB_SIGNATURE_HANDLER = "OEEquivHash"
> +
> +       The hash equivalence server needs the websockets python module version 9.1
> +       or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS Stream
> +       9 and later, and Ubuntu 22.04 (LTS) and later, all have a recent enough
> +       package. Other supported distributions need to get the module some other
> +       place than their package feed, e.g. via ``pip``.
> +
> +#.  **Start the Build:** Continue with the following command to build an OS
> +    image for the target, which is ``core-image-sato`` in this example:
> +
> +    .. code-block:: shell
> +
> +       $ bitbake core-image-sato
> +
> +    For information on using the ``bitbake`` command, see the
> +    :ref:`overview-manual/concepts:bitbake` section in the Yocto Project Overview and
> +    Concepts Manual, or see
> +    :ref:`bitbake-user-manual/bitbake-user-manual-intro:the bitbake command`
> +    in the BitBake User Manual.
> +
> +#.  **Simulate Your Image Using QEMU:** Once this particular image is
> +    built, you can start QEMU, which is a Quick EMUlator that ships with
> +    the Yocto Project:
> +
> +    .. code-block:: shell
> +
> +       $ runqemu qemux86-64
> +
> +    If you want to learn more about running QEMU, see the
> +    :ref:`dev-manual/qemu:using the quick emulator (qemu)` chapter in
> +    the Yocto Project Development Tasks Manual.
> +
> +#.  **Exit QEMU:** Exit QEMU by either clicking on the shutdown icon or by typing
> +    ``Ctrl-C`` in the QEMU transcript window from which you evoked QEMU.
>
> --
> 2.51.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7930): https://lists.yoctoproject.org/g/docs/message/7930
> Mute This Topic: https://lists.yoctoproject.org/mt/116033123/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

