Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.30537.1631543181831306235
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 07:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 94841200009;
	Mon, 13 Sep 2021 14:26:19 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: font fixes
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210903085125.2033899-1-michael.opdenacker@bootlin.com>
 <20210906133350.fcijjn7u4yhisibq@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <337e85d1-dc00-a1e2-4cc2-79ba75c7e926@bootlin.com>
Date: Mon, 13 Sep 2021 16:26:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210906133350.fcijjn7u4yhisibq@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 9/6/21 3:33 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On Fri, Sep 03, 2021 at 10:51:25AM +0200, Michael Opdenacker wrote:
>> This fixes font inconsistencies, mixing a ``text`` string
>> with another string with the regular font, where the whole string
>> makes more sense with a single font.
>>
>> The result is also much simpler and will make future
>> searches easiers.
>>
> But you also lose the indication that this given string should be
> replaced by the user.

True, but that was a very weak indication anyway.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

