Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web10.5087.1622111369516310298
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 03:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FrPFL2PFCz5tlJ;
	Thu, 27 May 2021 12:29:25 +0200 (CEST)
Date: Thu, 27 May 2021 12:29:24 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add glossary entry, INHIBIT_PACKAGE_STRIP_FILES
Message-ID: <20210527102924.wc5gnknwlekk4j7b@qschulz>
References: <e93fc77b-ea2f-862c-1476-6716da65e47f@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <e93fc77b-ea2f-862c-1476-6716da65e47f@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Fri, May 21, 2021 at 05:04:24AM -0400, Robert P. J. Day wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 0b61f77cb..b1774d22a 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3446,6 +3446,16 @@ system and gives an overview of their function and contents.
>        Consequently, you should not set ``INHIBIT_PACKAGE_STRIP`` when you
>        plan to debug in general.
> 
> +   :term:`INHIBIT_PACKAGE_STRIP_FILES`
> +      List of files to avoid stripping, to retain the ability to run
> +      certain tests on them. A small example from current ``elfutils``
> +      recipe file::
> +

Would it make sense to replicate more or less what was written for
INHIBIT_PACKAGE_STRIP? The behavior is very similar so I feel like it'd
be a good thing to have. I think we could even go for adding a word or
two in INHIBIT_PACKAGE_STRIP to say that if you only want to debug one
file, you can use INHIBIT_PACKAGE_STRIP_FILES instead.

I think it's also important to specify that ${PKGD} should be used as
prefix to the path (and not, e.g. ${D}). At least.. from my
understanding of the code below.

Thanks for the patch!
Cheers,
Quentin
