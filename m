Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.13122.1603113465202592039
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 06:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BcUwq5bV;
 spf=pass (domain: linaro.org, ip: 209.85.219.175, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f175.google.com with SMTP id a12so8823686ybg.9
        for <docs@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fYJ+1wj2HycqefqlAWH7TJXILFJ1fCY56C8AwU0CeSg=;
        b=BcUwq5bVbOrAQndkVy1I4iQFOPoJoZhPNhhcW4RoU+vCBc6mvVj7gBR2z1/rPJ+q41
         ex6Gn46XMIEPeLePA69rqP1fp+ZowPaJJxsKek4pHRJsr21MvsiHPILUCsvZNpjNWIVv
         C0kBk7QuCAGcupc5/VXvGD3FPOpqoay46DD+e0g/aCryWt8yn/+LXIucoQwuWdAjlWp5
         3FmMdtTikQOI8DNaY2qg7lXABCPGPhK2nH2aeUWES+7BDeJ3XW8EzPzX+VkTkBamDH3d
         ucD42yyaJ1nE4LEZs56r+uzhff341Mv99eobUkWtDQ9/XwMYN+kEV+axslyLK1RvzlRD
         zEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fYJ+1wj2HycqefqlAWH7TJXILFJ1fCY56C8AwU0CeSg=;
        b=PPi9j9jpGZwfmQ5/75Vgb4H9rL/qRs7OxMZ6To9kN8NLZAnuWLQxpvoZKIItlnM5Sx
         BFyHdrAohzjYVH2MENPiZB45NtTg5BVWmsgbduk4x4s95sCuEJqnpfiIjYx5i+7rnHp8
         OWRlGbE+YsiFrKHHiwAq/+8cO93rl7NlLZlCaauaDN+xvNzp4FaYo0JF7BbcZa5NBT6C
         ija7+Izf2sKMRtdCro1Jbs6JQ+XGIt+nHAIHOGVI1FHZgyMWLXzP5xntwNy4VGDX2p7e
         gHQYpHDbIn77K1Y3E8cxItrHgLYQqdxUWDxJUtzupujrxF1WsXX7Nw7fcVVyj1CvGoFW
         hM8Q==
X-Gm-Message-State: AOAM53380zX8UWvkawMveRKdmKmMxPL5cuH0xdAafQvF2cVLqBulrskC
	Db5+3KbDT5t7XCBmit8BMaY/h5wTyNlk0Ke2Fc/3eA==
X-Google-Smtp-Source: ABdhPJzImJeK8ii0MGQo5vufDLJx7K9QBwgiQm3Rm3VdCRHV+3OzaRduiSN4sgxXJdg7YTMRYVRTmHUxsX23KkncCRA=
X-Received: by 2002:a25:f87:: with SMTP id 129mr22833595ybp.475.1603113454089;
 Mon, 19 Oct 2020 06:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201018175712.23800-1-foss@0leil.net>
In-Reply-To: <20201018175712.23800-1-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 19 Oct 2020 15:17:22 +0200
Message-ID: <CAP71Wjx8MJNy0-jN4+P39TTK0C5zyd8BQomTbX2jOiO4jGzx0Q@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/3] docs: dev-manual: fix typos, highlights, indentation and links
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2020 at 7:58 PM Quentin Schulz <foss@0leil.net> wrote:
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  .../dev-manual/dev-manual-common-tasks.rst    | 1132 ++++++++---------
>  documentation/dev-manual/dev-manual-intro.rst |    2 +-
>  documentation/dev-manual/dev-manual-qemu.rst  |   43 +-
>  documentation/dev-manual/dev-manual-start.rst |   79 +-
>  4 files changed, 567 insertions(+), 689 deletions(-)
>
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/docu=
mentation/dev-manual/dev-manual-common-tasks.rst
> index bef8bf840..0df5e1e4c 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -39,7 +39,7 @@ Follow these general steps to create your layer withou=
t using tools:
>  1. *Check Existing Layers:* Before creating a new layer, you should be
>     sure someone has not already created a layer containing the Metadata
>     you need. You can see the `OpenEmbedded Metadata
> -   Index <http://layers.openembedded.org/layerindex/layers/>`__ for a
> +   Index <https://layers.openembedded.org/layerindex/layers/>`__ for a
>     list of layers from the OpenEmbedded community that can be used in
>     the Yocto Project. You could find a layer that is identical or close
>     to what you need.
> @@ -84,7 +84,7 @@ Follow these general steps to create your layer withou=
t using tools:
>        # We have a conf and classes directory, add to BBPATH
>        BBPATH .=3D ":${LAYERDIR}"
>
> -      # We have recipes-\* directories, add to BBFILES
> +      # We have recipes-* directories, add to BBFILES
>        BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
>                    ${LAYERDIR}/recipes-*/*/*.bbappend"
>
> @@ -150,10 +150,8 @@ Follow these general steps to create your layer wit=
hout using tools:
>     .. note::
>
>        For an explanation of layer hierarchy that is compliant with the
> -      Yocto Project, see the "
> -      Example Filesystem Layout
> -      " section in the Yocto Project Board Support Package (BSP)
> -      Developer's Guide.
> +      Yocto Project, see the ":ref:`bsp-guide/bsp:example filesystem la=
yout`"
> +      section in the Yocto Project Board Support Package (BSP) Develope=
r's Guide.
>
>  5. *Optionally Test for Compatibility:* If you want permission to use
>     the Yocto Project Compatibility logo with your layer or application
> @@ -181,8 +179,8 @@ following list:
>     for each recipe that uses an include file. Or, if you are introducin=
g
>     a new recipe that requires the included file, use the path relative
>     to the original layer directory to refer to the file. For example,
> -   use ``require recipes-core/``\ package\ ``/``\ file\ ``.inc`` instea=
d
> -   of ``require``\ file\ ``.inc``. If you're finding you have to overla=
y
> +   use ``require recipes-core/``\ `package`\ ``/``\ `file`\ ``.inc`` in=
stead
> +   of ``require`` `file`\ ``.inc``. If you're finding you have to overl=
ay
>     the include file, it could indicate a deficiency in the include file
>     in the layer to which it originally belongs. If this is the case, yo=
u
>     should try to address that deficiency instead of overlaying the
> @@ -214,8 +212,12 @@ following list:
>        ``foo``.
>
>        To make sure your changes apply only when building machine "one",
> -      use a machine override with the ``DEPENDS`` statement: DEPENDS_on=
e
> -      =3D "foo" You should follow the same strategy when using ``_appen=
d``
> +      use a machine override with the ``DEPENDS`` statement:
> +      ::
> +
> +         DEPENDS_one =3D "foo"
> +
> +      You should follow the same strategy when using ``_append``
>        and ``_prepend`` operations:
>        ::
>
> @@ -244,11 +246,8 @@ following list:
>
>        .. note::
>
> -         Avoiding "+=3D" and "=3D+" and using machine-specific
> -         \_append
> -         and
> -         \_prepend
> -         operations is recommended as well.
> +         Avoiding "+=3D" and "=3D+" and using machine-specific ``_appen=
d``
> +         and ``_prepend`` operations is recommended as well.
>
>     -  *Place Machine-Specific Files in Machine-Specific Locations:* Whe=
n
>        you have a base recipe, such as ``base-files.bb``, that contains =
a
> @@ -256,11 +255,12 @@ following list:
>        file, you can use an append file to cause the build to use your
>        own version of the file. For example, an append file in your laye=
r
>        at ``meta-one/recipes-core/base-files/base-files.bbappend`` could
> -      extend :term:`FILESPATH`
> -      using
> -      :term:`FILESEXTRAPATHS`
> -      as follows: FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BPN}:" The
> -      build for machine "one" will pick up your machine-specific file a=
s
> +      extend :term:`FILESPATH` using :term:`FILESEXTRAPATHS` as follows=
:
> +      ::
> +
> +         FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BPN}:"
> +
> +      The build for machine "one" will pick up your machine-specific fi=
le as
>        long as you have the file in
>        ``meta-one/recipes-core/base-files/base-files/``. However, if you
>        are building for a different machine and the ``bblayers.conf``
> @@ -311,9 +311,7 @@ Project Compatible Logo.
>     Only Yocto Project member organizations are permitted to use the
>     Yocto Project Compatible Logo. The logo is not available for general
>     use. For information on how to become a Yocto Project member
> -   organization, see the
> -   Yocto Project Website
> -   .
> +   organization, see the :yocto_home:`Yocto Project Website <>`.
>
>  The Yocto Project Compatibility Program consists of a layer application
>  process that requests permission to use the Yocto Project Compatibility
> @@ -482,7 +480,7 @@ have to manually merge changes as they occur.
>
>  When you create an append file, you must use the same root name as the
>  corresponding recipe file. For example, the append file
> -``someapp_DISTRO.bbappend`` must apply to ``someapp_DISTRO.bb``. This
> +``someapp_3.1.bbappend`` must apply to ``someapp_3.1.bb``. This

Should we have &DISTRO; instead?

>  means the original recipe and append file names are version
>  number-specific. If the corresponding recipe is renamed to update to a
>  newer version, you must also rename and possibly update the
> @@ -500,6 +498,9 @@ the "meta" layer at ``meta/recipes-bsp/formfactor``:
>  ::
>
>     SUMMARY =3D "Device formfactor information"
> +   DESCRIPTION =3D "A formfactor configuration file provides informatio=
n about the \
> +   target hardware for which the image is being built and information t=
hat the \
> +   build system cannot obtain from other sources such as the kernel."
>     SECTION =3D "base"
>     LICENSE =3D "MIT"
>     LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9=
cfbcb788c80a0384361b4de20420"
> @@ -603,7 +604,7 @@ For help on the BitBake layer management tool, use t=
he following
>  command:
>  ::
>
> -   $ bitbake-layers --help NOTE: Starting bitbake server... usage:
> +   $ bitbake-layers --help
>     NOTE: Starting bitbake server...
>     usage: bitbake-layers [-d] [-q] [-F] [--color COLOR] [-h] <subcomman=
d> ...
>
> @@ -751,9 +752,13 @@ create a layer with the following:
>
>  In its simplest form, you can use the following command form to create =
a
>  layer. The command creates a layer whose name corresponds to
> -your_layer_name in the current directory: $ bitbake-layers create-layer
> -your_layer_name As an example, the following command creates a layer
> -named ``meta-scottrif`` in your home directory:
> +"your_layer_name" in the current directory:
> +::
> +
> +   $ bitbake-layers create-layer your_layer_name
> +
> +As an example, the following command creates a layer named ``meta-scott=
rif``
> +in your home directory:
>  ::
>
>     $ cd /usr/home
> @@ -762,12 +767,12 @@ named ``meta-scottrif`` in your home directory:
>     Add your new layer with 'bitbake-layers add-layer meta-scottrif'
>
>  If you want to set the priority of the layer to other than the default
> -value of "6", you can either use the ``DASHDASHpriority`` option or you
> +value of "6", you can either use the ``--priority`` option or you
>  can edit the
>  :term:`BBFILE_PRIORITY` value
>  in the ``conf/layer.conf`` after the script creates it. Furthermore, if
>  you want to give the example recipe file some name other than the
> -default, you can use the ``DASHDASHexample-recipe-name`` option.
> +default, you can use the ``--example-recipe-name`` option.
>
>  The easiest way to see how the ``bitbake-layers create-layer`` command
>  works is to experiment with the script. You can also read the usage
> @@ -871,13 +876,16 @@ you want to avoid ordering issues. The reason for =
this is because doing
>  so unconditionally appends to the variable and avoids ordering problems
>  due to the variable being set in image recipes and ``.bbclass`` files
>  with operators like ``?=3D``. Using ``_append`` ensures the operation
> -takes affect.
> +takes effect.
>
>  As shown in its simplest use, ``IMAGE_INSTALL_append`` affects all
>  images. It is possible to extend the syntax so that the variable applie=
s
>  to a specific image only. Here is an example:
> -IMAGE_INSTALL_append_pn-core-image-minimal =3D " strace" This example a=
dds
> -``strace`` to the ``core-image-minimal`` image only.
> +::
> +
> +   IMAGE_INSTALL_append_pn-core-image-minimal =3D " strace"
> +
> +This example adds ``strace`` to the ``core-image-minimal`` image only.
>
>  You can add packages using a similar approach through the
>  ``CORE_IMAGE_EXTRA_INSTALL`` variable. If you use this variable, only
> @@ -937,10 +945,9 @@ configures the image you are working with to includ=
e
>
>  .. note::
>
> -   See the "
> -   Images
> -   " section in the Yocto Project Reference Manual for a complete list
> -   of image features that ship with the Yocto Project.
> +   See the ":ref:`ref-manual/ref-features:image features`" section in t=
he Yocto
> +   Project Reference Manual for a complete list of image features that =
ship
> +   with the Yocto Project.
>
>  .. _usingpoky-extend-customimage-custombb:
>
> @@ -988,12 +995,8 @@ package specified in the ``PACKAGES`` statement.
>
>  .. note::
>
> -   The
> -   inherit packagegroup
> -   line should be located near the top of the recipe, certainly before
> -   the
> -   PACKAGES
> -   statement.
> +   The ``inherit packagegroup`` line should be located near the top of =
the
> +   recipe, certainly before the ``PACKAGES`` statement.
>
>  For each package you specify in ``PACKAGES``, you can use ``RDEPENDS``
>  and ``RRECOMMENDS`` entries to provide a list of packages the parent
> @@ -1090,9 +1093,9 @@ how to create, write, and test a new recipe.
>  .. note::
>
>     For information on variables that are useful for recipes and for
> -   information about recipe naming issues, see the "
> -   Required
> -   " section of the Yocto Project Reference Manual.
> +   information about recipe naming issues, see the
> +   ":ref:`ref-manual/ref-varlocality:recipes`" section of the Yocto Pro=
ject
> +   Reference Manual.
>
>  .. _new-recipe-overview:
>
> @@ -1124,9 +1127,8 @@ that can help you quickly get a start on a new rec=
ipe:
>
>  .. note::
>
> -   For information on recipe syntax, see the "
> -   Recipe Syntax
> -   " section.
> +   For information on recipe syntax, see the
> +   ":ref:`dev-manual/dev-manual-common-tasks:recipe syntax`" section.
>
>  .. _new-recipe-creating-the-base-recipe-using-devtool:
>
> @@ -1161,7 +1163,7 @@ license requirements, and checksums configured.
>  To run the tool, you just need to be in your
>  :term:`Build Directory` and have sourced the
>  build environment setup script (i.e.
> -`:ref:`structure-core-script`).
> +:ref:`structure-core-script`).
>  To get help on the tool, use the following command:
>  ::
>
> @@ -1187,29 +1189,29 @@ To get help on the tool, use the following comma=
nd:
>       appendsrcfile   Create/update a bbappend to add or replace a sourc=
e file
>     Use recipetool <subcommand> --help to get help on a specific command
>
> -Running ``recipetool create -o`` OUTFILE creates the base recipe and
> +Running ``recipetool create -o OUTFILE`` creates the base recipe and
>  locates it properly in the layer that contains your source files.
>  Following are some syntax examples:
>
> -Use this syntax to generate a recipe based on source. Once generated,
> -the recipe resides in the existing source code layer:
> -::
> + - Use this syntax to generate a recipe based on source. Once generated=
,
> +   the recipe resides in the existing source code layer:
> +   ::
>
> -   recipetool create -o OUTFILE source
> +      recipetool create -o OUTFILE source
>
> -Use this syntax to generate a recipe using code that
> -you extract from source. The extracted code is placed in its own layer
> -defined by EXTERNALSRC.
> -::
> + - Use this syntax to generate a recipe using code that
> +   you extract from source. The extracted code is placed in its own lay=
er
> +   defined by ``EXTERNALSRC``.
> +   ::
>
> -   recipetool create -o OUTFILE -x EXTERNALSRC source
> +      recipetool create -o OUTFILE -x EXTERNALSRC source
>
> -Use this syntax to generate a recipe based on source. The options
> -direct ``recipetool`` to generate debugging information. Once generated=
,
> -the recipe resides in the existing source code layer:
> -::
> + - Use this syntax to generate a recipe based on source. The options
> +   direct ``recipetool`` to generate debugging information. Once genera=
ted,
> +   the recipe resides in the existing source code layer:
> +   ::
>
> -   recipetool create -d -o OUTFILE source
> +      recipetool create -d -o OUTFILE source
>
>  .. _new-recipe-locating-and-using-a-similar-recipe:
>
> @@ -1221,7 +1223,7 @@ whether someone else has already written one that =
meets (or comes close
>  to meeting) your needs. The Yocto Project and OpenEmbedded communities
>  maintain many recipes that might be candidates for what you are doing.
>  You can find a good central index of these recipes in the `OpenEmbedded
> -Layer Index <http://layers.openembedded.org>`__.
> +Layer Index <https://layers.openembedded.org>`__.
>
>  Working from an existing recipe or a skeleton recipe is the best way to
>  get started. Here are some points on both methods:
> @@ -1280,13 +1282,18 @@ the recipe.
>     Layers <#understanding-and-creating-layers>`__" section.
>
>  -  *Naming Your Recipe:* When you name your recipe, you need to follow
> -   this naming convention: basename_version.bb Use lower-cased
> -   characters and do not include the reserved suffixes ``-native``,
> -   ``-cross``, ``-initial``, or ``-dev`` casually (i.e. do not use them
> -   as part of your recipe name unless the string applies). Here are som=
e
> -   examples:
> +   this naming convention:
>     ::
>
> +      basename_version.bb
> +
> +   Use lower-cased characters and do not include the reserved suffixes
> +   ``-native``, ``-cross``, ``-initial``, or ``-dev`` casually (i.e. do=
 not use
> +   them as part of your recipe name unless the string applies). Here ar=
e some
> +   examples:
> +
> +   .. code-block:: none
> +
>        cups_1.7.0.bb
>        gawk_4.0.2.bb
>        irssi_0.8.16-rc1.bb
> @@ -1320,34 +1327,28 @@ context in which it is being built. The quickest=
 way to find this path
>  is to have BitBake return it by running the following:
>  ::
>
> -   $ bitbake -e basename \| grep ^WORKDIR=3D
> +   $ bitbake -e basename | grep ^WORKDIR=3D
>
>  As an example, assume a Source Directory
>  top-level folder named ``poky``, a default Build Directory at
>  ``poky/build``, and a ``qemux86-poky-linux`` machine target system.
>  Furthermore, suppose your recipe is named ``foo_1.3.0.bb``. In this
>  case, the work directory the build system uses to build the package
> -would be as follows: poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r=
0
> +would be as follows:
> +::
> +
> +   poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
> +
>  Inside this directory you can find sub-directories such as ``image``,
>  ``packages-split``, and ``temp``. After the build, you can examine thes=
e
>  to determine how well the build went.
>
>  .. note::
>
> -   You can find log files for each task in the recipe's
> -   temp
> -   directory (e.g.
> -   poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0/temp
> -   ). Log files are named
> -   log.
> -   taskname
> -   (e.g.
> -   log.do_configure
> -   ,
> -   log.do_fetch
> -   , and
> -   log.do_compile
> -   ).
> +   You can find log files for each task in the recipe's ``temp``
> +   directory (e.g. ``poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r=
0/temp``).
> +   Log files are named ``log.taskname`` (e.g. ``log.do_configure``,
> +   ``log.do_fetch``, and ``log.do_compile``).
>
>  You can find more information about the build process in
>  ":doc:`../overview-manual/overview-manual-development-environment`"
> @@ -1391,7 +1392,7 @@ comes from a single tarball. Notice the use of the
>  :term:`PV` variable:
>  ::
>
> -   SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \\
> +   SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>
>  Files mentioned in ``SRC_URI`` whose names end in a typical archive
>  extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so
> @@ -1576,8 +1577,8 @@ variables:
>     the checksums of the files to be sure the text has not changed. Any
>     differences result in an error with the message containing the
>     current checksum. For more explanation and examples of how to set th=
e
> -   ``LIC_FILES_CHKSUM`` variable, see the "`Tracking License
> -   Changes <#>`__" section.
> +   ``LIC_FILES_CHKSUM`` variable, see the
> +   ":ref:`dev-manual/dev-manual-common-tasks:tracking license changes`"=
 section.
>
>     To determine the correct checksum string, you can list the
>     appropriate files in the ``LIC_FILES_CHKSUM`` variable with incorrec=
t
> @@ -1668,13 +1669,10 @@ a build configuration file.
>     As of Yocto Project Release 1.7, some of the core recipes that
>     package binary configuration scripts now disable the scripts due to
>     the scripts previously requiring error-prone path substitution. The
> -   OpenEmbedded build system uses
> -   pkg-config
> -   now, which is much more robust. You can find a list of the
> -   \*-config
> -   scripts that are disabled list in the "
> -   Binary Configuration Scripts Disabled
> -   " section in the Yocto Project Reference Manual.
> +   OpenEmbedded build system uses ``pkg-config`` now, which is much mor=
e
> +   robust. You can find a list of the ``*-config`` scripts that are dis=
abled
> +   in the ":ref:`migration-1.7-binary-configuration-scripts-disabled`" =
section
> +   in the Yocto Project Reference Manual.
>
>  A major part of build-time configuration is about checking for
>  build-time dependencies and possibly enabling optional functionality as
> @@ -1718,11 +1716,7 @@ your software is built:
>
>        If you need to install one or more custom CMake toolchain files
>        that are supplied by the application you are building, install th=
e
> -      files to
> -      ${D}${datadir}/cmake/
> -      Modules during
> -      do_install
> -      .
> +      files to ``${D}${datadir}/cmake/Modules`` during ``do_install``.
>
>  -  *Other:* If your source files do not have a ``configure.ac`` or
>     ``CMakeLists.txt`` file, then your software is built using some
> @@ -1773,11 +1767,8 @@ with custom or machine-specific header informatio=
n. If you customize
>
>  .. note::
>
> -   Never copy and customize the
> -   libc
> -   header file (i.e.
> -   meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> -   ).
> +   Never copy and customize the ``libc`` header file (i.e.
> +   ``meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc``).
>
>  The correct way to interface to a device or custom kernel is to use a
>  separate package that provides the additional headers for the driver or
> @@ -1803,13 +1794,10 @@ previous list.
>
>  .. note::
>
> -   If for some reason your changes need to modify the behavior of the
> -   libc
> -   , and subsequently all other applications on the system, use a
> -   .bbappend
> -   to modify the
> -   linux-kernel-headers.inc
> -   file. However, take care to not make the changes machine specific.
> +   If for some reason your changes need to modify the behavior of the `=
`libc``,
> +   and subsequently all other applications on the system, use a ``.bbap=
pend``
> +   to modify the ``linux-kernel-headers.inc`` file. However, take care =
to not
> +   make the changes machine specific.
>
>  Consider a case where your kernel is older and you need an older
>  ``libc`` ABI. The headers installed by your recipe should still be a
> @@ -1839,11 +1827,8 @@ Here are some common issues that cause failures.
>
>     For cases where improper paths are detected for configuration files
>     or for when libraries/headers cannot be found, be sure you are using
> -   the more robust
> -   pkg-config
> -   . See the note in section "
> -   Configuring the Recipe
> -   " for additional information.
> +   the more robust ``pkg-config``. See the note in section
> +   ":ref:`new-recipe-configuring-the-recipe`" for additional informatio=
n.
>
>  -  *Parallel build failures:* These failures manifest themselves as
>     intermittent errors, or errors reporting that a file or directory
> @@ -1921,7 +1906,7 @@ the software being built:
>     ``do_install_append`` function using the install command as describe=
d
>     in the "Manual" bulleted item later in this list.
>
> --  Other (using ``make install``): You need to define a ``do_install``
> +-  *Other (using* ``make install``\ *)*: You need to define a ``do_inst=
all``
>     function in your recipe. The function should call
>     ``oe_runmake install`` and will likely need to pass in the
>     destination directory as well. How you pass that path is dependent o=
n
> @@ -1940,7 +1925,7 @@ the software being built:
>     install the built software into the directories.
>
>     You can find more information on ``install`` at
> -   http://www.gnu.org/software/coreutils/manual/html_node/install-invoc=
ation.html.
> +   https://www.gnu.org/software/coreutils/manual/html_node/install-invo=
cation.html.
>
>  For the scenarios that do not use Autotools or CMake, you need to track
>  the installation and diagnose and fix any issues until everything
> @@ -1969,13 +1954,15 @@ installed correctly.
>        conditions. If you experience intermittent failures during
>        ``do_install``, you might be able to work around them by disablin=
g
>        parallel Makefile installs by adding the following to the recipe:
> -      PARALLEL_MAKEINST =3D "" See
> -      :term:`PARALLEL_MAKEINST`
> -      for additional information.
> +      ::
> +
> +         PARALLEL_MAKEINST =3D ""
> +
> +      See :term:`PARALLEL_MAKEINST` for additional information.
>
>     -  If you need to install one or more custom CMake toolchain files
>        that are supplied by the application you are building, install th=
e
> -      files to ``${D}${datadir}/cmake/`` Modules during
> +      files to ``${D}${datadir}/cmake/Modules`` during
>        :ref:`ref-tasks-install`.
>
>  .. _new-recipe-enabling-system-services:
> @@ -2023,7 +2010,7 @@ different ways:
>  -  *systemd:* System Management Daemon (systemd) was designed to replac=
e
>     SysVinit and to provide enhanced management of services. For more
>     information on systemd, see the systemd homepage at
> -   http://freedesktop.org/wiki/Software/systemd/.
> +   https://freedesktop.org/wiki/Software/systemd/.
>
>     To enable a service using systemd, your recipe needs to inherit the
>     :ref:`systemd <ref-classes-systemd>` class. See
> @@ -2127,8 +2114,7 @@ recipe has two sysroots in its work directory, one=
 for target files
>  .. note::
>
>     You could find the term "staging" used within the Yocto project
> -   regarding files populating sysroots (e.g. the
> -   STAGING_DIR
> +   regarding files populating sysroots (e.g. the :term:`STAGING_DIR`
>     variable).
>
>  Recipes should never populate the sysroot directly (i.e. write files
> @@ -2205,24 +2191,26 @@ file:
>  When you use a virtual provider, you do not have to "hard code" a recip=
e
>  name as a build dependency. You can use the
>  :term:`DEPENDS` variable to state the
> -build is dependent on ``virtual/kernel`` for example: DEPENDS =3D
> -"virtual/kernel" During the build, the OpenEmbedded build system picks
> +build is dependent on ``virtual/kernel`` for example:
> +::
> +
> +   DEPENDS =3D "virtual/kernel"
> +
> +During the build, the OpenEmbedded build system picks
>  the correct recipe needed for the ``virtual/kernel`` dependency based o=
n
>  the ``PREFERRED_PROVIDER`` variable. If you want to use the small kerne=
l
>  mentioned at the beginning of this section, configure your build as
> -follows: PREFERRED_PROVIDER_virtual/kernel ??=3D "kernel-small"
> +follows:
> +::
> +
> +   PREFERRED_PROVIDER_virtual/kernel ??=3D "kernel-small"
>
>  .. note::
>
> -   Any recipe that
> -   PROVIDES
> -   a
> -   virtual/\*
> -   item that is ultimately not selected through
> -   PREFERRED_PROVIDER
> -   does not get built. Preventing these recipes from building is usuall=
y
> -   the desired behavior since this mechanism's purpose is to select
> -   between mutually exclusive alternative providers.
> +   Any recipe that ``PROVIDES`` a ``virtual/*`` item that is ultimately=
 not
> +   selected through ``PREFERRED_PROVIDER`` does not get built. Preventi=
ng these
> +   recipes from building is usually the desired behavior since this mec=
hanism's
> +   purpose is to select between mutually exclusive alternative provider=
s.
>
>  The following lists specific examples of virtual providers:
>
> @@ -2280,8 +2268,8 @@ Post-Installation Scripts
>  Post-installation scripts run immediately after installing a package on
>  the target or during image creation when a package is included in an
>  image. To add a post-installation script to a package, add a
> -``pkg_postinst_``\ PACKAGENAME\ ``()`` function to the recipe file
> -(``.bb``) and replace PACKAGENAME with the name of the package you want
> +``pkg_postinst_``\ `PACKAGENAME`\ ``()`` function to the recipe file
> +(``.bb``) and replace `PACKAGENAME` with the name of the package you wa=
nt
>  to attach to the ``postinst`` script. To apply the post-installation
>  script to the main package for the recipe, which is usually what is
>  required, specify
> @@ -2289,7 +2277,11 @@ required, specify
>  PACKAGENAME.
>
>  A post-installation function has the following structure:
> -pkg_postinst_PACKAGENAME() { # Commands to carry out }
> +::
> +
> +   pkg_postinst_PACKAGENAME() {
> +       # Commands to carry out
> +   }
>
>  The script defined in the post-installation function is called when the
>  root filesystem is created. If the script succeeds, the package is
> @@ -2324,19 +2316,11 @@ script to first boot is undesirable and for read=
-only rootfs impossible.
>  .. note::
>
>     Equivalent support for pre-install, pre-uninstall, and post-uninstal=
l
> -   scripts exist by way of
> -   pkg_preinst
> -   ,
> -   pkg_prerm
> -   , and
> -   pkg_postrm
> -   , respectively. These scrips work in exactly the same way as does
> -   pkg_postinst
> -   with the exception that they run at different times. Also, because o=
f
> -   when they run, they are not applicable to being run at image creatio=
n
> -   time like
> -   pkg_postinst
> -   .
> +   scripts exist by way of ``pkg_preinst``, ``pkg_prerm``, and ``pkg_po=
strm``,
> +   respectively. These scrips work in exactly the same way as does
> +   ``pkg_postinst`` with the exception that they run at different times=
. Also,
> +   because of when they run, they are not applicable to being run at im=
age
> +   creation time like ``pkg_postinst``.
>
>  .. _new-recipe-testing:
>
> @@ -2433,9 +2417,9 @@ Following is one example: (``hello_2.3.bb``)
>     inherit autotools gettext
>
>  The variable ``LIC_FILES_CHKSUM`` is used to track source license
> -changes as described in the "`Tracking License
> -Changes <#usingpoky-configuring-LIC_FILES_CHKSUM>`__" section in the
> -Yocto Project Overview and Concepts Manual. You can quickly create
> +changes as described in the
> +":ref:`dev-manual/dev-manual-common-tasks:tracking license changes`" se=
ction in
> +the Yocto Project Overview and Concepts Manual. You can quickly create
>  Autotool-based recipes in a manner similar to the previous example.
>
>  .. _new-recipe-makefile-based-package:
> @@ -2472,22 +2456,31 @@ In the following example, ``mtd-utils`` is a mak=
efile-based package:
>     LICENSE =3D "GPLv2+"
>     LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32=
c317bb3 \
>         file://include/common.h;beginline=3D1;endline=3D17;md5=3Dba05b07=
912a44ea2bf81ce409380049c"
> +
>     # Use the latest version at 26 Oct, 2013
>     SRCREV =3D "9f107132a6a073cce37434ca9cda6917dd8d866b"
>     SRC_URI =3D "git://git.infradead.org/mtd-utils.git \
>         file://add-exclusion-to-mkfs-jffs2-git-2.patch \
>         "
> +
>     PV =3D "1.5.1+git${SRCPV}"
> +
>     S =3D "${WORKDIR}/git"
> +
>     EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CF=
LAGS=3D${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=3D${S}'"
> +
>     do_install () {
>         oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir} MANDIR=3D=
${mandir} INCLUDEDIR=3D${includedir}
>     }
> +
>     PACKAGES =3D+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc"
> +
>     FILES_mtd-utils-jffs2 =3D "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dum=
p ${sbindir}/jffs2reader ${sbindir}/sumtool"
>     FILES_mtd-utils-ubifs =3D "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
>     FILES_mtd-utils-misc =3D "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir=
}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
> +
>     PARALLEL_MAKE =3D ""
> +
>     BBCLASSEXTEND =3D "native"
>
>  Splitting an Application into Multiple Packages
> @@ -2503,12 +2496,15 @@ into separate packages:
>  ::
>
>     require xorg-lib-common.inc
> +
>     SUMMARY =3D "Xpm: X Pixmap extension library"
>     LICENSE =3D "BSD"
>     LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D51f4270b012ecd4ab1a164f5f=
4ed6cf7"
>     DEPENDS +=3D "libxext libsm libxt"
>     PE =3D "1"
> +
>     XORG_PN =3D "libXpm"
> +
>     PACKAGES =3D+ "sxpm cxpm"
>     FILES_cxpm =3D "${bindir}/cxpm"
>     FILES_sxpm =3D "${bindir}/sxpm"
> @@ -2619,8 +2615,7 @@ Following Recipe Style Guidelines
>  ---------------------------------
>
>  When writing recipes, it is good to conform to existing style
> -guidelines. The `OpenEmbedded
> -Styleguide <http://www.openembedded.org/wiki/Styleguide>`__ wiki page
> +guidelines. The :oe_home:`OpenEmbedded Styleguide </wiki/Styleguide>` w=
iki page
>  provides rough guidelines for preferred recipe style.
>
>  It is common for existing recipes to deviate a bit from this style.
> @@ -2700,7 +2695,7 @@ syntax, you can reference the
>  :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata` chapter
>  in the BitBake User Manual.
>
> --  *Line Continuation (\):* Use the backward slash (``\``) character to
> +-  *Line Continuation (\\):* Use the backward slash (``\``) character t=
o
>     split a statement over multiple lines. Place the slash character at
>     the end of the line that is to be continued on the next line:
>     ::
> @@ -2750,8 +2745,12 @@ in the BitBake User Manual.
>
>     Here is an example where ``VAR1`` is set to "New value" if it is
>     currently empty. However, if ``VAR1`` has already been set, it
> -   remains unchanged: VAR1 ?=3D "New value" In this next example, ``VAR=
1``
> -   is left with the value "Original value":
> +   remains unchanged:
> +   ::
> +
> +      VAR1 ?=3D "New value"
> +
> +   In this next example, ``VAR1`` is left with the value "Original valu=
e":
>     ::
>
>        VAR1 =3D "Original value"
> @@ -2843,7 +2842,7 @@ in the BitBake User Manual.
>     specific to individual packages produced by a recipe, you should
>     always use an override that specifies the name of the package.
>
> --  *Indentation:* Use spaces for indentation rather than than tabs. For
> +-  *Indentation:* Use spaces for indentation rather than tabs. For
>     shell functions, both currently work. However, it is a policy
>     decision of the Yocto Project to use tabs in shell functions. Realiz=
e
>     that some layers have a policy to use spaces for all indentation.
> @@ -2879,8 +2878,7 @@ that the Yocto Project already supports.
>  .. note::
>
>     Although well within the capabilities of the Yocto Project, adding a
> -   totally new architecture might require changes to
> -   gcc/glibc
> +   totally new architecture might require changes to ``gcc``/``glibc``
>     and to the site information, which is beyond the scope of this
>     manual.
>
> @@ -3035,9 +3033,8 @@ commit messages in the layer's tree for the change=
s made to recipes.
>  .. note::
>
>     Conditions do exist when you should not use AUH to upgrade recipes
> -   and you should instead use either
> -   devtool upgrade
> -   or upgrade your recipes manually:
> +   and you should instead use either ``devtool upgrade`` or upgrade you=
r
> +   recipes manually:
>
>     -  When AUH cannot complete the upgrade sequence. This situation
>        usually results because custom patches carried by the recipe
> @@ -3052,13 +3049,14 @@ The following steps describe how to set up the A=
UH utility:
>
>  1. *Be Sure the Development Host is Set Up:* You need to be sure that
>     your development host is set up to use the Yocto Project. For
> -   information on how to set up your host, see the "`Preparing the Buil=
d
> -   Host <#dev-preparing-the-build-host>`__" section.
> +   information on how to set up your host, see the
> +   ":ref:`dev-preparing-the-build-host`" section.
>
>  2. *Make Sure Git is Configured:* The AUH utility requires Git to be
>     configured because AUH uses Git to save upgrades. Thus, you must hav=
e
>     Git user and email configured. The following command shows your
>     configurations:
> +   ::
>
>        $ git config --list
>
> @@ -3092,11 +3090,11 @@ The following steps describe how to set up the A=
UH utility:
>     ::
>
>        $ cd ~/poky
> -      $ source oe-init-build-env
> +      $ source oe-init-build-env your_AUH_build_directory
>
> -   your_AUH_build_directory Re-using an existing build directory and it=
s
> -   configurations is not recommended as existing settings could cause
> -   AUH to fail or behave undesirably.
> +   Re-using an existing build directory and its configurations is not
> +   recommended as existing settings could cause AUH to fail or behave
> +   undesirably.
>
>  5. *Make Configurations in Your Local Configuration File:* Several
>     settings need to exist in the ``local.conf`` file in the build
> @@ -3120,14 +3118,15 @@ The following steps describe how to set up the A=
UH utility:
>     -  If you want to enable testing through the
>        :ref:`testimage <ref-classes-testimage*>`
>        class, which is optional, you need to have the following set in
> -      your ``conf/local.conf`` file: INHERIT +=3D "testimage"
> +      your ``conf/local.conf`` file:
> +      ::
> +
> +         INHERIT +=3D "testimage"
>
>        .. note::
>
>           If your distro does not enable by default ptest, which Poky
> -         does, you need the following in your
> -         local.conf
> -         file:
> +         does, you need the following in your ``local.conf`` file:
>           ::
>
>                   DISTRO_FEATURES_append =3D " ptest"
> @@ -3142,9 +3141,8 @@ The following steps describe how to set up the AUH=
 utility:
>
>  7. *Create and Edit an AUH Configuration File:* You need to have the
>     ``upgrade-helper/upgrade-helper.conf`` configuration file in your
> -   build directory. You can find a sample configuration file in the `AU=
H
> -   source
> -   repository <http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-h=
elper/tree/>`__.
> +   build directory. You can find a sample configuration file in the
> +   :yocto_git:`AUH source repository </cgit/cgit.cgi/auto-upgrade-helpe=
r/tree/>`.
>
>     Read through the sample file and make configurations as needed. For
>     example, if you enabled build history in your ``local.conf`` as
> @@ -3160,16 +3158,23 @@ The following steps describe how to set up the A=
UH utility:
>  This next set of examples describes how to use the AUH:
>
>  -  *Upgrading a Specific Recipe:* To upgrade a specific recipe, use the
> -   following form: $ upgrade-helper.py recipe_name For example, this
> -   command upgrades the ``xmodmap`` recipe:
> +   following form:
> +   ::
> +
> +      $ upgrade-helper.py recipe_name
> +
> +   For example, this command upgrades the ``xmodmap`` recipe:
>     ::
>
>        $ upgrade-helper.py xmodmap
>
>  -  *Upgrading a Specific Recipe to a Particular Version:* To upgrade a
> -   specific recipe to a particular version, use the following form: $
> -   upgrade-helper.py recipe_name -t version For example, this command
> -   upgrades the ``xmodmap`` recipe to version 1.2.3:
> +   specific recipe to a particular version, use the following form:
> +   ::
> +
> +      $ upgrade-helper.py recipe_name -t version
> +
> +   For example, this command upgrades the ``xmodmap`` recipe to version=
 1.2.3:
>     ::
>
>        $ upgrade-helper.py xmodmap -t 1.2.3
> @@ -3201,7 +3206,7 @@ the layer tree.
>
>  You can easily set up to run the AUH utility on a regular basis by usin=
g
>  a cron job. See the
> -`weeklyjob.sh <http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-h=
elper/tree/weeklyjob.sh>`_
> +:yocto_git:`weeklyjob.sh </cgit/cgit.cgi/auto-upgrade-helper/tree/weekl=
yjob.sh>`
>  file distributed with the utility for an example.
>
>  .. _gs-using-devtool-upgrade:
> @@ -3241,15 +3246,12 @@ patches contained by the recipe as needed.
>
>  .. note::
>
> -   AUH uses much of
> -   devtool upgrade
> -   behind the scenes making AUH somewhat of a "wrapper" application for
> -   devtool upgrade
> -   .
> +   AUH uses much of ``devtool upgrade`` behind the scenes making AUH so=
mewhat
> +   of a "wrapper" application for ``devtool upgrade``.
>
>  A typical scenario involves having used Git to clone an upstream
> -repository that you use during build operations. Because you are (or
> -have) built the recipe in the past, the layer is likely added to your
> +repository that you use during build operations. Because you have built=
 the
> +recipe in the past, the layer is likely added to your
>  configuration already. If for some reason, the layer is not added, you
>  could add it easily using the
>  ":ref:`bitbake-layers <bsp-guide/bsp:creating a new bsp layer using the=
 \`\`bitbake-layers\`\` script>`"
> @@ -3281,11 +3283,8 @@ directory automatically upgrades the recipe for y=
ou:
>
>  .. note::
>
> -   Using the
> -   -V
> -   option is not necessary. Omitting the version number causes
> -   devtool upgrade
> -   to upgrade the recipe to the most recent version.
> +   Using the ``-V`` option is not necessary. Omitting the version numbe=
r causes
> +   ``devtool upgrade`` to upgrade the recipe to the most recent version=
.
>
>  ::
>
> @@ -3358,19 +3357,16 @@ source directory in a sub-directory named ``nano=
`` in this case.
>  Manually Upgrading a Recipe
>  ---------------------------
>
> -If for some reason you choose not to upgrade recipes using the `Auto
> -Upgrade Helper (AUH) <#gs-using-the-auto-upgrade-helper>`__ or by using
> -```devtool upgrade`` <#gs-using-devtool-upgrade>`__, you can manually
> -edit the recipe files to upgrade the versions.
> +If for some reason you choose not to upgrade recipes using
> +:ref:`gs-using-the-auto-upgrade-helper` or by :ref:`gs-using-devtool-up=
grade`,
> +you can manually edit the recipe files to upgrade the versions.
>
>  .. note::
>
>     Manually updating multiple recipes scales poorly and involves many
>     steps. The recommendation to upgrade recipe versions is through AUH
> -   or
> -   devtool upgrade
> -   , both of which automate some steps and provide guidance for others
> -   needed for the manual process.
> +   or ``devtool upgrade``, both of which automate some steps and provid=
e
> +   guidance for others needed for the manual process.
>
>  To manually upgrade recipe versions, follow these general steps:
>
> @@ -3379,7 +3375,7 @@ To manually upgrade recipe versions, follow these =
general steps:
>     changes appropriately. If the version is not part of the recipe name=
,
>     change the value as it is set for ``PV`` within the recipe itself.
>
> -2. Update ``SRCREV`` if Needed: If the source code your recipe builds
> +2. *Update* ``SRCREV`` *if Needed*: If the source code your recipe buil=
ds
>     is fetched from Git or some other version control system, update
>     :term:`SRCREV` to point to the
>     commit hash that matches the new version.
> @@ -3455,10 +3451,8 @@ usually set ``S`` to ``${WORKDIR}/git``.
>
>  .. note::
>
> -   The
> -   BP
> -   represents the base recipe name, which consists of the name and
> -   version:
> +   The :term:`BP` represents the base recipe name, which consists of th=
e name
> +   and version:
>     ::
>
>             BP =3D "${BPN}-${PV}"
> @@ -3467,8 +3461,11 @@ usually set ``S`` to ``${WORKDIR}/git``.
>  The path to the work directory for the recipe
>  (:term:`WORKDIR`) is defined as
>  follows:
> -${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR} The
> -actual directory depends on several things:
> +::
> +
> +   ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}
> +
> +The actual directory depends on several things:
>
>  -  :term:`TMPDIR`: The top-level build
>     output directory.
> @@ -3500,7 +3497,7 @@ build system uses to build the package would be as=
 follows:
>  Using Quilt in Your Workflow
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> -`Quilt <http://savannah.nongnu.org/projects/quilt>`__ is a powerful too=
l
> +`Quilt <https://savannah.nongnu.org/projects/quilt>`__ is a powerful to=
ol
>  that allows you to capture source code changes without having a clean
>  source tree. This section outlines the typical workflow you can use to
>  modify source code, test changes, and then preserve the changes in the
> @@ -3509,11 +3506,8 @@ form of a patch all using Quilt.
>  .. note::
>
>     With regard to preserving changes to source files, if you clean a
> -   recipe or have
> -   rm_work
> -   enabled, the
> -   devtool
> -   workflow
> +   recipe or have ``rm_work`` enabled, the
> +   :ref:`devtool workflow <sdk-manual/sdk-extensible:using \`\`devtool\=
`\` in your sdk workflow>`
>     as described in the Yocto Project Application Development and the
>     Extensible Software Development Kit (eSDK) manual is a safer
>     development flow than the flow that uses Quilt.
> @@ -3535,7 +3529,7 @@ Follow these general steps:
>  3. *Create a New Patch:* Before modifying source code, you need to
>     create a new patch. To create a new patch file, use ``quilt new`` as
>     below:
> -   :;
> +   ::
>
>        $ quilt new my_changes.patch
>
> @@ -3562,22 +3556,13 @@ Follow these general steps:
>
>     .. note::
>
> -      All the modifications you make to the temporary source code
> -      disappear once you run the
> -      do_clean
> -      or
> -      do_cleanall
> -      tasks using BitBake (i.e.
> -      bitbake -c clean
> -      package
> -      and
> -      bitbake -c cleanall
> -      package
> -      ). Modifications will also disappear if you use the
> -      rm_work
> -      feature as described in the "
> -      Conserving Disk Space During Builds
> -      " section.
> +      All the modifications you make to the temporary source code disap=
pear
> +      once you run the ``do_clean`` or ``do_cleanall`` tasks using BitB=
ake
> +      (i.e. ``bitbake -c clean package`` and ``bitbake -c cleanall pack=
age``).
> +      Modifications will also disappear if you use the ``rm_work`` feat=
ure as
> +      described in the
> +      ":ref:`dev-manual/dev-manual-common-tasks:conserving disk space d=
uring builds`"
> +      section.
>
>  7. *Generate the Patch:* Once your changes work as expected, you need t=
o
>     use Quilt to generate the final patch that contains all your
> @@ -3649,7 +3634,7 @@ Directory (:term:`S`).
>  To manually run a specific task using ``devshell``, run the
>  corresponding ``run.*`` script in the
>  ``${``\ :term:`WORKDIR`\ ``}/temp``
> -directory (e.g., ``run.do_configure.``\ pid). If a task's script does
> +directory (e.g., ``run.do_configure.``\ `pid`). If a task's script does
>  not exist, which would be the case if the task was skipped by way of th=
e
>  sstate cache, you can create the task by first running it outside of th=
e
>  ``devshell``:
> @@ -3784,8 +3769,7 @@ The following figure and list overviews the build =
process:
>     :align: center
>
>  1. *Set up Your Host Development System to Support Development Using th=
e
> -   Yocto Project*: See the "`Setting Up to Use the Yocto
> -   Project <#dev-manual-start>`__" section for options on how to get a
> +   Yocto Project*: See the ":doc:`dev-manual-start`" section for option=
s on how to get a
>     build host ready to use the Yocto Project.
>
>  2. *Initialize the Build Environment:* Initialize the build environment
> @@ -3796,24 +3780,17 @@ The following figure and list overviews the buil=
d process:
>        $ source oe-init-build-env [build_dir]
>
>     When you use the initialization script, the OpenEmbedded build syste=
m
> -   uses ``build`` as the default Build Directory in your current work
> -   directory. You can use a build_dir argument with the script to
> +   uses ``build`` as the default :term:`Build Directory` in your curren=
t work
> +   directory. You can use a `build_dir` argument with the script to
>     specify a different build directory.
>
>     .. note::
>
>        A common practice is to use a different Build Directory for
> -      different targets. For example,
> -      ~/build/x86
> -      for a
> -      qemux86
> -      target, and
> -      ~/build/arm
> -      for a
> -      qemuarm
> -      target.
> -
> -3. Make Sure Your ``local.conf`` File is Correct: Ensure the
> +      different targets. For example, ``~/build/x86`` for a ``qemux86``
> +      target, and ``~/build/arm`` for a ``qemuarm`` target.
> +
> +3. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
>     ``conf/local.conf`` configuration file, which is found in the Build
>     Directory, is set up how you want it. This file defines many aspects
>     of the build environment including the target machine architecture
> @@ -3830,9 +3807,7 @@ The following figure and list overviews the build =
process:
>
>     .. note::
>
> -      For information on BitBake, see the
> -      BitBake User Manual
> -      .
> +      For information on BitBake, see the :doc:`bitbake:index`.
>
>     The target is the name of the recipe you want to build. Common
>     targets are the images in ``meta/recipes-core/images``,
> @@ -3937,8 +3912,7 @@ Follow these steps to set up and execute multiple =
configuration builds:
>
>        A "default" configuration already exists by definition. This
>        configuration is named: "" (i.e. empty string) and is defined by
> -      the variables coming from your
> -      local.conf
> +      the variables coming from your ``local.conf``
>        file. Consequently, the previous example actually adds two
>        additional configurations to your build: "arm" and "x86" along
>        with "".
> @@ -3962,11 +3936,10 @@ Follow these steps to set up and execute multipl=
e configuration builds:
>
>  .. note::
>
> -   Support for multiple configuration builds in the Yocto Project DISTR=
O
> -   (DISTRO_NAME) Release does not include Shared State (sstate)
> +   Support for multiple configuration builds in the Yocto Project &DIST=
RO;
> +   (&DISTRO_NAME;) Release does not include Shared State (sstate)
>     optimizations. Consequently, if a build uses the same object twice
> -   in, for example, two different
> -   TMPDIR
> +   in, for example, two different ``TMPDIR``
>     directories, the build either loads from an existing sstate cache fo=
r
>     that build at the start or builds the object fresh.
>
> @@ -3999,7 +3972,7 @@ to be added to the recipe that builds the ``core-i=
mage-sato`` image:
>
>     do_image[mcdepends] =3D "mc:x86:arm:core-image-minimal:do_rootfs"
>
> -In this example, the from_multiconfig is "x86". The to_multiconfig is "=
arm". The
> +In this example, the `from_multiconfig` is "x86". The `to_multiconfig` =
is "arm". The
>  task on which the ``do_image`` task in the recipe depends is the
>  ``do_rootfs`` task from the ``core-image-minimal`` recipe associated
>  with the "arm" multiconfig.
> @@ -4083,16 +4056,10 @@ Follow these steps to create an initramfs image:
>
>        If you choose to not bundle the initramfs image with the kernel
>        image, you are essentially using an
> -      Initial RAM Disk (initrd)
> -      . Creating an initrd is handled primarily through the
> -      INITRD_IMAGE
> -      ,
> -      INITRD_LIVE
> -      , and
> -      INITRD_IMAGE_LIVE
> -      variables. For more information, see the
> -      image-live.bbclass
> -      file.
> +      `Initial RAM Disk (initrd) <https://en.wikipedia.org/wiki/Initrd>=
`__.
> +      Creating an initrd is handled primarily through the :term:`INITRD=
_IMAGE`,
> +      ``INITRD_LIVE``, and ``INITRD_IMAGE_LIVE`` variables. For more
> +      information, see the :ref:`ref-classes-image-live` file.
>
>  3. *Optionally Add Items to the initramfs Image Through the initramfs
>     Image Recipe:* If you add items to the initramfs image by way of its
> @@ -4191,15 +4158,10 @@ your own distribution that are likely modeled af=
ter ``poky-tiny``.
>
>  .. note::
>
> -   To use
> -   poky-tiny
> -   in your build, set the
> -   DISTRO
> -   variable in your
> -   local.conf
> -   file to "poky-tiny" as described in the "
> -   Creating Your Own Distribution
> -   " section.
> +   To use ``poky-tiny`` in your build, set the ``DISTRO`` variable in y=
our
> +   ``local.conf`` file to "poky-tiny" as described in the
> +   ":ref:`dev-manual/dev-manual-common-tasks:creating your own distribu=
tion`"
> +   section.
>
>  Understanding some memory concepts will help you reduce the system size=
.
>  Memory consists of static, dynamic, and temporary memory. Static memory
> @@ -4453,17 +4415,10 @@ your tunings to best consider build times and pa=
ckage feed maintenance.
>
>     .. note::
>
> -      If
> -      DISTRO
> -      settings change or fundamental configuration settings such as the
> -      filesystem layout, you need to work with a clean
> -      TMPDIR
> -      . Sharing
> -      TMPDIR
> -      under these circumstances might work but since it is not
> -      guaranteed, you should use a clean
> -      TMPDIR
> -      .
> +      If :term:`DISTRO` settings change or fundamental configuration se=
ttings
> +      such as the filesystem layout, you need to work with a clean ``TM=
PDIR``.
> +      Sharing ``TMPDIR`` under these circumstances might work but since=
 it is
> +      not guaranteed, you should use a clean ``TMPDIR``.
>
>  -  *Enable the Appropriate Package Architecture:* By default, the
>     OpenEmbedded build system enables three levels of package
> @@ -4561,7 +4516,7 @@ your tunings to best consider build times and pack=
age feed maintenance.
>     For such cases, you can use some tools to help you sort out the
>     situation:
>
> -   -  *sstate-diff-machines.sh:* You can find this tool in the
> +   -  ``state-diff-machines.sh``*:* You can find this tool in the
>        ``scripts`` directory of the Source Repositories. See the comment=
s
>        in the script for information on how to use the tool.
>
> @@ -4612,8 +4567,7 @@ This next example shows how to accomplish the same=
 thing by setting
>  .. note::
>
>     In order for these settings to take effect, you must globally or
> -   locally inherit the
> -   externalsrc
> +   locally inherit the :ref:`externalsrc <ref-classes-externalsrc>`
>     class.
>
>  By default, ``externalsrc.bbclass`` builds the source code in a
> @@ -4722,7 +4676,11 @@ directory:
>        latest version of software by setting
>        :term:`SRCREV` to
>        ``${``\ :term:`AUTOREV`\ ``}``:
> -      SRCREV =3D "${AUTOREV}" When a recipe sets ``SRCREV`` to
> +      ::
> +
> +         SRCREV =3D "${AUTOREV}"
> +
> +      When a recipe sets ``SRCREV`` to
>        ``${AUTOREV}``, the build system accesses the network in an
>        attempt to determine the latest version of software from the SCM.
>        Typically, recipes that use ``AUTOREV`` are custom or modified
> @@ -4892,9 +4850,7 @@ library files.
>  .. note::
>
>     Some previously released versions of the Yocto Project defined the
> -   static library files through
> -   ${PN}-dev
> -   .
> +   static library files through ``${PN}-dev``.
>
>  Following is part of the BitBake configuration file, where you can see
>  how the static library files are defined:
> @@ -4943,7 +4899,7 @@ The build system offers the ability to build libra=
ries with different
>  target optimizations or architecture formats and combine these together
>  into one system image. You can link different binaries in the image
>  against the different libraries as needed for specific use cases. This
> -feature is called "Multilib."
> +feature is called "Multilib".
>
>  An example would be where you have most of a system compiled in 32-bit
>  mode using 32-bit libraries, but you have something large, like a
> @@ -5108,13 +5064,14 @@ versioning. With properly versioned libraries, a=
ll you need to do to
>  individually specify the libraries is create separate, appropriately
>  named recipes where the :term:`PN` part of
>  the name includes a portion that differentiates each library version
> -(e.g.the major part of the version number). Thus, instead of having a
> +(e.g. the major part of the version number). Thus, instead of having a
>  single recipe that loads one version of a library (e.g. ``clutter``),
>  you provide multiple recipes that result in different versions of the
>  libraries you want. As an example, the following two recipes would allo=
w
>  the two separate versions of the ``clutter`` library to co-exist on the
>  same system:
> -::
> +
> +.. code-block:: none
>
>     clutter-1.6_1.6.20.bb
>     clutter-1.8_1.8.4.bb
> @@ -5245,11 +5202,8 @@ library package involves the following:
>
>     .. note::
>
> -      See recipes in the
> -      oe-core
> -      repository that use that
> -      GIR_EXTRA_LIBS_PATH
> -      variable as an example.
> +      See recipes in the ``oe-core`` repository that use that
> +      ``GIR_EXTRA_LIBS_PATH`` variable as an example.
>
>  4. Look for any other errors, which probably mean that introspection
>     support in a package is not entirely standard, and thus breaks down
> @@ -5322,7 +5276,7 @@ working in an image:
>        >>> GLib.get_host_name()
>
>  5. For something a little more advanced, enter the following see:
> -   http://python-gtk-3-tutorial.readthedocs.org/en/latest/introduction.=
html
> +   https://python-gtk-3-tutorial.readthedocs.io/en/latest/introduction.=
html
>
>  Known Issues
>  ------------
> @@ -5369,7 +5323,7 @@ follows:
>  A good example of an external toolchain used with the Yocto Project is
>  Mentor Graphics Sourcery G++ Toolchain. You can see information on how
>  to use that particular layer in the ``README`` file at
> -http://github.com/MentorEmbedded/meta-sourcery/. You can find
> +https://github.com/MentorEmbedded/meta-sourcery/. You can find
>  further information by reading about the
>  :term:`TCMODE` variable in the Yocto
>  Project Reference Manual's variable glossary.
> @@ -5399,11 +5353,9 @@ particular system.
>
>  .. note::
>
> -   For a kickstart file reference, see the "
> -   OpenEmbedded Kickstart (
> -   .wks
> -   ) Reference
> -   " Chapter in the Yocto Project Reference Manual.
> +   For a kickstart file reference, see the
> +   ":ref:`ref-manual/ref-kickstart:openembedded kickstart (\`\`.wks\`\`=
) reference`"
> +   Chapter in the Yocto Project Reference Manual.
>
>  The ``wic`` command and the infrastructure it is based on is by
>  definition incomplete. The purpose of the command is to allow the
> @@ -5472,7 +5424,10 @@ system needs to meet the following requirements:
>     form generated by the OpenEmbedded build system.
>
>  -  You must build several native tools, which are built to run on the
> -   build system: $ bitbake parted-native dosfstools-native mtools-nativ=
e
> +   build system:
> +   ::
> +
> +      $ bitbake parted-native dosfstools-native mtools-native
>
>  -  Include "wic" as part of the
>     :term:`IMAGE_FSTYPES`
> @@ -5730,8 +5685,7 @@ partition.
>
>     If you use plugins that have build-time dependencies (e.g. native
>     tools, bootloaders, and so forth) when building a Wic image, you nee=
d
> -   to specify those dependencies using the
> -   WKS_FILE_DEPENDS
> +   to specify those dependencies using the :term:`WKS_FILE_DEPENDS`
>     variable.
>
>  Source plugins are subclasses defined in plugin files. As shipped, the
> @@ -5837,9 +5791,8 @@ The following list describes the methods implement=
ed in the
>
>     .. note::
>
> -      get_bitbake_var()
> -      allows you to access non-standard variables that you might want t=
o
> -      use for this behavior.
> +      ``get_bitbake_var()`` allows you to access non-standard variables=
 that
> +      you might want to use for this behavior.
>
>  You can extend the source plugin mechanism. To add more hooks, create
>  more source plugin methods within ``SourcePlugin`` and the correspondin=
g
> @@ -5915,12 +5868,10 @@ or ::
>
>  .. note::
>
> -   For more information on how to use the
> -   bmaptool
> -   to flash a device with an image, see the "
> -   Flashing Images Using
> -   bmaptool
> -   " section.
> +   For more information on how to use the ``bmaptool``
> +   to flash a device with an image, see the
> +   ":ref:`dev-manual/dev-manual-common-tasks:flashing images using \`\`=
bmaptool\`\``"
> +   section.
>
>  Using a Modified Kickstart File
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> @@ -6048,9 +5999,7 @@ modify the kernel.
>  .. note::
>
>     In order to use Wic to manipulate a Wic image as in this example,
> -   your development machine must have the
> -   mtools
> -   package installed.
> +   your development machine must have the ``mtools`` package installed.
>
>  The following example examines the contents of the Wic image, deletes
>  the existing kernel, and then inserts a new kernel:
> @@ -6110,9 +6059,8 @@ the existing kernel, and then inserts a new kernel=
:
>     .. note::
>
>        If you see the following error, you need to update or create a
> -      ~/.mtoolsrc
> -      file and be sure to have the line "mtools_skip_check=3D1" in the
> -      file. Then, run the Wic command again:
> +      ``~/.mtoolsrc`` file and be sure to have the line "mtools_skip_ch=
eck=3D1"
> +      in the file. Then, run the Wic command again:
>        ::
>
>                ERROR: _exec_cmd: /usr/bin/mdir -i /tmp/wic-parttfokuwra =
::/ returned '1' instead of 0
> @@ -6141,17 +6089,14 @@ the existing kernel, and then inserts a new kern=
el:
>           ~/poky/build/tmp/deploy/images/qemux86/core-image-minimal-qemu=
x86.wic:1/vmlinuz
>
>     Once the new kernel is added back into the image, you can use the
> -   ``dd`` command or ```bmaptool`` <#flashing-images-using-bmaptool>`__
> +   ``dd`` command or :ref:`bmaptool
> +   <dev-manual/dev-manual-common-tasks:flashing images using \`\`bmapto=
ol\`\`>`
>     to flash your wic image onto an SD card or USB stick and test your
>     target.
>
>     .. note::
>
> -      Using
> -      bmaptool
> -      is generally 10 to 20 times faster than using
> -      dd
> -      .
> +      Using ``bmaptool`` is generally 10 to 20 times faster than using =
``dd``.
>
>  Flashing Images Using ``bmaptool``
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -6168,11 +6113,16 @@ system image files much faster.
>     -  If you are using Ubuntu or Debian distributions, you can install
>        the ``bmap-tools`` package using the following command and then
>        use the tool without specifying ``PATH`` even from the root
> -      account: $ sudo apt-get install bmap-tools
> +      account:
> +      ::
> +
> +         $ sudo apt-get install bmap-tools
>
>     -  If you are unable to install the ``bmap-tools`` package, you will
>        need to build Bmaptool before using it. Use the following command=
:
> -      $ bitbake bmap-tools-native
> +      ::
> +
> +         $ bitbake bmap-tools-native
>
>  Following, is an example that shows how to flash a Wic image. Realize
>  that while this example uses a Wic image, you can use Bmaptool to flash
> @@ -6356,8 +6306,7 @@ system to make your images more secure:
>  -  Consider enabling a Mandatory Access Control (MAC) framework such as
>     SMACK or SELinux and tuning it appropriately for your device's usage=
.
>     You can find more information in the
> -   `meta-selinux <http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinu=
x/>`__
> -   layer.
> +   :yocto_git:`meta-selinux </cgit/cgit.cgi/meta-selinux/>` layer.
>
>  Tools for Hardening Your Image
>  ------------------------------
> @@ -6397,11 +6346,8 @@ layer. The following steps provide some more deta=
il:
>
>     .. note::
>
> -      The
> -      DISTRO
> -      variable in your
> -      local.conf
> -      file determines the name of your distribution.
> +      The :term:`DISTRO` variable in your ``local.conf`` file determine=
s the
> +      name of your distribution.
>
>     You can split out parts of your configuration file into include file=
s
>     and then "require" them from within your distribution configuration
> @@ -6432,15 +6378,11 @@ layer. The following steps provide some more det=
ail:
>
>        If you want to base your distribution configuration file on the
>        very basic configuration from OE-Core, you can use
> -      conf/distro/defaultsetup.conf
> -      as a reference and just include variables that differ as compared
> -      to
> -      defaultsetup.conf
> -      . Alternatively, you can create a distribution configuration file
> -      from scratch using the
> -      defaultsetup.conf
> -      file or configuration files from other distributions such as Poky
> -      or Angstrom as references.
> +      ``conf/distro/defaultsetup.conf`` as a reference and just include
> +      variables that differ as compared to ``defaultsetup.conf``.
> +      Alternatively, you can create a distribution configuration file
> +      from scratch using the ``defaultsetup.conf`` file or configuratio=
n files
> +      from other distributions such as Poky or Angstrom as references.
>
>  -  *Provide miscellaneous variables:* Be sure to define any other
>     variables for which you want to create a default or enforce as part
> @@ -6652,11 +6594,8 @@ the following:
>
>     .. note::
>
> -      Technically, a third component, the "epoch" (i.e.
> -      PE
> -      ) is involved but this discussion for the most part ignores
> -      PE
> -      .
> +      Technically, a third component, the "epoch" (i.e. :term:`PE`) is =
involved
> +      but this discussion for the most part ignores ``PE``.
>
>     The version and revision are taken from the
>     :term:`PV` and
> @@ -6714,8 +6653,7 @@ revision field, which removes the human element.
>  .. note::
>
>     For additional information on using a PR Service, you can see the
> -   PR Service
> -   wiki page.
> +   :yocto_wiki:`PR Service </wiki/PR_Service>` wiki page.
>
>  The Yocto Project uses variables in order of decreasing priority to
>  facilitate revision numbering (i.e.
> @@ -6836,7 +6774,7 @@ the ``PE`` variable (Package Epoch). The ``PE`` va=
riable defaults to
>
>  Binary package version numbering strives to follow the `Debian Version
>  Field Policy
> -Guidelines <http://www.debian.org/doc/debian-policy/ch-controlfields.ht=
ml>`__.
> +Guidelines <https://www.debian.org/doc/debian-policy/ch-controlfields.h=
tml>`__.
>  These guidelines define how versions are compared and what "increasing"
>  a version means.
>
> @@ -6864,7 +6802,8 @@ code changes. Here is an example:
>     PV =3D "1.0+git${SRCPV}"
>
>  The OpenEmbedded build system substitutes ``SRCPV`` with the following:
> -::
> +
> +.. code-block:: none
>
>     AUTOINC+source_code_revision
>
> @@ -6876,7 +6815,8 @@ with a number. The number used depends on the stat=
e of the PR Service:
>     :term:`PR`. This behavior results in
>     linearly increasing package versions, which is desirable. Here is an
>     example:
> -   ::
> +
> +   .. code-block:: none
>
>        hello-world-git_0.0+git0+b6558dd387-r0.0_armv7a-neon.ipk
>        hello-world-git_0.0+git1+dd2f5c3565-r0.0_armv7a-neon.ipk
> @@ -6886,7 +6826,8 @@ with a number. The number used depends on the stat=
e of the PR Service:
>     changing the package version since the source revision is included.
>     However, package versions are not increased linearly. Here is an
>     example:
> -   ::
> +
> +   .. code-block:: none
>
>        hello-world-git_0.0+git0+b6558dd387-r0.0_armv7a-neon.ipk
>        hello-world-git_0.0+git0+dd2f5c3565-r0.0_armv7a-neon.ipk
> @@ -7013,7 +6954,7 @@ optional arguments:
>           As above
>        modulename
>           The module name derived using file_regex
> -    extra_depends
> +   extra_depends
>        Extra runtime dependencies (RDEPENDS) to be
>        set for all packages. The default value of None
>        causes a dependency on the main package
> @@ -7278,13 +7219,10 @@ the steps in this section if you want to use run=
time package management.
>
>  .. note::
>
> -   For information on the PACKAGE_FEED_* variables, see
> -   PACKAGE_FEED_ARCHS
> -   ,
> -   PACKAGE_FEED_BASE_PATHS
> -   , and
> -   PACKAGE_FEED_URIS
> -   in the Yocto Project Reference Manual variables glossary.
> +   For information on the ``PACKAGE_FEED_*`` variables, see
> +   :term:`PACKAGE_FEED_ARCHS`, :term:`PACKAGE_FEED_BASE_PATHS`, and
> +   :term:`PACKAGE_FEED_URIS` in the Yocto Project Reference Manual vari=
ables
> +   glossary.
>
>  On the target, you must inform DNF that package databases are available=
.
>  You do this by creating a file named
> @@ -7299,14 +7237,10 @@ configuration point to the correct remote locati=
on for the feeds.
>  .. note::
>
>     For development purposes, you can point the web server to the build
> -   system's
> -   deploy
> -   directory. However, for production use, it is better to copy the
> -   package directories to a location outside of the build area and use
> +   system's ``deploy`` directory. However, for production use, it is be=
tter to
> +   copy the package directories to a location outside of the build area=
 and use
>     that location. Doing so avoids situations where the build system
> -   overwrites or changes the
> -   deploy
> -   directory.
> +   overwrites or changes the ``deploy`` directory.
>
>  When telling DNF where to look for the package databases, you must
>  declare individual locations per architecture or a single location used
> @@ -7314,7 +7248,8 @@ for all architectures. You cannot do both:
>
>  -  *Create an Explicit List of Architectures:* Define individual base
>     URLs to identify where each package database is located:
> -   ::
> +
> +   .. code-block:: none
>
>        [oe-packages]
>        baseurl=3Dhttp://my.server/rpm/i586  http://my.server/rpm/qemux86=
 http://my.server/rpm/all
> @@ -7336,7 +7271,8 @@ for all architectures. You cannot do both:
>
>  Once you have informed DNF where to find the package databases, you nee=
d
>  to fetch them:
> -::
> +
> +.. code-block:: none
>
>     # dnf makecache
>
> @@ -7345,9 +7281,8 @@ upgrade packages from the specified repository or =
repositories.
>
>  .. note::
>
> -   See the
> -   DNF documentation
> -   for additional information.
> +   See the `DNF documentation <https://dnf.readthedocs.io/en/latest/>`_=
_ for
> +   additional information.
>
>  .. _runtime-package-management-target-ipk:
>
> @@ -7374,16 +7309,22 @@ directory containing the ``i586``, ``all``, and =
``qemux86`` databases
>  through an HTTP server named ``my.server``. On the target, create a
>  configuration file (e.g. ``my_repo.conf``) inside the ``/etc/opkg/``
>  directory containing the following:
> -::
> +
> +.. code-block:: none
>
>     src/gz all http://my.server/ipk/all
>     src/gz i586 http://my.server/ipk/i586
>     src/gz qemux86 http://my.server/ipk/qemux86
>
>  Next, instruct ``opkg`` to fetch the
> -repository information: # opkg update The ``opkg`` application is now
> -able to find, install, and upgrade packages from the specified
> -repository.
> +repository information:
> +
> +.. code-block:: none
> +
> +   # opkg update
> +
> +The ``opkg`` application is now able to find, install, and upgrade pack=
ages
> +from the specified repository.
>
>  .. _runtime-package-management-target-deb:
>
> @@ -7407,7 +7348,8 @@ list file (e.g. ``my_repo.list``) inside the
>  serving packages from a ``deb/`` directory containing the ``i586``,
>  ``all``, and ``qemux86`` databases through an HTTP server named
>  ``my.server``. The list file should contain:
> -::
> +
> +.. code-block:: none
>
>     deb http://my.server/deb/all ./
>     deb http://my.server/deb/i586 ./
> @@ -7415,7 +7357,8 @@ serving packages from a ``deb/`` directory contain=
ing the ``i586``,
>
>  Next, instruct the ``apt`` application
>  to fetch the repository information:
> -::
> +
> +.. code-block:: none
>
>    # apt-get update
>
> @@ -7451,10 +7394,8 @@ file:
>
>  .. note::
>
> -   Be sure to supply appropriate values for both
> -   key_name
> -   and
> -   passphrase
> +   Be sure to supply appropriate values for both `key_name` and
> +   `passphrase`.
>
>  Aside from the ``RPM_GPG_NAME`` and ``RPM_GPG_PASSPHRASE`` variables in
>  the previous example, two optional variables related to signing exist:
> @@ -7527,8 +7468,7 @@ see the :yocto_wiki:`Ptest </wiki/Ptest>` wiki pag=
e.
>  .. note::
>
>     A recipe is "ptest-enabled" if it inherits the
> -   ptest
> -   class.
> +   :ref:`ptest <ref-classes-ptest>` class.
>
>  Adding ptest to Your Build
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> @@ -7562,7 +7502,7 @@ you need to prepare the recipes that build the pac=
kages you want to
>  test. Here is what you have to do for each recipe:
>
>  -  *Be sure the recipe inherits
> -   the*\ :ref:`ptest <ref-classes-ptest>`\ *class:*
> +   the* :ref:`ptest <ref-classes-ptest>` *class:*
>     Include the following line in each recipe:
>     ::
>
> @@ -7630,7 +7570,7 @@ Creating Node Package Manager (NPM) Packages
>  manager for the JavaScript programming language. The Yocto Project
>  supports the NPM :ref:`fetcher <bitbake:bb-fetchers>`. You can
>  use this fetcher in combination with
> -:doc:```devtool`` <../ref-manual/ref-devtool-reference>` to create
> +:doc:`devtool <../ref-manual/ref-devtool-reference>` to create
>  recipes that produce NPM packages.
>
>  Two workflows exist that allow you to create NPM packages using
> @@ -7640,8 +7580,7 @@ method.
>  .. note::
>
>     While it is possible to create NPM recipes manually, using
> -   devtool
> -   is far simpler.
> +   ``devtool`` is far simpler.
>
>  Additionally, some requirements and caveats exist.
>
> @@ -7661,7 +7600,7 @@ NPM packages:
>     is NPM's public registry.
>
>  -  Be familiar with
> -   :doc:```devtool`` <../ref-manual/ref-devtool-reference>`.
> +   :doc:`devtool <../ref-manual/ref-devtool-reference>`.
>
>  -  The NPM host tools need the native ``nodejs-npm`` package, which is
>     part of the OpenEmbedded environment. You need to get the package by
> @@ -7691,9 +7630,7 @@ which is a file browser web application.
>
>  .. note::
>
> -   You must know the
> -   cute-files
> -   module version.
> +   You must know the ``cute-files`` module version.
>
>  The first thing you need to do is use ``devtool`` and the NPM fetcher t=
o
>  create the recipe:
> @@ -7778,11 +7715,8 @@ test the application:
>
>  .. note::
>
> -   Because of a know issue, you cannot simply run
> -   cute-files
> -   as you would if you had run
> -   npm install
> -   .
> +   Because of a known issue, you cannot simply run ``cute-files`` as yo=
u would
> +   if you had run ``npm install``.
>
>  ::
>
> @@ -7829,7 +7763,7 @@ the previous section. However, the ``SRC_URI`` loo=
ks like the following:
>         "
>
>  In this example,
> -the main module is taken from the Git repository and dependents are
> +the main module is taken from the Git repository and dependencies are
>  taken from the NPM registry. Other than those differences, the recipe i=
s
>  basically the same between the two methods. You can build and deploy th=
e
>  package exactly as described in the previous section that uses the
> @@ -7857,7 +7791,7 @@ of precedence is the same as this list:
>
>  -  ``PACKAGE_ADD_METADATA``
>
> -<PKGTYPE> is a parameter and expected to be a distinct name of specific
> +`<PKGTYPE>` is a parameter and expected to be a distinct name of specif=
ic
>  package type:
>
>  -  IPK for .ipk packages
> @@ -7866,15 +7800,17 @@ package type:
>
>  -  RPM for .rpm packages
>
> -<PN> is a parameter and expected to be a package name.
> +`<PN>` is a parameter and expected to be a package name.
>
>  The variable can contain multiple [one-line] metadata fields separated
> -by the literal sequence '\n'. The separator can be redefined using the
> +by the literal sequence '\\n'. The separator can be redefined using the
>  variable flag ``separator``.
>
>  The following is an example that adds two custom fields for ipk
> -packages: PACKAGE_ADD_METADATA_IPK =3D "Vendor: CustomIpk\nGroup:
> -Applications/Spreadsheets"
> +packages:
> +::
> +
> +   PACKAGE_ADD_METADATA_IPK =3D "Vendor: CustomIpk\nGroup:Applications/=
Spreadsheets"
>
>  Efficiently Fetching Source Files During a Build
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> @@ -7956,7 +7892,7 @@ Within the system, SysVinit treats system componen=
ts as services. These
>  services are maintained as shell scripts stored in the ``/etc/init.d/``
>  directory. Services organize into different run levels. This
>  organization is maintained by putting links to the services in the
> -``/etc/rcN.d/`` directories, where N/ is one of the following options:
> +``/etc/rcN.d/`` directories, where `N/` is one of the following options=
:
>  "S", "0", "1", "2", "3", "4", "5", or "6".
>
>  .. note::
> @@ -7971,7 +7907,7 @@ The runlevel concept in SysVinit corresponds to th=
e concept of a target
>  in systemd, where target is also a type of supported unit.
>
>  In a SysVinit-based system, services load sequentially (i.e. one by one=
)
> -during and parallelization is not supported. With systemd, services
> +during init and parallelization is not supported. With systemd, service=
s
>  start in parallel. Needless to say, the method can have an impact on
>  system startup performance.
>
> @@ -8170,10 +8106,8 @@ development source for numerous packages.
>
>  .. note::
>
> -   The
> -   poky-bleeding
> -   distribution is not tested on a regular basis. Keep this in mind if
> -   you use it.
> +   The ``poky-bleeding`` distribution is not tested on a regular basis.=
 Keep
> +   this in mind if you use it.
>
>  Creating a Read-Only Root Filesystem
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -8288,14 +8222,13 @@ the information.
>
>  The remainder of this section describes the following:
>
> --  How you can enable and disable build history
> +-  :ref:`How you can enable and disable build history <dev-manual/dev-m=
anual-common-tasks:enabling and disabling build history>`
>
> --  How to understand what the build history contains
> +-  :ref:`How to understand what the build history contains <dev-manual/=
dev-manual-common-tasks:understanding what the build history contains>`
>
> --  How to limit the information used for build history
> +-  :ref:`How to limit the information used for build history <dev-manua=
l/dev-manual-common-tasks:using build history to gather image information o=
nly>`
>
> --  How to examine the build history from both a command-line and web
> -   interface
> +-  :ref:`How to examine the build history from both a command-line and =
web interface <dev-manual/dev-manual-common-tasks:examining build history i=
nformation>`
>
>  Enabling and Disabling Build History
>  ------------------------------------
> @@ -8349,7 +8282,8 @@ The history for each package contains a text file =
that has name-value
>  pairs with information about the package. For example,
>  ``buildhistory/packages/i586-poky-linux/busybox/busybox/latest``
>  contains the following:
> -::
> +
> +.. code-block:: none
>
>     PV =3D 1.22.1
>     PR =3D r32
> @@ -8373,7 +8307,8 @@ package in bytes.
>
>  A file also exists that corresponds to the recipe from which the packag=
e
>  came (e.g. ``buildhistory/packages/i586-poky-linux/busybox/latest``):
> -::
> +
> +.. code-block:: none
>
>     PV =3D 1.22.1
>     PR =3D r32
> @@ -8432,9 +8367,7 @@ output from this command:
>
>  .. note::
>
> -   Here are some notes on using the
> -   buildhistory-collect-srcrevs
> -   command:
> +   Here are some notes on using the ``buildhistory-collect-srcrevs`` co=
mmand:
>
>     -  By default, only values where the ``SRCREV`` was not hardcoded
>        (usually when ``AUTOREV`` is used) are reported. Use the ``-a``
> @@ -8488,7 +8421,8 @@ The files produced for each image are as follows:
>     even if package management is disabled for the final image.
>
>  Here is an example of ``image-info.txt``:
> -::
> +
> +.. code-block:: none
>
>     DISTRO =3D poky
>     DISTRO_VERSION =3D 1.7
> @@ -8595,7 +8529,8 @@ The following list shows the files produced for SD=
Ks:
>        package filenames.
>
>  Here is an example of ``sdk-info.txt``:
> -::
> +
> +.. code-block:: none
>
>     DISTRO =3D poky
>     DISTRO_VERSION =3D 1.3+snapshot-20130327
> @@ -8652,29 +8587,19 @@ might be significant in human-readable form. Her=
e is an example:
>
>  .. note::
>
> -   The
> -   buildhistory-diff
> -   tool requires the
> -   GitPython
> +   The ``buildhistory-diff`` tool requires the ``GitPython``
>     package. Be sure to install it using Pip3 as follows:
>     ::
>
>           $ pip3 install GitPython --user
>
>
> -   Alternatively, you can install
> -   python3-git
> -   using the appropriate distribution package manager (e.g.
> -   apt-get
> -   ,
> -   dnf
> -   , or
> -   zipper
> -   ).
> +   Alternatively, you can install ``python3-git`` using the appropriate
> +   distribution package manager (e.g. ``apt-get``, ``dnf``, or ``zipper=
``).
>
>  To see changes to the build history using a web interface, follow the
> -instruction in the ``README`` file here.
> -http://git.yoctoproject.org/cgit/cgit.cgi/buildhistory-web/.
> +instruction in the ``README`` file
> +:yocto_git:`here </cgit/cgit.cgi/buildhistory-web/>`.
>
>  Here is a sample screenshot of the interface:
>
> @@ -8722,9 +8647,7 @@ In order to run tests, you need to do the followin=
g:
>        .. note::
>
>           On some distributions, you also need to comment out "Defaults
> -         requiretty" in
> -         /etc/sudoers
> -         .
> +         requiretty" in ``/etc/sudoers``.
>
>     -  Manually configure a tap interface for your system.
>
> @@ -8739,7 +8662,9 @@ In order to run tests, you need to do the followin=
g:
>
>           -  The package recipe ``qemu-helper-native`` is required to ru=
n
>              this script. Build the package using the following command:
> -            $ bitbake qemu-helper-native
> +            ::
> +
> +               $ bitbake qemu-helper-native
>
>  -  *Set the DISPLAY variable:* You need to set this variable so that
>     you have an X server available (e.g. start ``vncserver`` for a
> @@ -8846,13 +8771,13 @@ options exist:
>     comments at the top of the BeagleBoneTarget
>     ``meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py`` file.
>
> --  *"EdgeRouterTarget":* Choose "EdgeRouterTarget" is you are deploying
> +-  *"EdgeRouterTarget":* Choose "EdgeRouterTarget" if you are deploying
>     images and running tests on the Ubiquiti Networks EdgeRouter Lite.
>     For information on how to use these tests, see the comments at the
>     top of the EdgeRouterTarget
>     ``meta-yocto-bsp/lib/oeqa/controllers/edgeroutertarget.py`` file.
>
> --  *"GrubTarget":* Choose the "supports deploying images and running
> +-  *"GrubTarget":* Choose "GrubTarget" if you are deploying images and =
running
>     tests on any generic PC that boots using GRUB. For information on ho=
w
>     to use these tests, see the comments at the top of the GrubTarget
>     ``meta-yocto-bsp/lib/oeqa/controllers/grubtarget.py`` file.
> @@ -8943,7 +8868,8 @@ power:
>
>     In this example, the expect
>     script does the following:
> -   ::
> +
> +   .. code-block:: shell
>
>        ssh test@10.11.12.1 "pyctl nuc1 arg"
>
> @@ -8952,12 +8878,9 @@ power:
>
>     .. note::
>
> -      You need to customize
> -      TEST_POWERCONTROL_CMD
> -      and
> -      TEST_POWERCONTROL_EXTRA_ARGS
> -      for your own setup. The one requirement is that it accepts "on",
> -      "off", and "cycle" as the last argument.
> +      You need to customize ``TEST_POWERCONTROL_CMD`` and
> +      ``TEST_POWERCONTROL_EXTRA_ARGS`` for your own setup. The one requ=
irement
> +      is that it accepts "on", "off", and "cycle" as the last argument.
>
>  -  When no command is defined, it connects to the device over SSH and
>     uses the classic reboot command to reboot the device. Classic reboot
> @@ -8968,7 +8891,7 @@ power:
>
>  If you have no hardware to automatically perform power control but stil=
l
>  wish to experiment with automated hardware testing, you can use the
> -dialog-power-control script that shows a dialog prompting you to perfor=
m
> +``dialog-power-control`` script that shows a dialog prompting you to pe=
rform
>  the required power action. This script requires either KDialog or Zenit=
y
>  to be installed. To use this script, set the
>  :term:`TEST_POWERCONTROL_CMD`
> @@ -9059,9 +8982,7 @@ the ``local.conf`` file as normal. Be sure that te=
sts reside in
>  .. note::
>
>     Be sure that module names do not collide with module names used in
> -   the default set of test modules in
> -   meta/lib/oeqa/runtime
> -   .
> +   the default set of test modules in ``meta/lib/oeqa/runtime``.
>
>  You can change the set of tests run by appending or overriding
>  :term:`TEST_SUITES` variable in
> @@ -9082,9 +9003,7 @@ handling.
>  .. note::
>
>     Each module can have multiple classes with multiple test methods.
> -   And, Python
> -   unittest
> -   rules apply.
> +   And, Python ``unittest`` rules apply.
>
>  Here are some things to keep in mind when running tests:
>
> @@ -9098,8 +9017,12 @@ Here are some things to keep in mind when running=
 tests:
>
>        TEST_SUITES_append =3D " mytest"
>
> --  Run a specific list of tests as follows: TEST_SUITES =3D "test1 test=
2
> -   test3" Remember, order is important. Be sure to place a test that is
> +-  Run a specific list of tests as follows:
> +   ::
> +
> +     TEST_SUITES =3D "test1 test2 test3"
> +
> +   Remember, order is important. Be sure to place a test that is
>     dependent on another test later in the order.
>
>  Exporting Tests
> @@ -9114,7 +9037,7 @@ If your image is already built, make sure the foll=
owing are set in your
>  ``local.conf`` file:
>  ::
>
> -   INHERIT +=3D"testexport"
> +   INHERIT +=3D "testexport"
>     TEST_TARGET_IP =3D "IP-address-for-the-test-target"
>     TEST_SERVER_IP =3D "IP-address-for-the-test-server"
>
> @@ -9139,7 +9062,7 @@ Here is a complete example that shows IP addresses=
 and uses the
>  ``core-image-sato`` image:
>  ::
>
> -   INHERIT +=3D"testexport"
> +   INHERIT +=3D "testexport"
>     TEST_TARGET_IP =3D "192.168.7.2"
>     TEST_SERVER_IP =3D "192.168.7.1"
>
> @@ -9182,11 +9105,7 @@ code from ``meta/lib/oeqa/utils``, which are help=
er classes.
>
>     Structure shell commands such that you rely on them and they return =
a
>     single code for success. Be aware that sometimes you will need to
> -   parse the output. See the
> -   df.py
> -   and
> -   date.py
> -   modules for examples.
> +   parse the output. See the ``df.py`` and ``date.py`` modules for exam=
ples.
>
>  You will notice that all test classes inherit ``oeRuntimeTest``, which
>  is found in ``meta/lib/oetest.py``. This base class offers some helper
> @@ -9279,10 +9198,8 @@ require an SSH connection and the target must be =
using the
>
>  .. note::
>
> -   This method uses
> -   scp
> -   to copy files from the host to the target, which causes permissions
> -   and special attributes to be lost.
> +   This method uses ``scp`` to copy files from the host to the target, =
which
> +   causes permissions and special attributes to be lost.
>
>  A JSON file is used to define the packages needed by a test. This file
>  must be in the same path as the file used to define the tests.
> @@ -9348,9 +9265,9 @@ situations.
>     of the console output. You can enter the commands after the build
>     completes to log error information into a common database, that can
>     help you figure out what might be going wrong. For information on ho=
w
> -   to enable and use this feature, see the "
> -   Using the Error Reporting Tool
> -   " section.
> +   to enable and use this feature, see the
> +   ":ref:`dev-manual/dev-manual-common-tasks:using the error reporting =
tool`"
> +   section.
>
>  The following list shows the debugging topics in the remainder of this
>  section:
> @@ -9423,18 +9340,18 @@ Viewing Logs from Failed Tasks
>  ------------------------------
>
>  You can find the log for a task in the file
> -``${``\ :term:`WORKDIR`\ ``}/temp/log.do_``\ taskname.
> +``${``\ :term:`WORKDIR`\ ``}/temp/log.do_``\ `taskname`.
>  For example, the log for the
>  :ref:`ref-tasks-compile` task of the
>  QEMU minimal image for the x86 machine (``qemux86``) might be in
>  ``tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.do_com=
pile``.
>  To see the commands :term:`BitBake` ran
> -to generate a log, look at the corresponding ``run.do_``\ taskname file
> +to generate a log, look at the corresponding ``run.do_``\ `taskname` fi=
le
>  in the same directory.
>
> -``log.do_``\ taskname and ``run.do_``\ taskname are actually symbolic
> -links to ``log.do_``\ taskname\ ``.``\ pid and
> -``log.run_``\ taskname\ ``.``\ pid, where pid is the PID the task had
> +``log.do_``\ `taskname` and ``run.do_``\ `taskname` are actually symbol=
ic
> +links to ``log.do_``\ `taskname`\ ``.``\ `pid` and
> +``log.run_``\ `taskname`\ ``.``\ `pid`, where `pid` is the PID the task=
 had
>  when it ran. The symlinks always point to the files corresponding to th=
e
>  most recent run.
>
> @@ -9477,7 +9394,7 @@ been parsed. The variables include those from the =
configuration as well:
>
>  In the output of ``bitbake -e``, each variable is preceded by a
>  description of how the variable got its value, including temporary
> -values that were later overriden. This description also includes
> +values that were later overridden. This description also includes
>  variable flags (varflags) set on the variable. The output can be very
>  helpful during debugging.
>
> @@ -9548,7 +9465,8 @@ Following are a few of the available ``oe-pkgdata-=
util`` subcommands.
>     ``make-doc`` package:
>     ::
>
> -      $ oe-pkgdata-util find-path /usr/share/man/man1/make.1 make-doc: =
/usr/share/man/man1/make.1
> +      $ oe-pkgdata-util find-path /usr/share/man/man1/make.1
> +      make-doc: /usr/share/man/man1/make.1
>
>  -  ``oe-pkgdata-util lookup-recipe package ...``: Lists the name
>     of the recipes that produce the given packages.
> @@ -9557,7 +9475,7 @@ For more information on the ``oe-pkgdata-util`` co=
mmand, use the help
>  facility:
>  ::
>
> -   $ oe-pkgdata-util DASHDASHhelp
> +   $ oe-pkgdata-util --help
>     $ oe-pkgdata-util subcommand --help
>
>  .. _dev-viewing-dependencies-between-recipes-and-tasks:
> @@ -9578,8 +9496,8 @@ command:
>  This command writes the following files in the current directory:
>
>  -  ``pn-buildlist``: A list of recipes/targets involved in building
> -   recipename. "Involved" here means that at least one task from the
> -   recipe needs to run when building recipename from scratch. Targets
> +   `recipename`. "Involved" here means that at least one task from the
> +   recipe needs to run when building `recipename` from scratch. Targets
>     that are in
>     :term:`ASSUME_PROVIDED`
>     are not listed.
> @@ -9589,7 +9507,7 @@ This command writes the following files in the cur=
rent directory:
>  The graphs are in
>  `DOT <https://en.wikipedia.org/wiki/DOT_%28graph_description_language%2=
9>`__
>  format and can be converted to images (e.g. using the ``dot`` tool from
> -`Graphviz <http://www.graphviz.org/>`__).
> +`Graphviz <https://www.graphviz.org/>`__).
>
>  .. note::
>
> @@ -9688,10 +9606,8 @@ BitBake has determined by doing the following:
>
>     .. note::
>
> -      Functions (e.g.
> -      base_do_fetch
> -      ) also count as variable dependencies. These functions in turn
> -      depend on the variables they reference.
> +      Functions (e.g. ``base_do_fetch``) also count as variable depende=
ncies.
> +      These functions in turn depend on the variables they reference.
>
>     The output of ``bitbake-dumpsig`` also includes the value each
>     variable had, a list of dependencies for each variable, and
> @@ -9715,10 +9631,9 @@ BitBake command-line options:
>
>  .. note::
>
> -   Two common values for
> -   SIGNATURE_HANDLER
> -   are "none" and "printdiff", which dump only the signature or compare
> -   the dumped signature with the cached one, respectively.
> +   Two common values for `SIGNATURE_HANDLER` are "none" and "printdiff"=
, which
> +   dump only the signature or compare the dumped signature with the cac=
hed one,
> +   respectively.
>
>  Using BitBake with either of these options causes BitBake to dump out
>  ``sigdata`` files in the ``stamps`` directory for every task it would
> @@ -9750,7 +9665,7 @@ The OpenEmbedded build system uses
>  :ref:`checksums <overview-checksums>` and
>  :ref:`overview-manual/overview-manual-concepts:shared state` cache to a=
void unnecessarily
>  rebuilding tasks. Collectively, this scheme is known as "shared state
> -code."
> +code".
>
>  As with all schemes, this one has some drawbacks. It is possible that
>  you could make implicit changes to your code that the checksum
> @@ -9787,8 +9702,7 @@ the build system to run the task again.
>
>     For an example of a commit that makes a cosmetic change to invalidat=
e
>     shared state, see this
> -   commit
> -   .
> +   :yocto_git:`commit </cgit.cgi/poky/commit/meta/classes/package.bbcla=
ss?id=3D737f8bbb4f27b4837047cb9b4fbfe01dfde36d54>`.
>
>  .. _dev-debugging-taskrunning:
>
> @@ -9823,14 +9737,9 @@ out), then you can use the ``-f`` option.
>
>  .. note::
>
> -   The reason
> -   -f
> -   is never required when running the
> -   do_devshell
> -   task is because the
> -   [
> -   nostamp
> -   ]
> +   The reason ``-f`` is never required when running the
> +   :ref:`ref-tasks-devshell` task is because the
> +   [\ :ref:`nostamp <bitbake:bitbake-user-manual/bitbake-user-manual-me=
tadata:variable flags>`\ ]
>     variable flag is already set for the task.
>
>  The following example shows one way you can use the ``-f`` option:
> @@ -9856,8 +9765,7 @@ that depend on it is to use the ``-C`` option.
>
>  .. note::
>
> -   This option is upper-cased and is separate from the
> -   -c
> +   This option is upper-cased and is separate from the ``-c``
>     option, which is lower-cased.
>
>  Using this option invalidates the given task and then runs the
> @@ -9879,7 +9787,8 @@ task dependency mechanisms.
>     BitBake explicitly keeps track of which tasks have been tainted in
>     this fashion, and will print warnings such as the following for
>     builds involving such tasks:
> -   ::
> +
> +   .. code-block:: none
>
>        WARNING: /home/ulf/poky/meta/recipes-sato/matchbox-desktop/matchb=
ox-desktop_2.1.bb.do_compile is tainted from a forced run
>
> @@ -9914,7 +9823,7 @@ debug output gives more information about what Bit=
Bake is doing and the
>  reason behind it. Each ``-D`` option you use increases the logging
>  level. The most common usage is ``-DDD``.
>
> -The output from ``bitbake -DDD -v`` targetname can reveal why BitBake
> +The output from ``bitbake -DDD -v targetname`` can reveal why BitBake
>  chose a certain version of a package or why BitBake picked a certain
>  provider. This command could also help you in a situation where you
>  think BitBake did something unexpected.
> @@ -9945,7 +9854,7 @@ Recipe Logging Mechanisms
>  The Yocto Project provides several logging functions for producing
>  debugging output and reporting errors and warnings. For Python
>  functions, the following logging functions exist. All of these function=
s
> -log to ``${T}/log.do_``\ task, and can also log to standard output
> +log to ``${T}/log.do_``\ `task`, and can also log to standard output
>  (stdout) with the right settings:
>
>  -  ``bb.plain(msg)``: Writes msg as is to the log while also
> @@ -9974,9 +9883,8 @@ log to ``${T}/log.do_``\ task, and can also log to=
 standard output
>
>     .. note::
>
> -      bb.fatal()
> -      raises an exception, which means you do not need to put a "return=
"
> -      statement after the function.
> +      ``bb.fatal()`` raises an exception, which means you do not need t=
o put a
> +      "return" statement after the function.
>
>  The same logging functions are also available in shell functions, under
>  the names ``bbplain``, ``bbnote``, ``bbdebug``, ``bbwarn``, ``bberror``=
,
> @@ -10059,12 +9967,8 @@ Project autobuilder and the process used to fix =
it.
>
>  .. note::
>
> -   If you cannot properly fix a
> -   make
> -   race condition, you can work around it by clearing either the
> -   PARALLEL_MAKE
> -   or
> -   PARALLEL_MAKEINST
> +   If you cannot properly fix a ``make`` race condition, you can work a=
round it
> +   by clearing either the :term:`PARALLEL_MAKE` or :term:`PARALLEL_MAKE=
INST`
>     variables.
>
>  The Failure
> @@ -10081,7 +9985,8 @@ and creates the following output.
>
>  If you examine the output or the log file, you see the failure during
>  ``make``:
> -::
> +
> +.. code-block:: none
>
>     | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'comm=
on-linux', 'common-glibc', 'i586-linux', 'common']
>     | DEBUG: Executing shell function do_compile
> @@ -10266,7 +10171,9 @@ With everything in place, you can get back to tr=
ying the build again
>  locally:
>  ::
>
> -   $ bitbake neard This build should succeed.
> +   $ bitbake neard
> +
> +This build should succeed.
>
>  Now you can open up a ``devshell`` again and repeat the clean and make
>  operations as follows:
> @@ -10295,15 +10202,13 @@ style analysis of program crashes. GDB is avai=
lable as a package within
>  the Yocto Project and is installed in SDK images by default. See the
>  ":ref:`ref-manual/ref-images:Images`" chapter in the Yocto
>  Project Reference Manual for a description of these images. You can fin=
d
> -information on GDB at http://sourceware.org/gdb/.
> +information on GDB at https://sourceware.org/gdb/.
>
>  .. note::
>
> -   For best results, install debug (
> -   -dbg
> -   ) packages for the applications you are going to debug. Doing so
> -   makes extra debug symbols available that give you more meaningful
> -   output.
> +   For best results, install debug (``-dbg``) packages for the applicat=
ions you
> +   are going to debug. Doing so makes extra debug symbols available tha=
t give
> +   you more meaningful output.
>
>  Sometimes, due to memory or disk space constraints, it is not possible
>  to use GDB directly on the remote target to debug applications. These
> @@ -10340,7 +10245,7 @@ match the host's binaries.
>  To remain consistent with GDB documentation and terminology, the binary
>  being debugged on the remote target machine is referred to as the
>  "inferior" binary. For documentation on GDB see the `GDB
> -site <http://sourceware.org/gdb/documentation/>`__.
> +site <https://sourceware.org/gdb/documentation/>`__.
>
>  The following steps show you how to debug using the GNU project
>  debugger.
> @@ -10413,13 +10318,11 @@ debugger.
>
>     .. note::
>
> -      If you run
> -      bitbake gdb-cross
> -      , the OpenEmbedded build system suggests the actual image (e.g.
> -      gdb-cross-i586
> -      ). The suggestion is usually the actual name you want to use.
> +      If you run ``bitbake gdb-cross``, the OpenEmbedded build system s=
uggests
> +      the actual image (e.g. ``gdb-cross-i586``). The suggestion is usu=
ally the
> +      actual name you want to use.
>
> -4. *Set up the* ``debugfs``
> +4. *Set up the* ``debugfs``\ *:*
>
>     Run the following commands to set up the ``debugfs``:
>     ::
> @@ -10429,19 +10332,19 @@ debugger.
>        $ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image.rootfs=
.tar.bz2
>        $ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image-dbg.ro=
otfs.tar.bz2
>
> -5. *Set up GDB*
> +5. *Set up GDB:*
>
>     Install the SDK (if you built one) and then source the correct
>     environment file. Sourcing the environment file puts the SDK in your
>     ``PATH`` environment variable.
>
>     If you are using the build system, Gdb is located in
> -   build-dir/tmp/sysroots/host/usr/bin/architecture/architecture-gdb
> +   `build-dir`\ ``/tmp/sysroots/``\ `host`\ ``/usr/bin/``\ `architectur=
e`\ ``/``\ `architecture`\ ``-gdb``
>
>  6. *Boot the target:*
>
>     For information on how to run QEMU, see the `QEMU
> -   Documentation <http://wiki.qemu.org/Documentation/GettingStartedDeve=
lopers>`__.
> +   Documentation <https://wiki.qemu.org/Documentation/GettingStartedDev=
elopers>`__.
>
>     .. note::
>
> @@ -10451,7 +10354,8 @@ debugger.
>
>     Debugging a program involves running gdbserver on the target and the=
n
>     running Gdb on the host. The example in this step debugs ``gzip``:
> -   ::
> +
> +   .. code-block:: shell
>
>        root@qemux86:~# gdbserver localhost:1234 /bin/gzip =E2=80=94help
>
> @@ -10475,12 +10379,9 @@ debugger.
>
>     .. note::
>
> -      The Gdb
> -      set
> -      commands in the previous example can be placed into the users
> -      ~/.gdbinit
> -      file. Upon starting, Gdb automatically runs whatever commands are
> -      in that file.
> +      The Gdb ``set`` commands in the previous example can be placed in=
to the
> +      users ``~/.gdbinit`` file. Upon starting, Gdb automatically runs =
whatever
> +      commands are in that file.
>
>  8. *Deploying without a full image rebuild:*
>
> @@ -10518,9 +10419,11 @@ To support this kind of debugging, you need do =
the following:
>
>  -  Ensure that GDB is on the target. You can do this by adding "gdb" to
>     :term:`IMAGE_INSTALL`:
> -   IMAGE_INSTALL_append =3D " gdb" Alternatively, you can add
> -   "tools-debug" to
> -   :term:`IMAGE_FEATURES`:
> +   ::
> +
> +      IMAGE_INSTALL_append =3D " gdb"
> +
> +   Alternatively, you can add "tools-debug" to :term:`IMAGE_FEATURES`:
>     ::
>
>        IMAGE_FEATURES_append =3D " tools-debug"
> @@ -10541,18 +10444,13 @@ To support this kind of debugging, you need do=
 the following:
>
>     To improve the debug information accuracy, you can reduce the level
>     of optimization used by the compiler. For example, when adding the
> -   following line to your
> -   local.conf
> -   file, you will reduce optimization from
> -   FULL_OPTIMIZATION
> -   of "-O2" to
> -   DEBUG_OPTIMIZATION
> +   following line to your ``local.conf`` file, you will reduce optimiza=
tion
> +   from :term:`FULL_OPTIMIZATION` of "-O2" to :term:`DEBUG_OPTIMIZATION=
`
>     of "-O -fno-omit-frame-pointer":
>     ::
>
>             DEBUG_BUILD =3D "1"
>
> -
>     Consider that this will reduce the application's performance and is
>     recommended only for debugging purposes.
>
> @@ -10584,11 +10482,9 @@ Here are some other tips that you might find us=
eful:
>
>     .. note::
>
> -      Removing
> -      TMPDIR
> -      might be a workaround rather than a fix. Consequently, trying to
> -      determine the underlying cause of an issue before removing the
> -      directory is a good idea.
> +      Removing ``TMPDIR`` might be a workaround rather than a fix.
> +      Consequently, trying to determine the underlying cause of an issu=
e before
> +      removing the directory is a good idea.
>
>  -  Understanding how a feature is used in practice within existing
>     recipes can be very helpful. It is recommended that you configure
> @@ -10633,9 +10529,7 @@ Here are some other tips that you might find use=
ful:
>
>        The manuals might not be the right place to document variables
>        that are purely internal and have a limited scope (e.g. internal
> -      variables used to implement a single
> -      .bbclass
> -      file).
> +      variables used to implement a single ``.bbclass`` file).
>
>  Making Changes to the Yocto Project
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -10649,15 +10543,15 @@ Submitting a Defect Against the Yocto Project
>  ---------------------------------------------
>
>  Use the Yocto Project implementation of
> -`Bugzilla <http://www.bugzilla.org/about/>`__ to submit a defect (bug)
> +`Bugzilla <https://www.bugzilla.org/about/>`__ to submit a defect (bug)
>  against the Yocto Project. For additional information on this
> -implementation of Bugzilla see the :ref:"`Yocto Project
> +implementation of Bugzilla see the ":ref:`Yocto Project
>  Bugzilla <resources-bugtracker>`" section in the
>  Yocto Project Reference Manual. For more detail on any of the following
>  steps, see the Yocto Project
>  :yocto_wiki:`Bugzilla wiki page </wiki/Bugzilla_Configuration_and_Bug_T=
racking>`.
>
> -Use the following general steps to submit a bug"
> +Use the following general steps to submit a bug:
>
>  1.  Open the Yocto Project implementation of :yocto_bugs:`Bugzilla <>`.
>
> @@ -10671,7 +10565,7 @@ Use the following general steps to submit a bug"
>      Runtime", "BSPs", and "bsps-meta-intel", respectively.
>
>  4.  Choose the "Version" of the Yocto Project for which you found the
> -    bug (e.g. DISTRO).
> +    bug (e.g. &DISTRO;).
>
>  5.  Determine and select the "Severity" of the bug. The severity
>      indicates how the bug impacted your work.
> @@ -10737,24 +10631,24 @@ the combo-layer tool. The upstream location us=
ed for submitting changes
>  varies by component:
>
>  -  *Core Metadata:* Send your patch to the
> -   `openembedded-core <http://lists.openembedded.org/mailman/listinfo/o=
penembedded-core>`__
> +   :oe_lists:`openembedded-core </g/openembedded-core>`
>     mailing list. For example, a change to anything under the ``meta`` o=
r
>     ``scripts`` directories should be sent to this mailing list.
>
>  -  *BitBake:* For changes to BitBake (i.e. anything under the
>     ``bitbake`` directory), send your patch to the
> -   `bitbake-devel <http://lists.openembedded.org/mailman/listinfo/bitba=
ke-devel>`__
> +   :oe_lists:`bitbake-devel </g/bitbake-devel>`
>     mailing list.
>
>  -  *"meta-\*" trees:* These trees contain Metadata. Use the
> -   `poky <https://lists.yoctoproject.org/g/poky>`__ mailing list.
> +   :yocto_lists:`poky </g/poky>` mailing list.
>
> --  *Documentation*: For changes to the Yocto Project documentation, use=
 the `docs
> -   <https://lists.yoctoproject.org/g/docs>`__ mailing list.
> +-  *Documentation*: For changes to the Yocto Project documentation, use=
 the
> +   :yocto_lists:`docs </g/docs>` mailing list.
>
>  For changes to other layers hosted in the Yocto Project source
> -repositories (i.e. ``yoctoproject.org``) and tools use the `Yocto Proje=
ct
> -<https://lists.yoctoproject.org/g/yocto/>`__ general mailing list.
> +repositories (i.e. ``yoctoproject.org``) and tools use the
> +:yocto_lists:`Yocto Project </g/yocto/>` general mailing list.
>
>  .. note::
>
> @@ -10792,7 +10686,7 @@ whether the patch has been merged into one of th=
ese branches.
>     flow. Asking about the status of a patch or change is reasonable if
>     the change has been idle for a while with no feedback. The Yocto
>     Project does have plans to use
> -   Patchwork
> +   `Patchwork <https://en.wikipedia.org/wiki/Patchwork_(software)>`__
>     to track the status of patches and also to automatically preview
>     patches.
>
> @@ -10810,8 +10704,7 @@ repository:
>
>     You can find general Git information on how to push a change upstrea=
m
>     in the
> -   Git Community Book
> -   .
> +   `Git Community Book <https://git-scm.com/book/en/v2/Distributed-Git-=
Distributed-Workflows>`__.
>
>  1. *Make Your Changes Locally:* Make your changes in your local Git
>     repository. You should make small, controlled, isolated changes.
> @@ -10830,7 +10723,8 @@ repository:
>        required by the Linux kernel. Adding this line signifies that you=
,
>        the submitter, have agreed to the Developer's Certificate of
>        Origin 1.1 as follows:
> -      ::
> +
> +      .. code-block:: none
>
>           Developer's Certificate of Origin 1.1
>
> @@ -10858,7 +10752,7 @@ repository:
>               maintained indefinitely and may be redistributed consisten=
t with
>               this project or the open source license(s) involved.
>
> -   -  Provide a single-line summary of the change. and, if more
> +   -  Provide a single-line summary of the change and, if more
>        explanation is needed, provide more detail in the body of the
>        commit. This summary is typically viewable in the "shortlist" of
>        changes. Thus, providing something short and descriptive that
> @@ -10901,10 +10795,10 @@ repository:
>
>     For example, suppose you have permissions to push
>     into the upstream ``meta-intel-contrib`` repository and you are
> -   working in a local branch named your_name\ ``/README``. The followin=
g
> +   working in a local branch named `your_name`\ ``/README``. The follow=
ing
>     command pushes your local commits to the ``meta-intel-contrib``
>     upstream repository and puts the commit in a branch named
> -   your_name\ ``/README``:
> +   `your_name`\ ``/README``:
>     ::
>
>        $ git push meta-intel-contrib your_name/README
> @@ -10963,7 +10857,7 @@ repository:
>        $ ~/poky/scripts/create-pull-request -u meta-intel-contrib -s "Up=
dated Manual Section Reference in README"
>
>     Running this script forms ``*.patch`` files in a folder named
> -   ``pull-``\ PID in the current directory. One of the patch files is a
> +   ``pull-``\ `PID` in the current directory. One of the patch files is=
 a
>     cover letter.
>
>     Before running the ``send-pull-request`` script, you must edit the
> @@ -10980,8 +10874,7 @@ repository:
>
>     .. note::
>
> -      For help on using these scripts, simply provide the
> -      -h
> +      For help on using these scripts, simply provide the ``-h``
>        argument as follows:
>        ::
>
> @@ -11023,9 +10916,9 @@ without using the scripts:
>     Developer's Certificate of Origin (DCO) shown earlier.
>
>     When you form a commit, you must follow certain standards establishe=
d
> -   by the Yocto Project development team. See `Step
> -   3 <#making-sure-you-have-correct-commit-information>`__ in the
> -   previous section for information on how to provide commit informatio=
n
> +   by the Yocto Project development team. See :ref:`Step 3
> +   <dev-manual/dev-manual-common-tasks:using scripts to push a change u=
pstream and request a pull>`
> +   in the previous section for information on how to provide commit inf=
ormation
>     that meets Yocto Project commit message standards.
>
>  4. *Format the Commit:* Format the commit into an email message. To
> @@ -11066,12 +10959,9 @@ without using the scripts:
>
>     .. note::
>
> -      In order to use
> -      git send-email
> -      , you must have the proper Git packages installed on your host.
> -      For Ubuntu, Debian, and Fedora the package is
> -      git-email
> -      .
> +      In order to use ``git send-email``, you must have the proper Git =
packages
> +      installed on your host.
> +      For Ubuntu, Debian, and Fedora the package is ``git-email``.
>
>     The ``git send-email`` command sends email by using a local or remot=
e
>     Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
> @@ -11297,10 +11187,7 @@ in the whitelist.
>
>     When using a string subset, be sure to use the part of the expanded
>     string that precedes the appended underscore character (e.g.
> -   usethispart_1.3
> -   ,
> -   usethispart_1.4
> -   , and so forth).
> +   ``usethispart_1.3``, ``usethispart_1.4``, and so forth).
>
>  For example, simply specifying the string "commercial" in the whitelist
>  matches any expanded ``LICENSE_FLAGS`` definition that starts with the
> @@ -11417,9 +11304,7 @@ audit all artifacts to ensure completeness.
>  .. note::
>
>     The Yocto Project generates a license manifest during image creation
> -   that is located in
> -   ${DEPLOY_DIR}/licenses/
> -   image_name-datestamp
> +   that is located in ``${DEPLOY_DIR}/licenses/``\ `image_name`\ ``-``\=
 `datestamp`
>     to assist with any audits.
>
>  Providing the Source Code
> @@ -11466,7 +11351,8 @@ the size of the directory can get large.
>  A way to help mitigate the size issue is to only release tarballs for
>  licenses that require the release of source. Let us assume you are only
>  concerned with GPL code as identified by running the following script:
> -::
> +
> +.. code-block:: shell
>
>     # Script to archive a subset of packages matching specific license(s=
)
>     # Source and license files are copied into sub folders of package fo=
lder
> @@ -11556,7 +11442,8 @@ required to release those layers under section 3=
 of GPLv2 or section 1
>  of GPLv3. One way of doing that is with a clean checkout of the version
>  of the Yocto Project and layers used during your build. Here is an
>  example:
> -::
> +
> +.. code-block:: shell
>
>     # We built using the dunfell branch of the poky repo
>     $ git clone -b dunfell git://git.yoctoproject.org/poky
> @@ -11625,7 +11512,7 @@ The server receives the information collected an=
d saves it in a
>  database.
>
>  A live instance of the error reporting server exists at
> -http://errors.yoctoproject.org. This server exists so that when
> +https://errors.yoctoproject.org. This server exists so that when
>  you want to get help with build failures, you can submit all of the
>  information on the failure easily and then point to the URL in your bug
>  report or send an email to the mailing list.
> @@ -11667,7 +11554,7 @@ following command sends the errors to an upstrea=
m server:
>     $ send-error-report /home/brandusa/project/poky/build/tmp/log/error-=
report/error_report_201403141617.txt
>
>  In the previous example, the errors are sent to a public database
> -available at http://errors.yoctoproject.org, which is used by the
> +available at https://errors.yoctoproject.org, which is used by the
>  entire community. If you specify a particular server, you can send the
>  errors to a different database. Use the following command for more
>  information on available options:
> @@ -11679,7 +11566,7 @@ When sending the error file, you are prompted to=
 review the data being
>  sent as well as to provide a name and optional email address. Once you
>  satisfy these prompts, the command returns a link from the server that
>  corresponds to your entry in the database. For example, here is a
> -typical link: http://errors.yoctoproject.org/Errors/Details/9522/
> +typical link: https://errors.yoctoproject.org/Errors/Details/9522/
>
>  Following the link takes you to a web interface where you can browse,
>  query the errors, and view statistics.
> @@ -11698,8 +11585,7 @@ Setting Up Your Own Error Reporting Server
>  ------------------------------------------
>
>  If you want to set up your own error reporting server, you can obtain
> -the code from the Git repository at
> -http://git.yoctoproject.org/cgit/cgit.cgi/error-report-web/.
> +the code from the Git repository at :yocto_git:`/cgit/cgit.cgi/error-re=
port-web/`.
>  Instructions on how to set it up are in the README document.
>
>  .. _dev-using-wayland-and-weston:
> @@ -11707,7 +11593,7 @@ Instructions on how to set it up are in the READ=
ME document.
>  Using Wayland and Weston
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> -`Wayland <http://en.wikipedia.org/wiki/Wayland_(display_server_protocol=
)>`__
> +`Wayland <https://en.wikipedia.org/wiki/Wayland_(display_server_protoco=
l)>`__
>  is a computer display server protocol that provides a method for
>  compositing window managers to communicate directly with applications
>  and video hardware and expects them to communicate with input hardware
> @@ -11717,7 +11603,7 @@ might otherwise achieve.
>
>  The Yocto Project provides the Wayland protocol libraries and the
>  reference
> -`Weston <http://en.wikipedia.org/wiki/Wayland_(display_server_protocol)=
#Weston>`__
> +`Weston <https://en.wikipedia.org/wiki/Wayland_(display_server_protocol=
)#Weston>`__
>  compositor as part of its release. You can find the integrated packages
>  in the ``meta`` layer of the :term:`Source Directory`.
>  Specifically, you
> diff --git a/documentation/dev-manual/dev-manual-intro.rst b/documentati=
on/dev-manual/dev-manual-intro.rst
> index da08b7b6e..05136f735 100644
> --- a/documentation/dev-manual/dev-manual-intro.rst
> +++ b/documentation/dev-manual/dev-manual-intro.rst
> @@ -39,7 +39,7 @@ This manual does not provide the following:
>
>  -  Reference or Conceptual Material: This type of material resides in a=
n
>     appropriate reference manual. For example, system variables are
> -   documented in the :doc`../ref-manual/ref-manual`.
> +   documented in the :doc:`../ref-manual/ref-manual`.
>
>  -  Detailed Public Information Not Specific to the Yocto Project: For
>     example, exhaustive information on how to use the Source Control
> diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentatio=
n/dev-manual/dev-manual-qemu.rst
> index 9337a3542..c91e8b538 100644
> --- a/documentation/dev-manual/dev-manual-qemu.rst
> +++ b/documentation/dev-manual/dev-manual-qemu.rst
> @@ -33,10 +33,10 @@ implementation of QEMU.
>  For official information and documentation on QEMU in general, see the
>  following references:
>
> --  `QEMU Website <http://wiki.qemu.org/Main_Page>`__\ *:* The official
> +-  `QEMU Website <https://wiki.qemu.org/Main_Page>`__\ *:* The official
>     website for the QEMU Open Source project.
>
> --  `Documentation <http://wiki.qemu.org/Manual>`__\ *:* The QEMU user
> +-  `Documentation <https://wiki.qemu.org/Manual>`__\ *:* The QEMU user
>     manual.
>
>  .. _qemu-running-qemu:
> @@ -141,14 +141,14 @@ available. Follow these general steps to run QEMU:
>
>     -  This example does not provide enough information for QEMU to
>        launch. While the command does provide a root filesystem type, it
> -      must also minimally provide a MACHINE, KERNEL, or VM option.
> +      must also minimally provide a `MACHINE`, `KERNEL`, or `VM` option=
.
>        ::
>
>           $ runqemu ext4
>
>     -  This example specifies to boot a virtual machine image
>        (``.wic.vmdk`` file). From the ``.wic.vmdk``, ``runqemu``
> -      determines the QEMU architecture (MACHINE) to be "qemux86-64" and
> +      determines the QEMU architecture (`MACHINE`) to be "qemux86-64" a=
nd
>        the root filesystem type to be "vmdk".
>        ::
>
> @@ -208,7 +208,8 @@ using an NFS server.
>     extracts it into a location that you specify. Here is an example tha=
t
>     takes a file system and extracts it to a directory named
>     ``test-nfs``:
> -   ::
> +
> +   .. code-block:: none
>
>        runqemu-extract-sdk ./tmp/deploy/images/qemux86-64/core-image-sat=
o-qemux86-64.tar.bz2 test-nfs
>
> @@ -217,7 +218,8 @@ using an NFS server.
>     You can then also make changes to the files within ``./test-nfs`` an=
d
>     see those changes appear in the image in real time. Here is an
>     example using the ``qemux86`` image:
> -   ::
> +
> +   .. code-block:: none
>
>        runqemu qemux86-64 ./test-nfs
>
> @@ -226,14 +228,20 @@ using an NFS server.
>     Should you need to start, stop, or restart the NFS share, you can us=
e
>     the following commands:
>
> -   -  The following command starts the NFS share: runqemu-export-rootfs
> -      start file-system-location
> +   -  The following command starts the NFS share:
> +      ::
> +
> +         runqemu-export-rootfs start file-system-location
> +
> +   -  The following command stops the NFS share:
> +      ::
>
> -   -  The following command stops the NFS share: runqemu-export-rootfs
> -      stop file-system-location
> +         runqemu-export-rootfs stop file-system-location
>
>     -  The following command restarts the NFS share:
> -      runqemu-export-rootfs restart file-system-location
> +      ::
> +
> +         runqemu-export-rootfs restart file-system-location
>
>  .. _qemu-kvm-cpu-compatibility:
>
> @@ -380,30 +388,29 @@ command line:
>  .. note::
>
>     If you do provide some "illegal" option combination or perhaps you d=
o
> -   not provide enough in the way of options,
> -   runqemu
> +   not provide enough in the way of options, ``runqemu``
>     provides appropriate error messaging to help you correct the problem=
.
>
> --  QEMUARCH: The QEMU machine architecture, which must be "qemuarm",
> +-  `QEMUARCH`: The QEMU machine architecture, which must be "qemuarm",
>     "qemuarm64", "qemumips", "qemumips64", "qemuppc", "qemux86", or
>     "qemux86-64".
>
> --  ``VM``: The virtual machine image, which must be a ``.wic.vmdk``
> +-  `VM`: The virtual machine image, which must be a ``.wic.vmdk``
>     file. Use this option when you want to boot a ``.wic.vmdk`` image.
>     The image filename you provide must contain one of the following
>     strings: "qemux86-64", "qemux86", "qemuarm", "qemumips64",
>     "qemumips", "qemuppc", or "qemush4".
>
> --  ROOTFS: A root filesystem that has one of the following filetype
> +-  `ROOTFS`: A root filesystem that has one of the following filetype
>     extensions: "ext2", "ext3", "ext4", "jffs2", "nfs", or "btrfs". If
>     the filename you provide for this option uses "nfs", it must provide
>     an explicit root filesystem path.
>
> --  KERNEL: A kernel image, which is a ``.bin`` file. When you provide a
> +-  `KERNEL`: A kernel image, which is a ``.bin`` file. When you provide=
 a
>     ``.bin`` file, ``runqemu`` detects it and assumes the file is a
>     kernel image.
>
> --  MACHINE: The architecture of the QEMU machine, which must be one of
> +-  `MACHINE`: The architecture of the QEMU machine, which must be one o=
f
>     the following: "qemux86", "qemux86-64", "qemuarm", "qemuarm64",
>     "qemumips", "qemumips64", or "qemuppc". The MACHINE and QEMUARCH
>     options are basically identical. If you do not provide a MACHINE
> diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentati=
on/dev-manual/dev-manual-start.rst
> index 333c6a566..a85b86fbf 100644
> --- a/documentation/dev-manual/dev-manual-start.rst
> +++ b/documentation/dev-manual/dev-manual-start.rst
> @@ -88,12 +88,10 @@ particular working environment and set of practices.
>      .. note::
>
>         For information about BitBake, see the
> -       BitBake User Manual
> -       .
> +       :doc:`bitbake:index`.
>
>      It is relatively easy to set up Git services and create
> -    infrastructure like
> -    :yocto_git:`http://git.yoctoproject.org <>`, which is based on
> +    infrastructure like :yocto_git:`/`, which is based on
>      server software called ``gitolite`` with ``cgit`` being used to
>      generate the web interface that lets you view the repositories. The
>      ``gitolite`` software identifies users using SSH keys and allows
> @@ -106,10 +104,7 @@ particular working environment and set of practices=
.
>         However, sites such as the following exist that describe how to
>         perform setup:
>
> -       -  `Git documentation <http://git-scm.com/book/ch4-8.html>`__:
> -          Describes how to install ``gitolite`` on the server.
> -
> -       -  `Gitolite <http://gitolite.com>`__: Information for
> +       -  `Gitolite <https://gitolite.com>`__: Information for
>            ``gitolite``.
>
>         -  `Interfaces, frontends, and
> @@ -161,8 +156,7 @@ particular working environment and set of practices.
>      integration" style testing of software components and regression
>      identification and tracking.
>
> -    See "`Yocto Project
> -    Autobuilder <http://autobuilder.yoctoproject.org>`__" for more
> +    See ":yocto_ab:`Yocto Project Autobuilder <>`" for more
>      information and links to buildbot. The Yocto Project team has found
>      this implementation works well in this role. A public example of
>      this is the Yocto Project Autobuilders, which the Yocto Project tea=
m
> @@ -207,8 +201,7 @@ particular working environment and set of practices.
>
>      .. note::
>
> -       You can also use a more collective push model. The
> -       gitolite
> +       You can also use a more collective push model. The ``gitolite``
>         software supports both the push and pull models quite easily.
>
>      As with any development environment, it is important to document th=
e
> @@ -285,11 +278,10 @@ v2 (WSL).
>  .. note::
>
>     The Yocto Project is not compatible with
> -   Windows Subsystem for Linux v1
> -   . It is compatible but not officially supported nor validated with
> +   `Windows Subsystem for Linux v1 <https://en.wikipedia.org/wiki/Windo=
ws_Subsystem_for_Linux>`__.
> +   It is compatible but not officially supported nor validated with
>     WSLv2. If you still decide to use WSL please upgrade to
> -   WSLv2
> -   .
> +   `WSLv2 <https://docs.microsoft.com/en-us/windows/wsl/install-win10>`=
__.
>
>  Once your build host is set up to use the Yocto Project, further steps
>  are necessary depending on what you want to accomplish. See the
> @@ -453,9 +445,9 @@ as your Yocto Project build host:
>
>  Once you have a container set up, everything is in place to develop jus=
t
>  as if you were running on a native Linux machine. If you are going to
> -use the Poky container, see the "`Cloning the ``poky``
> -Repository <#cloning-the-poky-repository>`__" section. If you are going
> -to use the Extensible SDK container, see the
> +use the Poky container, see the
> +":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`=
"
> +section. If you are going to use the Extensible SDK container, see the
>  ":doc:`../sdk-manual/sdk-extensible`" Chapter in the Yocto
>  Project Application Development and the Extensible Software Development
>  Kit (eSDK) manual. If you are going to use the Toaster container, see
> @@ -566,10 +558,7 @@ your Yocto Project build host:
>
>     The current implementation of WSLv2 does not have out-of-the-box
>     access to external devices such as those connected through a USB
> -   port, but it automatically mounts your
> -   C:
> -   drive on
> -   /mnt/c/
> +   port, but it automatically mounts your ``C:`` drive on ``/mnt/c/``
>     (and others), which you can use to share deploy artifacts to be late=
r
>     flashed on hardware through Windows, but your build directory should
>     not reside inside this mountpoint.
> @@ -623,11 +612,8 @@ Use the following procedure to locate the latest up=
stream copy of the
>
>     .. note::
>
> -      For information on cloning a repository, see the "
> -      Cloning the
> -      poky
> -      Repository
> -      " section.
> +      For information on cloning a repository, see the
> +      ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repos=
itory`" section.
>
>  Accessing Index of Releases
>  ---------------------------
> @@ -653,12 +639,10 @@ Follow these steps to locate and download a partic=
ular tarball:
>
>     .. note::
>
> -      The
> -      yocto
> -      directory contains the full array of released Poky tarballs. The
> -      poky
> -      directory in the Index of Releases was historically used for very
> -      early releases and exists now only for retroactive completeness.
> +      The ``yocto`` directory contains the full array of released Poky
> +      tarballs. The ``poky`` directory in the Index of Releases was
> +      historically used for very early releases and exists now only for
> +      retroactive completeness.
>
>  2. *Select a Component:* Click on any released component in which you
>     are interested (e.g. ``yocto``).
> @@ -702,8 +686,7 @@ Releases <#accessing-index-of-releases>`__" section.
>     .. note::
>
>        For a "map" of Yocto Project releases to version numbers, see the
> -      Releases
> -      wiki page.
> +      :yocto_wiki:`Releases </wiki/Releases>` wiki page.
>
>     You can use the "RELEASE ARCHIVE" link to reveal a menu of all Yocto
>     Project releases.
> @@ -825,8 +808,9 @@ and then specifically check out that development bra=
nch.
>
>  1. *Switch to the Poky Directory:* If you have a local poky Git
>     repository, switch to that directory. If you do not have the local
> -   copy of poky, see the "`Cloning the ``poky``
> -   Repository <#cloning-the-poky-repository>`__" section.
> +   copy of poky, see the
> +   ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` reposito=
ry`"
> +   section.
>
>  2. *Determine Existing Branch Names:*
>     ::
> @@ -854,13 +838,13 @@ and then specifically check out that development b=
ranch.
>     &DISTRO; Release (&DISTRO_NAME;), use the following command:
>     ::
>
> -      $ git checkout -b &DISTRO_NAME; origin/&DISTRO_NAME;
> -      Branch &DISTRO_NAME; set up to track remote branch &DISTRO_NAME; =
from origin.
> -      Switched to a new branch '&DISTRO_NAME;'
> +      $ git checkout -b &DISTRO_NAME_NO_CAP; origin/&DISTRO_NAME_NO_CAP=
;
> +      Branch &DISTRO_NAME_NO_CAP; set up to track remote branch &DISTRO=
_NAME_NO_CAP; from origin.
> +      Switched to a new branch '&DISTRO_NAME_NO_CAP;'
>
> -   The previous command checks out the "&DISTRO_NAME;" development
> +   The previous command checks out the "&DISTRO_NAME_NO_CAP;" developme=
nt
>     branch and reports that the branch is tracking the upstream
> -   "origin/&DISTRO_NAME;" branch.
> +   "origin/&DISTRO_NAME_NO_CAP;" branch.
>
>     The following command displays the branches that are now part of you=
r
>     local poky repository. The asterisk character indicates the branch
> @@ -868,8 +852,8 @@ and then specifically check out that development bra=
nch.
>     ::
>
>        $ git branch
> -        master *
> -        &DISTRO_NAME;
> +        master
> +        * &DISTRO_NAME_NO_CAP;
>
>  .. _checkout-out-by-tag-in-poky:
>
> @@ -889,8 +873,9 @@ similar to checking out by branch name except you us=
e tag names.
>
>  1. *Switch to the Poky Directory:* If you have a local poky Git
>     repository, switch to that directory. If you do not have the local
> -   copy of poky, see the "`Cloning the ``poky``
> -   Repository <#cloning-the-poky-repository>`__" section.
> +   copy of poky, see the
> +   ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` reposito=
ry`"
> +   section.
>
>  2. *Fetch the Tag Names:* To checkout the branch based on a tag name,
>     you need to fetch the upstream tags into your local repository:
> --
> 2.26.2
>
>
>=20
>
