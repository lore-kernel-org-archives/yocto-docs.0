Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.31441.1631547714568438651
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 08:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B0E5CC000B;
	Mon, 13 Sep 2021 15:41:52 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCHv2] common-tasks: Add an example of using bbappends to add a file
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tom Rini <tom.rini@gmail.com>
References: <20210819151233.10066-1-trini@konsulko.com>
 <20210820075937.d3wazzbbfmybuffv@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <110550c5-2ecc-ba06-1328-9e4c0321f3bb@bootlin.com>
Date: Mon, 13 Sep 2021 17:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210820075937.d3wazzbbfmybuffv@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Tom, Quentin,

On 8/20/21 9:59 AM, Quentin Schulz wrote:
> Hi Tom,
>
> On Thu, Aug 19, 2021 at 11:12:33AM -0400, Tom Rini wrote:
>> Use the xserver-xf86-config_%.bbappend from meta-raspberrypi to provide
>> an example of having a bbappend file add files to an existing recipe.
>>
>> Signed-off-by: Tom Rini <trini@konsulko.com>
> Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks for the nice patch and reviews.

Merged into "master-next" (at last!)

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

