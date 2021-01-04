Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web10.11724.1609755223286953900
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 02:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4D8Wg803xpz5tlK;
	Mon,  4 Jan 2021 11:13:39 +0100 (CET)
Date: Mon, 4 Jan 2021 11:13:38 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] variables: Add documentation for KERNEL_DTC_FLAGS
Message-ID: <20210104101337.v3zrh7esjhb3ak5d@qschulz>
References: <20210104095453.33977-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210104095453.33977-1-ovidiu.panait@windriver.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ovidiu,

On Mon, Jan 04, 2021 at 11:54:53AM +0200, Ovidiu Panait wrote:
> Add documentation for the newly introduced KERNEL_DTC_FLAGS variable.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  documentation/ref-manual/variables.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 8c6cc46b6..ef6d46d66 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3870,6 +3870,14 @@ system and gives an overview of their function and contents.
>  
>           KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
>  
> +   :term:`KERNEL_DTC_FLAGS`
> +      Specifies the dtc flags that are passed to the Linux kernel build system
> +      when generating the device trees (via DTC_FLAGS environment variable).
> +

I'd probably "highlight" DTC_FLAGS with ``DTC_FLAGS``. Same for dtc as
it's a program.

Otherwise,
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
