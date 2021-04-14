Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.9953.1618388169260992670
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FKwKL2bbPz5tlB;
	Wed, 14 Apr 2021 10:16:06 +0200 (CEST)
Date: Wed, 14 Apr 2021 10:16:05 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 09/13] ref-manual: add FIT_KERNEL_COMP_ALG*
Message-ID: <20210414081605.nkoys2ri63h2d75f@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <fedb9252444ceaaaa6567d381318ca02c119a3da.1618358456.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <fedb9252444ceaaaa6567d381318ca02c119a3da.1618358456.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Tue, Apr 13, 2021 at 05:19:50PM -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> Add FIT_KERNEL_COMP_ALG and FIT_KERNEL_COMP_ALG_EXTENSION. Examining
> OE-Core commit 5c72105e2973e613b5c0f0e6310ffdea6e56c6c7 and the
> associated code, these do not enable arbitrary selection of compression
> algorithm - only disabling compression - so document them accordingly.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/variables.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 3b76dbc..f010cd7 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2580,6 +2580,17 @@ system and gives an overview of their function and contents.
>     :term:`FIT_HASH_ALG`
>        Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
>  
> +   :term:`FIT_KERNEL_COMP_ALG`
> +      Compression algorithm to use for the kernel image inside the fitImage.
> +      At present, the only supported values are "gzip" (default) or "none",
> +      which allows disabling of compression if it would otherwise be enabled.

I'm not a native speaker and I'm struggling to understand that last line,
would it be possible for you to rephrase please?

> +      If you set this you will also need to set :term:`FIT_KERNEL_COMP_ALG_EXTENSION`.
> +
> +   :term:`FIT_KERNEL_COMP_ALG_EXTENSION`
> +      File extension corresponding to :term:`FIT_KERNEL_COMP_ALG`. The default
> +      value is ".gz"; if you set ``FIT_KERNEL_COMP_ALG`` to "none" then

s/``FIT_KERNEL_COMP_ALG``/:term:`FIT_KERNEL_COMP_ALG`/

Thanks,
Quentin
