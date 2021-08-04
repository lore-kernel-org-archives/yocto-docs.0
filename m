Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8848.1628083802245109662
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 06:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3F9EC2000D;
	Wed,  4 Aug 2021 13:29:59 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] migration-3.4: Add extra notes to override sytnax changes
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
 <20210804094714.3500323-2-richard.purdie@linuxfoundation.org>
 <20210804102916.2k4qgvnyxz326fme@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2f572b87-3552-382e-ed19-114c92000f23@bootlin.com>
Date: Wed, 4 Aug 2021 15:29:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804102916.2k4qgvnyxz326fme@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Quentin,

Thanks for the review!

On 8/4/21 12:29 PM, Quentin Schulz wrote:
> s/BBFILE_PATTERN/:term:`BBFILE_PATTERN`/
>
> Styling might be better with :term:`SRCREV```_xxx`` (if that works,
> might need a "\ " before or something to separate the tick quotes?)?
> Maybe worth a try.

Fixed. Indeed, a "\ " was needed to make it work.

> s/xxx/``xxx``/ ?
>
> s/PREFERRED_VERSION_xxx/:term:`PREFERRED_VERSION`_xxx/ (if style
> suggestion above is chosen, to be applied to this too).


Done

>
>> +layer.conf suffixes may be the same as a :term:`DISTRO` override causing some
> s/layer.conf/``layer.conf``/


Done. 

I also fixed the typo in the title.

I pushed the changes to "master-next". See the built result in
http://docs.yoctoproject.org/next/migration-guides/migration-3.4.html#override-syntax-changes

Once again, further reviews are still possible. I can also add
"Reviewed-by" statements ;-)

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

