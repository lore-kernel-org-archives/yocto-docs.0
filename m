Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web09.32467.1607938561920068300
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 01:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4CvbqM1W0Dz5tlB;
	Mon, 14 Dec 2020 10:35:59 +0100 (CET)
Date: Mon, 14 Dec 2020 10:35:57 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/4] documentation: Simplify remaining yocto_home links
Message-ID: <20201214093557.rtilbhenivneos2s@qschulz>
References: <20201212203707.7428-1-pbarker@konsulko.com>
 <20201212203707.7428-3-pbarker@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20201212203707.7428-3-pbarker@konsulko.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Sat, Dec 12, 2020 at 08:37:06PM +0000, Paul Barker wrote:
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  documentation/conf.py                      |  2 +-
>  documentation/dev-manual/common-tasks.rst  |  4 ++--
>  documentation/overview-manual/concepts.rst | 15 ++++++---------
>  documentation/profile-manual/usage.rst     |  5 ++---
>  4 files changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 57b9b6fd6..3b198cd06 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -68,7 +68,7 @@ rst_prolog = """
>  
>  # external links and substitutions
>  extlinks = {
> -    'yocto_home': ('https://yoctoproject.org%s', None),
> +    'yocto_home': ('https://www.yoctoproject.org%s', None),
>      'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
>      'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
>      'yocto_lists': ('https://lists.yoctoproject.org%s', None),
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 79acb8671..30761c3c6 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -321,7 +321,7 @@ Logo for your layer and application. The process consists of two parts:
>     successful compatibility registration.
>  
>  2. Completion of an application acceptance form, which you can find at
> -   https://www.yoctoproject.org/webform/yocto-project-compatible-registration.
> +   :yocto_home:`/webform/yocto-project-compatible-registration`.
>  
>  To be granted permission to use the logo, you need to satisfy the
>  following:
> @@ -345,7 +345,7 @@ application, you can use the Yocto Project Compatibility Logo with your
>  layer and the application that uses your layer.
>  
>  To access the form, use this link:
> -https://www.yoctoproject.org/webform/yocto-project-compatible-registration.
> +:yocto_home:`/webform/yocto-project-compatible-registration`.
>  Follow the instructions on the form to complete your application.
>  
>  The application consists of the following sections:
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index b51f2a6d1..01c0d5de5 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -141,11 +141,10 @@ hardware-specific configurations allows you to share other metadata by
>  using a different layer where that metadata might be common across
>  several pieces of hardware.
>  
> -Many layers exist that work in the Yocto Project development
> -environment. The `Yocto Project Curated Layer
> -Index <https://www.yoctoproject.org/software-overview/layers/>`__
> -and :oe_layerindex:`OpenEmbedded Layer Index <>`
> -both contain layers from which you can use or leverage.
> +Many layers exist that work in the Yocto Project development environment. The
> +:yocto_home:`Yocto Project Curated Layer Index </software-overview/layers/>`
> +and :oe_layerindex:`OpenEmbedded Layer Index <>` both contain layers from
> +which you can use or leverage.
>  
>  By convention, layers in the Yocto Project follow a specific form.
>  Conforming to a known structure allows BitBake to make assumptions
> @@ -2093,10 +2092,8 @@ The capability to run tasks in a fake root environment is known as
>  the BitBake keyword/variable flag that requests a fake root environment
>  for a task.
>  
> -In the :term:`OpenEmbedded Build System`,
> -the program that
> -implements fakeroot is known as
> -`Pseudo <https://www.yoctoproject.org/software-item/pseudo/>`__. Pseudo
> +In the :term:`OpenEmbedded Build System`, the program that implements
> +fakeroot is known as :yocto_home:`Pseudo </software-item/pseudo/>`. Pseudo
>  overrides system calls by using the environment variable ``LD_PRELOAD``,
>  which results in the illusion of running as root. To keep track of
>  "fake" file ownership and permissions resulting from operations that
> diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
> index 418f4e993..0da408443 100644
> --- a/documentation/profile-manual/usage.rst
> +++ b/documentation/profile-manual/usage.rst
> @@ -1159,9 +1159,8 @@ e.g. 'perf help' or 'perf help record'.
>  
>  However, by default Yocto doesn't install man pages, but perf invokes
>  the man pages for most help functionality. This is a bug and is being
> -addressed by a Yocto bug: `Bug 3388 - perf: enable man pages for basic
> -'help'
> -functionality <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3388>`__.
> +addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for
> +basic 'help' functionality </show_bug.cgi?id=3388>`.
>  

Can you send a separate patch for this one file's diff please? It's nothing
to do with :yocto_home:.

Also, have you checked that the :yocto_home: URL change didn't break any
URL? (Execute `make linkcheck` IIRC, it takes some time).

Thanks,
Quentin
