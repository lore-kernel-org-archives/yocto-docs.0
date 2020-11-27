Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.20492.1606491170828273082
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2020 07:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=t6xoro1w;
 spf=pass (domain: linaro.org, ip: 209.85.219.174, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f174.google.com with SMTP id o144so4870279ybg.7
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2020 07:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LGNzSUSzo+efR/Pate9cOu7kWJ24xKpzA4jEkRv4yeY=;
        b=t6xoro1w1hZmwJrKPDVwD9IfZP7SWtlF1FHaxirvpgwJq2O5uM1gRqEhDYhlsZWDJk
         ucNNySJU0h1V3x0YuRwdNrBqr+Nvm3bTWQNhYl/6tctdA0LWDkT9OFNDmoZwkgYcc5iu
         mDGvH7UmffG3gtpg1ouCOR8DgxkaVcAdCC15Q3XukNuYViLaO0XhNTRrt1mlhv3ySHK6
         e6vfMmgz33Y/HlEmxNxjjHZUCdiMpU+x5c66HP+ifHg6mIq4MXsCsmwUbB7T2A+LEzM7
         j5XLfyU2G+MDKoffBJRyMRTN7JJpHYWimhO4+Oo6d+W9znHrRoPbXcaAwo6fBdGZMhMX
         q7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LGNzSUSzo+efR/Pate9cOu7kWJ24xKpzA4jEkRv4yeY=;
        b=MWDctxxEEXa2uV2ovMyfickJgqqcWaUuAayNMiwkiUNQyEqFMPJE9Ls9awdye/fzLy
         UeS/sGmJdg/tgOPLs9wsRWDWJ1FpLs5HswQxOoe2o25XPLD+wjq4Ag2vfK3eQZJAWgBs
         om7rFOUCpc3+SBSKAc03mS19oJ91nzXho0XhK4XZ97ZU3MkrOBzcBmAWFzqskNN6yq/Y
         +Fwg5YyM9q6eBb+yCoZ3DLo0BrcDUTTK1yMdoTD0aZYiuJTzUv9pMUwNE1pg+hKywn8W
         ChuLb91wTNJ07AMYYUrz6JBFKcUM+ReR9t4FCNRSfhBzwQdUv006kBgOiEb8d+vr194Y
         CA2g==
X-Gm-Message-State: AOAM5328dxDL/7hjGMLqOOwkFEHBK4LR9Ez+9kAhrngsv6joOiBLxOfx
	mHZSaD/GNy18WKel57xGmfdjy4Cona+bf1Lne+uWGw==
X-Google-Smtp-Source: ABdhPJzSIgXWJC9TsIqtg3D7mDE4lXPvISVGjEmi2TePjAsLKyuedAVBQuSvXiLDC0wO3r12mjusekNJkO4Z9sq2RJU=
X-Received: by 2002:a25:287:: with SMTP id 129mr12091520ybc.454.1606491169543;
 Fri, 27 Nov 2020 07:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20201127151910.6397-1-pbarker@konsulko.com> <20201127151910.6397-2-pbarker@konsulko.com>
In-Reply-To: <20201127151910.6397-2-pbarker@konsulko.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 27 Nov 2020 16:32:38 +0100
Message-ID: <CAP71Wjz_oOjmQdJobA4bb41WqEMwvoGfVcwB4ACbaBDVxDmPNA@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/3] documentation: Simplify yocto_wiki links
To: Paul Barker <pbarker@konsulko.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hi Paul,

On Fri, Nov 27, 2020 at 4:19 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> The `yocto_wiki` external link directive is modified to include the
> `/wiki` element of the URL so that we can simplify the links in the
> text.

thanks for sending these patches!

>
> Note that there are still a couple of places where this directive
> cannot be used, such as in the table of contents in index.rst.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  .../brief-yoctoprojectqs/brief-yoctoprojectqs.rst  |  2 +-
>  documentation/bsp-guide/bsp.rst                    |  2 +-
>  documentation/conf.py                              |  2 +-
>  .../dev-manual/dev-manual-common-tasks.rst         | 14 +++++++-------
>  documentation/dev-manual/dev-manual-start.rst      |  2 +-
>  documentation/kernel-dev/kernel-dev-common.rst     |  4 ++--
>  documentation/ref-manual/faq.rst                   |  4 ++--
>  documentation/ref-manual/migration-3.2.rst         |  2 +-
>  documentation/ref-manual/ref-release-process.rst   |  4 ++--
>  .../ref-manual/ref-system-requirements.rst         |  2 +-
>  documentation/ref-manual/ref-variables.rst         |  4 ++--
>  documentation/ref-manual/resources.rst             |  9 +++++----
>  documentation/test-manual/test-manual-intro.rst    |  2 +-
>  .../test-manual/test-manual-test-process.rst       |  2 +-
>  .../test-manual-understand-autobuilder.rst         |  2 +-
>  15 files changed, 29 insertions(+), 28 deletions(-)
>
> diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> index f6d863f5b..8772812eb 100644
> --- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> +++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> @@ -165,7 +165,7 @@ an entire Linux distribution, including the toolchain, from source.
>        infrastructure resources and get that information. A good starting
>        point could also be to check your web browser settings. Finally,
>        you can find more information on the
> -      ":yocto_wiki:`Working Behind a Network Proxy </wiki/Working_Behind_a_Network_Proxy>`"
> +      ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"

Is it possible to get rid of the 'leading' /, so that the links become:
:yocto_wiki:`My Awesome Page <My_Awesome_Page>`

I remember looking into that initially, but I forgot what's possible..

>        page of the Yocto Project Wiki.
>
>  #. **Initialize the Build Environment:** From within the ``poky``
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 408620212..d6a4f545c 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -854,7 +854,7 @@ Before looking at BSP requirements, you should consider the following:
>     a BSP. You should consult the packaging and distribution guidelines
>     for your specific release process. For an example of packaging and
>     distribution requirements, see the ":yocto_wiki:`Third Party BSP Release
> -   Process </wiki/Third_Party_BSP_Release_Process>`"
> +   Process </Third_Party_BSP_Release_Process>`"
>     wiki page.
>
>  -  The requirements for the BSP as it is made available to a developer
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 96118abec..c906d066a 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -69,7 +69,7 @@ rst_prolog = """
>  # external links and substitutions
>  extlinks = {
>      'yocto_home': ('https://yoctoproject.org%s', None),
> -    'yocto_wiki': ('https://wiki.yoctoproject.org%s', None),
> +    'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
>      'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
>      'yocto_lists': ('https://lists.yoctoproject.org%s', None),
>      'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 706d5e7a6..4257a4bb9 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -135,7 +135,7 @@ Follow these general steps to create your layer without using tools:
>        Lists all layers on which this layer depends (if any).
>
>     -  :term:`LAYERSERIES_COMPAT`:
> -      Lists the :yocto_wiki:`Yocto Project </wiki/Releases>`
> +      Lists the :yocto_wiki:`Yocto Project </Releases>`
>        releases for which the current version is compatible. This
>        variable is a good way to indicate if your particular layer is
>        current.
> @@ -6476,7 +6476,7 @@ the following:
>     build system uses this string to help define the value of ``PV`` when
>     the source code revision needs to be included in it.
>
> --  :yocto_wiki:`PR Service </wiki/PR_Service>`: A
> +-  :yocto_wiki:`PR Service </PR_Service>`: A
>     network-based service that helps automate keeping package feeds
>     compatible with existing package manager applications such as RPM,
>     APT, and OPKG.
> @@ -6518,7 +6518,7 @@ revision field, which removes the human element.
>  .. note::
>
>     For additional information on using a PR Service, you can see the
> -   :yocto_wiki:`PR Service </wiki/PR_Service>` wiki page.
> +   :yocto_wiki:`PR Service </PR_Service>` wiki page.
>
>  The Yocto Project uses variables in order of decreasing priority to
>  facilitate revision numbering (i.e.
> @@ -7314,7 +7314,7 @@ where the result can be ``PASS``, ``FAIL``, or ``SKIP``, and
>  the testname can be any identifying string.
>
>  For a list of Yocto Project recipes that are already enabled with ptest,
> -see the :yocto_wiki:`Ptest </wiki/Ptest>` wiki page.
> +see the :yocto_wiki:`Ptest </Ptest>` wiki page.
>
>  .. note::
>
> @@ -10320,7 +10320,7 @@ Here are some other tips that you might find useful:
>     Project implementation of
>     :yocto_bugs:`Bugzilla <>`. For information on
>     how to submit a bug against the Yocto Project, see the Yocto Project
> -   Bugzilla :yocto_wiki:`wiki page </wiki/Bugzilla_Configuration_and_Bug_Tracking>`
> +   Bugzilla :yocto_wiki:`wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
>     and the "`Submitting a Defect Against the Yocto
>     Project <#submitting-a-defect-against-the-yocto-project>`__" section.
>
> @@ -10348,7 +10348,7 @@ implementation of Bugzilla see the ":ref:`Yocto Project
>  Bugzilla <resources-bugtracker>`" section in the
>  Yocto Project Reference Manual. For more detail on any of the following
>  steps, see the Yocto Project
> -:yocto_wiki:`Bugzilla wiki page </wiki/Bugzilla_Configuration_and_Bug_Tracking>`.
> +:yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`.
>
>  Use the following general steps to submit a bug:
>
> @@ -10812,7 +10812,7 @@ master branch or the fix on the master branch is unsuitable for backporting.
>
>  The list of stable branches along with the status and maintainer for each
>  branch can be obtained from the
> -:yocto_wiki:`Releases wiki page </wiki/Releases>`.
> +:yocto_wiki:`Releases wiki page </Releases>`.
>
>  .. note::
>
> diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
> index f768f092b..86a4619f4 100644
> --- a/documentation/dev-manual/dev-manual-start.rst
> +++ b/documentation/dev-manual/dev-manual-start.rst
> @@ -305,7 +305,7 @@ Project Build Host:
>     validation and their status, see the ":ref:`Supported Linux
>     Distributions <detailed-supported-distros>`"
>     section in the Yocto Project Reference Manual and the wiki page at
> -   :yocto_wiki:`Distribution Support </wiki/Distribution_Support>`.
> +   :yocto_wiki:`Distribution Support </Distribution_Support>`.
>
>  2. *Have Enough Free Memory:* Your system should have at least 50 Gbytes
>     of free disk space for building images.
> diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
> index 72d9d7879..31e024c6c 100644
> --- a/documentation/kernel-dev/kernel-dev-common.rst
> +++ b/documentation/kernel-dev/kernel-dev-common.rst
> @@ -207,7 +207,7 @@ section:
>     building for actual hardware and not for emulation, you could flash
>     the image to a USB stick on ``/dev/sdd`` and boot your device. For an
>     example that uses a Minnowboard, see the
> -   :yocto_wiki:`TipsAndTricks/KernelDevelopmentWithEsdk </wiki/TipsAndTricks/KernelDevelopmentWithEsdk>`
> +   :yocto_wiki:`TipsAndTricks/KernelDevelopmentWithEsdk </TipsAndTricks/KernelDevelopmentWithEsdk>`
>     Wiki page.
>
>  At this point you have set up to start making modifications to the
> @@ -862,7 +862,7 @@ the ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devto
>        If the image you originally created resulted in a Wic file, you
>        can use an alternate method to create the new image with the
>        updated kernel. For an example, see the steps in the
> -      :yocto_wiki:`TipsAndTricks/KernelDevelopmentWithEsdk </wiki/TipsAndTricks/KernelDevelopmentWithEsdk>`
> +      :yocto_wiki:`TipsAndTricks/KernelDevelopmentWithEsdk </TipsAndTricks/KernelDevelopmentWithEsdk>`
>        Wiki Page.
>
>     ::
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index 576863eec..3ffc1f2c4 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -140,7 +140,7 @@ The Yocto Project also includes a
>  ``meta-poky/conf/site.conf.sample`` file that shows how to configure CVS
>  and Git proxy servers if needed. For more information on setting up
>  various proxy types and configuring proxy servers, see the
> -":yocto_wiki:`Working Behind a Network Proxy </wiki/Working_Behind_a_Network_Proxy>`"
> +":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
>  Wiki page.
>
>  **Q:** What's the difference between target and target\ ``-native``?
> @@ -362,7 +362,7 @@ redirect requests through proxy servers.
>  .. note::
>
>     You can find more information on the
> -   ":yocto_wiki:`Working Behind a Network Proxy </wiki/Working_Behind_a_Network_Proxy>`"
> +   ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
>     Wiki page.
>
>  **Q:** Can I get rid of build output so I can start over?
> diff --git a/documentation/ref-manual/migration-3.2.rst b/documentation/ref-manual/migration-3.2.rst
> index 9b65e26c4..65a9ff4ca 100644
> --- a/documentation/ref-manual/migration-3.2.rst
> +++ b/documentation/ref-manual/migration-3.2.rst
> @@ -71,7 +71,7 @@ be monitoring.
>  In addition, pseudo's behaviour on mismatches has now been changed - rather
>  than doing what turns out to be a rather dangerous "fixup" if it sees a file
>  with a different path but the same inode as another file it has previously seen,
> -pseudo will throw an ``abort()`` and direct you to a :yocto_wiki:`wiki page </wiki/Pseudo_Abort>`
> +pseudo will throw an ``abort()`` and direct you to a :yocto_wiki:`wiki page </Pseudo_Abort>`
>  that explains how to deal with this.
>
>
> diff --git a/documentation/ref-manual/ref-release-process.rst b/documentation/ref-manual/ref-release-process.rst
> index a6d9ff60e..c77a3bcb1 100644
> --- a/documentation/ref-manual/ref-release-process.rst
> +++ b/documentation/ref-manual/ref-release-process.rst
> @@ -64,7 +64,7 @@ codename are likely to be compatible and thus work together.
>  Releases are given a nominal release version as well but the codename is
>  used in repositories for this reason. You can find information on Yocto
>  Project releases and codenames at
> -:yocto_wiki:`/wiki/Releases`.
> +:yocto_wiki:`/Releases`.
>
>  Stable Release Process
>  ======================
> @@ -94,7 +94,7 @@ Community LTS trees and branches exist where community members share
>  patches for older releases. However, these types of patches do not go
>  through the same release process as do point releases. You can find more
>  information about stable branch maintenance at
> -:yocto_wiki:`/wiki/Stable_branch_maintenance`.
> +:yocto_wiki:`/Stable_branch_maintenance`.
>
>  Testing and Quality Assurance
>  =============================
> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> index fe7c9252c..af8663a5b 100644
> --- a/documentation/ref-manual/ref-system-requirements.rst
> +++ b/documentation/ref-manual/ref-system-requirements.rst
> @@ -93,7 +93,7 @@ distributions:
>        Bugzilla <>` and submit a bug. We are
>        interested in hearing about your experience. For information on
>        how to submit a bug, see the Yocto Project
> -      :yocto_wiki:`Bugzilla wiki page </wiki/Bugzilla_Configuration_and_Bug_Tracking>`
> +      :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
>        and the ":ref:`dev-manual/dev-manual-common-tasks:submitting a defect against the yocto project`"
>        section in the Yocto Project Development Tasks Manual.
>
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index b24e1fa39..921d19e7f 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -1997,7 +1997,7 @@ system and gives an overview of their function and contents.
>        process gets source files when working behind a firewall or proxy
>        server, see this specific question in the ":doc:`faq`"
>        chapter. You can also refer to the
> -      ":yocto_wiki:`Working Behind a Network Proxy </wiki/Working_Behind_a_Network_Proxy>`"
> +      ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
>        Wiki page.
>
>     :term:`DOC_COMPRESS`
> @@ -4177,7 +4177,7 @@ system and gives an overview of their function and contents.
>        To specify the OE-Core versions for which a layer is compatible, use
>        this variable in your layer's ``conf/layer.conf`` configuration file.
>        For the list, use the Yocto Project
> -      :yocto_wiki:`Release Name </wiki/Releases>` (e.g.
> +      :yocto_wiki:`Release Name </Releases>` (e.g.
>        DISTRO_NAME_NO_CAP). To specify multiple OE-Core versions for the
>        layer, use a space-separated list:
>        ::
> diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
> index c172aab25..70ba8e7be 100644
> --- a/documentation/ref-manual/resources.rst
> +++ b/documentation/ref-manual/resources.rst
> @@ -50,7 +50,7 @@ against the Yocto Project, see the following:
>  -  The ":ref:`dev-manual/dev-manual-common-tasks:submitting a defect against the yocto project`"
>     section in the Yocto Project Development Tasks Manual.
>
> --  The Yocto Project :yocto_wiki:`Bugzilla wiki page </wiki/Bugzilla_Configuration_and_Bug_Tracking>`
> +-  The Yocto Project :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
>
>  For information on Bugzilla in general, see http://www.bugzilla.org/about/.
>
> @@ -108,7 +108,7 @@ Here is a list of resources you might find helpful:
>  -  :yocto_home:`The Yocto Project Website <>`\ *:* The home site
>     for the Yocto Project.
>
> --  :yocto_wiki:`The Yocto Project Main Wiki Page </wiki/Main_Page>`\ *:* The main wiki page for
> +-  :yocto_wiki:`The Yocto Project Main Wiki Page <>`\ *:* The main wiki page for
>     the Yocto Project. This page contains information about project
>     planning, release engineering, QA & automation, a reference site map,
>     and other resources related to the Yocto Project.
> @@ -171,7 +171,7 @@ Here is a list of resources you might find helpful:
>     the :term:`OpenEmbedded Build System`, which uses
>     BitBake, that reports build information.
>
> --  :yocto_wiki:`FAQ </wiki/FAQ>`\ *:* A list of commonly asked
> +-  :yocto_wiki:`FAQ </FAQ>`\ *:* A list of commonly asked
>     questions and their answers.
>
>  -  *Release Notes:* Features, updates and known issues for the current
> @@ -184,7 +184,8 @@ Here is a list of resources you might find helpful:
>     the Yocto Project uses. If you find problems with the Yocto Project,
>     you should report them using this application.
>
> --  :yocto_wiki:`Bugzilla Configuration and Bug Tracking Wiki Page </wiki/Bugzilla_Configuration_and_Bug_Tracking>`\ *:*
> +-  :yocto_wiki:`Bugzilla Configuration and Bug Tracking Wiki Page
> +   </Bugzilla_Configuration_and_Bug_Tracking>`\ *:*
>     Information on how to get set up and use the Yocto Project
>     implementation of Bugzilla for logging and tracking Yocto Project
>     defects.
> diff --git a/documentation/test-manual/test-manual-intro.rst b/documentation/test-manual/test-manual-intro.rst
> index b6d130591..cf511e925 100644
> --- a/documentation/test-manual/test-manual-intro.rst
> +++ b/documentation/test-manual/test-manual-intro.rst
> @@ -144,7 +144,7 @@ thefollowing types of tests:
>     :ref:`Testing Packages With
>     ptest <dev-manual/dev-manual-common-tasks:Testing Packages With ptest>` section
>     in the Yocto Project Development Tasks Manual and the
> -   ":yocto_wiki:`Ptest </wiki/Ptest>`" Wiki page for more
> +   ":yocto_wiki:`Ptest </Ptest>`" Wiki page for more
>     information on Ptest.
>
>  -  *SDK Testing:* Image tests initiated through the following command::
> diff --git a/documentation/test-manual/test-manual-test-process.rst b/documentation/test-manual/test-manual-test-process.rst
> index 82b9bb441..bbf010380 100644
> --- a/documentation/test-manual/test-manual-test-process.rst
> +++ b/documentation/test-manual/test-manual-test-process.rst
> @@ -25,7 +25,7 @@ at: :yocto_ab:`/typhoon/#/console`.
>
>  Builds are triggered manually when the test branches are ready. The
>  builds are monitored by the SWAT team. For additional information, see
> -:yocto_wiki:`/wiki/Yocto_Build_Failure_Swat_Team`.
> +:yocto_wiki:`/Yocto_Build_Failure_Swat_Team`.
>  If successful, the changes would usually be merged to the ``master``
>  branch. If not successful, someone would respond to the changes on the
>  mailing list explaining that there was a failure in testing. The choice
> diff --git a/documentation/test-manual/test-manual-understand-autobuilder.rst b/documentation/test-manual/test-manual-understand-autobuilder.rst
> index 698a266ee..ca0c5fd2e 100644
> --- a/documentation/test-manual/test-manual-understand-autobuilder.rst
> +++ b/documentation/test-manual/test-manual-understand-autobuilder.rst
> @@ -195,7 +195,7 @@ Resulttool is part of OpenEmbedded-Core and is used to manipulate these
>  json results files. It has the ability to merge files together, display
>  reports of the test results and compare different result files.
>
> -For details, see :yocto_wiki:`/wiki/Resulttool`.
> +For details, see :yocto_wiki:`/Resulttool`.
>
>  run-config Target Execution
>  ===========================
> --
> 2.26.2
>
>
> 
>
