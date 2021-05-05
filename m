Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.8624.1620222848518031154
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 06:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.8] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A0D991C0007;
	Wed,  5 May 2021 13:54:06 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: reduce verbosity with "worry about" expression
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210505133408.61293-1-michael.opdenacker@bootlin.com>
 <20210505133732.6hcga4tmpy7u5pwk@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f4628aab-d2b2-8ce9-48ca-64ab1a606947@bootlin.com>
Date: Wed, 5 May 2021 15:54:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505133732.6hcga4tmpy7u5pwk@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Thanks for the super quick review!

On 5/5/21 3:37 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On Wed, May 05, 2021 at 03:34:08PM +0200, Michael Opdenacker wrote:
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/dev-manual/common-tasks.rst  | 4 ++--
>>  documentation/kernel-dev/common.rst        | 4 ++--
>>  documentation/ref-manual/classes.rst       | 4 ++--
>>  documentation/ref-manual/structure.rst     | 2 +-
>>  documentation/toaster-manual/reference.rst | 5 ++---
>>  5 files changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
>> index 37c7a19bfa..713ed8d64e 100644
>> --- a/documentation/dev-manual/common-tasks.rst
>> +++ b/documentation/dev-manual/common-tasks.rst
>> @@ -1589,7 +1589,7 @@ your software is built:
>>  
>>  -  *Autotools:* If your source files have a ``configure.ac`` file, then
>>     your software is built using Autotools. If this is the case, you just
>> -   need to worry about modifying the configuration.
>> +   to modify the configuration.
>>  
> Missing "need"

Oops, thanks. I fixed it in my branch.

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

