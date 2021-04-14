Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web09.9972.1618388280712129583
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FKwMV0bkhz5tlN;
	Wed, 14 Apr 2021 10:17:58 +0200 (CEST)
Date: Wed, 14 Apr 2021 10:17:56 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 10/13] ref-manual: fix reference to build-essential
Message-ID: <20210414081756.ydogingjrtmmsv6x@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <be9ee46d744c7b2b559819c61cb68ae47898b7c0.1618358456.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <be9ee46d744c7b2b559819c61cb68ae47898b7c0.1618358456.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Tue, Apr 13, 2021 at 05:19:51PM -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> This has been here since the text was added to the DocBook version.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/system-requirements.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index dc619ce..2e2d0d3 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -274,7 +274,8 @@ version requirement for gcc:
>  
>  If your host development system does not meet this requirement, you can
>  resolve this by installing a ``buildtools-extended`` tarball that
> -contains additional tools, the equivalent of ``buildtools-essential``.
> +contains additional tools, the equivalent of the Debian/Ubuntu ``build-essential``
> +package.
>  
>  Installing a Pre-Built ``buildtools`` Tarball with ``install-buildtools`` script
>  --------------------------------------------------------------------------------
> -- 
> 1.8.3.1
> 

Thanks for the patch. Please send a backport patch once merged for still
maintained Sphinx-using releases of the docs. (dunfell and gatesgarth I
guess?).

Cheers,
Quentin
