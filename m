Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.8909.1600420642646034871
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4Bt7X028ywz5tlH;
	Fri, 18 Sep 2020 11:17:17 +0200 (CEST)
Date: Fri, 18 Sep 2020 11:17:16 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] sphinx: ref-variables: Added entry for IMAGE_EFI_BOOT_FILES
Message-ID: <20200918091716.22q6yzqvqgr37usl@qschulz>
References: <1600420007-43045-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
MIME-Version: 1.0
In-Reply-To: <1600420007-43045-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Sep 18, 2020 at 05:06:47PM +0800, Jamaluddin, Khairul Rohaizzat wrote:
> From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
> 
> IMAGE_EFI_BOOT_FILES created to help differentiate files needed between
> bootimg-efi and bootimg-partition when creating the installer/.wic file.
> 
> Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
> ---
>  documentation/ref-manual/ref-variables.rst | 37 +++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index 625a37c..8483e08 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -2902,10 +2902,45 @@ system and gives an overview of their function and contents.
>        The base name of image output files. This variable defaults to the
>        recipe name (``${``\ :term:`PN`\ ``}``).
>  
> +   IMAGE_EFI_BOOT_FILES
> +      A space-separated list of files installed into the boot partition
> +      when preparing an image using the Wic tool with the
> +      ``bootimg-efi`` source plugin. By default,
> +      the files are
> +      installed under the same name as the source files. To change the
> +      installed name, separate it from the original name with a semi-colon
> +      (;). Source files need to be located in
> +      :term:`DEPLOY_DIR_IMAGE`. Here are two

Yet you have an example using IMGDEPLOYDIR?

(and there is only one example :) )

> +      examples:
> +      ::
> +
> +         IMAGE_EFI_BOOT_FILES = ${IMGDEPLOYDIR}/${IMAGE_BASENAME}-${MACHINE}.ext4;rootfs.img
> +

Probably missing surrounding double quotes?

Also, it is quite confusing to say it's a space-separated list of files
but the only example is with a semi-colon in it. I'd just add one more
example before explaining how to change the installed name with multiple
files in it (space-separated of course :) ).

Cheers,
Quentin
