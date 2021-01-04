Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.15803.1609776552112727723
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 08:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4D8gYJ5bTgz5tlD;
	Mon,  4 Jan 2021 17:09:07 +0100 (CET)
Date: Mon, 4 Jan 2021 17:09:06 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v3] variables: Add documentation for KERNEL_DTC_FLAGS
Message-ID: <20210104160906.rk4z6odydpdy2tx3@qschulz>
References: <20210104142851.6696-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210104142851.6696-1-ovidiu.panait@windriver.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 04, 2021 at 04:28:51PM +0200, Ovidiu Panait wrote:
> Add documentation for the newly introduced KERNEL_DTC_FLAGS variable.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
> v3 updates:
> - highlight ``DTC_FLAGS`` and ``dtc``
> 
>  documentation/ref-manual/variables.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c8e28fd32..4ce264813 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3884,6 +3884,15 @@ system and gives an overview of their function and contents.
>  
>           KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
>  
> +   :term:`KERNEL_DTC_FLAGS`
> +      Specifies the ``dtc`` flags that are passed to the Linux kernel build
> +      system when generating the device trees (via ``DTC_FLAGS`` environment
> +      variable).
> +
> +      In order to use this variable, the
> +      :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
> +      be inherited.
> +
>     :term:`KERNEL_EXTRA_ARGS`
>        Specifies additional ``make`` command-line arguments the OpenEmbedded
>        build system passes on when compiling the kernel.

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
