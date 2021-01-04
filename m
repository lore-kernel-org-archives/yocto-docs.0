Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.11450.1609751720748980214
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 01:15:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4D8VMn5xmRz5tlJ;
	Mon,  4 Jan 2021 10:15:17 +0100 (CET)
Date: Mon, 4 Jan 2021 10:15:16 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Elvis Stansvik <elvstone@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: terms: Fix poky tarball root folder
Message-ID: <20210104091516.kqaoptazpy4h4lna@qschulz>
References: <20201231112703.279217-1-elvstone@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201231112703.279217-1-elvstone@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 31, 2020 at 12:27:03PM +0100, Elvis Stansvik wrote:
> When extracting the tarball the root folder is not named `poky`, but
> e.g. `poky-gatesgarth-24.0.0`.
> ---
>  documentation/ref-manual/terms.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index c07dd4b12..966962005 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -349,7 +349,8 @@ universal, the list includes them just in case:
>       Source Directory is derived from the Yocto Project release tarball.
>       For example, downloading and unpacking
>       :yocto_dl:`/releases/yocto/&DISTRO_REL_TAG;/&YOCTO_POKY;.tar.bz2`
> -     results in a Source Directory whose root folder is named ``poky``.
> +     results in a Source Directory whose root folder is named
> +     ``&YOCTO_POKY;``.


Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
