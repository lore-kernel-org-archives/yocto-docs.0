Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web12.578.1623432045267682197
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 10:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4G1nfx2p1Cz5tlF;
	Fri, 11 Jun 2021 19:20:41 +0200 (CEST)
Date: Fri, 11 Jun 2021 19:20:40 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Daniel Wagenknecht <dwagenknecht@emlix.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] ref-manual: variables: update examples refering to DEPLOY_DIR_IMAGE
Message-ID: <20210611172040.j7p3l6mln2mnfqss@qschulz>
References: <20210611062613.188300-1-dwagenknecht@emlix.com>
 <20210611062613.188300-2-dwagenknecht@emlix.com>
MIME-Version: 1.0
In-Reply-To: <20210611062613.188300-2-dwagenknecht@emlix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

On Fri, Jun 11, 2021 at 08:26:12AM +0200, Daniel Wagenknecht wrote:
> DEPLOY_DIR_IMAGE has been replaced by IMGDEPLOYDIR for most use cases
> since OE-Core rev 6d969bacc718e21a5246d4da9bf9639dcae29b02. Update
> examples given in the documentation to use IMGDEPLOYDIR and match their
> implementation.
> 
> Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
> ---
>  documentation/ref-manual/variables.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 8ebc17f24..2e859c718 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2946,7 +2946,7 @@ system and gives an overview of their function and contents.
>        an override for the associated type. Here is an example::
>  
>           IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} \
> -             --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> +             --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.jffs2 \
>               ${EXTRA_IMAGECMD}"
>  

It'd be awesome if you could do a follow-up patch here since this isn't the actual
content of this variable anymore.
C.f.: https://cgit.openembedded.org/openembedded-core/tree/meta/classes/image_types.bbclass#n59

>        You typically do not need to set this variable unless you are adding
> @@ -3095,10 +3095,10 @@ system and gives an overview of their function and contents.
>        The :ref:`image <ref-classes-image>` class defines the manifest

IMAGE_MANIFEST isn't in this class anymore, it'd be great again if you
could send a follow-up patch for this.
c.f. http://cgit.openembedded.org/openembedded-core/tree/meta/classes/rootfs-postcommands.bbclass#n31

Thanks for the patch!

Reviewed-by: Quentin Schulz <foss@0leil.net>

[...]
>        The location is
> -      derived using the :term:`DEPLOY_DIR_IMAGE`
> +      derived using the :term:`IMGDEPLOYDIR`

On a side note: you should have added the term in the glossary (from patch 2)
first, because technically this commit does not build.

Cheers,
Quentin
