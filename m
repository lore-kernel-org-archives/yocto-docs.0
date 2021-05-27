Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.5078.1622112564162968488
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 03:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FrPhL2ldFz5tlL;
	Thu, 27 May 2021 12:49:21 +0200 (CEST)
Date: Thu, 27 May 2021 12:49:20 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add glossary entry for NON_MULTILIB_RECIPES
Message-ID: <20210527104920.7gdkqgjqdinckr3s@qschulz>
References: <4483651b-7799-71b4-69e1-8ba43b933821@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <4483651b-7799-71b4-69e1-8ba43b933821@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 23, 2021 at 07:00:57AM -0400, Robert P. J. Day wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index df6413b68..7f9182a5a 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4803,6 +4803,13 @@ system and gives an overview of their function and contents.
>           FILES_${PN}-dbg = "/usr/src/debug/"
>           FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"
> 
> +   :term:`NON_MULTILIB_RECIPES`
> +      A list of recipes that should not be built for multilib. OE-Core's
> +      ``multilib.conf`` file defines a reasonable starting point for this
> +      list with::
> +
> +         NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
> +

I'm surprised the kernel isn't part of this list? I would have assumed
it would be there.

Anyway,
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks for the patch!
Cheers,
Quentin
