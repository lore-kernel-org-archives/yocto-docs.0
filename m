Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web11.8717.1601967539863774779
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 23:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=l7KPJzoN;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id h6so8236299ybi.11
        for <docs@lists.yoctoproject.org>; Mon, 05 Oct 2020 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/dpSfl1QjPaKBDNHbm1uhl+VQqNboBhsoxLzgtUWjY=;
        b=l7KPJzoNRFmXXw9ygJidGQd56pkkP0bIGKBKR/TZoHZndgnTJsj5NZjY1BL7Dwi3GZ
         ryMI/4LwFGdzftrQudvbroL9nRExgmb8yisEAxl+ebUcpS/lMIICtJ0sWmVpd5aeYhrt
         IOpfcXIycfrGqrduiDX4VCSevXrK8dAyvQjBLeU2GKP5DFQgy66nJQCcKdLGJlBUwhyx
         98XS4SB4HPo+w5y2Nxt14779uiSvooFPxLD3WfNfldjU21qIz5MQ7627Cwq9CXMTkCGk
         HSu58k72+SwvC05jumsCTriVEbIAEctqI27P/gq428+p9uw1wOQ0JSs3ATj9+7wkcEHE
         iezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/dpSfl1QjPaKBDNHbm1uhl+VQqNboBhsoxLzgtUWjY=;
        b=jl3W2XQs4LOL3wF/XEyuTcP1H5J+yv+xOQB9k34dAAO2w0htou1QadWk87I4kBZm2Y
         81mJP1G04w6Y/BPYidj4bnhOF1/4JMV5ZyulgUschAQwoFFtPcQFDSJDo3o5gs1qeAXf
         +QOo5OQWYEZQEth1sQuvICVUQ+gb1GgcbcdkURNXRTi/D/dqz2ge8bG2sJlsToYveBCd
         3vRtcauSycBt1TeEh4z39k3rJxrfFW/7p5pLhIeUQDhCX8YNWExGuGCguw5Qbs/lUzUD
         vmECmvFGi0Dqx46th3cdzkrOI7FHs/FzX5ON3TVfpG6zTRvyrUbvpY2uAOwSqMyZqWS9
         yjPg==
X-Gm-Message-State: AOAM5317OpQB+fB6Suf6lUUxpOumgXI5f1XAdeBGw1UoYsKlNSh3qgV9
	YqWeSoj7+IVO+mNGRkpLkuGL7/epsC16c/ITub76UUfqIOpekQ==
X-Google-Smtp-Source: ABdhPJwNJvFxzQNq7sw+zvKk7bZHyekuY/JQ2lX6OrZokFoOsDbFMDBihT3IWxMDfvZgnSavFgYo67+4aYoizfwkxhw=
X-Received: by 2002:a05:6902:50e:: with SMTP id x14mr4912570ybs.273.1601967538591;
 Mon, 05 Oct 2020 23:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183728.9832-1-foss@0leil.net> <20201005183728.9832-4-foss@0leil.net>
In-Reply-To: <20201005183728.9832-4-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 6 Oct 2020 08:58:47 +0200
Message-ID: <CAP71Wjw_rfOE-sXYJ0LYk7OA_r0TAKiFuU_2jOx=esvDTqKEPA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] docs: remove OE_INIT_FILE variable
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 5, 2020 at 8:38 PM Quentin Schulz <foss@0leil.net> wrote:
>
> There's probably no need for such a variable (the name of the script is
> unlikely to change any time soon) and not all instances of
> oe-init-build-env were actually using this variable.
>
> For consistency sake, let's just remove the OE_INIT_FILE variable.
>
> Suggested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Quentin Schulz <foss@0leil.net>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>
> added in v2
>
>  documentation/adt-manual/adt-prepare.rst                    | 2 +-
>  documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst | 2 +-
>  documentation/bsp-guide/bsp.rst                             | 2 +-
>  documentation/poky.yaml                                     | 1 -
>  documentation/ref-manual/ref-structure.rst                  | 5 ++---
>  5 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/adt-manual/adt-prepare.rst b/documentation/adt-manual/adt-prepare.rst
> index 9b6bd0514..eac03785b 100644
> --- a/documentation/adt-manual/adt-prepare.rst
> +++ b/documentation/adt-manual/adt-prepare.rst
> @@ -107,7 +107,7 @@ the tarball using either of these methods:
>        configuration information.
>
>     $ cd ~ $ git clone git://git.yoctoproject.org/poky $ cd poky $ git
> -   checkout -b DISTRO_NAME origin/DISTRO_NAME $ source OE_INIT_FILE $
> +   checkout -b DISTRO_NAME origin/DISTRO_NAME $ source oe-init-build-env $
>     bitbake adt-installer
>
>  Configuring and Running the ADT Installer Script
> diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> index 7e24b9e68..55939e3b2 100644
> --- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> +++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> @@ -177,7 +177,7 @@ an entire Linux distribution, including the toolchain, from source.
>     .. code-block:: shell
>
>        $ cd ~/poky
> -      $ source &OE_INIT_FILE;
> +      $ source oe-init-build-env
>        You had no conf/local.conf file. This configuration file has therefore been
>        created for you with some default values. You may wish to edit it to, for
>        example, select a different MACHINE (target hardware). See conf/local.conf
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 024a240c2..7954f08b7 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -233,7 +233,7 @@ section.
>     setup script to define the OpenEmbedded build environment on your
>     build host. ::
>
> -      $ source &OE_INIT_FILE;
> +      $ source oe-init-build-env
>
>     Among other things, the script creates the :term:`Build Directory`, which is
>     ``build`` in this case and is located in the :term:`Source Directory`.  After
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index ec21271a3..14f45055d 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -58,7 +58,6 @@ YOCTO_DOCS_BRIEF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/brief-yoctoprojectq
>  YOCTO_ADTPATH_DIR : "/opt/poky/&DISTRO;"
>  YOCTO_POKY_TARBALL : "&YOCTO_POKY;.tar.bz2"
>  OE_INIT_PATH : "&YOCTO_POKY;/oe-init-build-env"
> -OE_INIT_FILE : "oe-init-build-env"
>  UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texinfo gcc-multilib \
>       build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
>       xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
> diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
> index 93807b52a..5a074a258 100644
> --- a/documentation/ref-manual/ref-structure.rst
> +++ b/documentation/ref-manual/ref-structure.rst
> @@ -188,7 +188,7 @@ your choice. For example, the following command creates a Build
>  Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`:
>  ::
>
> -   $ source OE_INIT_FILE ~/mybuilds
> +   $ source oe-init-build-env ~/mybuilds
>
>  The OpenEmbedded build system uses the template configuration files, which
>  are found by default in the ``meta-poky/conf/`` directory in the Source
> @@ -200,8 +200,7 @@ information.
>  .. note::
>
>     The OpenEmbedded build system does not support file or directory
> -   names that contain spaces. If you attempt to run the
> -   OE_INIT_FILE
> +   names that contain spaces. If you attempt to run the ``oe-init-build-env``
>     script from a Source Directory that contains spaces in either the
>     filenames or directory names, the script returns an error indicating
>     no such file or directory. Be sure to use a Source Directory free of
> --
> 2.26.2
>
