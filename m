Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.12364.1609760662392337443
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 03:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4D8YgZ1RfPz5tlF;
	Mon,  4 Jan 2021 12:44:09 +0100 (CET)
Date: Mon, 4 Jan 2021 12:44:08 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [dunfell][PATCH] sphinx: update link to bitbake docs
Message-ID: <20210104114408.scgtnjcbpmqdqri4@qschulz>
References: <20210104112204.23071-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210104112204.23071-1-nicolas.dechesne@linaro.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Mon, Jan 04, 2021 at 12:22:04PM +0100, Nicolas Dechesne wrote:
> The Sphinx based Bitbake documentation for dunfell release is published to
> https://docs.yoctoproject.org/bitbake/1.46/.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  documentation/conf.py   | 2 +-
>  documentation/index.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 33d0ddcfd..b6d8073ee 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -82,7 +82,7 @@ extlinks = {
>  
>  # Intersphinx config to use cross reference with Bitbake user manual
>  intersphinx_mapping = {
> -    'bitbake': ('https://docs.yoctoproject.org/bitbake/', None)
> +    'bitbake': ('https://docs.yoctoproject.org/bitbake/1.46', None)
>  }
>  
>  # -- Options for HTML output -------------------------------------------------
> diff --git a/documentation/index.rst b/documentation/index.rst
> index 937692ce0..71ed4e76f 100644
> --- a/documentation/index.rst
> +++ b/documentation/index.rst
> @@ -33,7 +33,7 @@ Welcome to the Yocto Project Documentation
>     Profile and Tracing Manual <profile-manual/profile-manual>
>     Application Development and the Extensible SDK (eSDK) <sdk-manual/sdk-manual>
>     Toaster Manual <toaster-manual/toaster-manual>
> -   Bitbake User Manual <https://docs.yoctoproject.org/bitbake>
> +   Bitbake User Manual <https://docs.yoctoproject.org/bitbake/1.46>

Would it make sense to have an entry for that in poky.yaml? That way we
don't forget to fix it when tagging the new Yocto releases? (ideally if
there's a "master" equivalent for where 1.46 is in the URL, we might put
it there (or just plain '' if we can't).

E.g. YOCTO_BITBAKE_VERSION : "1.46"?

BTW, the version dropdown menu on bitbake documentation is broken, it
points to Yocto docs.

Quentin
