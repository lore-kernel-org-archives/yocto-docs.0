Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.3446.1628248313486088627
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 04:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9479DFF804;
	Fri,  6 Aug 2021 11:11:51 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: mention license information in footer
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1695FB134708B5C3.29235@lists.yoctoproject.org>
 <1695FB528AB59051.5172@lists.yoctoproject.org>
 <1696A0E01FF4F31A.10446@lists.yoctoproject.org>
 <c6225ec3-fe53-8005-093c-c7d7cb16596d@bootlin.com>
 <f8fb3e4e98014f13bca55a71b2c8fdc28771758d.camel@linuxfoundation.org>
 <16981F62D5EC88B2.6880@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <cf6901c8-f89b-c812-dff5-a8ef7dea5cdc@bootlin.com>
Date: Fri, 6 Aug 2021 13:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <16981F62D5EC88B2.6880@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 8/4/21 4:02 PM, Michael Opdenacker wrote:
> Richard,
>
> On 8/4/21 3:48 PM, Richard Purdie wrote:
>> We probably should have something mentioning the license, yes and this
>> change is ok.
>>
>> We can't just say it is community owned because it is not, much of the 
>> docs work was done through the Linux Foundation and they do technically 
>> own that copyright, not the community. If any contributor wants to add
>> their copyright we can do that, or we can probably change it to "Linux
>> Foundation and The Yocto Project and OpenEmbedded community".
>
> Thanks for your feedback. I'll merge the first change and propose a
> quick subsection in the manual detailing the license.
> Unless there are disagreements, I propose to stick to the LF as
> copyright owner.


Eventually, I'll stick to what we have currently. The boilerplate
inserted at the end of each manual clearly states the license. That's
probably enough.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

