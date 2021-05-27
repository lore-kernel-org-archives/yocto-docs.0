Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.4945.1622111627238070683
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 03:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FrPLK2crgz5tlH;
	Thu, 27 May 2021 12:33:45 +0200 (CEST)
Date: Thu, 27 May 2021 12:33:44 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add DEBUGFS-related variables to glossary
Message-ID: <20210527103344.pqxrbddld5rtpbge@qschulz>
References: <b3b0312-688f-1b68-ac2b-29db8163cc9a@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <b3b0312-688f-1b68-ac2b-29db8163cc9a@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Fri, May 21, 2021 at 05:35:21AM -0400, Robert P. J. Day wrote:
> 
> Add variable glossary entries for all of:
> 
>   * IMAGE_GEN_DEBUGFS
>   * IMAGE_FSTYPES_DEBUGFS
>   * IMAGE_INSTALL_DEBUGFS
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 0b61f77cb..1ce43a954 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3006,6 +3006,24 @@ system and gives an overview of their function and contents.
>              or ``_prepend``. You must use the ``+=`` operator to add one or
>              more options to the ``IMAGE_FSTYPES`` variable.
> 
> +   :term:`IMAGE_FSTYPES_DEBUGFS`
> +      Similar to :term:`IMAGE_FSTYPES`, specifies the formats the
> +      OpenEmbedded build system uses during the build when creating the
> +      debug filesystem, as long as :term:`IMAGE_GEN_DEBUGFS` has been
> +      set to '1'.
> +
> +      The default value from ``bitbake.conf``::
> +
> +         IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
> +
> +   :term:`IMAGE_GEN_DEBUGFS`
> +      Set to '1' in order to generate a separate debug fileystem::
> +
> +         IMAGE_GEN_DEBUGFS = '1'
> +
> +      If set, the debugfs will be generated with all of the filesystem

Having worked with the kernel before Yocto, for me debugfs is a pseudo
filesystem created and mounted by the kernel. I guess this has nothing
to do with it. Could we elaborate a bit more on what this debug
filesystem is and what's its use? And also put a word that this
shouldn't be confused with debugfs filesystem from the kernel, c.f.
https://www.kernel.org/doc/html/latest/filesystems/debugfs.html.

Eager to learn what this is for :)

Thanks for the patch!
Cheers,
Quentin
