Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web12.27867.1604301603168689633
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Nov 2020 23:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aGUTRjek;
 spf=pass (domain: linaro.org, ip: 209.85.219.180, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f180.google.com with SMTP id h196so10927202ybg.4
        for <docs@lists.yoctoproject.org>; Sun, 01 Nov 2020 23:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FvlhKlWNICx6/HnwyQJ/aH+3TblyjL0B9ZzMOVmdeuk=;
        b=aGUTRjek08cGYNhs21vfHC4PDeT98OxhZ1PKoOdJ4bvp8pPplPAwYaWMiX1vqWAhoh
         YahoTsQWu82uALlfN1n7MfolHheHzB8LkV5wh39ODvcYGlUXSZEldpXrS0X8vFnTYWJk
         5Jf7bdtf4BMdKny3sP6TYmuW0Yp9TF86UkLWEynIFGW1yIoQLQIuExJJu1rgB4Ht9k9e
         up11MCXwLlrSlraCOsBGISdgSsbZl+n60abPQD9u/VXhsEmBBVYf2GIlC1cQvjMWV0z1
         7E61mK+x8C8aoHIeAF/TaPEmkJuGWEGFsaP6LqoTj4oxUYBiJ6bHCWeaGlGRet9kdXxN
         zemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FvlhKlWNICx6/HnwyQJ/aH+3TblyjL0B9ZzMOVmdeuk=;
        b=jaECQwXXikCQ71M2XjwyYeCQp1fZr1Zyu2Eb1tpLpuEY0ikha3lnnFaJUbKha5P9FZ
         +zNohDooOO8pjqwG4AAO3bRB/U3ER1ylgK+J2fikdnMNyiTTgnEQABpcPm3myok+RqOw
         RPIdNcKuv35f9+Dpl+CCiiZe0KxZVW4D79RCzMviIyPOZWbVjLHOaeUBQEbrYH4WGjmT
         4qxYK4fTIXB4RgJ4xT109Gq92DhqFtZnYuaykpTH+X8M6ELbnxpHO1T58InxVeQzmyAQ
         bOsFBrKibPQ+BQ9G8NRvvJCjZ4s1E7GKIjmNEcVFBltBcecaamTyUPJnLBh1YN6JyUHu
         X+wQ==
X-Gm-Message-State: AOAM531UZRyN3CXyiRtkbx34GbTCgl/LrdndjDMM3cls7eDik47FTfm0
	f0bPOcjZLnoZlRJbZOyuR5eaZyLSVSw5GgY/Ey9w0CfBy6krdw==
X-Google-Smtp-Source: ABdhPJzrj6KUxet0yzzjjyJ0Z7SQFdss0NyNrthHYFbMjsquDCwX8rm4WYvBWX5XYGjvbXNsYktl5d2i+pT+pZJa0eY=
X-Received: by 2002:a25:3813:: with SMTP id f19mr19733209yba.373.1604301601342;
 Sun, 01 Nov 2020 23:20:01 -0800 (PST)
MIME-Version: 1.0
References: <365bd4ec-fc1-f599-7553-f92352694fd2@crashcourse.ca>
In-Reply-To: <365bd4ec-fc1-f599-7553-f92352694fd2@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 2 Nov 2020 08:19:49 +0100
Message-ID: <CAP71Wjw3SyLCc5982b=1oDWXxSQ+Bc1VuUj1Apf6LDm5ikhm2A@mail.gmail.com>
Subject: Re: [docs] [PATCH] globally change ":doc:`../<manual>" to ":doc:`/<manual>"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hey Robert,

On Sat, Oct 31, 2020 at 8:08 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> Apparently, the :doc: directive works fine with absolute pathnames,
> which are more stable in case any .rst files get moved around, so
> change all relative pathnames to absolute pathnames via a simple Perl
> script.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

The patch looks good, but this time again, I am not able to apply it
locally. I hope it's not something wrong on my end.. But using both
"git am" and "patch" fails for me.

>
> ---
>
>   i checked a number of references that were changed due to this, and
> they all seemed to work just fine.
>
> diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> index c9622d364..c4e7eed2a 100644
> --- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> +++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> @@ -39,7 +39,7 @@ build a reference embedded OS called Poky.
>        Tasks Manual for more information.
>
>  If you want more conceptual or background information on the Yocto
> -Project, see the :doc:`../overview-manual/overview-manual`.
> +Project, see the :doc:`/overview-manual/overview-manual`.
>
>  Compatible Linux Distribution
>  =============================
> @@ -404,7 +404,7 @@ information including the website, wiki pages, and user manuals:
>     concepts are useful for the beginner.
>
>  -  **Yocto Project Overview and Concepts Manual:** The
> -   :doc:`../overview-manual/overview-manual` is a great
> +   :doc:`/overview-manual/overview-manual` is a great
>     place to start to learn about the Yocto Project. This manual
>     introduces you to the Yocto Project and its development environment.
>     The manual also provides conceptual information for various aspects
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 27aacde60..2acecfbbc 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -1351,7 +1351,7 @@ to determine how well the build went.
>     ``log.do_fetch``, and ``log.do_compile``).
>
>  You can find more information about the build process in
> -":doc:`../overview-manual/overview-manual-development-environment`"
> +":doc:`/overview-manual/overview-manual-development-environment`"
>  chapter of the Yocto Project Overview and Concepts Manual.
>
>  .. _new-recipe-fetching-code:
> @@ -3744,7 +3744,7 @@ build host running Linux.
>
>     -  For information on how to build an image using
>        :term:`Toaster`, see the
> -      :doc:`../toaster-manual/toaster-manual`.
> +      :doc:`/toaster-manual/toaster-manual`.
>
>     -  For information on how to use ``devtool`` to build images, see the
>        ":ref:`sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow`"
> @@ -3753,7 +3753,7 @@ build host running Linux.
>
>     -  For a quick example on how to build an image using the
>        OpenEmbedded build system, see the
> -      :doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document.
> +      :doc:`/brief-yoctoprojectqs/brief-yoctoprojectqs` document.
>
>  The build process creates an entire Linux distribution from source and
>  places it in your :term:`Build Directory` under
> @@ -3828,7 +3828,7 @@ The following figure and list overviews the build process:
>     kernels built by the OpenEmbedded build system are placed in the
>     Build Directory in ``tmp/deploy/images``. For information on how to
>     run pre-built images such as ``qemux86`` and ``qemuarm``, see the
> -   :doc:`../sdk-manual/sdk-manual` manual. For
> +   :doc:`/sdk-manual/sdk-manual` manual. For
>     information about how to install these images, see the documentation
>     for your particular board or machine.
>
> diff --git a/documentation/dev-manual/dev-manual-intro.rst b/documentation/dev-manual/dev-manual-intro.rst
> index 05136f735..da70467b5 100644
> --- a/documentation/dev-manual/dev-manual-intro.rst
> +++ b/documentation/dev-manual/dev-manual-intro.rst
> @@ -33,13 +33,13 @@ This manual provides the following:
>  This manual does not provide the following:
>
>  -  Redundant Step-by-step Instructions: For example, the
> -   :doc:`../sdk-manual/sdk-manual` manual contains detailed
> +   :doc:`/sdk-manual/sdk-manual` manual contains detailed
>     instructions on how to install an SDK, which is used to develop
>     applications for target hardware.
>
>  -  Reference or Conceptual Material: This type of material resides in an
>     appropriate reference manual. For example, system variables are
> -   documented in the :doc:`../ref-manual/ref-manual`.
> +   documented in the :doc:`/ref-manual/ref-manual`.
>
>  -  Detailed Public Information Not Specific to the Yocto Project: For
>     example, exhaustive information on how to use the Source Control
> @@ -54,7 +54,7 @@ supplemental information is recommended for full comprehension. For
>  introductory information on the Yocto Project, see the
>  :yocto_home:`Yocto Project Website <>`. If you want to build an image with no
>  knowledge of Yocto Project as a way of quickly testing it out, see the
> -:doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document.
> +:doc:`/brief-yoctoprojectqs/brief-yoctoprojectqs` document.
>
>  For a comprehensive list of links and other documentation, see the
>  ":ref:`ref-manual/resources:links and related documentation`"
> diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
> index a85b86fbf..59a69061f 100644
> --- a/documentation/dev-manual/dev-manual-start.rst
> +++ b/documentation/dev-manual/dev-manual-start.rst
> @@ -346,10 +346,10 @@ using a given development path on your native Linux machine. If you are
>  going to use BitBake, see the
>  ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`"
>  section. If you are going
> -to use the Extensible SDK, see the ":doc:`../sdk-manual/sdk-extensible`" Chapter in the Yocto
> +to use the Extensible SDK, see the ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
>  Project Application Development and the Extensible Software Development
> -Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`../kernel-dev/kernel-dev`. If you are going to use
> -Toaster, see the ":doc:`../toaster-manual/toaster-manual-setup-and-use`"
> +Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`/kernel-dev/kernel-dev`. If you are going to use
> +Toaster, see the ":doc:`/toaster-manual/toaster-manual-setup-and-use`"
>  section in the Toaster User Manual.
>
>  .. _setting-up-to-use-crops:
> @@ -448,10 +448,10 @@ as if you were running on a native Linux machine. If you are going to
>  use the Poky container, see the
>  ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`"
>  section. If you are going to use the Extensible SDK container, see the
> -":doc:`../sdk-manual/sdk-extensible`" Chapter in the Yocto
> +":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
>  Project Application Development and the Extensible Software Development
>  Kit (eSDK) manual. If you are going to use the Toaster container, see
> -the ":doc:`../toaster-manual/toaster-manual-setup-and-use`"
> +the ":doc:`/toaster-manual/toaster-manual-setup-and-use`"
>  section in the Toaster User Manual.
>
>  .. _setting-up-to-use-wsl:
> @@ -565,10 +565,10 @@ your Yocto Project build host:
>
>  Once you have WSLv2 set up, everything is in place to develop just as if
>  you were running on a native Linux machine. If you are going to use the
> -Extensible SDK container, see the ":doc:`../sdk-manual/sdk-extensible`" Chapter in the Yocto
> +Extensible SDK container, see the ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
>  Project Application Development and the Extensible Software Development
>  Kit (eSDK) manual. If you are going to use the Toaster container, see
> -the ":doc:`../toaster-manual/toaster-manual-setup-and-use`"
> +the ":doc:`/toaster-manual/toaster-manual-setup-and-use`"
>  section in the Toaster User Manual.
>
>  Locating Yocto Project Source Files
> diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/kernel-dev-advanced.rst
> index 444037c3a..d1011c9f2 100644
> --- a/documentation/kernel-dev/kernel-dev-advanced.rst
> +++ b/documentation/kernel-dev/kernel-dev-advanced.rst
> @@ -476,7 +476,7 @@ supported kernel type.
>  This section overviews the BSP description structure, the aggregation
>  concepts, and presents a detailed example using a BSP supported by the
>  Yocto Project (i.e. BeagleBone Board). For complete information on BSP
> -layer file hierarchy, see the :doc:`../bsp-guide/bsp-guide`.
> +layer file hierarchy, see the :doc:`/bsp-guide/bsp-guide`.
>
>  .. _bsp-description-file-overview:
>
> diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
> index 830b3e88c..3449847ea 100644
> --- a/documentation/kernel-dev/kernel-dev-common.rst
> +++ b/documentation/kernel-dev/kernel-dev-common.rst
> @@ -21,7 +21,7 @@ Preparing the Build Host to Work on the Kernel
>
>  Before you can do any kernel development, you need to be sure your build
>  host is set up to use the Yocto Project. For information on how to get
> -set up, see the ":doc:`../dev-manual/dev-manual-start`" section in
> +set up, see the ":doc:`/dev-manual/dev-manual-start`" section in
>  the Yocto Project Development Tasks Manual. Part of preparing the system
>  is creating a local Git repository of the
>  :term:`Source Directory` (``poky``) on your system. Follow the steps in the
> @@ -502,7 +502,7 @@ your layer in the following area:
>  .. note::
>
>     If you are working on a new machine Board Support Package (BSP), be
> -   sure to refer to the :doc:`../bsp-guide/bsp-guide`.
> +   sure to refer to the :doc:`/bsp-guide/bsp-guide`.
>
>  As an example, consider the following append file used by the BSPs in
>  ``meta-yocto-bsp``:
> diff --git a/documentation/kernel-dev/kernel-dev-intro.rst b/documentation/kernel-dev/kernel-dev-intro.rst
> index 5679a0ab8..6a4f79c12 100644
> --- a/documentation/kernel-dev/kernel-dev-intro.rst
> +++ b/documentation/kernel-dev/kernel-dev-intro.rst
> @@ -81,9 +81,9 @@ facilitate the process of working with the kernel recipes. If you find
>  you need some additional background, please be sure to review and
>  understand the following documentation:
>
> --  :doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document.
> +-  :doc:`/brief-yoctoprojectqs/brief-yoctoprojectqs` document.
>
> --  :doc:`../overview-manual/overview-manual`.
> +-  :doc:`/overview-manual/overview-manual`.
>
>  -  :ref:`devtool
>     workflow <sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow>`
> @@ -113,7 +113,7 @@ general information and references for further information.
>     :align: center
>
>  1. *Set up Your Host Development System to Support Development Using the
> -   Yocto Project*: See the ":doc:`../dev-manual/dev-manual-start`" section in
> +   Yocto Project*: See the ":doc:`/dev-manual/dev-manual-start`" section in
>     the Yocto Project Development Tasks Manual for options on how to get
>     a build host ready to use the Yocto Project.
>
> diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
> index d9f50e519..a91ed22f2 100644
> --- a/documentation/overview-manual/overview-manual-concepts.rst
> +++ b/documentation/overview-manual/overview-manual-concepts.rst
> @@ -494,7 +494,7 @@ The BSP Layer provides machine configurations that target specific
>  hardware. Everything in this layer is specific to the machine for which
>  you are building the image or the SDK. A common structure or form is
>  defined for BSP layers. You can learn more about this structure in the
> -:doc:`../bsp-guide/bsp-guide`.
> +:doc:`/bsp-guide/bsp-guide`.
>
>  .. note::
>
> @@ -1320,7 +1320,7 @@ this output:
>  .. note::
>
>     For a list of example images that the Yocto Project provides, see the
> -   ":doc:`../ref-manual/ref-images`" chapter in the Yocto Project Reference
> +   ":doc:`/ref-manual/ref-images`" chapter in the Yocto Project Reference
>     Manual.
>
>  The build process writes images out to the :term:`Build Directory`
> @@ -1403,7 +1403,7 @@ can initialize the environment before using the tools.
>        section.
>
>     -  For information on setting up a cross-development environment, see
> -      the :doc:`../sdk-manual/sdk-manual` manual.
> +      the :doc:`/sdk-manual/sdk-manual` manual.
>
>  All the output files for an SDK are written to the ``deploy/sdk`` folder
>  inside the :term:`Build Directory` as
> @@ -1483,7 +1483,7 @@ The Yocto Project does most of the work for you when it comes to
>  creating :ref:`sdk-manual/sdk-intro:the cross-development toolchain`. This
>  section provides some technical background on how cross-development
>  toolchains are created and used. For more information on toolchains, you
> -can also see the :doc:`../sdk-manual/sdk-manual` manual.
> +can also see the :doc:`/sdk-manual/sdk-manual` manual.
>
>  In the Yocto Project development environment, cross-development
>  toolchains are used to build images and applications that run on the
> diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
> index 4bedd6df6..eccd1f67c 100644
> --- a/documentation/overview-manual/overview-manual-development-environment.rst
> +++ b/documentation/overview-manual/overview-manual-development-environment.rst
> @@ -105,7 +105,7 @@ methods exist for you to do work in the Yocto Project environment:
>     hardware. To development BSPs, you need to take some additional steps
>     beyond what was described in setting up a development host.
>
> -   The :doc:`../bsp-guide/bsp-guide` provides BSP-related development
> +   The :doc:`/bsp-guide/bsp-guide` provides BSP-related development
>     information. For specifics on development host preparation, see the
>     ":ref:`bsp-guide/bsp:preparing your build host to work with bsp layers`"
>     section in the Yocto Project Board Support Package (BSP) Developer's
> @@ -116,7 +116,7 @@ methods exist for you to do work in the Yocto Project environment:
>     using ``devtool`` makes kernel development quicker by reducing
>     iteration cycle times.
>
> -   The :doc:`../kernel-dev/kernel-dev` provides kernel-related
> +   The :doc:`/kernel-dev/kernel-dev` provides kernel-related
>     development information. For specifics on development host
>     preparation, see the
>     ":ref:`kernel-dev/kernel-dev-common:preparing the build host to work on the kernel`"
> @@ -132,7 +132,7 @@ methods exist for you to do work in the Yocto Project environment:
>
>     For steps that show you how to set up your development host to use
>     Toaster and on how to use Toaster in general, see the
> -   :doc:`../toaster-manual/toaster-manual`.
> +   :doc:`/toaster-manual/toaster-manual`.
>
>  .. _yocto-project-repositories:
>
> diff --git a/documentation/overview-manual/overview-manual-intro.rst b/documentation/overview-manual/overview-manual-intro.rst
> index 8885eb89f..2dddf51ae 100644
> --- a/documentation/overview-manual/overview-manual-intro.rst
> +++ b/documentation/overview-manual/overview-manual-intro.rst
> @@ -39,17 +39,17 @@ This manual does not give you the following:
>
>  -  *Step-by-step Instructions for Development Tasks:* Instructional
>     procedures reside in other manuals within the Yocto Project
> -   documentation set. For example, the :doc:`../dev-manual/dev-manual`
> +   documentation set. For example, the :doc:`/dev-manual/dev-manual`
>     provides examples on how to perform
>     various development tasks. As another example, the
> -   :doc:`../sdk-manual/sdk-manual` manual contains detailed
> +   :doc:`/sdk-manual/sdk-manual` manual contains detailed
>     instructions on how to install an SDK, which is used to develop
>     applications for target hardware.
>
>  -  *Reference Material:* This type of material resides in an appropriate
>     reference manual. For example, system variables are documented in the
> -   :doc:`../ref-manual/ref-manual`. As another
> -   example, the :doc:`../bsp-guide/bsp-guide` contains reference information on
> +   :doc:`/ref-manual/ref-manual`. As another
> +   example, the :doc:`/bsp-guide/bsp-guide` contains reference information on
>     BSPs.
>
>  -  *Detailed Public Information Not Specific to the Yocto Project:* For
> @@ -67,7 +67,7 @@ supplemental information is recommended for full comprehension. For
>  additional introductory information on the Yocto Project, see the
>  :yocto_home:`Yocto Project Website <>`. If you want to build an image
>  with no knowledge of Yocto Project as a way of quickly testing it out,
> -see the :doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document.
> +see the :doc:`/brief-yoctoprojectqs/brief-yoctoprojectqs` document.
>  For a comprehensive list of links and other documentation, see the
>  ":ref:`Links and Related
>  Documentation <resources-links-and-related-documentation>`"
> diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
> index 9073582ac..86f2ce938 100644
> --- a/documentation/overview-manual/overview-manual-yp-intro.rst
> +++ b/documentation/overview-manual/overview-manual-yp-intro.rst
> @@ -255,7 +255,7 @@ accomplish this through a recipe that is a BitBake append
>  .. note::
>
>     For general information on BSP layer structure, see the
> -   :doc:`../bsp-guide/bsp-guide`
> +   :doc:`/bsp-guide/bsp-guide`
>     .
>
>  The :term:`Source Directory`
> @@ -346,12 +346,12 @@ applications using the Yocto Project:
>     experience supplemented with the powerful set of ``devtool`` commands
>     tailored for the Yocto Project environment.
>
> -   For information on the eSDK, see the :doc:`../sdk-manual/sdk-manual` Manual.
> +   For information on the eSDK, see the :doc:`/sdk-manual/sdk-manual` Manual.
>
>  -  *Toaster:* Toaster is a web interface to the Yocto Project
>     OpenEmbedded build system. Toaster allows you to configure, run, and
>     view information about builds. For information on Toaster, see the
> -   :doc:`../toaster-manual/toaster-manual`.
> +   :doc:`/toaster-manual/toaster-manual`.
>
>  .. _gs-production-tools:
>
> @@ -669,7 +669,7 @@ Project.
>     configure and start builds on multiple remote build servers.
>
>     For information about and how to use Toaster, see the
> -   :doc:`../toaster-manual/toaster-manual`.
> +   :doc:`/toaster-manual/toaster-manual`.
>
>  .. _reference-embedded-distribution:
>
> @@ -741,7 +741,7 @@ Poky has a regular, well established, six-month release cycle under its
>  own version. Major releases occur at the same time major releases (point
>  releases) occur for the Yocto Project, which are typically in the Spring
>  and Fall. For more information on the Yocto Project release schedule and
> -cadence, see the ":doc:`../ref-manual/ref-release-process`" chapter in the
> +cadence, see the ":doc:`/ref-manual/ref-release-process`" chapter in the
>  Yocto Project Reference Manual.
>
>  Much has been said about Poky being a "default configuration". A default
> @@ -835,7 +835,7 @@ helpful for getting started:
>     application developers. This eSDK allows developers to incorporate
>     their library and programming changes back into the image to make
>     their code available to other application developers. For information
> -   on the eSDK, see the :doc:`../sdk-manual/sdk-manual` manual.
> +   on the eSDK, see the :doc:`/sdk-manual/sdk-manual` manual.
>
>  -  *Layer:* A collection of related recipes. Layers allow you to
>     consolidate related metadata to customize your build. Layers also
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index 8c2b34be5..b4b4bca5d 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -47,7 +47,7 @@ Support Package (BSP) layer for it. For more information on how to
>  create a BSP layer, see the
>  ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
>  section in the Yocto Project Development Tasks Manual and the
> -:doc:`../bsp-guide/bsp-guide`.
> +:doc:`/bsp-guide/bsp-guide`.
>
>  Usually, if the board is not completely exotic, adding support in the
>  Yocto Project is fairly straightforward.
> diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
> index 0220221e0..d5a3966f7 100644
> --- a/documentation/ref-manual/migration-2.1.rst
> +++ b/documentation/ref-manual/migration-2.1.rst
> @@ -234,7 +234,7 @@ functionality almost completely overlapped with the :ref:`standard
>  SDK <sdk-manual/sdk-using:using the standard sdk>` and the
>  :ref:`extensible SDK <sdk-manual/sdk-extensible:using the extensible sdk>`. For
>  information on these SDKs and how to build and use them, see the
> -:doc:`../sdk-manual/sdk-manual` manual.
> +:doc:`/sdk-manual/sdk-manual` manual.
>
>  .. note::
>
> diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
> index 9b9ddf53f..f178e4acc 100644
> --- a/documentation/ref-manual/ref-devtool-reference.rst
> +++ b/documentation/ref-manual/ref-devtool-reference.rst
> @@ -11,7 +11,7 @@ is a key part of the extensible SDK.
>
>  This chapter provides a Quick Reference for the ``devtool`` command. For
>  more information on how to apply the command when using the extensible
> -SDK, see the ":doc:`../sdk-manual/sdk-extensible`" chapter in the Yocto
> +SDK, see the ":doc:`/sdk-manual/sdk-extensible`" chapter in the Yocto
>  Project Application Development and the Extensible Software Development
>  Kit (eSDK) manual.
>
> diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
> index f28ad2bb4..7f781a148 100644
> --- a/documentation/ref-manual/ref-features.rst
> +++ b/documentation/ref-manual/ref-features.rst
> @@ -261,7 +261,7 @@ these valid features is as follows:
>
>  -  *perf:* Installs profiling tools such as ``perf``, ``systemtap``, and
>     ``LTTng``. For general information on user-space tools, see the
> -   :doc:`../sdk-manual/sdk-manual` manual.
> +   :doc:`/sdk-manual/sdk-manual` manual.
>
>  -  *ssh-server-dropbear:* Installs the Dropbear minimal SSH server.
>
> @@ -275,7 +275,7 @@ these valid features is as follows:
>     ``gdb``. For information on GDB, see the
>     ":ref:`platdev-gdb-remotedebug`" section
>     in the Yocto Project Development Tasks Manual. For information on
> -   tracing and profiling, see the :doc:`../profile-manual/profile-manual`.
> +   tracing and profiling, see the :doc:`/profile-manual/profile-manual`.
>
>  -  *tools-sdk:* Installs a full SDK that runs on the device.
>
> diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
> index db1ea9797..1e346f8dd 100644
> --- a/documentation/ref-manual/ref-structure.rst
> +++ b/documentation/ref-manual/ref-structure.rst
> @@ -104,7 +104,7 @@ metadata to define the Poky reference distribution.
>
>  This directory contains the Yocto Project reference hardware Board
>  Support Packages (BSPs). For more information on BSPs, see the
> -:doc:`../bsp-guide/bsp-guide`.
> +:doc:`/bsp-guide/bsp-guide`.
>
>  .. _structure-meta-selftest:
>
> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> index fe7c9252c..685ef3b2f 100644
> --- a/documentation/ref-manual/ref-system-requirements.rst
> +++ b/documentation/ref-manual/ref-system-requirements.rst
> @@ -20,9 +20,9 @@ chapter in the Yocto Project Overview and Concepts Manual.
>
>  If you want to use the Yocto Project to quickly build an image without
>  having to understand concepts, work through the
> -:doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document. You can find "how-to"
> -information in the :doc:`../dev-manual/dev-manual`. You can find Yocto Project overview
> -and conceptual information in the :doc:`../overview-manual/overview-manual`.
> +:doc:`/brief-yoctoprojectqs/brief-yoctoprojectqs` document. You can find "how-to"
> +information in the :doc:`/dev-manual/dev-manual`. You can find Yocto Project overview
> +and conceptual information in the :doc:`/overview-manual/overview-manual`.
>
>  .. note::
>
> diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
> index b4ceebc0b..841cd063b 100644
> --- a/documentation/ref-manual/ref-terms.rst
> +++ b/documentation/ref-manual/ref-terms.rst
> @@ -384,7 +384,7 @@ universal, the list includes them just in case:
>        The interface enables you to
>        configure and run your builds. Information about builds is collected
>        and stored in a database. For information on Toaster, see the
> -      :doc:`../toaster-manual/toaster-manual`.
> +      :doc:`/toaster-manual/toaster-manual`.
>
>     :term:`Upstream`
>        A reference to source code or repositories that are not
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index e552351e3..3a6e8d6fb 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -2907,7 +2907,7 @@ system and gives an overview of their function and contents.
>        ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
>        section of the Yocto Project Development Tasks Manual. Reference
>        material for Wic is located in the
> -      ":doc:`../ref-manual/ref-kickstart`" chapter.
> +      ":doc:`/ref-manual/ref-kickstart`" chapter.
>
>     :term:`IMAGE_BOOT_FILES`
>        A space-separated list of files installed into the boot partition
> @@ -2943,7 +2943,7 @@ system and gives an overview of their function and contents.
>        ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
>        section of the Yocto Project Development Tasks Manual. Reference
>        material for Wic is located in the
> -      ":doc:`../ref-manual/ref-kickstart`" chapter.
> +      ":doc:`/ref-manual/ref-kickstart`" chapter.
>
>     :term:`IMAGE_CLASSES`
>        A list of classes that all images should inherit. You typically use
> @@ -8154,7 +8154,7 @@ system and gives an overview of their function and contents.
>        ":ref:`sdk-manual/sdk-intro:the cross-development toolchain`"
>        section in the Yocto Project Overview and Concepts Manual. For
>        information on setting up a cross-development environment, see the
> -      :doc:`../sdk-manual/sdk-manual` manual.
> +      :doc:`/sdk-manual/sdk-manual` manual.
>
>     :term:`TOOLCHAIN_OUTPUTNAME`
>        This variable defines the name used for the toolchain output. The
> @@ -8184,7 +8184,7 @@ system and gives an overview of their function and contents.
>        ":ref:`sdk-manual/sdk-intro:the cross-development toolchain`"
>        section in the Yocto Project Overview and Concepts Manual. For
>        information on setting up a cross-development environment, see the
> -      :doc:`../sdk-manual/sdk-manual` manual.
> +      :doc:`/sdk-manual/sdk-manual` manual.
>
>     :term:`TOPDIR`
>        The top-level :term:`Build Directory`. BitBake
> @@ -8737,7 +8737,7 @@ system and gives an overview of their function and contents.
>        image, see the
>        ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
>        section in the Yocto Project Development Tasks Manual. For details on
> -      the kickstart file format, see the ":doc:`../ref-manual/ref-kickstart`" Chapter.
> +      the kickstart file format, see the ":doc:`/ref-manual/ref-kickstart`" Chapter.
>
>     :term:`WKS_FILE_DEPENDS`
>        When placed in the recipe that builds your image, this variable lists
> diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
> index 2ef182fb1..5e7fc37ef 100644
> --- a/documentation/ref-manual/resources.rst
> +++ b/documentation/ref-manual/resources.rst
> @@ -125,33 +125,33 @@ Here is a list of resources you might find helpful:
>     guide to the BitBake tool. If you want information on BitBake, see
>     this manual.
>
> --  :doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` *:* This
> +-  :doc:`/brief-yoctoprojectqs/brief-yoctoprojectqs` *:* This
>     short document lets you experience building an image using the Yocto
>     Project without having to understand any concepts or details.
>
> --  :doc:`../overview-manual/overview-manual` *:* This manual provides overview
> +-  :doc:`/overview-manual/overview-manual` *:* This manual provides overview
>     and conceptual information about the Yocto Project.
>
> --  :doc:`../dev-manual/dev-manual` *:* This manual is a "how-to" guide
> +-  :doc:`/dev-manual/dev-manual` *:* This manual is a "how-to" guide
>     that presents procedures useful to both application and system
>     developers who use the Yocto Project.
>
> --  :doc:`../sdk-manual/sdk-manual` *manual :* This
> +-  :doc:`/sdk-manual/sdk-manual` *manual :* This
>     guide provides information that lets you get going with the standard
>     or extensible SDK. An SDK, with its cross-development toolchains,
>     allows you to develop projects inside or outside of the Yocto Project
>     environment.
>
> --  :doc:`../bsp-guide/bsp` *:* This guide defines the structure
> +-  :doc:`/bsp-guide/bsp` *:* This guide defines the structure
>     for BSP components. Having a commonly understood structure encourages
>     standardization.
>
> --  :doc:`../kernel-dev/kernel-dev` *:* This manual describes
> +-  :doc:`/kernel-dev/kernel-dev` *:* This manual describes
>     how to work with Linux Yocto kernels as well as provides a bit of
>     conceptual information on the construction of the Yocto Linux kernel
>     tree.
>
> --  :doc:`../ref-manual/ref-manual` *:* This
> +-  :doc:`/ref-manual/ref-manual` *:* This
>     manual provides reference material such as variable, task, and class
>     descriptions.
>
> @@ -161,11 +161,11 @@ Here is a list of resources you might find helpful:
>     which you can easily search for phrases and terms used in the Yocto
>     Project documentation set.
>
> --  :doc:`../profile-manual/profile-manual` *:* This manual presents a set of
> +-  :doc:`/profile-manual/profile-manual` *:* This manual presents a set of
>     common and generally useful tracing and profiling schemes along with
>     their applications (as appropriate) to each tool.
>
> --  :doc:`../toaster-manual/toaster-manual` *:* This manual
> +-  :doc:`/toaster-manual/toaster-manual` *:* This manual
>     introduces and describes how to set up and use Toaster. Toaster is an
>     Application Programming Interface (API) and web-based interface to
>     the :term:`OpenEmbedded Build System`, which uses
> diff --git a/documentation/sdk-manual/sdk-intro.rst b/documentation/sdk-manual/sdk-intro.rst
> index acb3f455c..81015ce04 100644
> --- a/documentation/sdk-manual/sdk-intro.rst
> +++ b/documentation/sdk-manual/sdk-intro.rst
> @@ -215,7 +215,7 @@ You just need to follow these general steps:
>     tools to develop your application. If you need to separately install
>     and use the QEMU emulator, you can go to `QEMU Home
>     Page <http://wiki.qemu.org/Main_Page>`__ to download and learn about
> -   the emulator. See the ":doc:`../dev-manual/dev-manual-qemu`" chapter in the
> +   the emulator. See the ":doc:`/dev-manual/dev-manual-qemu`" chapter in the
>     Yocto Project Development Tasks Manual for information on using QEMU
>     within the Yocto Project.
>
> diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
> index 593c6fe14..ee0ff065d 100644
> --- a/documentation/what-i-wish-id-known.rst
> +++ b/documentation/what-i-wish-id-known.rst
> @@ -190,28 +190,28 @@ contact us with other suggestions.
>       contains procedural information grouped to help you get set up, work with
>       layers, customize images, write new recipes, work with libraries, and use
>       QEMU. The information is task-based and spans the breadth of the Yocto
> -     Project. See the :doc:`../dev-manual/dev-manual`.
> +     Project. See the :doc:`/dev-manual/dev-manual`.
>
>     * **Look Through the Yocto Project Application Development and the Extensible
>       Software Development Kit (eSDK) manual**: This manual describes how to use
>       both the standard SDK and the extensible SDK, which are used primarily for
> -     application development. The :doc:`../sdk-manual/sdk-extensible` also provides
> +     application development. The :doc:`/sdk-manual/sdk-extensible` also provides
>       example workflows that use devtool. See the section
>       :ref:`sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow`
>       for more information.
>
>     * **Learn About Kernel Development**: If you want to see how to work with the
> -     kernel and understand Yocto Linux kernels, see the :doc:`../kernel-dev/kernel-dev`.
> +     kernel and understand Yocto Linux kernels, see the :doc:`/kernel-dev/kernel-dev`.
>       This manual provides information on how to patch the kernel, modify kernel
>       recipes, and configure the kernel.
>
>     * **Learn About Board Support Packages (BSPs)**: If you want to learn about
> -     BSPs, see the :doc:`../bsp-guide/bsp-guide`. This manual also provides an
> -     example BSP creation workflow. See the :doc:`../bsp-guide/bsp` section.
> +     BSPs, see the :doc:`/bsp-guide/bsp-guide`. This manual also provides an
> +     example BSP creation workflow. See the :doc:`/bsp-guide/bsp` section.
>
>     * **Learn About Toaster**: Toaster is a web interface to the Yocto Project's
>       OpenEmbedded build system. If you are interested in using this type of
> -     interface to create images, see the :doc:`../toaster-manual/toaster-manual`.
> +     interface to create images, see the :doc:`/toaster-manual/toaster-manual`.
>
>     * **Have Available the Yocto Project Reference Manual**: Unlike the rest of
>       the Yocto Project manual set, this manual is comprised of material suited
> @@ -219,7 +219,7 @@ contact us with other suggestions.
>       look at how the pieces of the Yocto Project development environment work
>       together, information on various technical details, guidance on migrating
>       to a newer Yocto Project release, reference material on the directory
> -     structure, classes, and tasks. The :doc:`../ref-manual/ref-manual` also
> +     structure, classes, and tasks. The :doc:`/ref-manual/ref-manual` also
>       contains a fairly comprehensive glossary of variables used within the Yocto
>       Project.
>
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> 
>
