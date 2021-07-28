Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.2437.1627463774726955860
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 02:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4D9C9FF80E;
	Wed, 28 Jul 2021 09:16:13 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 0/3] Improve/simplify references to the BitBake manual
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <1695B21F5A0B37B5.3345@lists.yoctoproject.org>
 <20210727171147.132288-1-michael.opdenacker@bootlin.com>
 <20210728084849.i2snf4hxgnwnq7fx@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <55016711-686d-c7df-7a2e-6c17fa2283b8@bootlin.com>
Date: Wed, 28 Jul 2021 11:16:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728084849.i2snf4hxgnwnq7fx@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/28/21 10:48 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Tue, Jul 27, 2021 at 07:11:44PM +0200, Michael Opdenacker wrote:
>> This new version:
>> - Updates the guidelines about refering to variable descriptions
>>   in the BitBake manual
>> - Explains the simplifications made to the references to the
>>   BitBake manual
>> - Add a new commit to replace explicit references to term
>>   descriptions in the BitBake manual by generic term references.
>>   Such descriptions are taken first from the Yocto Project Variable
>>   Glossary, or otherwise from the BitBake manual.
>>
>> *** BLURB HERE ***
>>
> Adding my blurb then :)

Oops, that was embarrassing. Thanks for your blurb then!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

