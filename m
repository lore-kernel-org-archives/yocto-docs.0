Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.5440.1623837564716581782
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 02:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4G4gdP1wTXz5tlP;
	Wed, 16 Jun 2021 11:59:21 +0200 (CEST)
Date: Wed, 16 Jun 2021 11:59:19 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] sdk-manual: fix broken references
Message-ID: <20210616095919.du3xmrpe2adlhge7@qschulz>
References: <20210615170056.211711-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210615170056.211711-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Tue, Jun 15, 2021 at 07:00:56PM +0200, Michael Opdenacker wrote:
> Detected by running:
> git grep "^[\ ]*\" section" | grep -v "\`"
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  .../sdk-manual/appendix-customizing.rst         | 12 ++++++------
>  documentation/sdk-manual/extensible.rst         | 17 ++++++++---------
>  documentation/sdk-manual/working-projects.rst   |  5 ++---
>  3 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
> index 67b49d9f49..c122fb5836 100644
> --- a/documentation/sdk-manual/appendix-customizing.rst
> +++ b/documentation/sdk-manual/appendix-customizing.rst
> @@ -74,9 +74,9 @@ adjustments:
>        is set using the "?=" operator. Consequently, you will need to
>        either define the entire list by using the "=" operator, or you
>        will need to append a value using either "_append" or the "+="
> -      operator. You can learn more about these operators in the "
> -      Basic Syntax
> -      " section of the BitBake User Manual.
> +      operator. You can learn more about these operators in the
> +      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`"
> +      section of the BitBake User Manual.
>  
>     .
>  

This seems like a spurious dot. (not introduced by your patch, I know :) )

Looks good otherwise, did you check that it's referring to the same page
we had in earlier docs? I often check by going on
https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html
and click on links and check if the reference I'm giving is the expected
one.

Cheers,
Quentin
