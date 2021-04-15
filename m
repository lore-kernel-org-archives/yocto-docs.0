Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7583.1618495544696910695
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 07:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0A33A1C0007;
	Thu, 15 Apr 2021 14:05:41 +0000 (UTC)
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/13] Documentation updates for 3.3
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <446635da-f144-9e8e-fd4b-7dc127e4b8da@bootlin.com>
 <20210415140051.j43m4xhquzfa5jeb@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9d78ecfe-cccb-3ded-c859-92e525153be3@bootlin.com>
Date: Thu, 15 Apr 2021 16:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415140051.j43m4xhquzfa5jeb@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/15/21 4:00 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On Thu, Apr 15, 2021 at 03:54:28PM +0200, Michael Opdenacker wrote:
>> Hi Paul,
>>
>> On 4/14/21 2:19 AM, Paul Eggleton wrote:
>>> The migration guide for 3.3, plus some missing related changes and a few
>>> cleanups. Let me know if I missed anything.
>>>
>>>
>>> The following changes since commit 4f7f451df266a307b34bf145b29291ca85eb882f:
>>>
>>>   docs: add a top level page for bitbake documentation (2021-04-09 09:00:53 +0200)
>>>
>>> are available in the git repository at:
>>>
>>>   git://git.yoctoproject.org/poky-contrib paule/migration-3.3
>>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/migration-3.3
>>
>> Thanks, the changes look good to me. I checked that indeed you took the
>> feedback into account.
>>
>> I merged them in yocto-docs' master-next.
>>
> You answered on the v1 thread. I'm here just to make sure you took the
> v2?


Oops, yes, indeed, I took the v2, apologies! I was comparing both
threads, to check that the comments had been taken into account.

Thanks for asking, and above all many thanks for your reviews!

http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

