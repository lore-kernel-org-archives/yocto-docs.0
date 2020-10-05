Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.29953.1601884469582802709
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 00:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qIcQEVqd;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id x8so6001943ybe.12
        for <docs@lists.yoctoproject.org>; Mon, 05 Oct 2020 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=th8sHJLERCRRtbIJZUuw9inYRl0apOWgZr/Y8tW0qEU=;
        b=qIcQEVqdZxOiVNIDBIwfXsEyJSeeur9UwWp5I4/C74oiAxW0lF6aHQ+0xCwofNNAz9
         0tvarPC0pbGnMq9msalyIomOtWDBs+TBPCRN8bn3ZpEAqIoX8nUIIbTcXcLMQCTbOnly
         gv9iA2qpO6VjipfjOgZTgf4C1XjlYfY+D92l94rxfFJA3AyJOjjuBy2seUgv5Hvj6LOx
         rmBdEv0AnvrvYHz+luWbgoAwQduU4nHOA/UfakXSY+cNgaynWrhfZMOQPQa4YG149X8I
         zXkEbw/L5QjguBcgiY5scfC/3WuhOK4125Ff6bokVksOHsdetIdMghuoudIYXOFn6epy
         eNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=th8sHJLERCRRtbIJZUuw9inYRl0apOWgZr/Y8tW0qEU=;
        b=uQmWYr4xDxAoiU7U3EXgEn4/ztIVex06i/QR8q7/+u0iyt2liO615FadX6rW0zXEq6
         Swh9Tg6P8K1l75nd2oMoTMGowwJbsA11LP40JywO5KsHdv7S5SKImR/AdJwqRkSrB+M/
         k4L+XI0FzMqUJogHNaXDwzJxUjR/sdpQ8JSve/tVVEW1+S2SCxZAOR1oAxpc7MY7RCpq
         FgLIQHXpzNdcZTPgSl3NftDpR/koyfsrLCGGMqWuUUT7ATogqov8f1xui9ZTFsW8Wv3O
         vODXw9aw/lxMAi/yw4U3deF7S7HhMqTNuIIkLKLWxxQuIpvTDDRJ4dC5eW7Nn8zs+mD7
         5j1Q==
X-Gm-Message-State: AOAM533SwKc1EhWrCKFUH+o4RUKrJqVhj8bfkkLW6EYtMsPG/Dc+LIwG
	4fo1px9QlSiIOAhHZzldcXyoTI02JlSH58+3s4/Q1nBGeFGabw==
X-Google-Smtp-Source: ABdhPJzuX7TkINY1pYm/A2v/wT4595iP9r7FIQxrxbFLC/6Ygr6J5BG4P62cWzkHkbX3MHvHcQri4PdRx0T/uM8daIw=
X-Received: by 2002:a05:6902:50e:: with SMTP id x14mr17226396ybs.273.1601884464952;
 Mon, 05 Oct 2020 00:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201004085728.8015-1-foss@0leil.net> <20201004085728.8015-3-foss@0leil.net>
In-Reply-To: <20201004085728.8015-3-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 5 Oct 2020 09:54:13 +0200
Message-ID: <CAP71WjwcYvRUE5WzWK6MADr7XxnLS9v4=h9TCCK58WcZf0MRiw@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/8] docs: ref-manual: indentation, links and highlights fixes
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 4, 2020 at 10:58 AM Quentin Schulz <foss@0leil.net> wrote:
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/ref-manual/faq.rst              |  24 +-
>  documentation/ref-manual/migration-1.3.rst    |  10 +-
>  documentation/ref-manual/migration-1.4.rst    |   6 +-
>  documentation/ref-manual/migration-1.5.rst    |  16 +-
>  documentation/ref-manual/migration-1.6.rst    |  21 +-
>  documentation/ref-manual/migration-1.7.rst    |  12 +-
>  documentation/ref-manual/migration-2.0.rst    |   4 +-
>  documentation/ref-manual/migration-2.1.rst    |  22 +-
>  documentation/ref-manual/migration-2.2.rst    |  15 +-
>  documentation/ref-manual/migration-2.3.rst    |  31 +-
>  documentation/ref-manual/migration-2.5.rst    |   4 +-
>  documentation/ref-manual/migration-2.6.rst    |  49 +-
>  documentation/ref-manual/migration-3.0.rst    |   3 +-
>  documentation/ref-manual/ref-classes.rst      | 143 ++--
>  .../ref-manual/ref-devtool-reference.rst      |  26 +-
>  documentation/ref-manual/ref-features.rst     |   7 +-
>  documentation/ref-manual/ref-images.rst       |   3 +-
>  documentation/ref-manual/ref-kickstart.rst    |  13 +-
>  documentation/ref-manual/ref-qa-checks.rst    |   5 +-
>  .../ref-manual/ref-release-process.rst        |  14 +-
>  documentation/ref-manual/ref-structure.rst    |  55 +-
>  .../ref-manual/ref-system-requirements.rst    |  29 +-
>  documentation/ref-manual/ref-tasks.rst        |  63 +-
>  documentation/ref-manual/ref-terms.rst        |  21 +-
>  documentation/ref-manual/ref-variables.rst    | 724 +++++++-----------
>  documentation/ref-manual/resources.rst        |  26 +-
>  26 files changed, 509 insertions(+), 837 deletions(-)
>
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index 2d2aaad0a..fb562ad49 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -4,7 +4,7 @@
>  FAQ
>  ***
>
> -**Q:** How does Poky differ from `OpenEmbedded <http://www.openembedded.org/>`__?
> +**Q:** How does Poky differ from :oe_home:`OpenEmbedded <>`?
>
>  **A:** The term ``Poky`` refers to the specific reference build
>  system that the Yocto Project provides. Poky is based on
> @@ -21,9 +21,9 @@ Can I still use the Yocto Project?
>
>  **A:** You can get the required tools on your host development system a
>  couple different ways (i.e. building a tarball or downloading a
> -tarball). See the "`Required Git, tar, Python and gcc
> -Versions <#required-git-tar-python-and-gcc-versions>`__" section for
> -steps on how to update your build tools.
> +tarball). See the
> +":ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`"
> +section for steps on how to update your build tools.
>
>  **Q:** How can you claim Poky / OpenEmbedded-Core is stable?
>
> @@ -370,7 +370,7 @@ redirect requests through proxy servers.
>  **A:** Yes - you can easily do this. When you use BitBake to build an
>  image, all the build output goes into the directory created when you run
>  the build environment setup script (i.e.
> -````` <#structure-core-script>`__). By default, this :term:`Build Directory`
> +:ref:`structure-core-script`). By default, this :term:`Build Directory`
>  is named ``build`` but can be named
>  anything you want.
>
> @@ -414,7 +414,14 @@ that program is never installed directly to the build machine's root
>  file system. Consequently, the build system uses paths within the Build
>  Directory for ``DESTDIR``, ``bindir`` and related variables. To better
>  understand this, consider the following two paths where the first is
> -relatively normal and the second is not: ::
> +relatively normal and the second is not:
> +
> +.. note::
> +
> +   Due to these lengthy examples, the paths are artificially broken
> +   across lines for readability.
> +
> +::
>
>     /home/maxtothemax/poky-bootchart2/build/tmp/work/i586-poky-linux/zlib/
>        1.2.8-r0/sysroot-destdir/usr/bin
> @@ -423,11 +430,6 @@ relatively normal and the second is not: ::
>        zlib-native/1.2.8-r0/sysroot-destdir/home/maxtothemax/poky-bootchart2/
>        build/tmp/sysroots/x86_64-linux/usr/bin
>
> -.. note::
> -
> -   Due to these lengthy examples, the paths are artificially broken
> -   across lines for readability.
> -
>  Even if the paths look unusual,
>  they both are correct - the first for a target and the second for a
>  native recipe. These paths are a consequence of the ``DESTDIR``
> diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/ref-manual/migration-1.3.rst
> index ebbc23887..3eda7d349 100644
> --- a/documentation/ref-manual/migration-1.3.rst
> +++ b/documentation/ref-manual/migration-1.3.rst
> @@ -121,11 +121,11 @@ further details.
>  IMAGE_FEATURES
>  ~~~~~~~~~~~~~~
>
> -Image recipes that previously included "apps-console-core" in
> -:term:`IMAGE_FEATURES` should now include "splash"
> +Image recipes that previously included ``apps-console-core`` in
> +:term:`IMAGE_FEATURES` should now include ``splash``
>  instead to enable the boot-up splash screen. Retaining
> -"apps-console-core" will still include the splash screen but generates a
> -warning. The "apps-x11-core" and "apps-x11-games" ``IMAGE_FEATURES``
> +``apps-console-core`` will still include the splash screen but generates a
> +warning. The ``apps-x11-core`` and ``apps-x11-games`` ``IMAGE_FEATURES``
>  features have been removed.
>
>  .. _migration-1.3-removed-recipes:
> @@ -173,7 +173,7 @@ the OpenEmbedded community layers such as ``meta-oe`` and
>  ``meta-gnome``. For the remainder, you can now find them in the
>  ``meta-extras`` repository, which is in the
>  :yocto_git:`Source Repositories <>` at
> -http://git.yoctoproject.org/cgit/cgit.cgi/meta-extras/.
> +:yocto_git:`/cgit/cgit.cgi/meta-extras/`.
>
>  .. _1.3-linux-kernel-naming:
>
> diff --git a/documentation/ref-manual/migration-1.4.rst b/documentation/ref-manual/migration-1.4.rst
> index a658bdff6..231fc95da 100644
> --- a/documentation/ref-manual/migration-1.4.rst
> +++ b/documentation/ref-manual/migration-1.4.rst
> @@ -61,7 +61,7 @@ Differences include the following:
>     the :term:`MACHINEOVERRIDES` or
>     :term:`DISTROOVERRIDES` variables, as
>     appropriate. For more related changes, see the
> -   "`Variables <#migration-1.4-variables>`__" section.
> +   ":ref:`ref-manual/migration-1.4:variables`" section.
>
>  .. _migration-1.4-proxies-and-fetching-source:
>
> @@ -124,8 +124,8 @@ The following variables have changed:
>     :term:`SRC_URI`. If you have a recipe that relied upon
>     these directories, which would be unusual, then you will need to add
>     the appropriate paths within the recipe or, alternatively, rearrange
> -   the files. The most common locations are still covered by ``${BP}``,
> -   ``${BPN}``, and "files", which all remain in the default value of
> +   the files. The most common locations are still covered by ``${``\ :term:`BP`\ ``}``,
> +   ``${``\ :term:`BPN`\ ``}``, and "files", which all remain in the default value of
>     :term:`FILESPATH`.
>
>  .. _migration-target-package-management-with-rpm:
> diff --git a/documentation/ref-manual/migration-1.5.rst b/documentation/ref-manual/migration-1.5.rst
> index fa6ff92f1..fc7aface9 100644
> --- a/documentation/ref-manual/migration-1.5.rst
> +++ b/documentation/ref-manual/migration-1.5.rst
> @@ -25,8 +25,8 @@ If the Linux distribution you are using on your build host does not
>  provide packages for these, you can install and use the Buildtools
>  tarball, which provides an SDK-like environment containing them.
>
> -For more information on this requirement, see the "`Required Git, tar,
> -Python and gcc Versions <#required-git-tar-python-and-gcc-versions>`__"
> +For more information on this requirement, see the
> +":ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`"
>  section.
>
>  .. _migration-1.5-atom-pc-bsp:
> @@ -41,9 +41,8 @@ all x86 hardware, but it will run on a wider range of systems than the
>
>  .. note::
>
> -   Additionally, a
> -   genericx86-64
> -   BSP has been added for 64-bit Atom systems.
> +   Additionally, a ``genericx86-64`` BSP has been added for 64-bit Atom
> +   systems.
>
>  .. _migration-1.5-bitbake:
>
> @@ -96,7 +95,7 @@ The following changes have been made to the package QA checks:
>     this file within :ref:`ref-tasks-install` if "make
>     install" is installing it.
>
> --  If you are using the buildhistory class, the check for the package
> +-  If you are using the ``buildhistory`` class, the check for the package
>     version going backwards is now controlled using a standard QA check.
>     Thus, if you have customized your ``ERROR_QA`` or ``WARN_QA`` values
>     and still wish to have this check performed, you should add
> @@ -299,7 +298,7 @@ Removed and Renamed Recipes
>  -  ``libtool-nativesdk`` has been renamed to ``nativesdk-libtool``.
>
>  -  ``tinylogin`` has been removed. It has been replaced by a suid
> -   portion of Busybox. See the "`BusyBox <#migration-1.5-busybox>`__"
> +   portion of Busybox. See the "`BusyBox <#busybox>`__"
>     section for more information.
>
>  -  ``external-python-tarball`` has been renamed to
> @@ -345,8 +344,7 @@ Following is a list of short entries describing other changes:
>  -  ``libpam``: Deny all services for the ``OTHER`` entries.
>
>  -  ``image.bbclass``: Move ``runtime_mapping_rename`` to avoid conflict
> -   with ``multilib``. See
> -   `YOCTO #4993 <https://bugzilla.yoctoproject.org/show_bug.cgi?id=4993>`_
> +   with ``multilib``. See :yocto_bugs:`YOCTO #4993 </show_bug.cgi?id=4993>`
>     in Bugzilla for more information.
>
>  -  ``linux-dtb``: Use kernel build system to generate the ``dtb`` files.
> diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/ref-manual/migration-1.6.rst
> index b55be46e5..a6c4c8a93 100644
> --- a/documentation/ref-manual/migration-1.6.rst
> +++ b/documentation/ref-manual/migration-1.6.rst
> @@ -53,9 +53,12 @@ Matching Branch Requirement for Git Fetching
>  When fetching source from a Git repository using
>  :term:`SRC_URI`, BitBake will now validate the
>  :term:`SRCREV` value against the branch. You can specify
> -the branch using the following form: SRC_URI =
> -"git://server.name/repository;branch=branchname" If you do not specify a
> -branch, BitBake looks in the default "master" branch.
> +the branch using the following form:
> +::
> +
> +      SRC_URI = "git://server.name/repository;branch=branchname"
> +
> +If you do not specify a branch, BitBake looks in the default "master" branch.
>
>  Alternatively, if you need to bypass this check (e.g. if you are
>  fetching a revision corresponding to a tag that is not on any branch),
> @@ -123,8 +126,7 @@ Changes to Variables
>  --------------------
>
>  The following variables have changed. For information on the
> -OpenEmbedded build system variables, see the "`Variables
> -Glossary <#ref-variables-glos>`__" Chapter.
> +OpenEmbedded build system variables, see the ":doc:`ref-variables`" Chapter.
>
>  .. _migration-1.6-variable-changes-TMPDIR:
>
> @@ -254,11 +256,8 @@ default. The following additional lines are needed in your
>
>  .. note::
>
> -   The default
> -   local.conf
> -   contains these statements. Consequently, if you are building a
> -   headless system and using a default
> -   local.conf
> +   The default ``local.conf`` contains these statements. Consequently, if you
> +   are building a headless system and using a default ``local.conf``
>     file, you will need comment these two lines out.
>
>  .. _migration-1.6-core-image-basic:
> @@ -412,6 +411,6 @@ The previous reference BSPs for the ``beagleboard`` and
>  ``routerstationpro`` machines are still available in a new
>  ``meta-yocto-bsp-old`` layer in the
>  :yocto_git:`Source Repositories <>` at
> -http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto-bsp-old/.
> +:yocto_git:`/cgit/cgit.cgi/meta-yocto-bsp-old/`.
>
>
> diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
> index 82fd37d3a..5a5151ec1 100644
> --- a/documentation/ref-manual/migration-1.7.rst
> +++ b/documentation/ref-manual/migration-1.7.rst
> @@ -31,9 +31,9 @@ version required on the
>  build host is now 1.7.8 because the ``--list`` option is now required by
>  BitBake's Git fetcher. As always, if your host distribution does not
>  provide a version of Git that meets this requirement, you can use the
> -``buildtools-tarball`` that does. See the "`Required Git, tar, Python
> -and gcc Versions <#required-git-tar-python-and-gcc-versions>`__" section
> -for more information.
> +``buildtools-tarball`` that does. See the
> +":ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`"
> +section for more information.
>
>  .. _migration-1.7-autotools-class-changes:
>
> @@ -157,7 +157,7 @@ The following changes have occurred to the QA check process:
>     added in order to verify that file dependencies are satisfied (e.g.
>     package contains a script requiring ``/bin/bash``) and build-time
>     dependencies are declared, respectively. For more information, please
> -   see the "`QA Error and Warning Messages <#ref-qa-checks>`__" chapter.
> +   see the ":doc:`ref-qa-checks`" chapter.
>
>  -  Package QA checks are now performed during a new
>     :ref:`ref-tasks-package_qa` task rather than being
> @@ -202,9 +202,7 @@ The following recipes have been removed:
>     for version 3.17 has been added.
>
>  -  ``eglibc`` has been removed in favor of ``glibc``. See the
> -   "```eglibc 2.19`` Replaced with
> -   ``glibc 2.20`` <#migration-1.7-glibc-replaces-eglibc>`__" section for
> -   more information.
> +   ":ref:`migration-1.7-glibc-replaces-eglibc`" section for more information.
>
>  .. _migration-1.7-miscellaneous-changes:
>
> diff --git a/documentation/ref-manual/migration-2.0.rst b/documentation/ref-manual/migration-2.0.rst
> index 570486ba0..4eea94887 100644
> --- a/documentation/ref-manual/migration-2.0.rst
> +++ b/documentation/ref-manual/migration-2.0.rst
> @@ -96,8 +96,8 @@ changes in behavior exist:
>
>        $ bitbake -e
>
> --  ``d.delVar('``\ VARNAME\ ``')`` and
> -   ``d.setVar('``\ VARNAME\ ``', None)`` result in the variable and all
> +-  ``d.delVar('VARNAME')`` and
> +   ``d.setVar('VARNAME', None)`` result in the variable and all
>     of its overrides being cleared out. Before the change, only the
>     non-overridden values were cleared.
>
> diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
> index a1fd3ea81..0220221e0 100644
> --- a/documentation/ref-manual/migration-2.1.rst
> +++ b/documentation/ref-manual/migration-2.1.rst
> @@ -9,7 +9,7 @@ Project 2.1 Release from the prior release.
>  Variable Expansion in Python Functions
>  --------------------------------------
>
> -Variable expressions, such as ``${``\ VARNAME\ ``}`` no longer expand
> +Variable expressions, such as ``${VARNAME}`` no longer expand
>  automatically within Python functions. Suppressing expansion was done to
>  allow Python functions to construct shell scripts or other code for
>  situations in which you do not want such expressions expanded. For any
> @@ -125,7 +125,7 @@ Image Generation is Now Split Out from Filesystem Generation
>  Previously, for image recipes the :ref:`ref-tasks-rootfs`
>  task assembled the filesystem and then from that filesystem generated
>  images. With this Yocto Project release, image generation is split into
> -separate ```do_image_*`` <#ref-tasks-image>`__ tasks for clarity both in
> +separate :ref:`ref-tasks-image` tasks for clarity both in
>  operation and in the code.
>
>  For most cases, this change does not present any problems. However, if
> @@ -133,7 +133,7 @@ you have made customizations that directly modify the ``do_rootfs`` task
>  or that mention ``do_rootfs``, you might need to update those changes.
>  In particular, if you had added any tasks after ``do_rootfs``, you
>  should make edits so that those tasks are after the
> -```do_image_complete`` <#ref-tasks-image-complete>`__ task rather than
> +:ref:`ref-tasks-image-complete` task rather than
>  after ``do_rootfs`` so that the your added tasks run at the correct
>  time.
>
> @@ -180,7 +180,7 @@ The following recipes have been removed in the 2.1 release:
>  -  ``python-pygtk``: Recipe became obsolete.
>
>  -  ``adt-installer``: Recipe became obsolete. See the "`ADT
> -   Removed <#migration-2.1-adt-removed>`__" section for more
> +   Removed <#adt-removed>`__" section for more
>     information.
>
>  .. _migration-2.1-class-changes:
> @@ -287,7 +287,9 @@ The following changes have been made for the Poky distribution:
>     option specified on the configure command line either because it is
>     not a supported option for the configure script or because static
>     libraries are needed should set the following variable:
> -   DISABLE_STATIC = ""
> +   ::
> +
> +      DISABLE_STATIC = ""
>
>  -  The separate ``poky-tiny`` distribution now uses the musl C library
>     instead of a heavily pared down ``glibc``. Using musl results in a
> @@ -357,10 +359,9 @@ These additional changes exist:
>
>  -  The minimum Git version has been increased to 1.8.3.1. If your host
>     distribution does not provide a sufficiently recent version, you can
> -   install the buildtools, which will provide it. See the "`Required
> -   Git, tar, Python and gcc
> -   Versions <#required-git-tar-python-and-gcc-versions>`__" section for
> -   more information on the buildtools tarball.
> +   install the buildtools, which will provide it. See the
> +   :ref:`ref-manual/ref-system-requirements:required git, tar, python and gcc versions`
> +   section for more information on the buildtools tarball.
>
>  -  The buggy and incomplete support for the RPM version 4 package
>     manager has been removed. The well-tested and maintained support for
> @@ -376,8 +377,9 @@ These additional changes exist:
>        base-passwd
>        shadow
>        update-alternatives
> +      run-postinsts
>
> -   run-postinsts With the Yocto Project 2.1 release, these packages are
> +   With the Yocto Project 2.1 release, these packages are
>     only removed if "read-only-rootfs" is in ``IMAGE_FEATURES``, since
>     they might still be needed for a read-write image even in the absence
>     of a package manager (e.g. if users need to be added, modified, or
> diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
> index 59d0eeeb9..8afa8ffdd 100644
> --- a/documentation/ref-manual/migration-2.2.rst
> +++ b/documentation/ref-manual/migration-2.2.rst
> @@ -16,8 +16,7 @@ the minimum kernel version is 3.19.
>
>  .. note::
>
> -   For x86 and x86_64, you can reset
> -   OLDEST_KERNEL
> +   For x86 and x86_64, you can reset :term:`OLDEST_KERNEL`
>     to anything down to 2.6.32 if desired.
>
>  .. _migration-2.2-staging-directories-in-sysroot-simplified:
> @@ -79,7 +78,9 @@ particular areas of interest:
>
>    - the syntax for octal values changed
>
> -  - the ``iter*()`` functions changed name \* iterators now return views, not lists
> +  - the ``iter*()`` functions changed name
> +
> +  - iterators now return views, not lists
>
>    - changed names for Python modules
>
> @@ -224,9 +225,7 @@ follows and run ``runqemu``:
>
>  .. note::
>
> -   For command-line syntax, use
> -   runqemu help
> -   .
> +   For command-line syntax, use ``runqemu help``.
>
>  ::
>
> @@ -369,7 +368,7 @@ The following recipes have been removed:
>  -  ``sato-icon-theme``: Became obsolete.
>
>  -  ``swabber-native``: Swabber has been removed. See the `entry on
> -   Swabber <#migration-2.2-swabber-has-been-removed>`__.
> +   Swabber <#swabber-has-been-removed>`__.
>
>  -  ``tslib``: No longer needed and has been moved to ``meta-oe``.
>
> @@ -395,7 +394,7 @@ The following classes have been removed:
>  -  ``sip``: Mostly unused.
>
>  -  ``swabber``: See the `entry on
> -   Swabber <#migration-2.2-swabber-has-been-removed>`__.
> +   Swabber <#swabber-has-been-removed>`__.
>
>  .. _migration-2.2-minor-packaging-changes:
>
> diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
> index 7f34f0cd7..60e4b2e45 100644
> --- a/documentation/ref-manual/migration-2.3.rst
> +++ b/documentation/ref-manual/migration-2.3.rst
> @@ -76,9 +76,7 @@ Consider the following:
>  .. note::
>
>     You can find more information on how recipe-specific sysroots work in
> -   the "
> -   staging.bbclass
> -   " section.
> +   the ":ref:`ref-classes-staging`" section.
>
>  .. _migration-2.3-path-variable:
>
> @@ -104,9 +102,8 @@ value.
>  .. note::
>
>     PATH
> -   is not sanitized in the same way within
> -   devshell
> -   . If it were, you would have difficulty running host tools for
> +   is not sanitized in the same way within ``devshell``.
> +   If it were, you would have difficulty running host tools for
>     development and debugging within the shell.
>
>  .. _migration-2.3-scripts:
> @@ -240,10 +237,8 @@ to substitute a GPLv2 version of a GPLv3 recipe, then you must add the
>
>  .. note::
>
> -   You can find
> -   meta-gplv2
> -   layer in the OpenEmbedded layer index at
> -   .
> +   You can ``find meta-gplv2`` layer in the OpenEmbedded layer index at
> +   https://layers.openembedded.org/layerindex/branch/master/layer/meta-gplv2/.
>
>  These relocated GPLv2 recipes do not receive the same level of
>  maintenance as other core recipes. The recipes do not get security fixes
> @@ -316,8 +311,7 @@ The following package management changes took place:
>
>  -  Signing of remote package feeds using ``PACKAGE_FEED_SIGN`` is not
>     currently supported. This issue will be fully addressed in a future
> -   Yocto Project release. See `defect
> -   11209 <https://bugzilla.yoctoproject.org/show_bug.cgi?id=11209>`__
> +   Yocto Project release. See :yocto_bugs:`defect 11209 </show_bug.cgi?id=11209>`
>     for more information on a solution to package feed signing with RPM
>     in the Yocto Project 2.3 release.
>
> @@ -329,8 +323,7 @@ The following package management changes took place:
>     .. note::
>
>        For further details on this change, see the
> -      commit message
> -      .
> +      :yocto_git:`commit message </cgit/cgit.cgi/poky/commit/?id=f4d4f99cfbc2396e49c1613a7d237b9e57f06f81>`.
>
>  .. _migration-2.3-removed-recipes:
>
> @@ -372,9 +365,9 @@ The following changes have been made to Wic:
>
>  .. note::
>
> -   For more information on Wic, see the "
> -   Creating Partitioned Images Using Wic
> -   " section in the Yocto Project Development Tasks Manual.
> +   For more information on Wic, see the
> +   ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
> +   section in the Yocto Project Development Tasks Manual.
>
>  -  *Default Output Directory Changed:* Wic's default output directory is
>     now the current directory by default instead of the unusual
> @@ -410,8 +403,8 @@ The following QA checks have changed:
>     warning, you need to address missing runtime dependencies.
>
>     For additional information, see the
> -   :ref:`insane <ref-classes-insane>` class and the "`Errors and
> -   Warnings <#qa-errors-and-warnings>`__" section.
> +   :ref:`insane <ref-classes-insane>` class and the
> +   ":ref:`ref-manual/ref-qa-checks:errors and warnings`" section.
>
>  .. _migration-2.3-miscellaneous-changes:
>
> diff --git a/documentation/ref-manual/migration-2.5.rst b/documentation/ref-manual/migration-2.5.rst
> index a2adc1775..1aeddc81c 100644
> --- a/documentation/ref-manual/migration-2.5.rst
> +++ b/documentation/ref-manual/migration-2.5.rst
> @@ -179,8 +179,8 @@ or ::
>
>  The earlier build-time provides behavior was a quirk of the
>  way the Python manifest file was created. For more information on this
> -change please see `this
> -commit <http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=8d94b9db221d1def42f091b991903faa2d1651ce>`__.
> +change please see :yocto_git:`this commit
> +</cgit/cgit.cgi/poky/commit/?id=8d94b9db221d1def42f091b991903faa2d1651ce>`.
>
>  .. _migration-2.5-miscellaneous-changes:
>
> diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
> index f16aaaa97..2f0da48ab 100644
> --- a/documentation/ref-manual/migration-2.6.rst
> +++ b/documentation/ref-manual/migration-2.6.rst
> @@ -110,7 +110,7 @@ upon the older ``*proto`` recipes need to be changed to depend on the
>  newer ``xorgproto`` recipe instead.
>
>  For names of recipes removed because of this repository change, see the
> -`Removed Recipes <#migration-2.6-removed-recipes>`__ section.
> +`Removed Recipes <#removed-recipes>`__ section.

are you sure about this one? perhaps better to use a :ref:?

>
>  .. _migration-2.6-distutils-distutils3-fetching-dependencies:
>
> @@ -128,18 +128,9 @@ missing from :term:`DEPENDS`).
>  .. note::
>
>     This change affects classes beyond just the two mentioned (i.e.
> -   distutils
> -   and
> -   distutils3
> -   ). Any recipe that inherits
> -   distutils\*
> -   classes are affected. For example, the
> -   setuptools
> -   and
> -   setuptools3
> -   recipes are affected since they inherit the
> -   distutils\*
> -   classes.
> +   ``distutils`` and ``distutils3``). Any recipe that inherits ``distutils*``
> +   classes are affected. For example, the ``setuptools`` and ``setuptools3``
> +   recipes are affected since they inherit the ``distutils*`` classes.
>
>  Fetching these types of dependencies that are not provided in the
>  sysroot negatively affects the ability to reproduce builds. This type of
> @@ -178,13 +169,13 @@ The following changes have been made:
>  -  Several variables have changed names for consistency:
>     ::
>
> -      Old Variable                  Name New Variable Name
> +      Old Variable Name             New Variable Name
>        ========================================================
> -      KERNEL_IMAGE_BASE_NAME        :term:`KERNEL_IMAGE_NAME`
> -      KERNEL_IMAGE_SYMLINK_NAME     :term:`KERNEL_IMAGE_LINK_NAME`
> -      MODULE_TARBALL_BASE_NAME      :term:`MODULE_TARBALL_NAME`
> -      MODULE_TARBALL_SYMLINK_NAME   :term:`MODULE_TARBALL_LINK_NAME`
> -      INITRAMFS_BASE_NAME           :term:`INITRAMFS_NAME`
> +      KERNEL_IMAGE_BASE_NAME        KERNEL_IMAGE_NAME
> +      KERNEL_IMAGE_SYMLINK_NAME     KERNEL_IMAGE_LINK_NAME
> +      MODULE_TARBALL_BASE_NAME      MODULE_TARBALL_NAME
> +      MODULE_TARBALL_SYMLINK_NAME   MODULE_TARBALL_LINK_NAME
> +      INITRAMFS_BASE_NAME           INITRAMFS_NAME
>
>  -  The ``MODULE_IMAGE_BASE_NAME`` variable has been removed. The module
>     tarball name is now controlled directly with the
> @@ -233,11 +224,9 @@ you replace all instances of ``SERIAL_CONSOLE`` with
>
>  .. note::
>
> -   The only difference in usage is that
> -   SERIAL_CONSOLES
> +   The only difference in usage is that ``SERIAL_CONSOLES``
>     expects entries to be separated using semicolons as compared to
> -   SERIAL_CONSOLE
> -   , which expects spaces.
> +   ``SERIAL_CONSOLE``, which expects spaces.
>
>  .. _migration-2.6-poky-sets-unknown-configure-option-to-qa-error:
>
> @@ -263,9 +252,7 @@ The following changes have occurred:
>
>     .. note::
>
> -      The
> -      virtclass-multilib-
> -      overrides for multilib are still valid.
> +      The ``virtclass-multilib-`` overrides for multilib are still valid.
>
>  -  The ``forcevariable`` Override Now Has a Higher Priority Than
>     ``libc`` Overrides: The ``forcevariable`` override is documented to
> @@ -447,14 +434,8 @@ The following miscellaneous changes occurred:
>
>     .. note::
>
> -      genericx86
> -      and
> -      genericx86-64
> -      retain
> -      kernel-modules
> -      as part of the
> -      RRECOMMENDS
> -      variable setting.
> +      ``genericx86`` and ``genericx86-64`` retain ``kernel-modules`` as part of
> +      the ``RRECOMMENDS`` variable setting.
>
>  -  The ``LGPLv2_WHITELIST_GPL-3.0`` variable has been removed. If you
>     are setting this variable in your configuration, set or append it to
> diff --git a/documentation/ref-manual/migration-3.0.rst b/documentation/ref-manual/migration-3.0.rst
> index e1305dfcc..047b75526 100644
> --- a/documentation/ref-manual/migration-3.0.rst
> +++ b/documentation/ref-manual/migration-3.0.rst
> @@ -197,8 +197,7 @@ The following BitBake changes have occurred.
>  -  The arguments passed to functions used with
>     :term:`bitbake:BB_HASHCHECK_FUNCTION`
>     have changed. If you are using your own custom hash check function,
> -   see
> -   http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=40a5e193c4ba45c928fccd899415ea56b5417725
> +   see :yocto_git:`/cgit/cgit.cgi/poky/commit/?id=40a5e193c4ba45c928fccd899415ea56b5417725`
>     for details.
>
>  -  Task specifications in ``BB_TASKDEPDATA`` and class implementations
> diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
> index b007e3482..aa5e44069 100644
> --- a/documentation/ref-manual/ref-classes.rst
> +++ b/documentation/ref-manual/ref-classes.rst
> @@ -47,7 +47,7 @@ splitting out of debug symbols during packaging).
>     even if the recipes do not produce architecture-specific output.
>
>     Configuring such recipes for all architectures causes the
> -   ```do_package_write_*`` tasks to
> +   ``do_package_write_*`` tasks to
>     have different signatures for the machines with different tunings.
>     Additionally, unnecessary rebuilds occur every time an image for a
>     different ``MACHINE`` is built even when the recipe never changes.
> @@ -164,24 +164,18 @@ example use for this class.
>
>     For RPMs and other packages that do not contain a subdirectory, you
>     should specify an appropriate fetcher parameter to point to the
> -   subdirectory. For example, if BitBake is using the Git fetcher (
> -   git://
> -   ), the "subpath" parameter limits the checkout to a specific subpath
> -   of the tree. Here is an example where
> -   ${BP}
> -   is used so that the files are extracted into the subdirectory
> -   expected by the default value of
> -   S
> -   :
> +   subdirectory. For example, if BitBake is using the Git fetcher (``git://``),
> +   the "subpath" parameter limits the checkout to a specific subpath
> +   of the tree. Here is an example where ``${BP}`` is used so that the files
> +   are extracted into the subdirectory expected by the default value of
> +   ``S``:
>     ::
>
>             SRC_URI = "git://example.com/downloads/somepackage.rpm;subpath=${BP}"
>
>
> -   See the "
> -   Fetchers
> -   " section in the BitBake User Manual for more information on
> -   supported BitBake Fetchers.
> +   See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the BitBake User Manual for
> +   more information on supported BitBake Fetchers.
>
>  .. _ref-classes-binconfig:
>
> @@ -736,11 +730,8 @@ introspection. This functionality is only enabled if the
>  .. note::
>
>     This functionality is backfilled by default and, if not applicable,
> -   should be disabled through
> -   DISTRO_FEATURES_BACKFILL_CONSIDERED
> -   or
> -   MACHINE_FEATURES_BACKFILL_CONSIDERED
> -   , respectively.
> +   should be disabled through ``DISTRO_FEATURES_BACKFILL_CONSIDERED`` or
> +   ``MACHINE_FEATURES_BACKFILL_CONSIDERED``, respectively.
>
>  .. _ref-classes-grub-efi:
>
> @@ -969,9 +960,8 @@ The ``image_types`` class also handles conversion and compression of images.
>  .. note::
>
>     To build a VMware VMDK image, you need to add "wic.vmdk" to
> -   IMAGE_FSTYPES
> -   . This would also be similar for Virtual Box Virtual Disk Image
> -   ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
> +   ``IMAGE_FSTYPES``. This would also be similar for Virtual Box Virtual Disk
> +   Image ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
>
>  .. _ref-classes-image-live:
>
> @@ -1032,9 +1022,8 @@ You can configure the sanity checks so that specific test failures
>  either raise a warning or an error message. Typically, failures for new
>  tests generate a warning. Subsequent failures for the same test would
>  then generate an error message once the metadata is in a known and good
> -condition. See the "`QA Error and Warning Messages <#ref-qa-checks>`__"
> -Chapter for a list of all the warning and error messages you might
> -encounter using a default configuration.
> +condition. See the ":doc:`ref-qa-checks`" Chapter for a list of all the warning
> +and error messages you might encounter using a default configuration.
>
>  Use the :term:`WARN_QA` and
>  :term:`ERROR_QA` variables to control the behavior of
> @@ -1275,9 +1264,9 @@ The following list shows the tests you can list with the ``WARN_QA`` and
>
>  -  ``textrel:`` Checks for ELF binaries that contain relocations in
>     their ``.text`` sections, which can result in a performance impact at
> -   runtime. See the explanation for the
> -   ```ELF binary`` <#qa-issue-textrel>`__ message for more information
> -   regarding runtime performance issues.
> +   runtime. See the explanation for the ``ELF binary`` message in
> +   ":doc:`ref-qa-checks`" for more information regarding runtime performance
> +   issues.
>
>  -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
>     for a package are also declared on the recipe level (i.e. any license
> @@ -1629,8 +1618,8 @@ section in the Yocto Project Development Tasks Manual.
>  ==================
>
>  The ``native`` class provides common functionality for recipes that
> -build tools to run on the `build host <#hardware-build-system-term>`__
> -(i.e. tools that use the compiler or other tools from the build host).
> +build tools to run on the :term:`Build Host` (i.e. tools that use the compiler
> +or other tools from the build host).
>
>  You can create a recipe that builds tools that run natively on the host
>  a couple different ways:
> @@ -1728,8 +1717,7 @@ package manager (NPM) <https://en.wikipedia.org/wiki/Npm_(software)>`__.
>
>  .. note::
>
> -   Currently, recipes inheriting this class must use the
> -   npm://
> +   Currently, recipes inheriting this class must use the ``npm://``
>     fetcher to have dependencies fetched and packaged automatically.
>
>  For information on how to create NPM packages, see the
> @@ -1833,9 +1821,9 @@ consider some further things about using RPM:
>  You can find additional information on the effects of the package class
>  at these two Yocto Project mailing list links:
>
> --  https://lists.yoctoproject.org/pipermail/poky/2011-May/006362.html
> +-  :yocto_lists:`/pipermail/poky/2011-May/006362.html`
>
> --  https://lists.yoctoproject.org/pipermail/poky/2011-May/006363.html
> +-  :yocto_lists:`/pipermail/poky/2011-May/006363.html`
>
>  .. _ref-classes-package_deb:
>
> @@ -1894,16 +1882,8 @@ variable in the ``local.conf`` file.
>
>  .. note::
>
> -   You cannot specify the
> -   package_tar
> -   class first using the
> -   PACKAGE_CLASSES
> -   variable. You must use
> -   .deb
> -   ,
> -   .ipk
> -   , or
> -   .rpm
> +   You cannot specify the ``package_tar`` class first using the
> +   ``PACKAGE_CLASSES`` variable. You must use ``.deb``, ``.ipk``, or ``.rpm``
>     file formats for your image or SDK.
>
>  .. _ref-classes-packagedata:
> @@ -2068,9 +2048,7 @@ The ``prexport`` class provides functionality for exporting
>  .. note::
>
>     This class is not intended to be used directly. Rather, it is enabled
> -   when using "
> -   bitbake-prserv-tool export
> -   ".
> +   when using "``bitbake-prserv-tool export``".
>
>  .. _ref-classes-primport:
>
> @@ -2083,9 +2061,7 @@ The ``primport`` class provides functionality for importing
>  .. note::
>
>     This class is not intended to be used directly. Rather, it is enabled
> -   when using "
> -   bitbake-prserv-tool import
> -   ".
> +   when using "``bitbake-prserv-tool import``".
>
>  .. _ref-classes-prserv:
>
> @@ -2204,9 +2180,7 @@ override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows:
>
>  .. note::
>
> -   The
> -   remove-libtool
> -   class is not enabled by default.
> +   The ``remove-libtool`` class is not enabled by default.
>
>  .. _ref-classes-report-error:
>
> @@ -2442,13 +2416,12 @@ stages:
>     .. note::
>
>        Additionally, a recipe can customize the files further by
> -      declaring a processing function in the
> -      SYSROOT_PREPROCESS_FUNCS
> +      declaring a processing function in the ``SYSROOT_PREPROCESS_FUNCS``
>        variable.
>
>     A shared state (sstate) object is built from these files and the
>     files are placed into a subdirectory of
> -   ```tmp/sysroots-components/`` <#structure-build-tmp-sysroots-components>`__.
> +   :ref:`structure-build-tmp-sysroots-components`.
>     The files are scanned for hardcoded paths to the original
>     installation location. If the location is found in text files, the
>     hardcoded locations are replaced by tokens and a list of the files
> @@ -2597,13 +2570,8 @@ internal class and is not intended to be used directly.
>
>  .. note::
>
> -   The
> -   systemd-boot
> -   class is a result from merging the
> -   gummiboot
> -   class used in previous Yocto Project releases with the
> -   systemd
> -   project.
> +   The ``systemd-boot`` class is a result from merging the ``gummiboot`` class
> +   used in previous Yocto Project releases with the ``systemd`` project.
>
>  Set the :term:`EFI_PROVIDER` variable to
>  "systemd-boot" to use this class. Doing so creates a standalone EFI
> @@ -2647,13 +2615,9 @@ steps to set up the environment.
>
>  .. note::
>
> -   Best practices include using
> -   IMAGE_CLASSES
> -   rather than
> -   INHERIT
> -   to inherit the
> -   testimage
> -   class for automated image testing.
> +   Best practices include using :term:`IMAGE_CLASSES` rather than
> +   :term:`INHERIT` to inherit the ``testimage`` class for automated image
> +   testing.
>
>  The tests are commands that run on the target system over ``ssh``. Each
>  test is written in Python and makes use of the ``unittest`` module.
> @@ -2686,13 +2650,9 @@ using the following:
>
>  .. note::
>
> -   Best practices include using
> -   IMAGE_CLASSES
> -   rather than
> -   INHERIT
> -   to inherit the
> -   testsdk
> -   class for automated SDK testing.
> +   Best practices include using :term:`IMAGE_CLASSES` rather than
> +   :term:`INHERIT` to inherit the ``testsdk`` class for automated SDK
> +   testing.
>
>  .. _ref-classes-texinfo:
>
> @@ -2709,11 +2669,8 @@ host system.
>  .. note::
>
>     If you want to use the Texinfo recipe shipped with the build system,
> -   you can remove "texinfo-native" from
> -   ASSUME_PROVIDED
> -   and makeinfo from
> -   SANITY_REQUIRED_UTILITIES
> -   .
> +   you can remove "texinfo-native" from :term:`ASSUME_PROVIDED` and makeinfo
> +   from :term:`SANITY_REQUIRED_UTILITIES`.
>
>  .. _ref-classes-tinderclient:
>
> @@ -2836,10 +2793,8 @@ file.
>
>  .. note::
>
> -   You can use the
> -   update-alternatives
> -   command directly in your recipes. However, this class simplifies
> -   things in most cases.
> +   You can use the ``update-alternatives`` command directly in your recipes.
> +   However, this class simplifies things in most cases.
>
>  .. _ref-classes-update-rc.d:
>
> @@ -2905,18 +2860,10 @@ additional information.
>
>  .. note::
>
> -   You do not use the
> -   useradd-staticids
> -   class directly. You either enable or disable the class by setting the
> -   USERADDEXTENSION
> -   variable. If you enable or disable the class in a configured system,
> -   TMPDIR
> -   might contain incorrect
> -   uid
> -   and
> -   gid
> -   values. Deleting the
> -   TMPDIR
> +   You do not use the ``useradd-staticids`` class directly. You either enable
> +   or disable the class by setting the ``USERADDEXTENSION`` variable. If you
> +   enable or disable the class in a configured system, :term:`TMPDIR` might
> +   contain incorrect ``uid`` and ``gid`` values. Deleting the ``TMPDIR``
>     directory will correct this condition.
>
>  .. _ref-classes-utility-tasks:
> diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
> index eaca45ae2..a0551744d 100644
> --- a/documentation/ref-manual/ref-devtool-reference.rst
> +++ b/documentation/ref-manual/ref-devtool-reference.rst
> @@ -131,7 +131,7 @@ The following figure shows the workspace structure:
>     :align: center
>     :scale: 70%
>
> -::
> +.. code-block:: none
>
>     attic - A directory created if devtool believes it must preserve
>             anything when you run "devtool reset".  For example, if you
> @@ -223,7 +223,7 @@ specify these options when using the ``devtool add`` command:
>  .. note::
>
>     If you prefer to use the latest revision every time the recipe is
> -   built, use the options --autorev or -a.
> +   built, use the options ``--autorev`` or ``-a``.
>
>  .. _devtool-extracting-the-source-for-an-existing-recipe:
>
> @@ -261,7 +261,7 @@ Modifying an Existing Recipe
>
>  Use the ``devtool modify`` command to begin modifying the source of an
>  existing recipe. This command is very similar to the
> -```add`` <#devtool-adding-a-new-recipe-to-the-workspace>`__ command
> +:ref:`add <devtool-adding-a-new-recipe-to-the-workspace>` command
>  except that it does not physically create the recipe in the workspace
>  layer because the recipe already exists in an another layer.
>
> @@ -303,7 +303,7 @@ Updating a Recipe
>  Use the ``devtool update-recipe`` command to update your recipe with
>  patches that reflect changes you make to the source files. For example,
>  if you know you are going to work on some code, you could first use the
> -```devtool modify`` <#devtool-modifying-a-recipe>`__ command to extract
> +:ref:`devtool modify <devtool-modifying-a-recipe>` command to extract
>  the code and set up the workspace. After which, you could modify,
>  compile, and test the code.
>
> @@ -386,15 +386,21 @@ satisfied.
>  .. note::
>
>     When a reason for not upgrading displays, the reason is usually
> -   written into the recipe using the RECIPE_NO_UPDATE_REASON
> -   variable. See the base-passwd.bb recipe for an example.
> +   written into the recipe using the ``RECIPE_NO_UPDATE_REASON``
> +   variable. See the
> +   :yocto_git:`base-passwd.bb </cgit/cgit.cgi/poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
> +   recipe for an example.
>
>  ::
>
> -   $ devtool check-upgrade-status ...
> +   $ devtool check-upgrade-status
> +   ...
>     NOTE: acpid 2.0.30 2.0.31 Ross Burton <ross.burton@intel.com>
>     NOTE: u-boot-fw-utils 2018.11 2019.01 Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
> -   NOTE: u-boot-tools 2018.11 2019.01 Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff . . .
> +   NOTE: u-boot-tools 2018.11 2019.01 Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
> +   .
> +   .
> +   .
>     NOTE: base-passwd 3.5.29 3.5.45 Anuj Mittal <anuj.mittal@intel.com> cannot be updated due to: Version 3.5.38 requires cdebconf for update-passwd utility
>     NOTE: busybox 1.29.2 1.30.0 Andrej Valek <andrej.valek@siemens.com>
>     NOTE: dbus-test 1.12.10 1.12.12 Chen Qi <Qi.Chen@windriver.com>
> @@ -607,8 +613,8 @@ Following is sample output after using
>  to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory:
>  ::
>
> -   $ devtool status mtr
> -   :/home/scottrif/poky/build/workspace/sources/mtr (/home/scottrif/poky/build/workspace/recipes/mtr/mtr_0.86.bb)
> +   $ devtool status
> +   mtr:/home/scottrif/poky/build/workspace/sources/mtr (/home/scottrif/poky/build/workspace/recipes/mtr/mtr_0.86.bb)
>     $
>
>  .. _devtool-search-for-available-target-recipes:
> diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
> index ae5a0e3b2..87be696be 100644
> --- a/documentation/ref-manual/ref-features.rst
> +++ b/documentation/ref-manual/ref-features.rst
> @@ -229,11 +229,8 @@ The following image features are available for all images:
>
>     .. note::
>
> -      To make the
> -      /var/log
> -      directory on the target persistent, use the
> -      VOLATILE_LOG_DIR
> -      variable by setting it to "no".
> +      To make the ``/var/log`` directory on the target persistent, use the
> +      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
>
>  -  *ptest-pkgs:* Installs ptest packages for all ptest-enabled recipes.
>
> diff --git a/documentation/ref-manual/ref-images.rst b/documentation/ref-manual/ref-images.rst
> index c88d4d75c..2af054d5f 100644
> --- a/documentation/ref-manual/ref-images.rst
> +++ b/documentation/ref-manual/ref-images.rst
> @@ -16,8 +16,7 @@ image you want.
>     the GNU Affero General Public License Version 3 (AGPL-3.0) components
>     is only supported for minimal and base images. Furthermore, if you
>     are going to build an image using non-GPLv3 and similarly licensed
> -   components, you must make the following changes in the
> -   local.conf
> +   components, you must make the following changes in the ``local.conf``
>     file before using the BitBake command to build the minimal or base
>     image:
>     ::
> diff --git a/documentation/ref-manual/ref-kickstart.rst b/documentation/ref-manual/ref-kickstart.rst
> index 45222de05..befae0570 100644
> --- a/documentation/ref-manual/ref-kickstart.rst
> +++ b/documentation/ref-manual/ref-kickstart.rst
> @@ -55,15 +55,14 @@ must also provide one of the ``--ondrive``, ``--ondisk``, or
>  .. note::
>
>     The mount program must understand the PARTUUID syntax you use with
> -   --use-uuid
> -   and non-root
> -   mountpoint
> -   , including swap. The busybox versions of these application are
> -   currently excluded.
> +   ``--use-uuid`` and non-root *mountpoint*, including swap. The busybox
> +   versions of these application are currently excluded.
>
>  Here is an example that uses "/" as the mountpoint. The command uses
> -``--ondisk`` to force the partition onto the ``sdb`` disk: part /
> ---source rootfs --ondisk sdb --fstype=ext3 --label platform --align 1024
> +``--ondisk`` to force the partition onto the ``sdb`` disk:
> +::
> +
> +      part / --source rootfs --ondisk sdb --fstype=ext3 --label platform --align 1024
>
>  Here is a list that describes other supported options you can use with
>  the ``part`` and ``partition`` commands:
> diff --git a/documentation/ref-manual/ref-qa-checks.rst b/documentation/ref-manual/ref-qa-checks.rst
> index 3e76ac150..e5df77cb7 100644
> --- a/documentation/ref-manual/ref-qa-checks.rst
> +++ b/documentation/ref-manual/ref-qa-checks.rst
> @@ -454,9 +454,8 @@ Errors and Warnings
>
>        Disabling stripping here does not mean that the final packaged
>        binaries will be unstripped. Once the OpenEmbedded build system
> -      splits out debug symbols to the
> -      -dbg
> -      package, it will then strip the symbols from the binaries.
> +      splits out debug symbols to the ``-dbg`` package, it will then
> +      strip the symbols from the binaries.
>
>
>
> diff --git a/documentation/ref-manual/ref-release-process.rst b/documentation/ref-manual/ref-release-process.rst
> index be041e725..15128754c 100644
> --- a/documentation/ref-manual/ref-release-process.rst
> +++ b/documentation/ref-manual/ref-release-process.rst
> @@ -64,7 +64,7 @@ codename are likely to be compatible and thus work together.
>  Releases are given a nominal release version as well but the codename is
>  used in repositories for this reason. You can find information on Yocto
>  Project releases and codenames at
> -https://wiki.yoctoproject.org/wiki/Releases.
> +:yocto_wiki:`/wiki/Releases`.
>
>  Stable Release Process
>  ======================
> @@ -94,7 +94,7 @@ Community LTS trees and branches exist where community members share
>  patches for older releases. However, these types of patches do not go
>  through the same release process as do point releases. You can find more
>  information about stable branch maintenance at
> -https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance.
> +:yocto_wiki:`/wiki/Stable_branch_maintenance`.
>
>  Testing and Quality Assurance
>  =============================
> @@ -145,18 +145,16 @@ consists of the following pieces:
>
>     .. note::
>
> -      Running
> -      oe-selftest
> -      requires host packages beyond the "Essential" grouping. See the "
> -      Required Packages for the Build Host
> -      " section for more information.
> +      Running ``oe-selftest`` requires host packages beyond the "Essential"
> +      grouping. See the :ref:`ref-manual/ref-system-requirements:required packages for the build host`
> +      section for more information.
>
>  Originally, much of this testing was done manually. However, significant
>  effort has been made to automate the tests so that more people can use
>  them and the Yocto Project development team can run them faster and more
>  efficiently.
>
> -The Yocto Project's main Autobuilder (https://autobuilder.yoctoproject.org/)
> +The Yocto Project's main Autobuilder (&YOCTO_AB_URL;)
>  publicly tests each Yocto Project release's code in the
>  :term:`OpenEmbedded-Core (OE-Core)`, Poky, and BitBake repositories. The testing
>  occurs for both the current state of the "master" branch and also for
> diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
> index 48a443331..93807b52a 100644
> --- a/documentation/ref-manual/ref-structure.rst
> +++ b/documentation/ref-manual/ref-structure.rst
> @@ -282,17 +282,10 @@ file, it uses ``sed`` to substitute final
>
>  .. note::
>
> -   You can see how the
> -   TEMPLATECONF
> -   variable is used by looking at the
> -   scripts/oe-setup-builddir
> -   script in the
> -   Source Directory
> -   . You can find the Yocto Project version of the
> -   local.conf.sample
> -   file in the
> -   meta-poky/conf
> -   directory.
> +   You can see how the ``TEMPLATECONF`` variable is used by looking at the
> +   ``scripts/oe-setup-builddir``` script in the :term:`Source Directory`.
> +   You can find the Yocto Project version of the ``local.conf.sample`` file in
> +   the ``meta-poky/conf`` directory.
>
>  .. _structure-build-conf-bblayers.conf:
>
> @@ -327,16 +320,9 @@ Once the build process gets the sample file, it uses ``sed`` to substitute final
>
>  .. note::
>
> -   You can see how the
> -   TEMPLATECONF
> -   variable
> -   scripts/oe-setup-builddir
> -   script in the
> -   Source Directory
> -   . You can find the Yocto Project version of the
> -   bblayers.conf.sample
> -   file in the
> -   meta-poky/conf/
> +   You can see how the ``TEMPLATECONF`` variable ``scripts/oe-setup-builddir``
> +   script in the :term:`Source Directory`. You can find the Yocto Project
> +   version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/``
>     directory.
>
>  .. _structure-build-conf-sanity_info:
> @@ -531,19 +517,16 @@ should be automatic, and recipes should not directly reference
>
>  Previous versions of the OpenEmbedded build system used to create a
>  global shared sysroot per machine along with a native sysroot. Beginning
> -with the DISTRO version of the Yocto Project, sysroots exist in
> +with the 2.3 version of the Yocto Project, sysroots exist in
>  recipe-specific :term:`WORKDIR` directories. Thus, the
>  ``build/tmp/sysroots/`` directory is unused.
>
>  .. note::
>
> -   The
> -   build/tmp/sysroots/
> -   directory can still be populated using the
> -   bitbake build-sysroots
> -   command and can be used for compatibility in some cases. However, in
> -   general it is not recommended to populate this directory. Individual
> -   recipe-specific sysroots should be used.
> +   The ``build/tmp/sysroots/`` directory can still be populated using the
> +   ``bitbake build-sysroots`` command and can be used for compatibility in some
> +   cases. However, in general it is not recommended to populate this directory.
> +   Individual recipe-specific sysroots should be used.
>
>  .. _structure-build-tmp-stamps:
>
> @@ -554,8 +537,11 @@ This directory holds information that BitBake uses for accounting
>  purposes to track what tasks have run and when they have run. The
>  directory is sub-divided by architecture, package name, and version.
>  Following is an example:
> -stamps/all-poky-linux/distcc-config/1.0-r0.do_build-2fdd....2do Although
> -the files in the directory are empty of data, BitBake uses the filenames
> +::
> +
> +      stamps/all-poky-linux/distcc-config/1.0-r0.do_build-2fdd....2do
> +
> +Although the files in the directory are empty of data, BitBake uses the filenames
>  and timestamps for tracking purposes.
>
>  For information on how BitBake uses stamp files to determine if a task
> @@ -613,13 +599,12 @@ install" places its output that is then split into sub-packages within
>  The recipe work directory - ``${WORKDIR}``.
>
>  As described earlier in the
> -"```build/tmp/sysroots/`` <#structure-build-tmp-sysroots>`__" section,
> -beginning with the DISTRO release of the Yocto Project, the OpenEmbedded
> +":ref:`structure-build-tmp-sysroots`" section,
> +beginning with the 2.3 release of the Yocto Project, the OpenEmbedded
>  build system builds each recipe in its own work directory (i.e.
>  :term:`WORKDIR`). The path to the work directory is
>  constructed using the architecture of the given build (e.g.
> -:term:`TUNE_PKGARCH`,
> -:term:`MACHINE_ARCH`, or "allarch"), the recipe
> +:term:`TUNE_PKGARCH`, :term:`MACHINE_ARCH`, or "allarch"), the recipe
>  name, and the version of the recipe (i.e.
>  :term:`PE`\ ``:``\ :term:`PV`\ ``-``\ :term:`PR`).
>
> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> index 56218e4eb..1259fecd4 100644
> --- a/documentation/ref-manual/ref-system-requirements.rst
> +++ b/documentation/ref-manual/ref-system-requirements.rst
> @@ -27,9 +27,7 @@ and conceptual information in the :doc:`../overview-manual/overview-manual`.
>  .. note::
>
>     For more information about the Yocto Project Documentation set, see
> -   the "
> -   Links and Related Documentation
> -   " section.
> +   the :ref:`ref-manual/resources:links and related documentation` section.
>
>  .. _detailed-supported-distros:
>
> @@ -91,8 +89,8 @@ distributions:
>        compatible but not officially supported nor validated with
>        WSLv2, if you still decide to use WSL please upgrade to WSLv2.
>
> -   -  If you encounter problems, please go to `Yocto Project
> -      Bugzilla <http://bugzilla.yoctoproject.org>`__ and submit a bug. We are
> +   -  If you encounter problems, please go to :yocto_bugs:`Yocto Project
> +      Bugzilla <>` and submit a bug. We are
>        interested in hearing about your experience. For information on
>        how to submit a bug, see the Yocto Project
>        :yocto_wiki:`Bugzilla wiki page </wiki/Bugzilla_Configuration_and_Bug_Tracking>`
> @@ -177,8 +175,11 @@ supported openSUSE Linux distribution:
>        $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
>
>  -  *Documentation:* Packages needed if you are going to build out the
> -   Yocto Project documentation manuals: $ sudo zypper install dblatex
> -   xmlto
> +   Yocto Project documentation manuals:
> +   ::
> +
> +      $ sudo zypper install dblatex xmlto
> +
>
>  CentOS-7 Packages
>  -----------------
> @@ -279,7 +280,7 @@ installer and automatically installs the tools for you:
>
>        $ cd poky
>        $ scripts/install-buildtools --without-extended-buildtools \
> -        --base-url https://downloads.yoctoproject.org/releases/yocto \
> +        --base-url &YOCTO_DL_URL;/releases/yocto \
>          --release yocto-&DISTRO; \
>          --installer-version &DISTRO;
>
> @@ -340,7 +341,7 @@ of the two methods by which you can get these tools:
>
>     During execution, a prompt appears that allows you to choose the
>     installation directory. For example, you could choose the following:
> -   /home/your-username/buildtools
> +   ``/home/your-username/buildtools``
>
>  3. Source the tools environment setup script by using a command like the
>     following:
> @@ -388,12 +389,8 @@ installer:
>
>     .. note::
>
> -      The
> -      SDKMACHINE
> -      variable in your
> -      local.conf
> -      file determines whether you build tools for a 32-bit or 64-bit
> -      system.
> +      The :term:`SDKMACHINE` variable in your ``local.conf`` file determines
> +      whether you build tools for a 32-bit or 64-bit system.
>
>     Once the build completes, you can find the ``.sh`` file that installs
>     the tools in the ``tmp/deploy/sdk`` subdirectory of the
> @@ -417,7 +414,7 @@ installer:
>
>     During execution, a prompt appears that allows you to choose the
>     installation directory. For example, you could choose the following:
> -   /home/your_username/buildtools
> +   ``/home/your_username/buildtools``
>
>  5. Source the tools environment setup script by using a command like the
>     following:
> diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
> index dcdff05dc..ec1ecbe70 100644
> --- a/documentation/ref-manual/ref-tasks.rst
> +++ b/documentation/ref-manual/ref-tasks.rst
> @@ -87,33 +87,30 @@ output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
>
>  .. note::
>
> -   Do not write the output directly to
> -   ${DEPLOY_DIR_IMAGE}
> -   , as this causes the sstate mechanism to malfunction.
> +   Do not write the output directly to ``${DEPLOY_DIR_IMAGE}``, as this causes
> +   the sstate mechanism to malfunction.
>
>  The ``do_deploy`` task is not added as a task by default and
>  consequently needs to be added manually. If you want the task to run
>  after :ref:`ref-tasks-compile`, you can add it by doing
> -the following: addtask deploy after do_compile Adding ``do_deploy``
> -after other tasks works the same way.
> +the following:
> +::
> +
> +      addtask deploy after do_compile
> +
> +Adding ``do_deploy`` after other tasks works the same way.
>
>  .. note::
>
> -   You do not need to add
> -   before do_build
> -   to the
> -   addtask
> -   command (though it is harmless), because the
> -   base
> -   class contains the following:
> +   You do not need to add ``before do_build`` to the ``addtask`` command
> +   (though it is harmless), because the ``base`` class contains the following:
>     ::
>
>             do_build[recrdeptask] += "do_deploy"
>
>
> -   See the "
> -   Dependencies
> -   " section in the BitBake User Manual for more information.
> +   See the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`"
> +   section in the BitBake User Manual for more information.
>
>  If the ``do_deploy`` task re-executes, any previous output is removed
>  (i.e. "cleaned").
> @@ -298,10 +295,8 @@ to locate and apply patch files to the source code.
>
>  .. note::
>
> -   The build system uses the
> -   FILESPATH
> -   variable to determine the default set of directories when searching
> -   for patches.
> +   The build system uses the :term:`FILESPATH` variable to determine the
> +   default set of directories when searching for patches.
>
>  Patch files, by default, are ``*.patch`` and ``*.diff`` files created
>  and kept in a subdirectory of the directory holding the recipe file. For
> @@ -322,13 +317,8 @@ and patch files needed to build the package.
>
>  .. note::
>
> -   In the case for the
> -   bluez5_5.48.bb
> -   recipe, the
> -   SRC_URI
> -   statements are from an include file
> -   bluez5.inc
> -   .
> +   In the case for the ``bluez5_5.48.bb`` recipe, the ``SRC_URI`` statements
> +   are from an include file ``bluez5.inc``.
>
>  As mentioned earlier, the build system treats files whose file types are
>  ``.patch`` and ``.diff`` as patch files. However, you can use the
> @@ -356,7 +346,7 @@ the patch phase, you can use the "apply=no" parameter with the
>  In the
>  previous example, assuming all the files in the directory holding the
>  patch files end with either ``.patch`` or ``.diff``, every file would be
> -applied as a patch by default except for the patch_file5 patch.
> +applied as a patch by default except for the ``patch_file5`` patch.
>
>  You can find out more about the patching process in the
>  ":ref:`patching-dev-environment`" section in
> @@ -561,11 +551,9 @@ scratch is guaranteed.
>
>  .. note::
>
> -   The
> -   do_cleansstate
> -   task cannot remove sstate from a remote sstate mirror. If you need to
> -   build a target from scratch using remote mirrors, use the "-f" option
> -   as follows:
> +   The ``do_cleansstate`` task cannot remove sstate from a remote sstate
> +   mirror. If you need to build a target from scratch using remote mirrors, use
> +   the "-f" option as follows:
>     ::
>
>        $ bitbake -f -c do_cleansstate target
> @@ -609,14 +597,9 @@ Creates or updates the index in the `:ref:`package-feeds-dev-environment` area.
>
>  .. note::
>
> -   This task is not triggered with the
> -   bitbake -c
> -   command-line option as are the other tasks in this section. Because
> -   this task is specifically for the
> -   package-index
> -   recipe, you run it using
> -   bitbake package-index
> -   .
> +   This task is not triggered with the ``bitbake -c`` command-line option as
> +   are the other tasks in this section. Because this task is specifically for
> +   the ``package-index`` recipe, you run it using ``bitbake package-index``.
>
>  Image-Related Tasks
>  ===================
> diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
> index 48e665fe3..425490061 100644
> --- a/documentation/ref-manual/ref-terms.rst
> +++ b/documentation/ref-manual/ref-terms.rst
> @@ -101,12 +101,12 @@ universal, the list includes them just in case:
>
>        .. note::
>
> -         By default, the Build Directory contains :term:`TMPDIR` , which is a
> -         temporary directory the build system uses for its work. TMPDIR cannot
> +         By default, the Build Directory contains :term:`TMPDIR`, which is a
> +         temporary directory the build system uses for its work. ``TMPDIR`` cannot
>           be under NFS. Thus, by default, the Build Directory cannot be under
>           NFS. However, if you need the Build Directory to be under NFS, you can
> -         set this up by setting TMPDIR in your local.conf file to use a local
> -         drive. Doing so effectively separates TMPDIR from TOPDIR , which is the
> +         set this up by setting ``TMPDIR`` in your ``local.conf`` file to use a local
> +         drive. Doing so effectively separates ``TMPDIR`` from :term:`TOPDIR`, which is the
>           Build Directory.
>
>     :term:`Build Host`
> @@ -232,7 +232,7 @@ universal, the list includes them just in case:
>        core set of recipes.
>
>        You can see the Metadata in the ``meta`` directory of the Yocto
> -      Project :yocto_git:`Source Repositories <>`.
> +      Project :yocto_git:`Source Repositories </cgit/cgit.cgi/poky>`.
>
>     :term:`OpenEmbedded Build System`
>        The build system specific to the Yocto
> @@ -246,9 +246,7 @@ universal, the list includes them just in case:
>
>        .. note::
>
> -         For some historical information about Poky, see the
> -         Poky
> -         term.
> +         For some historical information about Poky, see the :term:`Poky` term.
>
>     :term:`Package`
>        In the context of the Yocto Project, this term refers to a
> @@ -258,10 +256,9 @@ universal, the list includes them just in case:
>
>        It is worth noting that the term "package" can, in general, have
>        subtle meanings. For example, the packages referred to in the
> -      "`Required Packages for the Build
> -      Host <#required-packages-for-the-build-host>`__" section are compiled
> -      binaries that, when installed, add functionality to your Linux
> -      distribution.
> +      ":ref:`ref-manual/ref-system-requirements:required packages for the build host`"
> +      section are compiled binaries that, when installed, add functionality to
> +      your Linux distribution.
>
>        Another point worth noting is that historically within the Yocto
>        Project, recipes were referred to as packages - thus, the existence
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index 35baf9b81..eb4042b4f 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -78,7 +78,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         If ALTERNATIVE_LINK_NAME is not defined, it defaults to ${bindir}/ name.
> +         If ``ALTERNATIVE_LINK_NAME`` is not defined, it defaults to ``${bindir}/name``.
>
>        For more information on the alternatives system, see the
>        ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
> @@ -237,15 +237,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         It is assumed that all changes to
> -         COMMON_LICENSE_DIR
> -         and
> -         LICENSE_PATH
> -         have been done before
> -         AVAILABLE_LICENSES
> -         is defined (in
> -         license.bbclass
> -         ).
> +         It is assumed that all changes to ``COMMON_LICENSE_DIR`` and
> +         ``LICENSE_PATH`` have been done before ``AVAILABLE_LICENSES``
> +         is defined (in :ref:`ref-classes-license`).
>
>     :term:`AVAILTUNES`
>        The list of defined CPU and Application Binary Interface (ABI)
> @@ -389,7 +383,8 @@ system and gives an overview of their function and contents.
>        add the ``BB_DISKMON_DIRS`` variable to your ``conf/local.conf`` file
>        found in the :term:`Build Directory`. Use the
>        following form:
> -      ::
> +
> +      .. code-block:: none
>
>           BB_DISKMON_DIRS = "action,dir,threshold [...]"
>
> @@ -473,7 +468,8 @@ system and gives an overview of their function and contents.
>
>        When specifying the variable in your configuration file, use the
>        following form:
> -      ::
> +
> +      .. code-block:: none
>
>           BB_DISKMON_WARNINTERVAL = "disk_space_interval,disk_inode_interval"
>
> @@ -619,8 +615,7 @@ system and gives an overview of their function and contents.
>
>        .. tip::
>
> -         You can use the command
> -         bitbake-layers show-layers
> +         You can use the command ``bitbake-layers show-layers``
>           to list all configured layers along with their priorities.
>
>     :term:`BBFILES`
> @@ -653,7 +648,8 @@ system and gives an overview of their function and contents.
>
>        This next example shows an error message that occurs because invalid
>        entries are found, which cause parsing to abort:
> -      ::
> +
> +      .. code-block:: none
>
>           ERROR: BBFILES_DYNAMIC entries must be of the form <collection name>:<filename pattern>, not:
>               /work/my-layer/bbappends/meta-security-isafw/*/*/*.bbappend
> @@ -675,7 +671,8 @@ system and gives an overview of their function and contents.
>        ::
>
>           BBLAYERS = " \
> -             /home/scottrif/poky/meta \ /home/scottrif/poky/meta-poky \
> +             /home/scottrif/poky/meta \
> +             /home/scottrif/poky/meta-poky \
>               /home/scottrif/poky/meta-yocto-bsp \
>               /home/scottrif/poky/meta-mykernel \
>               "
> @@ -799,16 +796,12 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The
> -         BINCONFIG_GLOB
> -         variable uses
> -         shell globbing
> -         , which is recognition and expansion of wildcards during pattern
> +         The ``BINCONFIG_GLOB`` variable uses
> +         `shell globbing <https://tldp.org/LDP/abs/html/globbingref.html>`__,
> +         which is recognition and expansion of wildcards during pattern
>           matching. Shell globbing is very similar to
> -         fnmatch
> -         and
> -         glob
> -         .
> +         `fnmatch <https://docs.python.org/3/library/fnmatch.html#module-fnmatch>`__
> +         and `glob <https://docs.python.org/3/library/glob.html>`__.
>
>        For more information on how this variable works, see
>        ``meta/classes/binconfig.bbclass`` in the :term:`Source Directory`.
> @@ -944,7 +937,7 @@ system and gives an overview of their function and contents.
>     :term:`BUILDDIR`
>        Points to the location of the :term:`Build Directory`.
>        You can define this directory indirectly through the
> -      ````` <#structure-core-script>`__ script by passing in a Build
> +      :ref:`structure-core-script` script by passing in a Build
>        Directory path when you run the script. If you run the script and do
>        not provide a Build Directory path, the ``BUILDDIR`` defaults to
>        ``build`` in the current directory.
> @@ -1133,10 +1126,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         CLASSOVERRIDE
> -         gets its default "class-target" value from the
> -         bitbake.conf
> -         file.
> +         ``CLASSOVERRIDE`` gets its default "class-target" value from the
> +         ``bitbake.conf`` file.
>
>        As an example, the following override allows you to install extra
>        files, but only when building for the target:
> @@ -1208,13 +1199,10 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The
> -         COMPLEMENTARY_GLOB
> -         variable uses Unix filename pattern matching (
> -         fnmatch
> -         ), which is similar to the Unix style pathname pattern expansion (
> -         glob
> -         ).
> +         The ``COMPLEMENTARY_GLOB`` variable uses Unix filename pattern matching
> +         (`fnmatch <https://docs.python.org/3/library/fnmatch.html#module-fnmatch>`__),
> +         which is similar to the Unix style pathname pattern expansion
> +         (`glob <https://docs.python.org/3/library/glob.html>`__).
>
>        The resulting list of complementary packages is associated with an
>        item that can be added to
> @@ -1274,22 +1262,12 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         When specifying paths as part of the
> -         CONFFILES
> -         variable, it is good practice to use appropriate path variables.
> -         For example,
> -         ${sysconfdir}
> -         rather than
> -         /etc
> -         or
> -         ${bindir}
> -         rather than
> -         /usr/bin
> -         . You can find a list of these variables at the top of the
> -         meta/conf/bitbake.conf
> -         file in the
> -         Source Directory
> -         .
> +         When specifying paths as part of the ``CONFFILES`` variable, it is
> +         good practice to use appropriate path variables.
> +         For example, ``${sysconfdir}`` rather than ``/etc`` or ``${bindir}``
> +         rather than ``/usr/bin``. You can find a list of these variables at
> +         the top of the ``meta/conf/bitbake.conf`` file in the
> +         :term:`Source Directory`.
>
>     :term:`CONFIG_INITRAMFS_SOURCE`
>        Identifies the initial RAM filesystem (initramfs) source files. The
> @@ -1339,11 +1317,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The
> -         COPYLEFT_LICENSE_EXCLUDE
> -         variable takes precedence over the
> -         COPYLEFT_LICENSE_INCLUDE
> -         variable.
> +         The ``COPYLEFT_LICENSE_EXCLUDE`` variable takes precedence over the
> +         :term:`COPYLEFT_LICENSE_INCLUDE` variable.
>
>        The default value, which is "CLOSED Proprietary", for
>        ``COPYLEFT_LICENSE_EXCLUDE`` is set by the
> @@ -1410,15 +1385,12 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The
> -         COPY_LIC_DIRS
> -         does not offer a path for adding licenses for newly installed
> -         packages to an image, which might be most suitable for read-only
> -         filesystems that cannot be upgraded. See the
> -         LICENSE_CREATE_PACKAGE
> -         variable for additional information. You can also reference the "
> -         Providing License Text
> -         " section in the Yocto Project Development Tasks Manual for
> +         The ``COPY_LIC_DIRS`` does not offer a path for adding licenses for
> +         newly installed packages to an image, which might be most suitable for
> +         read-only filesystems that cannot be upgraded. See the
> +         :term:`LICENSE_CREATE_PACKAGE` variable for additional information.
> +         You can also reference the ":ref:`dev-manual/dev-manual-common-tasks:providing license text`"
> +         section in the Yocto Project Development Tasks Manual for
>           information on providing license text.
>
>     :term:`COPY_LIC_MANIFEST`
> @@ -1429,15 +1401,12 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The
> -         COPY_LIC_MANIFEST
> -         does not offer a path for adding licenses for newly installed
> -         packages to an image, which might be most suitable for read-only
> -         filesystems that cannot be upgraded. See the
> -         LICENSE_CREATE_PACKAGE
> -         variable for additional information. You can also reference the "
> -         Providing License Text
> -         " section in the Yocto Project Development Tasks Manual for
> +         The ``COPY_LIC_MANIFEST`` does not offer a path for adding licenses for
> +         newly installed packages to an image, which might be most suitable for
> +         read-only filesystems that cannot be upgraded. See the
> +         :term:`LICENSE_CREATE_PACKAGE` variable for additional information.
> +         You can also reference the ":ref:`dev-manual/dev-manual-common-tasks:providing license text`"
> +         section in the Yocto Project Development Tasks Manual for
>           information on providing license text.
>
>     :term:`CORE_IMAGE_EXTRA_INSTALL`
> @@ -1500,8 +1469,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The OpenEmbedded build system sets the
> -         CROSS_COMPILE
> +         The OpenEmbedded build system sets the ``CROSS_COMPILE``
>           variable only in certain contexts (e.g. when building for kernel
>           and kernel module recipes).
>
> @@ -1541,8 +1509,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           Tasks that read from or write to this directory should run under
> -         fakeroot
> -         .
> +         :ref:`fakeroot <overview-manual/overview-manual-concepts:fakeroot and pseudo>`.
>
>     :term:`DATE`
>        The date the build was started. Dates appear using the year, month,
> @@ -1593,12 +1560,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The bias provided by
> -         DEFAULT_PREFERENCE
> -         is weak and is overridden by
> -         BBFILE_PRIORITY
> -         if that variable is different between two layers that contain
> -         different versions of the same recipe.
> +         The bias provided by ``DEFAULT_PREFERENCE`` is weak and is overridden
> +         by :term:`BBFILE_PRIORITY` if that variable is different between two
> +         layers that contain different versions of the same recipe.
>
>     :term:`DEFAULTTUNE`
>        The default CPU and Application Binary Interface (ABI) tunings (i.e.
> @@ -1635,8 +1599,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         It seldom is necessary to reference, for example,
> -         STAGING_DIR_HOST
> +         It seldom is necessary to reference, for example, ``STAGING_DIR_HOST``
>           explicitly. The standard classes and build-related variables are
>           configured to automatically use the appropriate staging sysroots.
>
> @@ -1807,7 +1770,7 @@ system and gives an overview of their function and contents.
>        is set in the ``deploy`` class as follows:
>        ::
>
> -         DEPLOYDIR = "${WORKDIR}/deploy-${:term:`PN`}"
> +         DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
>
>        Recipes inheriting the ``deploy`` class should copy files to be
>        deployed into ``DEPLOYDIR``, and the class will take care of copying
> @@ -1844,12 +1807,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         If the
> -         DISTRO
> -         variable is blank, a set of default configurations are used, which
> -         are specified within
> -         meta/conf/distro/defaultsetup.conf
> -         also in the Source Directory.
> +         If the ``DISTRO`` variable is blank, a set of default configurations
> +         are used, which are specified within
> +         ``meta/conf/distro/defaultsetup.conf`` also in the Source Directory.
>
>     :term:`DISTRO_CODENAME`
>        Specifies a codename for the distribution being built.
> @@ -1884,8 +1844,7 @@ system and gives an overview of their function and contents.
>
>        Two more examples are Bluetooth and NFS support. For a more complete
>        list of features that ships with the Yocto Project and that you can
> -      provide with this variable, see the "`Distro
> -      Features <#ref-features-distro>`__" section.
> +      provide with this variable, see the ":ref:`ref-features-distro`" section.
>
>     :term:`DISTRO_FEATURES_BACKFILL`
>        Features to be added to ``DISTRO_FEATURES`` if not also present in
> @@ -1894,15 +1853,13 @@ system and gives an overview of their function and contents.
>        This variable is set in the ``meta/conf/bitbake.conf`` file. It is
>        not intended to be user-configurable. It is best to just reference
>        the variable to see which distro features are being backfilled for
> -      all distro configurations. See the "`Feature
> -      Backfilling <#ref-features-backfill>`__" section for more
> -      information.
> +      all distro configurations. See the ":ref:`ref-features-backfill`" section
> +      for more information.
>
>     :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
>        Features from ``DISTRO_FEATURES_BACKFILL`` that should not be
>        backfilled (i.e. added to ``DISTRO_FEATURES``) during the build. See
> -      the "`Feature Backfilling <#ref-features-backfill>`__" section for
> -      more information.
> +      the ":ref:`ref-features-backfill`" section for more information.
>
>     :term:`DISTRO_FEATURES_DEFAULT`
>        A convenience variable that gives you the default list of distro
> @@ -1973,12 +1930,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         If the
> -         DISTRO_NAME
> -         variable is blank, a set of default configurations are used, which
> -         are specified within
> -         meta/conf/distro/defaultsetup.conf
> -         also in the Source Directory.
> +         If the ``DISTRO_NAME`` variable is blank, a set of default
> +         configurations are used, which are specified within
> +         ``meta/conf/distro/defaultsetup.conf`` also in the Source Directory.
>
>     :term:`DISTRO_VERSION`
>        The version of the distribution.
> @@ -2028,8 +1982,7 @@ system and gives an overview of their function and contents.
>        You can safely share this directory between multiple builds on the
>        same development machine. For additional information on how the build
>        process gets source files when working behind a firewall or proxy
> -      server, see this specific question in the
> -      "`FAQ <#how-does-the-yocto-project-obtain-source-code-and-will-it-work-behind-my-firewall-or-proxy-server>`__"
> +      server, see this specific question in the ":doc:`faq`"
>        chapter. You can also refer to the
>        ":yocto_wiki:`Working Behind a Network Proxy </wiki/Working_Behind_a_Network_Proxy>`"
>        Wiki page.
> @@ -2089,12 +2042,10 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           The shared libraries resolver's functionality results in part from
> -         the internal function
> -         package_do_shlibs
> -         , which is part of the
> -         do_package
> -         task. You should be aware that the shared libraries resolver might
> -         implicitly define some dependencies between packages.
> +         the internal function ``package_do_shlibs``, which is part of the
> +         :ref:`ref-tasks-package` task. You should be aware that the shared
> +         libraries resolver might implicitly define some dependencies between
> +         packages.
>
>        The ``EXCLUDE_FROM_SHLIBS`` variable is similar to the
>        :term:`PRIVATE_LIBS` variable, which excludes a
> @@ -2117,13 +2068,10 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Recipes added to
> -         EXCLUDE_FROM_WORLD
> -         may still be built during a world build in order to satisfy
> -         dependencies of other recipes. Adding a recipe to
> -         EXCLUDE_FROM_WORLD
> -         only ensures that the recipe is not explicitly added to the list
> -         of build targets in a world build.
> +         Recipes added to ``EXCLUDE_FROM_WORLD`` may still be built during a
> +         world build in order to satisfy dependencies of other recipes. Adding
> +         a recipe to ``EXCLUDE_FROM_WORLD`` only ensures that the recipe is not
> +         explicitly added to the list of build targets in a world build.
>
>     :term:`EXTENDPE`
>        Used with file and pathnames to create a prefix for a recipe's
> @@ -2205,8 +2153,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           To enable primary features from within the image recipe, use the
> -         IMAGE_FEATURES
> -         variable.
> +         :term:`IMAGE_FEATURES` variable.
>
>        Here are some examples of features you can add:
>
> @@ -2215,8 +2162,8 @@ system and gives an overview of their function and contents.
>
>          - "debug-tweaks" - Makes an image suitable for debugging. For example, allows root logins without passwords and
>            enables post-installation logging. See the 'allow-empty-password' and
> -          'post-install-logging' features in the "`Image
> -          Features <#ref-features-image>`__" section for more information.
> +          'post-install-logging' features in the ":ref:`ref-features-image`"
> +          section for more information.
>          - "dev-pkgs" - Adds -dev packages for all installed packages. This is
>            useful if you want to develop against the libraries in the image.
>          - "read-only-rootfs" - Creates an image whose root filesystem is
> @@ -2231,7 +2178,7 @@ system and gives an overview of their function and contents.
>            such as ts_print, aplay, arecord and so forth.
>
>        For a complete list of image features that ships with the Yocto
> -      Project, see the "`Image Features <#ref-features-image>`__" section.
> +      Project, see the ":ref:`ref-features-image`" section.
>
>        For an example that shows how to customize your image by using this
>        variable, see the ":ref:`usingpoky-extend-customimage-imagefeatures`"
> @@ -2258,8 +2205,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           To add packages to the root filesystem, see the various
> -         \*RDEPENDS and \*RRECOMMENDS
> -         variables.
> +         \*:term:`RDEPENDS` and \*:term:`RRECOMMENDS` variables.
>
>     :term:`EXTRANATIVEPATH`
>        A list of subdirectories of
> @@ -2332,13 +2278,10 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Packages installed by features defined through
> -         FEATURE_PACKAGES
> +         Packages installed by features defined through ``FEATURE_PACKAGES``
>           are often package groups. While similarly named, you should not
> -         confuse the
> -         FEATURE_PACKAGES
> -         variable with package groups, which are discussed elsewhere in the
> -         documentation.
> +         confuse the ``FEATURE_PACKAGES`` variable with package groups, which
> +         are discussed elsewhere in the documentation.
>
>     :term:`FEED_DEPLOYDIR_BASE_URI`
>        Points to the base URL of the server and location within the
> @@ -2471,9 +2414,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           For a layer that supports a single BSP, the override could just be
> -         the value of
> -         MACHINE
> -         .
> +         the value of ``MACHINE``.
>
>        By prepending paths in ``.bbappend`` files, you allow multiple append
>        files that reside in different layers but are used for the same
> @@ -2498,10 +2439,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Do not hand-edit the
> -         FILESOVERRIDES
> -         variable. The values match up with expected overrides and are used
> -         in an expected manner by the build system.
> +         Do not hand-edit the ``FILESOVERRIDES`` variable. The values match up
> +         with expected overrides and are used in an expected manner by the
> +         build system.
>
>     :term:`FILESPATH`
>        The default set of directories the OpenEmbedded build system uses
> @@ -2674,11 +2614,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         If you specifically remove the locale
> -         en_US.UTF-8
> -         , you must set
> -         IMAGE_LINGUAS
> -         appropriately.
> +         If you specifically remove the locale ``en_US.UTF-8``, you must set
> +         :term:`IMAGE_LINGUAS` appropriately.
>
>        You can set ``GLIBC_GENERATE_LOCALES`` in your ``local.conf`` file.
>        By default, all locales are generated.
> @@ -2771,7 +2708,7 @@ system and gives an overview of their function and contents.
>        -  :term:`TARGET_CC_ARCH` when building for the
>           target
>
> -      -  ``BUILD_CC_ARCH`` when building for the build host (i.e.
> +      -  :term:`BUILD_CC_ARCH` when building for the build host (i.e.
>           ``-native``)
>
>        -  ``BUILDSDK_CC_ARCH`` when building for an SDK (i.e.
> @@ -2870,9 +2807,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           The options passed affect builds on all enabled machines on the
> -         network, which are machines running the
> -         iceccd
> -         daemon.
> +         network, which are machines running the ``iceccd`` daemon.
>
>        If your enabled machines support multiple cores, coming up with the
>        maximum number of parallel threads that gives you the best
> @@ -3046,11 +2981,10 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           To enable extra features from outside the image recipe, use the
> -         EXTRA_IMAGE_FEATURES
> -         variable.
> +         :term:`EXTRA_IMAGE_FEATURES` variable.
>
>        For a list of image features that ships with the Yocto Project, see
> -      the "`Image Features <#ref-features-image>`__" section.
> +      the ":ref:`ref-features-image`" section.
>
>        For an example that shows how to customize your image by using this
>        variable, see the ":ref:`usingpoky-extend-customimage-imagefeatures`"
> @@ -3104,7 +3038,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           -  When working with a
> -            ```core-image-minimal-initramfs`` <#images-core-image-minimal-initramfs>`__
> +            :ref:`core-image-minimal-initramfs <ref-manual/ref-images:images>`
>              image, do not use the ``IMAGE_INSTALL`` variable to specify
>              packages for installation. Instead, use the
>              :term:`PACKAGE_INSTALL` variable, which
> @@ -3219,10 +3153,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The
> -         package_tar
> -         class is broken and is not supported. It is recommended that you
> -         do not use it.
> +         The ``package_tar`` class is broken and is not supported. It is
> +         recommended that you do not use it.
>
>        The :ref:`populate_sdk_* <ref-classes-populate-sdk-*>` and
>        :ref:`image <ref-classes-image>` classes use the ``IMAGE_PKGTYPE``
> @@ -3237,10 +3169,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Files using the
> -         .tar
> -         format are never used as a substitute packaging format for DEB,
> -         RPM, and IPK formatted files for your image or SDK.
> +         Files using the ``.tar`` format are never used as a substitute
> +         packaging format for DEB, RPM, and IPK formatted files for your image
> +         or SDK.
>
>     :term:`IMAGE_POSTPROCESS_COMMAND`
>        Specifies a list of functions to call once the OpenEmbedded build
> @@ -3447,23 +3378,17 @@ system and gives an overview of their function and contents.
>
>           It is possible to define a list of licenses that are allowed to be
>           used instead of the licenses that are excluded. To do this, define
> -         a variable
> -         COMPATIBLE_LICENSES
> -         with the names of the licences that are allowed. Then define
> -         INCOMPATIBLE_LICENSE
> -         as:
> +         a variable ``COMPATIBLE_LICENSES`` with the names of the licences
> +         that are allowed. Then define ``INCOMPATIBLE_LICENSE`` as:
>           ::
>
>                   INCOMPATIBLE_LICENSE = "${@' '.join(sorted(set(d.getVar('AVAILABLE_LICENSES').split()) - set(d.getVar('COMPATIBLE_LICENSES').split())))}"
>
>
> -         This will result in
> -         INCOMPATIBLE_LICENSE
> -         containing the names of all licences from
> -         AVAILABLE_LICENSES
> -         except the ones specified in
> -         COMPATIBLE_LICENSES
> -         , thus only allowing the latter licences to be used.
> +         This will result in ``INCOMPATIBLE_LICENSE`` containing the names of
> +         all licences from :term:`AVAILABLE_LICENSES` except the ones specified
> +         in ``COMPATIBLE_LICENSES`` , thus only allowing the latter licences to
> +         be used.
>
>     :term:`INHERIT`
>        Causes the named class or classes to be inherited globally. Anonymous
> @@ -3536,13 +3461,11 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Use of the
> -         INHIBIT_SYSROOT_STRIP
> -         variable occurs in rare and special circumstances. For example,
> -         suppose you are building bare-metal firmware by using an external
> -         GCC toolchain. Furthermore, even if the toolchain's binaries are
> -         strippable, other files exist that are needed for the build that
> -         are not strippable.
> +         Use of the ``INHIBIT_SYSROOT_STRIP`` variable occurs in rare and
> +         special circumstances. For example, suppose you are building
> +         bare-metal firmware by using an external GCC toolchain. Furthermore,
> +         even if the toolchain's binaries are strippable, other files exist
> +         that are needed for the build that are not strippable.
>
>     :term:`INITRAMFS_FSTYPES`
>        Defines the format for the output image of an initial RAM filesystem
> @@ -3573,13 +3496,10 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         See the
> -         meta/recipes-core/images/core-image-minimal-initramfs.bb
> -         recipe in the
> -         Source Directory
> +         See the ``meta/recipes-core/images/core-image-minimal-initramfs.bb``
> +         recipe in the :term:`Source Directory`
>           for an example initramfs recipe. To select this sample recipe as
> -         the one built to provide the initramfs image, set
> -         INITRAMFS_IMAGE
> +         the one built to provide the initramfs image, set ``INITRAMFS_IMAGE``
>           to "core-image-minimal-initramfs".
>
>        You can also find more information by referencing the
> @@ -3637,10 +3557,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         You must set the
> -         INITRAMFS_IMAGE_BUNDLE
> -         variable in a configuration file. You cannot set the variable in a
> -         recipe file.
> +         You must set the ``INITRAMFS_IMAGE_BUNDLE`` variable in a
> +         configuration file. You cannot set the variable in a recipe file.
>
>        See the
>        :yocto_git:`local.conf.sample.extended </cgit/cgit.cgi/poky/tree/meta-poky/conf/local.conf.sample.extended>`
> @@ -3861,7 +3779,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The IMAGE_VERSION_SUFFIX variable is set to DATETIME.
> +         The ``IMAGE_VERSION_SUFFIX`` variable is set to :term:`DATETIME`.
>
>     :term:`KERNEL_CLASSES`
>        A list of classes defining kernel image types that the
> @@ -3879,7 +3797,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           Legacy support exists for specifying the full path to the device
> -         tree. However, providing just the .dtb file is preferred.
> +         tree. However, providing just the ``.dtb`` file is preferred.
>
>        In order to use this variable, the
>        :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
> @@ -4038,8 +3956,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         This variable replaces the deprecated
> -         module_autoload
> +         This variable replaces the deprecated :term:`module_autoload`
>           variable.
>
>        You can use the ``KERNEL_MODULE_AUTOLOAD`` variable anywhere that it
> @@ -4234,9 +4151,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Setting
> -         LAYERSERIES_COMPAT
> -         is required by the Yocto Project Compatible version 2 standard.
> +         Setting ``LAYERSERIES_COMPAT`` is required by the Yocto Project
> +         Compatible version 2 standard.
>           The OpenEmbedded build system produces a warning if the variable
>           is not set for any given layer.
>
> @@ -4484,9 +4400,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           Adding additional Board Support Package (BSP) layers to your
> -         configuration adds new possible settings for
> -         MACHINE
> -         .
> +         configuration adds new possible settings for ``MACHINE``.
>
>     :term:`MACHINE_ARCH`
>        Specifies the name of the machine-specific architecture. This
> @@ -4551,13 +4465,10 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         In this example, the
> -         kernel-module-ab123
> -         recipe needs to explicitly set its
> -         PACKAGES
> -         variable to ensure that BitBake does not use the kernel recipe's
> -         PACKAGES_DYNAMIC
> -         variable to satisfy the dependency.
> +         In this example, the ``kernel-module-ab123`` recipe needs to
> +         explicitly set its :term:`PACKAGES` variable to ensure that BitBake
> +         does not use the kernel recipe's :term:`PACKAGES_DYNAMIC` variable to
> +         satisfy the dependency.
>
>        Some examples of these machine essentials are flash, screen,
>        keyboard, mouse, or touchscreen drivers (depending on the machine).
> @@ -4625,8 +4536,7 @@ system and gives an overview of their function and contents.
>        :term:`IMAGE_FEATURES` variables.
>
>        For a list of hardware features supported by the Yocto Project as
> -      shipped, see the "`Machine Features <#ref-features-machine>`__"
> -      section.
> +      shipped, see the ":ref:`ref-features-machine`" section.
>
>     :term:`MACHINE_FEATURES_BACKFILL`
>        Features to be added to ``MACHINE_FEATURES`` if not also present in
> @@ -4635,15 +4545,13 @@ system and gives an overview of their function and contents.
>        This variable is set in the ``meta/conf/bitbake.conf`` file. It is
>        not intended to be user-configurable. It is best to just reference
>        the variable to see which machine features are being backfilled for
> -      all machine configurations. See the "`Feature
> -      Backfilling <#ref-features-backfill>`__" section for more
> -      information.
> +      all machine configurations. See the ":ref:`ref-features-backfill`"
> +      section for more information.
>
>     :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`
>        Features from ``MACHINE_FEATURES_BACKFILL`` that should not be
>        backfilled (i.e. added to ``MACHINE_FEATURES``) during the build. See
> -      the "`Feature Backfilling <#ref-features-backfill>`__" section for
> -      more information.
> +      the ":ref:`ref-features-backfill`" section for more information.
>
>     :term:`MACHINEOVERRIDES`
>        A colon-separated list of overrides that apply to the current
> @@ -4697,16 +4605,10 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The "ML" in
> -         MLPREFIX
> -         stands for "MultiLib". This representation is historical and comes
> -         from a time when
> -         nativesdk
> -         was a suffix rather than a prefix on the recipe name. When
> -         nativesdk
> -         was turned into a prefix, it made sense to set
> -         MLPREFIX
> -         for it as well.
> +         The "ML" in ``MLPREFIX`` stands for "MultiLib". This representation is
> +         historical and comes from a time when ``nativesdk`` was a suffix
> +         rather than a prefix on the recipe name. When ``nativesdk`` was turned
> +         into a prefix, it made sense to set ``MLPREFIX`` for it as well.
>
>        To help understand when ``MLPREFIX`` might be needed, consider when
>        :term:`BBCLASSEXTEND` is used to provide a
> @@ -4891,7 +4793,7 @@ system and gives an overview of their function and contents.
>
>           Some recommended packages might be required for certain system
>           functionality, such as kernel modules. It is up to you to add
> -         packages with the IMAGE_INSTALL variable.
> +         packages with the :term:`IMAGE_INSTALL` variable.
>
>        Support for this variable exists only when using the IPK and RPM
>        packaging backend. Support does not exist for DEB.
> @@ -4969,7 +4871,7 @@ system and gives an overview of their function and contents.
>     :term:`OEROOT`
>        The directory from which the top-level build environment setup script
>        is sourced. The Yocto Project provides a top-level build environment
> -      setup script: ````` <#structure-core-script>`__. When you run this
> +      setup script: :ref:`structure-core-script`. When you run this
>        script, the ``OEROOT`` variable resolves to the directory that
>        contains the script.
>
> @@ -5020,14 +4922,10 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         An easy way to see what overrides apply is to search for
> -         OVERRIDES
> -         in the output of the
> -         bitbake -e
> -         command. See the "
> -         Viewing Variable Values
> -         " section in the Yocto Project Development Tasks Manual for more
> -         information.
> +         An easy way to see what overrides apply is to search for ``OVERRIDES``
> +         in the output of the ``bitbake -e`` command. See the
> +         ":ref:`dev-debugging-viewing-variable-values`" section in the Yocto
> +         Project Development Tasks Manual for more information.
>
>     :term:`P`
>        The recipe name and version. ``P`` is comprised of the following:
> @@ -5062,9 +4960,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         See
> -         SDK_ARCH
> -         for more information.
> +         See :term:`SDK_ARCH` for more information.
>
>        However, if your recipe's output packages are built specific to the
>        target machine rather than generally for the architecture of the
> @@ -5098,8 +4994,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         While it is a legal option, the
> -         package_tar
> +         While it is a legal option, the ``package_tar``
>           class has limited functionality due to no support for package
>           dependencies by that backend. Therefore, it is recommended that
>           you do not use it.
> @@ -5209,8 +5104,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         You can use the
> -         PACKAGE_FEEDS_ARCHS
> +         You can use the ``PACKAGE_FEEDS_ARCHS``
>           variable to whitelist specific package architectures. If you do
>           not need to whitelist specific architectures, which is a common
>           case, you can omit this variable. Omitting the variable results in
> @@ -5228,7 +5122,8 @@ system and gives an overview of their function and contents.
>           PACKAGE_FEED_ARCHS = "all core2-64"
>
>        Given these settings, the resulting package feeds are as follows:
> -      ::
> +
> +      .. code-block:: none
>
>           https://example.com/packagerepos/release/rpm/all
>           https://example.com/packagerepos/release/rpm/core2-64
> @@ -5257,7 +5152,8 @@ system and gives an overview of their function and contents.
>           PACKAGE_FEED_ARCHS = "all core2-64"
>
>        Given these settings, the resulting package feeds are as follows:
> -      ::
> +
> +      .. code-block:: none
>
>           https://example.com/packagerepos/release/rpm/all
>           https://example.com/packagerepos/release/rpm/core2-64
> @@ -5286,7 +5182,8 @@ system and gives an overview of their function and contents.
>           PACKAGE_FEED_ARCHS = "all core2-64"
>
>        Given these settings, the resulting package feeds are as follows:
> -      ::
> +
> +      .. code-block:: none
>
>           https://example.com/packagerepos/release/rpm/all
>           https://example.com/packagerepos/release/rpm/core2-64
> @@ -5308,8 +5205,7 @@ system and gives an overview of their function and contents.
>        general, you should use the
>        :term:`IMAGE_INSTALL` variable to specify
>        packages for installation. The exception to this is when working with
> -      the
> -      ```core-image-minimal-initramfs`` <#images-core-image-minimal-initramfs>`__
> +      the :ref:`core-image-minimal-initramfs <ref-manual/ref-images:images>`
>        image. When working with an initial RAM filesystem (initramfs) image,
>        use the ``PACKAGE_INSTALL`` variable. For information on creating an
>        initramfs, see the ":ref:`building-an-initramfs-image`" section
> @@ -5424,8 +5320,11 @@ system and gives an overview of their function and contents.
>           block through an append file except you edit your ``local.conf``
>           or ``mydistro.conf`` file. As with append files previously
>           described, you can either completely override the variable:
> -         PACKAGECONFIG_pn-recipename = "f4 f5" Or, you can just amend the
> -         variable:
> +         ::
> +
> +            PACKAGECONFIG_pn-recipename = "f4 f5"
> +
> +         Or, you can just amend the variable:
>           ::
>
>              PACKAGECONFIG_append_pn-recipename = " f4"
> @@ -5511,17 +5410,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         In order for
> -         PARALLEL_MAKE
> -         to be effective,
> -         make
> -         must be called with
> -         ${
> -         EXTRA_OEMAKE
> -         }
> -         . An easy way to ensure this is to use the
> -         oe_runmake
> -         function.
> +         In order for ``PARALLEL_MAKE`` to be effective, ``make`` must be
> +         called with ``${``\ :term:`EXTRA_OEMAKE`\ ``}``. An easy way to ensure
> +         this is to use the ``oe_runmake`` function.
>
>        By default, the OpenEmbedded build system automatically sets this
>        variable to be equal to the number of cores the build system uses.
> @@ -5529,14 +5420,11 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           If the software being built experiences dependency issues during
> -         the
> -         do_compile
> -         task that result in race conditions, you can clear the
> -         PARALLEL_MAKE
> -         variable within the recipe as a workaround. For information on
> -         addressing race conditions, see the "
> -         Debugging Parallel Make Races
> -         " section in the Yocto Project Development Tasks Manual.
> +         the ``do_compile`` task that result in race conditions, you can clear
> +         the ``PARALLEL_MAKE`` variable within the recipe as a workaround. For
> +         information on addressing race conditions, see the
> +         ":ref:`dev-manual/dev-manual-common-tasks:debugging parallel make races`"
> +         section in the Yocto Project Development Tasks Manual.
>
>        For single socket systems (i.e. one CPU), you should not have to
>        override this variable to gain optimal parallelism during builds.
> @@ -5623,9 +5511,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         When using the
> -         PKG
> -         variable, you must use a package name override.
> +         When using the ``PKG`` variable, you must use a package name override.
>
>        For example, when the :ref:`debian <ref-classes-debian>` class
>        renames the output package, it does so by setting
> @@ -5768,14 +5654,11 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The OpenEmbedded build system does not need the aid of
> -         PR
> +         The OpenEmbedded build system does not need the aid of ``PR``
>           to know when to rebuild a recipe. The build system uses the task
> -         input checksums
> -         along with the
> -         stamp
> -         and
> -         shared state cache
> +         :ref:`input checksums <overview-checksums>` along with the
> +         :ref:`stamp <structure-build-tmp-stamps>` and
> +         :ref:`overview-manual/overview-manual-concepts:shared state cache`
>           mechanisms.
>
>        The ``PR`` variable primarily becomes significant when a package
> @@ -5790,8 +5673,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         PR
> -         does not need to be increased for changes that do not change the
> +         ``PR`` does not need to be increased for changes that do not change the
>           package contents or metadata.
>
>        Because manually managing ``PR`` can be cumbersome and error-prone,
> @@ -5826,17 +5708,11 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         If you use a
> -         virtual/\*
> -         item with
> -         PREFERRED_PROVIDER
> -         , then any recipe that
> -         PROVIDES
> -         that item but is not selected (defined) by
> -         PREFERRED_PROVIDER
> -         is prevented from building, which is usually desirable since this
> -         mechanism is designed to select between mutually exclusive
> -         alternative providers.
> +         If you use a ``virtual/\*`` item with ``PREFERRED_PROVIDER``, then any
> +         recipe that :term:`PROVIDES` that item but is not selected (defined)
> +         by ``PREFERRED_PROVIDER`` is prevented from building, which is usually
> +         desirable since this mechanism is designed to select between mutually
> +         exclusive alternative providers.
>
>     :term:`PREFERRED_VERSION`
>        If multiple versions of recipes exist, this variable determines which
> @@ -5897,8 +5773,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The \_forcevariable override is not handled specially. This override
> -         only works because the default value of OVERRIDES includes "forcevariable".
> +         The ``\_forcevariable`` override is not handled specially. This override
> +         only works because the default value of ``OVERRIDES`` includes "forcevariable".
>
>     :term:`PREMIRRORS`
>        Specifies additional paths from which the OpenEmbedded build system
> @@ -5988,9 +5864,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           Given that a recipe's own recipe name is already implicitly in its
> -         own
> -         PROVIDES
> -         list, it is unnecessary to add aliases with the "+=" operator;
> +         own PROVIDES list, it is unnecessary to add aliases with the "+=" operator;
>           using a simple assignment will be sufficient. In other words,
>           while you could write:
>           ::
> @@ -6122,8 +5996,15 @@ system and gives an overview of their function and contents.
>
>           RCONFLICTS_${PN} = "package (operator version)"
>
> -      For ``operator``, you can specify the following: = < > <=
> -      >= For example, the following sets up a dependency on version 1.2 or
> +      For ``operator``, you can specify the following:
> +
> +      - =
> +      - <
> +      - >
> +      - <=
> +      - >=
> +
> +      For example, the following sets up a dependency on version 1.2 or
>        greater of the package ``foo``:
>        ::
>
> @@ -6149,7 +6030,7 @@ system and gives an overview of their function and contents.
>        The practical effect of the above ``RDEPENDS`` assignment is that
>        ``bar`` and ``baz`` will be declared as dependencies inside the
>        package ``foo`` when it is written out by one of the
> -      ```do_package_write_*`` <#ref-tasks-package_write_deb>`__ tasks.
> +      :ref:`do_package_write_\* <ref-tasks-package_write_deb>` tasks.
>        Exactly how this is done depends on which package format is used,
>        which is determined by
>        :term:`PACKAGE_CLASSES`. When the
> @@ -6188,19 +6069,11 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         RDEPENDS_${PN}-dev
> -         includes
> -         ${
> -         PN
> -         }
> +         ``RDEPENDS_${PN}-dev`` includes ``${``\ :term:`PN`\ ``}``
>           by default. This default is set in the BitBake configuration file
> -         (
> -         meta/conf/bitbake.conf
> -         ). Be careful not to accidentally remove
> -         ${PN}
> -         when modifying
> -         RDEPENDS_${PN}-dev
> -         . Use the "+=" operator rather than the "=" operator.
> +         (``meta/conf/bitbake.conf``). Be careful not to accidentally remove
> +         ``${PN}`` when modifying ``RDEPENDS_${PN}-dev``. Use the "+=" operator
> +         rather than the "=" operator.
>
>        The package names you use with ``RDEPENDS`` must appear as they would
>        in the ``PACKAGES`` variable. The :term:`PKG` variable
> @@ -6219,14 +6092,20 @@ system and gives an overview of their function and contents.
>
>           RDEPENDS_${PN} = "package (operator version)"
>
> -      For operator, you can specify the following: = < > <= >= For version,
> -      provide the version number.
> +      For ``operator``, you can specify the following:
> +
> +      - =
> +      - <
> +      - >
> +      - <=
> +      - >=
> +
> +      For version, provide the version number.
>
>        .. note::
>
> -         You can use
> -         EXTENDPKGV
> -         to provide a full package version specification.
> +         You can use ``EXTENDPKGV`` to provide a full package version
> +         specification.
>
>        For example, the following sets up a dependency on version 1.2 or
>        greater of the package ``foo``:
> @@ -6355,9 +6234,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         A package's own name is implicitly already in its
> -         RPROVIDES
> -         list.
> +         A package's own name is implicitly already in its ``RPROVIDES`` list.
>
>        As with all package-controlling variables, you must always use the
>        variable in conjunction with a package name override. Here is an
> @@ -6546,13 +6423,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The
> -         SDK_DIR
> -         directory is a temporary directory as it is part of
> -         WORKDIR
> -         . The final output directory is
> -         SDK_DEPLOY
> -         .
> +         The ``SDK_DIR`` directory is a temporary directory as it is part of
> +         ``WORKDIR``. The final output directory is :term:`SDK_DEPLOY`.
>
>     :term:`SDK_EXT_TYPE`
>        Controls whether or not shared state artifacts are copied into the
> @@ -6563,9 +6435,8 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           If you set the variable to "minimal", you need to ensure
> -         SSTATE_MIRRORS
> -         is set in the SDK's configuration to enable the artifacts to be
> -         fetched as needed.
> +         :term:`SSTATE_MIRRORS` is set in the SDK's configuration to enable the
> +         artifacts to be fetched as needed.
>
>     :term:`SDK_HOST_MANIFEST`
>        The manifest file for the host part of the SDK. This file lists all
> @@ -6594,8 +6465,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Enabling the
> -         SDK_INCLUDE_PKGDATA
> +         Enabling the ``SDK_INCLUDE_PKGDATA``
>           variable significantly increases build time because all of world
>           needs to be built. Enabling the variable also slightly increases
>           the size of the extensible SDK.
> @@ -6702,9 +6572,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The SDK_OUTPUT directory is a temporary directory as it is part of
> -         WORKDIR by way of SDK_DIR. The final output directory is
> -         SDK_DEPLOY.
> +         The ``SDK_OUTPUT`` directory is a temporary directory as it is part of
> +         :term:`WORKDIR` by way of :term:`SDK_DIR`. The final output directory is
> +         :term:`SDK_DEPLOY`.
>
>     :term:`SDK_PACKAGE_ARCHS`
>        Specifies a list of architectures compatible with the SDK machine.
> @@ -6859,8 +6729,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         You cannot set the
> -         SDKMACHINE
> +         You cannot set the ``SDKMACHINE``
>           variable in your distribution configuration file. If you do, the
>           configuration will not take affect.
>
> @@ -6900,11 +6769,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The
> -         SERIAL_CONSOLE
> -         variable is deprecated. Please use the
> -         SERIAL_CONSOLES
> -         variable.
> +         The ``SERIAL_CONSOLE`` variable is deprecated. Please use the
> +         :term:`SERIAL_CONSOLES` variable.
>
>     :term:`SERIAL_CONSOLES`
>        Defines a serial console (TTY) to enable using
> @@ -6996,11 +6862,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         You must include
> -         conf/machine/include/soc-family.inc
> -         for this variable to appear in
> -         MACHINEOVERRIDES
> -         .
> +         You must include ``conf/machine/include/soc-family.inc`` for this
> +         variable to appear in :term:`MACHINEOVERRIDES`.
>
>     :term:`SOLIBS`
>        Defines the suffix for shared libraries used on the target platform.
> @@ -7033,8 +6896,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Do not set the
> -         SOURCE_MIRROR_FETCH
> +         Do not set the ``SOURCE_MIRROR_FETCH``
>           variable unless you are creating a source mirror. In other words,
>           do not set the variable during a normal build.
>
> @@ -7053,9 +6915,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         You can specify only a single URL in
> -         SOURCE_MIRROR_URL
> -         .
> +         You can specify only a single URL in ``SOURCE_MIRROR_URL``.
>
>     :term:`SPDXLICENSEMAP`
>        Maps commonly used license names to their SPDX counterparts found in
> @@ -7283,13 +7143,10 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           For information on limitations when inheriting the latest revision
> -         of software using
> -         SRCREV
> -         , see the
> -         AUTOREV
> -         variable description and the "
> -         Automatically Incrementing a Binary Package Revision Number
> -         " section, which is in the Yocto Project Development Tasks Manual.
> +         of software using ``SRCREV``, see the :term:`AUTOREV` variable
> +         description and the
> +         ":ref:`automatically-incrementing-a-binary-package-revision-number`"
> +         section, which is in the Yocto Project Development Tasks Manual.
>
>     :term:`SSTATE_DIR`
>        The directory for the shared state cache.
> @@ -7379,13 +7236,9 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           This style of build configuration has been largely replaced by
> -         pkg-config
> -         . Consequently, if
> -         pkg-config
> -         is supported by the library to which you are linking, it is
> -         recommended you use
> -         pkg-config
> -         instead of a provided configuration script.
> +         ``pkg-config``. Consequently, if ``pkg-config`` is supported by the
> +         library to which you are linking, it is recommended you use
> +         ``pkg-config`` instead of a provided configuration script.
>
>     :term:`STAGING_BINDIR_NATIVE`
>        Specifies the path to the ``/usr/bin`` subdirectory of the sysroot
> @@ -7414,15 +7267,10 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Recipes should never write files directly under the
> -         STAGING_DIR
> +         Recipes should never write files directly under the ``STAGING_DIR``
>           directory because the OpenEmbedded build system manages the
>           directory automatically. Instead, files should be installed to
> -         ${
> -         D
> -         }
> -         within your recipe's
> -         do_install
> +         ``${``\ :term:`D`\ ``}`` within your recipe's :ref:`ref-tasks-install`
>           task and then the OpenEmbedded build system will stage a subset of
>           those files into the sysroot.
>
> @@ -7668,12 +7516,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Programs built by
> -         -native
> -         recipes run directly from the sysroot (
> -         STAGING_DIR_NATIVE
> -         ), which is why additional directories containing program
> -         executables and supporting files need to be staged.
> +         Programs built by ``-native`` recipes run directly from the sysroot
> +         (:term:`STAGING_DIR_NATIVE`), which is why additional directories
> +         containing program executables and supporting files need to be staged.
>
>     :term:`SYSROOT_PREPROCESS_FUNCS`
>        A list of functions to execute after files are staged into the
> @@ -7819,14 +7664,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         It is a common workaround to append
> -         LDFLAGS
> -         to
> -         TARGET_CC_ARCH
> -         in recipes that build software for the target that would not
> -         otherwise respect the exported
> -         LDFLAGS
> -         variable.
> +         It is a common workaround to append :term:`LDFLAGS` to
> +         ``TARGET_CC_ARCH`` in recipes that build software for the target that
> +         would not otherwise respect the exported ``LDFLAGS`` variable.
>
>     :term:`TARGET_CC_KERNEL_ARCH`
>        This is a specific kernel compiler flag for a CPU or Application
> @@ -7929,7 +7769,7 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         You do not need to set the TARGET_SYS variable yourself.
> +         You do not need to set the ``TARGET_SYS`` variable yourself.
>
>        Consider these two examples:
>
> @@ -7973,16 +7813,13 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         If
> -         TCMODE
> -         is set to a value other than "default", then it is your
> +         If ``TCMODE`` is set to a value other than "default", then it is your
>           responsibility to ensure that the toolchain is compatible with the
>           default toolchain. Using older or newer versions of these
>           components might cause build problems. See the Release Notes for
>           the Yocto Project release for the specific components with which
>           the toolchain must be compatible. To access the Release Notes, go
> -         to the
> -         Downloads
> +         to the :yocto_home:`Downloads </software-overview/downloads>`
>           page on the Yocto Project website and click on the "RELEASE
>           INFORMATION" link for the appropriate release.
>
> @@ -8026,11 +7863,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Actual test results reside in the task log (
> -         log.do_testimage
> -         ), which is in the
> -         ${WORKDIR}/temp/
> -         directory.
> +         Actual test results reside in the task log (``log.do_testimage``),
> +         which is in the ``${WORKDIR}/temp/`` directory.
>
>     :term:`TEST_POWERCONTROL_CMD`
>        For automated hardware testing, specifies the command to use to
> @@ -8089,12 +7923,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         The
> -         TEST_SERVER_IP
> -         variable is only used for a small number of tests such as the
> -         "dnf" test suite, which needs to download packages from
> -         WORKDIR/oe-rootfs-repo
> -         .
> +         The ``TEST_SERVER_IP`` variable is only used for a small number of
> +         tests such as the "dnf" test suite, which needs to download packages
> +         from ``WORKDIR/oe-rootfs-repo``.
>
>     :term:`TEST_SUITES`
>        An ordered list of tests (modules) to run against an image when
> @@ -8169,8 +8000,7 @@ system and gives an overview of their function and contents.
>           .. note::
>
>              This argument is defined in
> -            meta/lib/oeqa/controllers/simpleremote.py
> -            .
> +            ``meta/lib/oeqa/controllers/simpleremote.py``.
>
>        For information on running tests on hardware, see the
>        ":ref:`hardware-image-enabling-tests`"
> @@ -8304,7 +8134,7 @@ system and gives an overview of their function and contents.
>     :term:`TOPDIR`
>        The top-level :term:`Build Directory`. BitBake
>        automatically sets this variable when you initialize your build
> -      environment using ````` <#structure-core-script>`__.
> +      environment using :ref:`structure-core-script`.
>
>     :term:`TRANSLATED_TARGET_ARCH`
>        A sanitized version of :term:`TARGET_ARCH`. This
> @@ -8728,20 +8558,11 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           There is a difference in behavior between setting
> -         USERADD_ERROR_DYNAMIC
> -         to
> -         error
> -         and setting it to
> -         warn
> -         . When it is set to
> -         warn
> -         , the build system will report a warning for every undefined
> -         uid
> -         and
> -         gid
> -         in any recipe. But when it is set to
> -         error
> -         , it will only report errors for recipes that are actually built.
> +         ``USERADD_ERROR_DYNAMIC`` to ``error`` and setting it to ``warn``.
> +         When it is set to ``warn``, the build system will report a warning for
> +         every undefined ``uid`` and ``gid`` in any recipe. But when it is set
> +         to ``error``, it will only report errors for recipes that are actually
> +         built.
>           This saves you from having to add static IDs for recipes that you
>           know will never be built.
>
> @@ -8761,12 +8582,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Setting the
> -         USERADDEXTENSION
> -         variable to "useradd-staticids" causes the build system to use
> -         static
> -         gid
> -         values.
> +         Setting the :term:`USERADDEXTENSION` variable to "useradd-staticids"
> +         causes the build system to use static ``gid`` values.
>
>     :term:`USERADD_PACKAGES`
>        When inheriting the :ref:`useradd <ref-classes-useradd>` class,
> @@ -8782,15 +8599,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         It follows that if you are going to use the
> -         USERADD_PACKAGES
> -         variable, you need to set one or more of the
> -         USERADD_PARAM
> -         ,
> -         GROUPADD_PARAM
> -         , or
> -         GROUPMEMS_PARAM
> -         variables.
> +         It follows that if you are going to use the ``USERADD_PACKAGES``
> +         variable, you need to set one or more of the :term:`USERADD_PARAM`,
> +         :term:`GROUPADD_PARAM`, or :term:`GROUPMEMS_PARAM` variables.
>
>     :term:`USERADD_PARAM`
>        When inheriting the :ref:`useradd <ref-classes-useradd>` class,
> @@ -8824,12 +8635,8 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Setting the
> -         USERADDEXTENSION
> -         variable to "useradd-staticids" causes the build system to use
> -         static
> -         uid
> -         values.
> +         Setting the :term:`USERADDEXTENSION` variable to "useradd-staticids"
> +         causes the build system to use static ``uid`` values.
>
>     :term:`USERADDEXTENSION`
>        When set to "useradd-staticids", causes the OpenEmbedded build system
> @@ -8842,13 +8649,9 @@ system and gives an overview of their function and contents.
>
>        .. note::
>
> -         Setting this variable to use static
> -         uid
> -         and
> -         gid
> +         Setting this variable to use static ``uid`` and ``gid``
>           values causes the OpenEmbedded build system to employ the
> -         useradd-staticids
> -         class.
> +         :ref:`ref-classes-useradd` class.
>
>        If you use static ``uid`` and ``gid`` information, you must also
>        specify the ``files/passwd`` and ``files/group`` files by setting the
> @@ -8919,22 +8722,13 @@ system and gives an overview of their function and contents.
>
>        The actual directory depends on several things:
>
> -      -  TMPDIR
> -         : The top-level build output directory
> -      -  MULTIMACH_TARGET_SYS
> -         : The target system identifier
> -      -  PN
> -         : The recipe name
> -      -  EXTENDPE
> -         : The epoch - (if
> -         PE
> -         is not specified, which is usually the case for most recipes, then
> -         EXTENDPE
> -         is blank)
> -      -  PV
> -         : The recipe version
> -      -  PR
> -         : The recipe revision
> +      -  :term:`TMPDIR`: The top-level build output directory
> +      -  :term:`MULTIMACH_TARGET_SYS`: The target system identifier
> +      -  :term:`PN`: The recipe name
> +      -  :term:`EXTENDPE`: The epoch - (if :term:`PE` is not specified, which
> +         is usually the case for most recipes, then `EXTENDPE` is blank)
> +      -  :term:`PV`: The recipe version
> +      -  :term:`PR`: The recipe revision
>
>        As an example, assume a Source Directory top-level folder name
>        ``poky``, a default Build Directory at ``poky/build``, and a
> diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
> index 2b82b7910..db9dd7e21 100644
> --- a/documentation/ref-manual/resources.rst
> +++ b/documentation/ref-manual/resources.rst
> @@ -65,27 +65,27 @@ and announcements. To subscribe to one of the following mailing lists,
>  click on the appropriate URL in the following list and follow the
>  instructions:
>
> --  https://lists.yoctoproject.org/g/yocto - General Yocto Project
> +-  :yocto_lists:`/g/yocto` - General Yocto Project
>     discussion mailing list.
>
> --  https://lists.openembedded.org/g/openembedded-core - Discussion mailing
> +-  :oe_lists:`/g/openembedded-core` - Discussion mailing
>     list about OpenEmbedded-Core (the core metadata).
>
> --  https://lists.openembedded.org/g/openembedded-devel - Discussion
> +-  :oe_lists:`/g/openembedded-devel` - Discussion
>     mailing list about OpenEmbedded.
>
> --  https://lists.openembedded.org/g/bitbake-devel - Discussion mailing
> +-  :oe_lists:`/g/bitbake-devel` - Discussion mailing
>     list about the :term:`BitBake` build tool.
>
> --  https://lists.yoctoproject.org/g/poky - Discussion mailing list
> -   about `Poky <#poky>`__.
> +-  :yocto_lists:`/g/poky` - Discussion mailing list
> +   about :term:`Poky`.
>
> --  https://lists.yoctoproject.org/g/yocto-announce - Mailing list to
> +-  :yocto_lists:`/g/yocto-announce` - Mailing list to
>     receive official Yocto Project release and milestone announcements.
>
>  For more Yocto Project-related mailing lists, see the
> -Yocto Project Website
> -.
> +:yocto_home:`Yocto Project Website <>`.
> +
>  .. _resources-irc:
>
>  Internet Relay Chat (IRC)
> @@ -113,12 +113,12 @@ Here is a list of resources you might find helpful:
>     planning, release engineering, QA & automation, a reference site map,
>     and other resources related to the Yocto Project.
>
> --  `OpenEmbedded <http://www.openembedded.org/>`__\ *:* The build system used by the
> +-  :oe_home:`OpenEmbedded <>`\ *:* The build system used by the
>     Yocto Project. This project is the upstream, generic, embedded
>     distribution from which the Yocto Project derives its build system
>     (Poky) and to which it contributes.
>
> --  `BitBake <http://www.openembedded.org/wiki/BitBake>`__\ *:* The tool
> +-  :oe_home:`BitBake </wiki/BitBake>`\ *:* The tool
>     used to process metadata.
>
>  -  :doc:`BitBake User Manual <bitbake:index>`\ *:* A comprehensive
> @@ -155,7 +155,7 @@ Here is a list of resources you might find helpful:
>     manual provides reference material such as variable, task, and class
>     descriptions.
>
> --  `Yocto Project Mega-Manual <https://docs.yoctoproject.org/singleindex.html>`__\ *:* This manual
> +-  :yocto_docs:`Yocto Project Mega-Manual </singleindex.html>`\ *:* This manual
>     is simply a single HTML file comprised of the bulk of the Yocto
>     Project manuals. The Mega-Manual primarily exists as a vehicle by
>     which you can easily search for phrases and terms used in the Yocto
> @@ -180,7 +180,7 @@ Here is a list of resources you might find helpful:
>     the Yocto Project website and click on the "RELEASE INFORMATION" link
>     for the appropriate release.
>
> --  `Bugzilla <https://bugzilla.yoctoproject.org>`__\ *:* The bug tracking application
> +-  :yocto_bugs:`Bugzilla <>`\ *:* The bug tracking application
>     the Yocto Project uses. If you find problems with the Yocto Project,
>     you should report them using this application.
>
> --
> 2.26.2
>
>
> 
>
