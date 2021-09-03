Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.366.1630687910715549251
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Sep 2021 09:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 616DD40007;
	Fri,  3 Sep 2021 16:51:48 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH] dev manual, ch 1: various pedantic nitpickery
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <f110ee5f-4b96-2310-d02e-9f943d6f5b4b@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1be54a7a-ba22-de5e-61e6-de1b053bc0b4@bootlin.com>
Date: Fri, 3 Sep 2021 18:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f110ee5f-4b96-2310-d02e-9f943d6f5b4b@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 8/27/21 9:57 PM, Robert P. J. Day wrote:
> --  Reference or Conceptual Material: This type of material resides in an
> -   appropriate reference manual. For example, system variables are
> +-  Reference or conceptual material: This type of material resides in an
> +   appropriate reference manual. As an example, system variables are
>     documented in the :doc:`/ref-manual/index`.


Thanks to you, I realized that uppercase is legal and even recommended
when a sentence starts after a colon:
https://www.grammarly.com/blog/capitalization-after-colons/

I haven't seen this yet in Romance languages, but this definitely makes
sense.
Thanks again!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

