Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1232.1620315807386992283
 for <docs@lists.yoctoproject.org>;
 Thu, 06 May 2021 08:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.10] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8C7831BF208;
	Thu,  6 May 2021 15:43:25 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: reduce verbosity with "worry about" expression
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210505133408.61293-1-michael.opdenacker@bootlin.com>
 <20210505133732.6hcga4tmpy7u5pwk@qschulz>
 <167C3018EF3F78EB.28940@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <342d78f8-43b4-1bea-8291-4c9fa0f8fd86@bootlin.com>
Date: Thu, 6 May 2021 17:43:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <167C3018EF3F78EB.28940@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

On 5/5/21 3:54 PM, Michael Opdenacker wrote:
> Hi Quentin,
>
> Thanks for the super quick review!
>
> On 5/5/21 3:37 PM, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On Wed, May 05, 2021 at 03:34:08PM +0200, Michael Opdenacker wrote:
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>>  documentation/dev-manual/common-tasks.rst  | 4 ++--
>>>  documentation/kernel-dev/common.rst        | 4 ++--
>>>  documentation/ref-manual/classes.rst       | 4 ++--
>>>  documentation/ref-manual/structure.rst     | 2 +-
>>>  documentation/toaster-manual/reference.rst | 5 ++---
>>>  5 files changed, 9 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
>>> index 37c7a19bfa..713ed8d64e 100644
>>> --- a/documentation/dev-manual/common-tasks.rst
>>> +++ b/documentation/dev-manual/common-tasks.rst
>>> @@ -1589,7 +1589,7 @@ your software is built:
>>>  
>>>  -  *Autotools:* If your source files have a ``configure.ac`` file, then
>>>     your software is built using Autotools. If this is the case, you just
>>> -   need to worry about modifying the configuration.
>>> +   to modify the configuration.
>>>  
>> Missing "need"
> Oops, thanks. I fixed it in my branch.

Merged into "master-next". Thanks again.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

