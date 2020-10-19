Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web12.2491.1603130628576106669
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 11:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eCVyZtQS;
 spf=pass (domain: linaro.org, ip: 209.85.219.172, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f172.google.com with SMTP id d15so286957ybl.10
        for <docs@lists.yoctoproject.org>; Mon, 19 Oct 2020 11:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EG14mBKBLeeHCSblujWeTg9LBaHFhNBpMrk20Ky3PfE=;
        b=eCVyZtQSqcLQ7ohJfXU/9iIXVay0H6D1LJ4N2uAiar6egRAFGhR6DbbpHBghdU6BJs
         0tpwDKdV+boqrNXchquaKYD532OgiqYNEEQUDDQviS00ngMZD1PpYq1d303n7KMuotgx
         Z7fkhAiprm3X0Uik6EIDYbim0QLsHH2vRxsNNiBgaf4jZ6BD/mcpZclINboc/4MwK32J
         eeQGHsmwt9EMsqFZfHxp4fLyymM+mERPHqvbON1JMrmyk+4BB/ks/cxrXuZlNIXPPW2P
         lwxG75Crbm2dfxHzOKTaC2o/J4DtA4NPdXkbhhwWdrrR5q4PErUsJPYhxZDycSc14bt7
         OM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EG14mBKBLeeHCSblujWeTg9LBaHFhNBpMrk20Ky3PfE=;
        b=oKqiwSATjI1L6tPN6ALaeTDrlPiHya7uBmeakgB7mFc6YHpDczDF3Lfxf6wkacLIfh
         mPu9rbv1/u6iYZFZbmTAERIhNq+q/EMAlAsRwQb911lJaHThSiWZQMsKw1cnBhvQNcdN
         S0yVK/IlhOSMUbzlgpOL3UU33VzwCiOEfZ9BApxjTjKHPZQC4DbnJSoXEFcjeKFoR61h
         dIb/WVhYcnUPCd7YbholHfm9/5QEQDIDdfj4EzPU5qzkO2Qrav0BYLHkwP9OKLydjSho
         Ba6+YN0Ey6mcmugunyAwR0RvysYN9ldlVwjMuMKbLz50OLT+RT3ItvNMXtSwxsBUsgxx
         4bOg==
X-Gm-Message-State: AOAM533bvJey9t9WtUKn4WpYUwlGdd5yp8/ODppW97VbqArBXmCvYJxc
	7oaGTTh/p+JkjWB2aEeHYVSZtGJ39MJneRxRwjpVzvbst0o=
X-Google-Smtp-Source: ABdhPJzjTLaT3AFvUugI6q0nSjfaqBLC2sj47Z2T10qydz278DAab4M/cFM4mHNpkO3SM3NnqDGc/RT++BddlkF44EM=
X-Received: by 2002:a25:c204:: with SMTP id s4mr633793ybf.454.1603130627277;
 Mon, 19 Oct 2020 11:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201019170833.9991-1-foss@0leil.net>
In-Reply-To: <20201019170833.9991-1-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 19 Oct 2020 20:03:36 +0200
Message-ID: <CAP71WjwhTaupVWjmk79YVyqZ5_3yfS21G3eQ=QD+8GasSDd1GA@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: bsp-guide: bsp: fix typos, highlights and links
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2020 at 7:08 PM Quentin Schulz <foss@0leil.net> wrote:
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>

thanks for the patch!
Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>  documentation/bsp-guide/bsp.rst | 76 +++++++++++++++++----------------
>  1 file changed, 40 insertions(+), 36 deletions(-)
>
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 34206d159..d0275eea9 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -31,14 +31,14 @@ convention: ::
>     meta-bsp_root_name
>
>  The string "meta-" is prepended to the
> -machine or platform name, which is bsp_root_name in the above form.
> +machine or platform name, which is "bsp_root_name" in the above form.
>
>  .. note::
>
>     Because the BSP layer naming convention is well-established, it is
>     advisable to follow it when creating layers. Technically speaking, a
> -   BSP layer name does not need to start with
> -   meta-. However, various scripts and tools in the Yocto Project development
> +   BSP layer name does not need to start with ``meta-``.
> +   However, various scripts and tools in the Yocto Project development
>     environment assume this convention.
>
>  To help understand the BSP layer concept, consider the BSPs that the
> @@ -81,7 +81,7 @@ directory of that Layer. This directory is what you add to the
>  ``conf/bblayers.conf`` file found in your
>  :term:`Build Directory`, which is
>  established after you run the OpenEmbedded build environment setup
> -script (i.e. :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\`` ).
> +script (i.e. :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``).
>  Adding the root directory allows the :term:`OpenEmbedded Build System`
>  to recognize the BSP
>  layer and from it build an image. Here is an example: ::
> @@ -95,10 +95,11 @@ layer and from it build an image. Here is an example: ::
>
>  .. note::
>
> -   Ordering and ``BBFILE_PRIORITY`` for the layers listed in BBLAYERS matter. For
> -   example, if multiple layers define a machine configuration, the OpenEmbedded
> -   build system uses the last layer searched given similar layer priorities. The
> -   build system works from the top-down through the layers listed in ``BBLAYERS``.
> +   Ordering and :term:`BBFILE_PRIORITY` for the layers listed in ``BBLAYERS``
> +   matter. For example, if multiple layers define a machine configuration, the
> +   OpenEmbedded build system uses the last layer searched given similar layer
> +   priorities. The build system works from the top-down through the layers
> +   listed in ``BBLAYERS``.
>
>  Some BSPs require or depend on additional layers beyond the BSP's root
>  layer in order to be functional. In this case, you need to specify these
> @@ -107,7 +108,7 @@ Additionally, if any build instructions exist for the BSP, you must add
>  them to the "Dependencies" section.
>
>  Some layers function as a layer to hold other BSP layers. These layers
> -are knows as ":term:`container layers <Container Layer>`". An example of
> +are known as ":term:`container layers <Container Layer>`". An example of
>  this type of layer is OpenEmbedded's
>  `meta-openembedded <https://github.com/openembedded/meta-openembedded>`__
>  layer. The ``meta-openembedded`` layer contains many ``meta-*`` layers.
> @@ -141,8 +142,8 @@ section.
>
>  .. note::
>
> -   For structural information on BSPs, see the Example Filesystem Layout
> -   section.
> +   For structural information on BSPs, see the
> +   :ref:`bsp-guide/bsp:example filesystem layout` section.
>
>  #. *Set Up the Build Environment:* Be sure you are set up to use BitBake
>     in a shell. See the ":ref:`dev-manual/dev-manual-start:preparing the build host`"
> @@ -150,10 +151,10 @@ section.
>     to get a build host ready that is either a native Linux machine or a machine
>     that uses CROPS.
>
> -#. *Clone the ``poky`` Repository:* You need to have a local copy of the
> +#. *Clone the poky Repository:* You need to have a local copy of the
>     Yocto Project :term:`Source Directory` (i.e. a local
>     ``poky`` repository). See the
> -   "ref:`dev-manual/dev-manual-start:cloning the ``poky`` repository`" and
> +   ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`" and
>     possibly the
>     ":ref:`dev-manual/dev-manual-start:checking out by branch in poky`" or
>     ":ref:`dev-manual/dev-manual-start:checking out by tag in poky`"
> @@ -168,7 +169,7 @@ section.
>     BSP layers, you can look at the `index of
>     machines <&YOCTO_RELEASE_DL_URL;/machines>`__ for the release.
>
> -#. *Optionally Clone the ``meta-intel`` BSP Layer:* If your hardware is
> +#. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
>     based on current Intel CPUs and devices, you can leverage this BSP
>     layer. For details on the ``meta-intel`` BSP layer, see the layer's
>     `README <http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/README>`__
> @@ -193,7 +194,7 @@ section.
>
>     #. *Check Out the Proper Branch:* The branch you check out for
>        ``meta-intel`` must match the same branch you are using for the
> -      Yocto Project release (e.g. &DISTRO_NAME_NO_CAP;): ::
> +      Yocto Project release (e.g. ``&DISTRO_NAME_NO_CAP;``): ::
>
>           $ cd meta-intel
>           $ git checkout -b &DISTRO_NAME_NO_CAP; remotes/origin/&DISTRO_NAME_NO_CAP;
> @@ -291,7 +292,9 @@ individual BSPs could differ. ::
>     meta-bsp_root_name/recipes-kernel/linux/linux-yocto_kernel_rev.bbappend
>
>  Below is an example of the Raspberry Pi BSP layer that is available from
> -the :yocto_git:`Source Respositories <>`: ::
> +the :yocto_git:`Source Respositories <>`:
> +
> +.. code-block:: none
>
>     meta-raspberrypi/COPYING.MIT
>     meta-raspberrypi/README.md
> @@ -544,13 +547,13 @@ The ``conf/layer.conf`` file identifies the file structure as a layer,
>  identifies the contents of the layer, and contains information about how
>  the build system should use it. Generally, a standard boilerplate file
>  such as the following works. In the following example, you would replace
> -bsp with the actual name of the BSP (i.e. bsp_root_name from the example
> +"bsp" with the actual name of the BSP (i.e. "bsp_root_name" from the example
>  template). ::
>
>     # We have a conf and classes directory, add to BBPATH
>     BBPATH .= ":${LAYERDIR}"
>
> -   # We have a recipes directory, add to BBFILES
> +   # We have a recipes directory containing .bb and .bbappend files, add to BBFILES
>     BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
>                 ${LAYERDIR}/recipes-*/*/*.bbappend"
>
> @@ -694,7 +697,7 @@ located in the BSP Layer for your target device (e.g. the
>
>  Suppose you are using the ``linux-yocto_4.4.bb`` recipe to build the
>  kernel. In other words, you have selected the kernel in your
> -bsp_root_name\ ``.conf`` file by adding
> +``"bsp_root_name".conf`` file by adding
>  :term:`PREFERRED_PROVIDER` and :term:`PREFERRED_VERSION`
>  statements as follows: ::
>
> @@ -704,7 +707,7 @@ statements as follows: ::
>  .. note::
>
>     When the preferred provider is assumed by default, the ``PREFERRED_PROVIDER``
> -   statement does not appear in the ``bsp_root_name`` .conf file.
> +   statement does not appear in the ``"bsp_root_name".conf`` file.
>
>  You would use the ``linux-yocto_4.4.bbappend`` file to append specific
>  BSP settings to the kernel, thus configuring the kernel for your
> @@ -781,7 +784,7 @@ workflow.
>
>     .. note::
>
> -      -  Five hardware reference BSPs exist that are part of the Yocto
> +      -  Four hardware reference BSPs exist that are part of the Yocto
>           Project release and are located in the ``poky/meta-yocto-bsp``
>           BSP layer:
>
> @@ -870,8 +873,8 @@ Before looking at BSP requirements, you should consider the following:
>  -  The requirements in this section apply regardless of how you package
>     a BSP. You should consult the packaging and distribution guidelines
>     for your specific release process. For an example of packaging and
> -   distribution requirements, see the "`Third Party BSP Release
> -   Process <https://wiki.yoctoproject.org/wiki/Third_Party_BSP_Release_Process>`__"
> +   distribution requirements, see the ":yocto_wiki:`Third Party BSP Release
> +   Process </wiki/Third_Party_BSP_Release_Process>`"
>     wiki page.
>
>  -  The requirements for the BSP as it is made available to a developer
> @@ -897,7 +900,7 @@ Yocto Project:
>     your BSP layer as listed in the ``recipes.txt`` file, which is found
>     in ``poky/meta`` directory of the :term:`Source Directory`
>     or in the OpenEmbedded-Core Layer (``openembedded-core``) at
> -   http://git.openembedded.org/openembedded-core/tree/meta.
> +   https://git.openembedded.org/openembedded-core/tree/meta.
>
>     You should place recipes (``*.bb`` files) and recipe modifications
>     (``*.bbappend`` files) into ``recipes-*`` subdirectories by
> @@ -1074,7 +1077,7 @@ also supports several other machines:
>
>     .. note::
>
> -      If the meta-xyz layer did not support multiple machines, you would place
> +      If the ``meta-xyz`` layer did not support multiple machines, you would place
>        the interfaces configuration file in the layer here: ::
>
>           meta-xyz/recipes-core/init-ifupdown/files/interfaces
> @@ -1233,7 +1236,7 @@ file. In this example, the ``conf/layer.conf`` is the following: ::
>     # We have a conf and classes directory, add to BBPATH
>     BBPATH .= ":${LAYERDIR}"
>
> -   # We have recipes-\* directories, add to BBFILES
> +   # We have a recipes directory containing .bb and .bbappend files, add to BBFILES
>     BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
>                 ${LAYERDIR}/recipes-*/*/*.bbappend"
>
> @@ -1262,13 +1265,13 @@ general or kernel layer.
>  One or more machine configuration files exist in the
>  ``bsp_layer/conf/machine/`` directory of the layer: ::
>
> -   bsp_layer/conf/machine/machine1\.conf``
> -   bsp_layer/conf/machine/machine2\.conf``
> -   bsp_layer/conf/machine/machine3\.conf``
> +   bsp_layer/conf/machine/machine1\.conf
> +   bsp_layer/conf/machine/machine2\.conf
> +   bsp_layer/conf/machine/machine3\.conf
>     ... more ...
>
>  For example, the machine configuration file for the `BeagleBone and
> -BeagleBone Black development boards <http://beagleboard.org/bone>`__ is
> +BeagleBone Black development boards <https://beagleboard.org/bone>`__ is
>  located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
>  ``beaglebone-yocto.conf``: ::
>
> @@ -1344,7 +1347,7 @@ Project Reference Manual.
>
>     .. tip::
>
> -      Many ``MACHINE\*`` variables exist that help you configure a particular piece
> +      Many ``MACHINE*`` variables exist that help you configure a particular piece
>        of hardware.
>
>  -  :term:`EXTRA_IMAGEDEPENDS`:
> @@ -1359,12 +1362,12 @@ Project Reference Manual.
>     These features, which are collectively known as "tuning features",
>     exist in the :term:`OpenEmbedded-Core (OE-Core)` layer (e.g.
>     ``poky/meta/conf/machine/include``). In this example, the default
> -   tunning file is "cortexa8hf-neon".
> +   tuning file is "cortexa8hf-neon".
>
>     .. note::
>
>        The include statement that pulls in the
> -      conf/machine/include/tune-cortexa8.inc file provides many tuning
> +      ``conf/machine/include/tune-cortexa8.inc`` file provides many tuning
>        possibilities.
>
>  -  :term:`IMAGE_FSTYPES`: The
> @@ -1389,7 +1392,7 @@ Project Reference Manual.
>
>  -  ``do_image_wic[depends]``: A task that is constructed during the
>     build. In this example, the task depends on specific tools in order
> -   to create the sysroot when buiding a Wic image.
> +   to create the sysroot when building a Wic image.
>
>  -  :term:`SERIAL_CONSOLES`:
>     Defines a serial console (TTY) to enable using getty. In this case,
> @@ -1429,7 +1432,8 @@ Project Reference Manual.
>
>     .. note::
>
> -      For more information on how the SPL variables are used, see the u-boot.inc
> +      For more information on how the SPL variables are used, see the
> +      :yocto_git:`u-boot.inc </cgit/cgit.cgi/poky/tree/meta/recipes-bsp/u-boot/u-boot.inc>`
>        include file.
>
>  -  :term:`UBOOT_* <UBOOT_ENTRYPOINT>`: Defines
> @@ -1473,7 +1477,7 @@ The ``meta-yocto-bsp/recipes-kernel/linux`` directory in the layer contains
>  metadata used to build the kernel. In this case, a kernel append file
>  (i.e. ``linux-yocto_5.0.bbappend``) is used to override an established
>  kernel recipe (i.e. ``linux-yocto_5.0.bb``), which is located in
> -https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/linux.
> +:yocto_git:`/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/linux`.
>
>  Following is the contents of the append file: ::
>
> --
> 2.26.2
>
>
> 
>
