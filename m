Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.9291.1603096361668854332
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 01:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4CF9464zTrz5tlK;
	Mon, 19 Oct 2020 10:32:38 +0200 (CEST)
Date: Mon, 19 Oct 2020 10:32:37 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH] ref-variables: Given example for naming sources
Message-ID: <20201019083237.t4dmjcdgsr7d5dxr@qschulz>
References: <20201016203150.36679-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201016203150.36679-1-JPEWhacker@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joshua,

On Fri, Oct 16, 2020 at 03:31:50PM -0500, Joshua Watt wrote:
> Adds an example to SRC_URI that explains how to name sources in SRC_URI
> and how to associate SRCREVs and checksums with the names
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/ref-manual/ref-variables.rst | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index 316e8aabf..d65d0a4a5 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -7236,8 +7236,18 @@ system and gives an overview of their function and contents.
>           tree when using the Git fetcher is used.
>  
>        -  ``name`` - Specifies a name to be used for association with
> -         ``SRC_URI`` checksums when you have more than one file specified
> -         in ``SRC_URI``.
> +         ``SRC_URI`` checksums or :term:`SRCREV` when you have more than one
> +         file or git repository specified in ``SRC_URI``. For example:
> +         ::
> +
> +            SRC_URI = "git://example.com/foo.git;name=first \
> +                       git://example.com/bar.git;name=second \
> +                       http://example.com/file.tar.gz;name=third"
> +
> +            SRCREV_first = "f1d2d2f924e986ac86fdf7b36c94bcdf32beec15"
> +            SRCREV_second = "e242ed3bffccdf271b7fbaf34ed72d089537b42f"
> +            SRC_URI[third.sha256sum] = "13550350a8681c84c861aac2e5b440161c2b33a3e4f302ac680ca5b686de48de"
> +

Well, I discovered something today :)

Looking in poky, I found vulkan-demos recipe which has interesting
SRCREVs:

```
SRCREV_glm = "1ad55c5016339b83b7eec98c31007e0aee57d2bf"
SRCREV_ktx = "726d14d02c95bb21ec9e43807751b491d295dd3c"

SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
           git://github.com/g-truc/glm;destsuffix=git/external/glm;name=glm \
           git://github.com/KhronosGroup/KTX-Software;destsuffix=git/external/ktx;name=ktx;lfs=0 \
	   ...
	   "

SRCREV = "4818f85916bf88c1ca8c2ed1a46e0e758651489e"
```

Would that benefit from an explanation in the same paragraph, should we
"fix" the recipe or do we just ignore it exists :) ?

Otherwise, considering it's used in master poky the way you explain it:
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks,
Quentin
