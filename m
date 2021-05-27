Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web10.4400.1622105920159951258
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 01:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FrMDY18lhz5tl9;
	Thu, 27 May 2021 10:58:37 +0200 (CEST)
Date: Thu, 27 May 2021 10:58:35 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Weinberger <richard@nod.at>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][PATCH v2] Document erofs filesystem targets
Message-ID: <20210527085835.utg3dvjjexg2y2nv@qschulz>
References: <20210526215443.16066-1-richard@nod.at>
MIME-Version: 1.0
In-Reply-To: <20210526215443.16066-1-richard@nod.at>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Wed, May 26, 2021 at 11:54:43PM +0200, Richard Weinberger wrote:
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> Changes since v1:
>  - Order filesystem types alphabetically (requested by Quentin Schulz)
> ---
>  documentation/ref-manual/kickstart.rst | 8 +++++---
>  documentation/ref-manual/variables.rst | 3 +++
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
> index 8308ffff5b72..a7443f9ea37b 100644
> --- a/documentation/ref-manual/kickstart.rst
> +++ b/documentation/ref-manual/kickstart.rst
> @@ -106,13 +106,15 @@ the ``part`` and ``partition`` commands:
>  -  ``--fstype``: Sets the file system type for the partition. Valid
>     values are:
>  
> -   -  ``ext4``
> +   -  ``btrfs``
>  
> -   -  ``ext3``
> +   -  ``erofs``
>  
>     -  ``ext2``
>  
> -   -  ``btrfs``
> +   -  ``ext3``
> +
> +   -  ``ext4``
>  
>     -  ``squashfs``
>  
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index df6413b68ae9..b0dacf9fbf83 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3279,6 +3279,9 @@ system and gives an overview of their function and contents.
>        - cpio.lzma
>        - cpio.xz
>        - cramfs
> +      - erofs
> +      - erofs-lz4
> +      - erofs-lz4hc
>        - ext2
>        - ext2.bz2
>        - ext2.gz

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks for the patch!
Quentin
