Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.24270.1627653997736464089
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 07:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8A1A6FF809;
	Fri, 30 Jul 2021 14:06:35 +0000 (UTC)
Cc: docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH v2] migration-guides: Add start of 3.4 guide with override migration notes
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <16968778436D0C00.13113@lists.yoctoproject.org>
 <20210730094757.177431-1-michael.opdenacker@bootlin.com>
 <20210730103304.fb5d2b4aqfwszt4z@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6e2d3873-9172-c8f1-00dd-8721110334b0@bootlin.com>
Date: Fri, 30 Jul 2021 16:06:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730103304.fb5d2b4aqfwszt4z@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 7/30/21 12:33 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On Fri, Jul 30, 2021 at 11:47:57AM +0200, Michael Opdenacker wrote:
>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Reviewed-by: Quentin Schulz <foss@0leil.net>
> Please don't add my Reviewed-by if I haven't given it :)


Oops, my apologies!


> getVar to be tick quoted?
>
> Maybe we can link to:
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html?functions-for-accessing-datastore-variables
> for the various queries to the datastore?


Both done! I'm posting a V3 now.
Thanks,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

