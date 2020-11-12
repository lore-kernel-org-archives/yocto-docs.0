Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web12.2007.1605173818970983655
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 01:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4CWxMB2yjnz5tlC;
	Thu, 12 Nov 2020 10:36:54 +0100 (CET)
Date: Thu, 12 Nov 2020 10:36:53 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 2/2] poky.yaml: updates for 3.2
Message-ID: <20201112093652.el5pz2dw2nkz3ick@qschulz>
References: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
 <20201112075206.113124-3-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201112075206.113124-3-nicolas.dechesne@linaro.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Thu, Nov 12, 2020 at 08:52:06AM +0100, Nicolas Dechesne wrote:
> Updates global variables for 3.2 / Gategarth release.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
> v2: fix DISTRO_NAME_NO_CAP_MINUS_ONE
> 
>  documentation/poky.yaml | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 85f42cf07..e184fa829 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,11 +1,11 @@
> -DISTRO : "3.1"
> -DISTRO_NAME_NO_CAP : "dunfell"
> -DISTRO_NAME : "Dunfell"
> -DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1"
> -YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
> -DISTRO_REL_TAG : "yocto-3.1"
> -POKYVERSION : "23.0.0"
> +DISTRO : "3.2"
> +DISTRO_NAME_NO_CAP : "gatesgarth"
> +DISTRO_NAME : "Gatesgarth"
> +DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
> +YOCTO_DOC_VERSION : "3.2"
> +YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
> +DISTRO_REL_TAG : "yocto-3.2"

DISTRO_REL_TAG : "yocto-&DISTRO;"
?

Provided DISTRO is bumped for dot releases too?

Thanks,
Quentin
