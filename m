Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.414.1623937285203641939
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 06:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3E6EBC0016
	for <docs@lists.yoctoproject.org>; Thu, 17 Jun 2021 13:41:22 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: fix issues related to trailing dots
To: docs@lists.yoctoproject.org
References: <16896175A22B1467.698@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ec1267fe-691a-9f0d-db4b-f4ed5d7d053c@bootlin.com>
Date: Thu, 17 Jun 2021 15:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <16896175A22B1467.698@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Michael,

Thanks for the patch, but not it's not your best day today ;-)

On 6/17/21 3:24 PM, Michael Opdenacker wrote:
> --- a/documentation/sdk-manual/appendix-customizing.rst
> +++ b/documentation/sdk-manual/appendix-customizing.rst
> @@ -78,8 +78,6 @@ adjustments:
>        ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`"
>        section of the BitBake User Manual.
>  
> -   .
> -
>  -  If you have classes or recipes that add additional tasks to the
>     standard build flow (i.e. the tasks execute as the recipe builds as
>     opposed to being called explicitly), then you need to do one of the
> @@ -294,8 +292,7 @@ source, you need to do a number of things:
>  
>           This second option is the safest option should you have any
>           doubts as to which method to use when setting
> -         SSTATE_MIRRORS
> -         .
> +         :term:``SSTATE_MIRRORS``


Oops, wrong syntax. It should be :term:`SSTATE_MIRRORS`.

Please resubmit...

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

