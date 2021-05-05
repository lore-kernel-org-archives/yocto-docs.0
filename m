Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.10000.1620228591574054956
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 08:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.8] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6FCD320009;
	Wed,  5 May 2021 15:29:48 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: delete references to dead LSB compliance
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <90526bad-9558-be3-252f-8e48b2d6eb93@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <20dbced8-602a-0cbb-87eb-b74664b60358@bootlin.com>
Date: Wed, 5 May 2021 17:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <90526bad-9558-be3-252f-8e48b2d6eb93@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

Many thanks for the patch!

On 5/1/21 3:16 PM, Robert P. J. Day wrote:
> Since LSB does not seem to be relevant these days, delete mentions of
> it.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index f8dc7d282..b1201e4fb 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -783,7 +783,7 @@ system. The tools, however, can also be used on targets.
>
>  This directory contains non-essential applications that add features
>  compared to the alternatives in core. You might need this directory for
> -full tool functionality or for Linux Standard Base (LSB) compliance.
> +full tool functionality.


I found that meta/recipes-extended/lsb/lsb-release still exists in Poky,
but indeed, I trust your comment on LSB relevance. So this paragraph can
indeed be simplified. Apparently, nobody disagrees.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into the "master-next" branch of yocto-docs.

Thanks again!

Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

