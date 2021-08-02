Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.19629.1627910038681500346
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 06:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 93C41FF806;
	Mon,  2 Aug 2021 13:13:56 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] profile-manual: document how to build perf manpages on target
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210730160617.185319-1-michael.opdenacker@bootlin.com>
 <20210802093816.vndv4fa25mbypjca@fedora>
 <6d8cf5bae1c7ee038342d837b0537d30accec9a2.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1763d756-4fbf-0c7b-a536-727886ac452a@bootlin.com>
Date: Mon, 2 Aug 2021 15:13:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6d8cf5bae1c7ee038342d837b0537d30accec9a2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

Thank you for the review!

On 8/2/21 2:43 PM, Richard Purdie wrote:
> On Mon, 2021-08-02 at 11:38 +0200, Quentin Schulz wrote:\
>> Should perf-doc not be the only package added to IMAGE_INSTALL? I assume
>> one wants perf-doc only if they need perf so they would already have it
>> in their image?
>>
>> s/perf // is what I suggest here.
> Personally, I think it is better to be specific. I did end up just installing
> the doc package when I first attempted to test this and if I can do that... :/.

LOL! We promise we will continue to improve the documentation to make
your user life easier!

Thanks again,
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

