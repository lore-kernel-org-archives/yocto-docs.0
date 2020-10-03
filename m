Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web10.3600.1601717114953268370
 for <docs@lists.yoctoproject.org>;
 Sat, 03 Oct 2020 02:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=U8sFYpm0;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id s19so2983231ybc.5
        for <docs@lists.yoctoproject.org>; Sat, 03 Oct 2020 02:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJYesJUwEwQ4C2GwhI0MnovIDDvTXgOsTo5UiaD8OK4=;
        b=U8sFYpm0nMza4Yp37Xv0GZ0PRyLECNbWwUHaUEa0PYGFP/95iahdquvR26l8oOUYo9
         LHq+PIF8Jzh2DhFLA3cTsKNOfzjexTOSHj/UT0dRCfwfON2iU0FGT3oIWwTq/jk5fr9i
         yUUHjpoyb5RdbkWSw/bvmE7YOIrP250ENDjn03dANxBWUOyhotPPmti9M/TAM+OR2iMM
         W5uMnrNNpMP2t9lL9e6P0bTI3oAsiohQnYKeESghYTA1BPxD3idHhE7E7EcO7Aek+3Jq
         VqvvLzM6M4nADuNVM4uUYxnjE7DKJH679X96IZcQlmdL7xQddV8GnAyBvUuSB7H9jnuG
         tQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJYesJUwEwQ4C2GwhI0MnovIDDvTXgOsTo5UiaD8OK4=;
        b=JvOjnZBgH73pV8eM/iVSk/ziTm42KVR+9ZXCN55xjZzgmDNGOpR+xPTfTxzHO/G/q5
         NrJgDtIWqNh6ra29BBHCy7oqpjGAy2/9IbCrK9FxWxt9+8f2L4Ps5q8Oe2Bv4apnlH+n
         Cg7Bc35KDq7tBDkAoUSFbb+B+1hF9SidS39nuPe8vgftrZYUSuXDRUinhrZd8n/vMbma
         QHsuaXwkmYXFxtWcAAyxSS+j32XCK4UYTmj6iOu9gmSjgJUc8pzfEBxTBXc1sa4bIExf
         mmegC00feIZxOvdvEK21rHiw/Eb0Pt4OCh/mu/+5kyiHFnoqF32Ya9CbkbPE84eUn2VV
         H3PQ==
X-Gm-Message-State: AOAM530OxUTTKxmrvYigafzPFq+A93Ie4R0BvliFJznsAZ5cat19tKiY
	pGLb4OAPYZFU318n4iZEp+uGqvjERSaqtBIt/O2WPw==
X-Google-Smtp-Source: ABdhPJzKcFDFvoFlX+x2+BPtW8tietXhSUfGSrrp8mA3C14c7Dgypuu3uvb+LAybU1RJ1ijvMgDkc09cOFwFViaBE3A=
X-Received: by 2002:a25:4845:: with SMTP id v66mr7844134yba.397.1601717113850;
 Sat, 03 Oct 2020 02:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201003082336.55703-1-foss@0leil.net> <20201003082336.55703-2-foss@0leil.net>
In-Reply-To: <20201003082336.55703-2-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Sat, 3 Oct 2020 11:25:02 +0200
Message-ID: <CAP71WjwgtFW_iCOCd8T_q8=s-B6_5EjzZ9jAFevzzt+tLwnj=g@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/3] docs: ref-manual: ref-variables: fix alphabetical order in glossary
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 3, 2020 at 10:23 AM Quentin Schulz <foss@0leil.net> wrote:
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>
> Note: we could technically enforce alphabetical order by adding the
> :sorted: flag to the glossary directive. However, this sorting seems to
> ignore the underscores: e.g. COPY_LIC_DIRS would be put before
> COPYLEFT_LICENSE_EXCLUDE.
>
> However, it's been historically this particular order. If the order in
> the example is the one desired, then one could fix the order in the rst
> and then add the :sorted: flag, to be extra sure the alphabetical order
> is always guaranteed.
>
>  documentation/ref-manual/ref-variables.rst | 170 ++++++++++-----------
>  1 file changed, 85 insertions(+), 85 deletions(-)

I think we should merge this patch, since some terms are not sorted well, so
Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

We can discuss/decide about :sorted: flag separately.
>
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index e238b1247..3a4a5551e 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -7592,14 +7592,6 @@ system and gives an overview of their function and contents.
>
>        The class checks for and uses the variable as needed.
>
> -   SYSLINUX_SPLASH
> -      An ``.LSS`` file used as the background for the VGA boot menu when
> -      you use the boot menu. You need to set this variable in your recipe.
> -
> -      The :ref:`syslinux <ref-classes-syslinux>` class checks for this
> -      variable and if found, the OpenEmbedded build system installs the
> -      splash screen.
> -
>     SYSLINUX_SERIAL_TTY
>        Specifies the alternate console=tty... kernel boot argument. The
>        variable's default value is set in the
> @@ -7610,6 +7602,14 @@ system and gives an overview of their function and contents.
>
>        The class checks for and uses the variable as needed.
>
> +   SYSLINUX_SPLASH
> +      An ``.LSS`` file used as the background for the VGA boot menu when
> +      you use the boot menu. You need to set this variable in your recipe.
> +
> +      The :ref:`syslinux <ref-classes-syslinux>` class checks for this
> +      variable and if found, the OpenEmbedded build system installs the
> +      splash screen.
> +
>     SYSROOT_DESTDIR
>        Points to the temporary directory under the work directory (default
>        "``${``\ :term:`WORKDIR`\ ``}/sysroot-destdir``")
> @@ -8096,6 +8096,49 @@ system and gives an overview of their function and contents.
>           WORKDIR/oe-rootfs-repo
>           .
>
> +   TEST_SUITES
> +      An ordered list of tests (modules) to run against an image when
> +      performing automated runtime testing.
> +
> +      The OpenEmbedded build system provides a core set of tests that can
> +      be used against images.
> +
> +      .. note::
> +
> +         Currently, there is only support for running these tests under
> +         QEMU.
> +
> +      Tests include ``ping``, ``ssh``, ``df`` among others. You can add
> +      your own tests to the list of tests by appending ``TEST_SUITES`` as
> +      follows:
> +      ::
> +
> +         TEST_SUITES_append = " mytest"
> +
> +      Alternatively, you can
> +      provide the "auto" option to have all applicable tests run against
> +      the image.
> +      ::
> +
> +         TEST_SUITES_append = " auto"
> +
> +      Using this option causes the
> +      build system to automatically run tests that are applicable to the
> +      image. Tests that are not applicable are skipped.
> +
> +      The order in which tests are run is important. Tests that depend on
> +      another test must appear later in the list than the test on which
> +      they depend. For example, if you append the list of tests with two
> +      tests (``test_A`` and ``test_B``) where ``test_B`` is dependent on
> +      ``test_A``, then you must order the tests as follows:
> +      ::
> +
> +         TEST_SUITES = "test_A test_B"
> +
> +      For more information on testing images, see the
> +      ":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
> +      section in the Yocto Project Development Tasks Manual.
> +
>     TEST_TARGET
>        Specifies the target controller to use when running tests against a
>        test image. The default controller to use is "qemu":
> @@ -8150,49 +8193,6 @@ system and gives an overview of their function and contents.
>        directly accessible from your host and you need to do port address
>        translation.
>
> -   TEST_SUITES
> -      An ordered list of tests (modules) to run against an image when
> -      performing automated runtime testing.
> -
> -      The OpenEmbedded build system provides a core set of tests that can
> -      be used against images.
> -
> -      .. note::
> -
> -         Currently, there is only support for running these tests under
> -         QEMU.
> -
> -      Tests include ``ping``, ``ssh``, ``df`` among others. You can add
> -      your own tests to the list of tests by appending ``TEST_SUITES`` as
> -      follows:
> -      ::
> -
> -         TEST_SUITES_append = " mytest"
> -
> -      Alternatively, you can
> -      provide the "auto" option to have all applicable tests run against
> -      the image.
> -      ::
> -
> -         TEST_SUITES_append = " auto"
> -
> -      Using this option causes the
> -      build system to automatically run tests that are applicable to the
> -      image. Tests that are not applicable are skipped.
> -
> -      The order in which tests are run is important. Tests that depend on
> -      another test must appear later in the list than the test on which
> -      they depend. For example, if you append the list of tests with two
> -      tests (``test_A`` and ``test_B``) where ``test_B`` is dependent on
> -      ``test_A``, then you must order the tests as follows:
> -      ::
> -
> -         TEST_SUITES = "test_A test_B"
> -
> -      For more information on testing images, see the
> -      ":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
> -      section in the Yocto Project Development Tasks Manual.
> -
>     TESTIMAGE_AUTO
>        Automatically runs the series of automated tests for images when an
>        image is successfully built. Setting ``TESTIMAGE_AUTO`` to "1" causes
> @@ -8378,6 +8378,23 @@ system and gives an overview of their function and contents.
>           in turn, affects the tune variables themselves (i.e. the tune can
>           supply its own set of flags).
>
> +   TUNE_FEATURES
> +      Features used to "tune" a compiler for optimal use given a specific
> +      processor. The features are defined within the tune files and allow
> +      arguments (i.e. ``TUNE_*ARGS``) to be dynamically generated based on
> +      the features.
> +
> +      The OpenEmbedded build system verifies the features to be sure they
> +      are not conflicting and that they are supported.
> +
> +      The BitBake configuration file (``meta/conf/bitbake.conf``) defines
> +      ``TUNE_FEATURES`` as follows:
> +      ::
> +
> +         TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
> +
> +      See the :term:`DEFAULTTUNE` variable for more information.
> +
>     TUNE_LDARGS
>        Specifies architecture-specific linker flags for the target system.
>        The set of flags is based on the selected tune features.
> @@ -8396,23 +8413,6 @@ system and gives an overview of their function and contents.
>           in turn, affects the tune variables themselves (i.e. the tune can
>           supply its own set of flags).
>
> -   TUNE_FEATURES
> -      Features used to "tune" a compiler for optimal use given a specific
> -      processor. The features are defined within the tune files and allow
> -      arguments (i.e. ``TUNE_*ARGS``) to be dynamically generated based on
> -      the features.
> -
> -      The OpenEmbedded build system verifies the features to be sure they
> -      are not conflicting and that they are supported.
> -
> -      The BitBake configuration file (``meta/conf/bitbake.conf``) defines
> -      ``TUNE_FEATURES`` as follows:
> -      ::
> -
> -         TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
> -
> -      See the :term:`DEFAULTTUNE` variable for more information.
> -
>     TUNE_PKGARCH
>        The package architecture understood by the packaging system to define
>        the architecture, ABI, and tuning of output packages. The specific
> @@ -8559,14 +8559,6 @@ system and gives an overview of their function and contents.
>        Options for the device tree compiler passed to mkimage '-D'
>        feature while creating FIT image in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class.
>
> -   UBOOT_RD_LOADADDRESS
> -      Specifies the load address for the RAM disk image.
> -      During FIT image creation, the
> -      ``UBOOT_RD_LOADADDRESS`` variable is used
> -      in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the
> -      load address to be used in creating the Image Tree Source for
> -      the FIT image.
> -
>     UBOOT_RD_ENTRYPOINT
>        Specifies the entrypoint for the RAM disk image.
>        During FIT image creation, the
> @@ -8575,6 +8567,14 @@ system and gives an overview of their function and contents.
>        entrypoint to be used in creating the Image Tree Source for
>        the FIT image.
>
> +   UBOOT_RD_LOADADDRESS
> +      Specifies the load address for the RAM disk image.
> +      During FIT image creation, the
> +      ``UBOOT_RD_LOADADDRESS`` variable is used
> +      in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the
> +      load address to be used in creating the Image Tree Source for
> +      the FIT image.
> +
>     UBOOT_SIGN_ENABLE
>        Enable signing of FIT image. The default value is "0".
>
> @@ -8872,6 +8872,15 @@ system and gives an overview of their function and contents.
>        can control with this variable, see the
>        ":ref:`insane.bbclass <ref-classes-insane>`" section.
>
> +   WKS_FILE
> +      Specifies the location of the Wic kickstart file that is used by the
> +      OpenEmbedded build system to create a partitioned image
> +      (image\ ``.wic``). For information on how to create a partitioned
> +      image, see the
> +      ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
> +      section in the Yocto Project Development Tasks Manual. For details on
> +      the kickstart file format, see the ":doc:`../ref-manual/ref-kickstart`" Chapter.
> +
>     WKS_FILE_DEPENDS
>        When placed in the recipe that builds your image, this variable lists
>        build-time dependencies. The ``WKS_FILE_DEPENDS`` variable is only
> @@ -8897,15 +8906,6 @@ system and gives an overview of their function and contents.
>        previous example, some-native-tool would be replaced with an actual
>        native tool on which the build would depend.
>
> -   WKS_FILE
> -      Specifies the location of the Wic kickstart file that is used by the
> -      OpenEmbedded build system to create a partitioned image
> -      (image\ ``.wic``). For information on how to create a partitioned
> -      image, see the
> -      ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
> -      section in the Yocto Project Development Tasks Manual. For details on
> -      the kickstart file format, see the ":doc:`../ref-manual/ref-kickstart`" Chapter.
> -
>     WORKDIR
>        The pathname of the work directory in which the OpenEmbedded build
>        system builds a recipe. This directory is located within the
> --
> 2.26.2
>
>
> 
>
