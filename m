Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web08.9435.1608629969546938343
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 01:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4D0WWf28HXz5tlN;
	Tue, 22 Dec 2020 10:39:26 +0100 (CET)
Date: Tue, 22 Dec 2020 10:39:24 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 4/5] variables: Add documentation for new kernel-fitimage vars
Message-ID: <20201222093924.gdmvccls6xd7bme7@qschulz>
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
 <2a491bf195731319b9fa3bca15b95f7ce8342af5.1608598606.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <2a491bf195731319b9fa3bca15b95f7ce8342af5.1608598606.git.paul.eggleton@linux.microsoft.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Mon, Dec 21, 2020 at 05:06:03PM -0800, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> Add documentation for FIT_DESC, FIT_SIGN_INDIVIDUAL, UBOOT_MKIMAGE,
> UBOOT_MKIMAGE_SIGN and UBOOT_MKIMAGE_SIGN_ARGS.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/variables.rst | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 8f7f86e..607ebfe 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2538,6 +2538,14 @@ system and gives an overview of their function and contents.
>        For guidance on how to create your own file permissions settings
>        table file, examine the existing ``fs-perms.txt``.
>  
> +   :term:`FIT_DESC`
> +      Specifies the description string encoded into a fitImage. The default
> +      value is set by the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
> +      class as follows:
> +      ::

The two lines above have the same outcome as:

class as follows::

IIRC. I don't remember if a patch was sent by Robert recently nor if it
was merged (does not seem so?) but we strive for consistency on this one
by having all :\n:: migrated to :: at the end of a paragraph.

c.f.: https://lists.yoctoproject.org/g/docs/message/557

Thanks,
Quentin
