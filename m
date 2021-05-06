Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.960.1620314761037885016
 for <docs@lists.yoctoproject.org>;
 Thu, 06 May 2021 08:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.10] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6500A60016;
	Thu,  6 May 2021 15:25:58 +0000 (UTC)
Cc: quentin.schulz@streamunlimited.com
Subject: Re: [docs] [PATCH v2] kernel-dev: document KCONFIG_MODE
To: Daniel Wagenknecht <dwagenknecht@emlix.com>, docs@lists.yoctoproject.org
References: <20210505085749.753783-1-dwagenknecht@emlix.com>
 <8bc762e4-cd03-f305-2635-ce390c4ea40d@bootlin.com>
 <e651d05fba0a2f9ffb800820d4a762b66eb0f4ca.camel@emlix.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <4bd4165d-734a-660e-541e-c96579640c81@bootlin.com>
Date: Thu, 6 May 2021 17:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e651d05fba0a2f9ffb800820d4a762b66eb0f4ca.camel@emlix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Daniel

On 5/6/21 7:46 AM, Daniel Wagenknecht wrote:
> Hello Michael, hello Quentin,
>
>> From an English perspective, I believe that "unset" means "not set", but
>> from a UNIX perspective, it makes me think about corresponding shell
>> command, that unsets an variable that was set previously.
>>
>> Could we just say "not set" instead of "unset"?
> It reduces ambiguity and I can see no reasons against "not set". Will you do
> this little fixup when merging?


Yes, done!
Merged in the "master-next" branch of yocto-docs.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

