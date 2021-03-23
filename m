Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.9719.1616510371214760764
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 07:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5B1C220006;
	Tue, 23 Mar 2021 14:39:29 +0000 (UTC)
Subject: Re: [docs] [PATCH] documentation/README minor improvements
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 docs@lists.yoctoproject.org
References: <20210322171725.78677-1-michael.opdenacker@bootlin.com>
 <5f42e521-1c65-9905-eb56-0b2ad4967d1a@linaro.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3f18c3fe-ba35-1370-5fba-e3c5f42d312f@bootlin.com>
Date: Tue, 23 Mar 2021 15:39:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5f42e521-1c65-9905-eb56-0b2ad4967d1a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Nicolas,

On 3/22/21 7:34 PM, Nicolas Dechesne wrote:
> On 3/22/21 6:17 PM, Michael Opdenacker wrote:
>> - Minor style and spelling fixes
>> - Add some extra details; add missing external link macros
>>    and explain where they are defined
>> - Correct where documentation can be found on the
>>    Yocto Project website: the "Documentation" tab
>>    has been replaced by "Docs" (and its later
>>    shown as uppercase ("DOCS") by the current CSS, but this
>>    may change one day.
>>
>> These updates are not critical anyway, as this file is not part
>> of the project documentation. It's the documentation of the
>> documentation!
>
> This shouldn't really be in commit log. If needed please add in the
> below section, so that it's stripped when the patch is applied.
>
> Other than that, it looks good, thanks for the cleanup.   


This definitely make sense. Thanks for the review. I'll send a new
version version right away.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

