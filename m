Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.21172.1627917047677714167
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 08:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GOc8gt8b;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.42, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f42.google.com with SMTP id h13so8406663wrp.1
        for <docs@lists.yoctoproject.org>; Mon, 02 Aug 2021 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E31IuJrf1xyAtROD5hb8VmeE0HiAxPUfzDmxGCMwnnU=;
        b=GOc8gt8bmQiSYUm+5ZsyRsJw10H3mYBd5eYZ6iAZlC69IEbD+zERr9Pm0VH/FZjSOF
         OwICcX9o8uD8mwDBkdgaR0ozypNNgYe8BpJyIwtVCybiicPit7hUsB9rkrOrl56LCcAU
         QjJfGtBinKepbDsuTKVo4ur97Inbr1Zy3XwZv7ZOW3ufwj7PGmyFaO3oeKfHIcEdm1LU
         4uJBNZuu2LkM+819yPzPWG1v6ubnP9C4mMchdSLFGo6NLWtE47jAXNWjSAvljaR2Sx7W
         OSuU1oF4g2Ofh6qFyfnsfyhYT4j3MCGGRAJL4U5iO5wf7Z0b6nVTO0Mdtmek7+B1wO2e
         /Obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E31IuJrf1xyAtROD5hb8VmeE0HiAxPUfzDmxGCMwnnU=;
        b=DaF5lVEU6Jie7d+ydaaosRwXcRqXQdqIFtk5BV72a+H0aSf1dIIXreGAQuzQFaI5UW
         EzF9d4H7E5F2l5i1f2ub59eR3w6AHBnwGY3HOnZbxqw/JLfZBnVa1Kso1WRdu6skXWUm
         WAmprUukgwBRZCOExNXZXBQTFtwlXf8cOXcMsARZ+39yT7AvU0p1VTpphm8P6O3Lm+xe
         vEEgzBfFA2zKZkqaf9/Y+DpCnKumeavyX0rHkJ3Q/VKPaAAHOnfmN2YLesLH+fupEtBV
         p3rIkR3YP7LZtKlunHsxy8ArO6gjP1xY+l2kzPclQqmcz5Rn2BmJBffj2vE1kM5NGpJb
         m/dA==
X-Gm-Message-State: AOAM533z0kD8yisDF1UO2WkBI9X0PphuVP2ZFUf2iNJYnOJbJzOTCkAL
	LAr04t1xSPrVZ/JBPZ6Q6N2as6J1c7TrpBTVNtm9nA==
X-Google-Smtp-Source: ABdhPJwTjV6e/e0f4/HTbMdOmkwTS/PfUbT7IUeuqHzokJo0zBsOp5az3viHN0/8mxNHQAcMul6PxaqchwU6/Mqxtyg=
X-Received: by 2002:a5d:518a:: with SMTP id k10mr18178251wrv.400.1627917046072;
 Mon, 02 Aug 2021 08:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <169784CA8E208BFA.17923@lists.yoctoproject.org> <20210802145454.12521-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210802145454.12521-1-michael.opdenacker@bootlin.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 2 Aug 2021 05:10:35 -1000
Message-ID: <CAOSpxdYZoZneKxnkASheZeFkJL_3DeOdjJy7NwTjoAfueiWasw@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] manuals: initial documentation for CVE management
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 4:55 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> This starts to document vulnerability management
> and the use of the CVE_PRODUCT variable
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

This looks good!  Thanks for documenting this.  I'll pull this into
the dunfell docs too.

Steve

>  documentation/dev-manual/common-tasks.rst | 45 +++++++++++++++++++++++
>  documentation/ref-manual/variables.rst    | 12 ++++++
>  2 files changed, 57 insertions(+)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 9a6f4e1a8e..5905a650ba 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10528,6 +10528,9 @@ follows:
>  1. *Identify the bug or CVE to be fixed:* This information should be
>     collected so that it can be included in your submission.
>
> +   See :ref:`dev-manual/common-tasks:checking for vulnerabilities`
> +   for details about CVE tracking.
> +
>  2. *Check if the fix is already present in the master branch:* This will
>     result in the most straightforward path into the stable branch for the
>     fix.
> @@ -11090,6 +11093,48 @@ the license from the fetched source::
>
>     NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
>
> +Checking for Vulnerabilities
> +============================
> +
> +Vulnerabilities in images
> +-------------------------
> +
> +The Yocto Project has an infrastructure to track and address unfixed
> +known security vulnerabilities, as tracked by the public
> +`Common Vulnerabilities and Exposures (CVE) <https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures>`__
> +database.
> +
> +To know which packages are vulnerable to known security vulnerabilities,
> +add the following setting to your configuration::
> +
> +   INHERIT += "cve-check"
> +
> +This way, at build time, BitBake will warn you about known CVEs
> +as in the example below::
> +
> +   WARNING: flex-2.6.4-r0 do_cve_check: Found unpatched CVE (CVE-2019-6293), for more information check /poky/build/tmp/work/core2-64-poky-linux/flex/2.6.4-r0/temp/cve.log
> +   WARNING: libarchive-3.5.1-r0 do_cve_check: Found unpatched CVE (CVE-2021-36976), for more information check /poky/build/tmp/work/core2-64-poky-linux/libarchive/3.5.1-r0/temp/cve.log
> +
> +It is also possible to check the CVE status of individual packages as follows::
> +
> +   bitbake -c cve_check flex libarchive
> +
> +Note that OpenEmbedded-Core keeps a list of known unfixed CVE issues which can
> +be ignored. You can pass this list to the check as follows::
> +
> +   bitbake -c cve_check libarchive -R conf/distro/include/cve-extra-exclusions.inc
> +
> +Enabling vulnerabily tracking in recipes
> +----------------------------------------
> +
> +The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
> +against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
> +
> +The CVE database is stored in :term:`DL_DIR` and can be inspected using
> +``sqlite3`` command as follows::
> +
> +   sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
> +
>  Using the Error Reporting Tool
>  ==============================
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index b61de1993d..1150940133 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1471,6 +1471,18 @@ system and gives an overview of their function and contents.
>           variable only in certain contexts (e.g. when building for kernel
>           and kernel module recipes).
>
> +   :term:`CVE_PRODUCT`
> +      In a recipe, defines the name used to match the recipe name
> +      against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
> +
> +      The default is ${:term:`BPN`}. If it does not match the name in NIST CVE
> +      database or matches with multiple entries in the database, the default
> +      value needs to be changed.
> +
> +      Here is an example from the :oe_layerindex:`Berkeley DB recipe </layerindex/recipe/544>`::
> +
> +         CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
> +
>     :term:`CVSDIR`
>        The directory in which files checked out under the CVS system are
>        stored.
> --
> 2.25.1
>
>
> 
>
