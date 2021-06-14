Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web08.27008.1623658335759227237
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 01:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4G3PLj2Z0pz5tlY;
	Mon, 14 Jun 2021 10:12:13 +0200 (CEST)
Date: Mon, 14 Jun 2021 10:12:12 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Daniel Wagenknecht <dwagenknecht@emlix.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 0/2] Fixups for glossary
Message-ID: <20210614081212.2fbbgzvaw7e62dqx@qschulz>
References: <20210614053013.68669-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
In-Reply-To: <20210614053013.68669-1-dwagenknecht@emlix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

On Mon, Jun 14, 2021 at 07:30:11AM +0200, Daniel Wagenknecht wrote:
> Did some fixups as suggested by Quentin.
> 
> On Fri, 2021-06-11 at 19:20 +0200, Quentin Schulz wrote:
> > >           IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} \
> > > -             --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> > > +             --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.jffs2 \
> > >               ${EXTRA_IMAGECMD}"
> > 
> > It'd be awesome if you could do a follow-up patch here since this isn't the actual
> > content of this variable anymore.
> done
> 
> > IMAGE_MANIFEST isn't in this class anymore, it'd be great again if you
> > could send a follow-up patch for this.
> done
> 
> > On a side note: you should have added the term in the glossary (from patch 2)
> > first, because technically this commit does not build.
> will keep in mind next time.
> 
> Thanks for taking a thorough look at the changes and what was still
> missing. Great work you are all doing with the documentation!
> 
> Best Wishes
>   Daniel
> 
> Daniel Wagenknecht (2):
>   ref-manual: variables: fixup example in IMAGE_CMD
>   ref-manual: variables: fixup class reference in IMAGE_MANIFEST
> 

Thanks a ton Daniel, much appreciated :)

Looking forward to your next patches :)
Cheers,
Quentin
