Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.19864.1628760747559057611
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 02:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8F0FA1C0007;
	Thu, 12 Aug 2021 09:32:25 +0000 (UTC)
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: fix new override syntax migration
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210811200601.12265-1-foss@0leil.net>
 <5804b362-3801-28f8-8c95-d9a057ed2d63@bootlin.com>
 <20210812085510.ac36dd2qf7xte56f@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ecb5637e-b087-a1a6-ae63-00faf29db570@bootlin.com>
Date: Thu, 12 Aug 2021 11:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812085510.ac36dd2qf7xte56f@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/12/21 10:55 AM, Quentin Schulz wrote:

> Woke up to the same thoughts.
>
> Since 3.1, 3.2 and 3.3 will support the new syntax alongside the "old"
> one, I think the migration manuals would be correct without any change.
> So I'm all for dropping those changes.


Good. This also makes my life easier as I won't have to update the 3.1,
3.2, and 3.3 migration guides to mention the new syntax.

> This one looks wrong, and you get ``\:forcevariable`` in the output.
> I'll put ``:forcevariable`` instead. I can make the change by myself.
>
> Hopefully there isn't any other like that :)


It doesn't seem so.

>
> Will send a v2 tonight if I don't forget :) Or if you prefer to drop the
> changes in migration manuals yourself, let me know so I don't send a v2
> :)

No problem, I'll take care of this.
Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

