Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web11.32646.1607939122969254346
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 01:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4Cvc283KF2z5tlG;
	Mon, 14 Dec 2020 10:45:20 +0100 (CET)
Date: Mon, 14 Dec 2020 10:45:19 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 4/4] documentation: Use https links where possible
Message-ID: <20201214094519.qqfadyj2rf5xmr4k@qschulz>
References: <20201212203707.7428-1-pbarker@konsulko.com>
 <20201212203707.7428-4-pbarker@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20201212203707.7428-4-pbarker@konsulko.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Sat, Dec 12, 2020 at 08:37:07PM +0000, Paul Barker wrote:
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  documentation/README                          |  8 ++--
>  documentation/boilerplate.rst                 |  2 +-
>  documentation/brief-yoctoprojectqs/index.rst  |  2 +-
>  documentation/dev-manual/common-tasks.rst     |  2 +-
>  .../development-environment.rst               | 22 +++++-----
>  documentation/overview-manual/yp-intro.rst    |  4 +-
>  documentation/profile-manual/usage.rst        | 44 +++++++++----------
>  documentation/ref-manual/classes.rst          |  4 +-
>  documentation/ref-manual/faq.rst              |  6 +--
>  documentation/ref-manual/images.rst           |  4 +-
>  documentation/ref-manual/kickstart.rst        |  4 +-
>  documentation/ref-manual/migration-2.1.rst    |  2 +-
>  documentation/ref-manual/migration-2.2.rst    |  2 +-
>  documentation/ref-manual/migration-2.3.rst    |  2 +-
>  documentation/ref-manual/migration-2.7.rst    |  2 +-
>  documentation/ref-manual/qa-checks.rst        |  2 +-
>  documentation/ref-manual/resources.rst        |  4 +-
>  documentation/ref-manual/variables.rst        | 20 ++++-----
>  documentation/sdk-manual/intro.rst            |  2 +-
>  documentation/toaster-manual/reference.rst    |  4 +-
>  20 files changed, 71 insertions(+), 71 deletions(-)
> 
> diff --git a/documentation/README b/documentation/README
> index b0a3cb1dc..be03bb119 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -2,7 +2,7 @@ documentation
>  =============
>  
>  This is the directory that contains the Yocto Project documentation.  The Yocto
> -Project source repositories at http://git.yoctoproject.org/cgit.cgi have two
> +Project source repositories at https://git.yoctoproject.org/cgit.cgi have two
>  instances of the "documentation" directory.  You should understand each of
>  these instances.
>  
> @@ -47,12 +47,12 @@ Folders exist for individual manuals as follows:
>  Each folder is self-contained regarding content and figures.
>  
>  If you want to find HTML versions of the Yocto Project manuals on the web,
> -go to http://www.yoctoproject.org and click on the "Documentation" tab.  From
> +go to https://www.yoctoproject.org and click on the "Documentation" tab.  From

:yocto_home:`<>`?

>  there you have access to archived documentation from previous releases, current
>  documentation for the latest release, and "Docs in Progress" for the release
>  currently being developed.
>  
> -In general, the Yocto Project site (http://www.yoctoproject.org) is a great
> +In general, the Yocto Project site (https://www.yoctoproject.org) is a great

Ditto.

>  reference for both information and downloads.
>  
>  poky.yaml
> @@ -228,7 +228,7 @@ content:
>  
>  Variables can be nested, like it was the case for DocBook:
>  
> -  YOCTO_HOME_URL : "http://www.yoctoproject.org"
> +  YOCTO_HOME_URL : "https://www.yoctoproject.org"

Ditto.

[...]
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index 4da55a83d..0ec7e2b96 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -368,7 +368,7 @@ activities using the Yocto Project:
>  
>  -  *Patchwork:* `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`__

This is a broken link (was wondering why you didn't switch it to https).
Might want to contact ozlabs about that since they still point to this
link on patchwork.ozlabs.org (footer).

[...]
> diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
> index ac247dce4..558a0ad45 100644
> --- a/documentation/ref-manual/migration-2.2.rst
> +++ b/documentation/ref-manual/migration-2.2.rst
> @@ -29,7 +29,7 @@ introduces the new :term:`SYSROOT_DIRS`,
>  :term:`SYSROOT_DIRS_NATIVE`, and
>  :term:`SYSROOT_DIRS_BLACKLIST`. See the
>  `v2 patch series on the OE-Core Mailing
> -List <http://lists.openembedded.org/pipermail/openembedded-core/2016-May/121365.html>`__
> +List <https://lists.openembedded.org/pipermail/openembedded-core/2016-May/121365.html>`__

:oe_lists:`/pipermail/openembedded-core/2016-May/121365.html`?

Thanks,
Quentin
