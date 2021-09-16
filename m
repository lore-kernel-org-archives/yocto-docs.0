Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.1710.1631801292055186782
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 07:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 62E4724000D;
	Thu, 16 Sep 2021 14:08:09 +0000 (UTC)
Subject: Re: [docs] [PATCH v3 1/5] ref-manual: document UPSTREAM_CHECK_COMMITS and UPSTREAM_VERSION_UNKNOWN
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
 <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
 <20210915175842.2998541-2-michael.opdenacker@bootlin.com>
 <6D0567BB-0803-4839-83B4-99A9F82C1539@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <aeab0fe2-954c-0598-89f7-e8e0b6a8bfac@bootlin.com>
Date: Thu, 16 Sep 2021 16:08:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6D0567BB-0803-4839-83B4-99A9F82C1539@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Thanks for the reviews!

On 9/16/21 9:14 AM, Quentin Schulz wrote:
>
> "allows to determine what the latest upstream version is,"


Oops, that's what you get when you write text too late in the day.
Fixed, thanks!

>> +      you can set :term:`UPSTREAM_VERSION_UNKNOWN`` to ``1`` in the recipe
> Spurious tick quote after the term reference.


Fix too, thanks again.
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

