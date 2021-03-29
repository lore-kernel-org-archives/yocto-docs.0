Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.18791.1617007016755793689
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 01:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0D24C20000F;
	Mon, 29 Mar 2021 08:36:54 +0000 (UTC)
Cc: docs@lists.yoctoproject.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [docs] [PATCH] SDK manual: fix reference to appendix
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210326104942.13304-1-michael.opdenacker@bootlin.com>
 <20210326105937.koufjbc2cokcg5az@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <11475a88-e8a7-6939-afae-acdd3430b261@bootlin.com>
Date: Mon, 29 Mar 2021 10:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326105937.koufjbc2cokcg5az@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 3/26/21 11:59 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Fri, Mar 26, 2021 at 11:49:42AM +0100, Michael Opdenacker wrote:
>> This fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=14307
>>
> Please use [YOCTO #14307] to match the guidelines:
> https://docs.yoctoproject.org/dev-manual/common-tasks.html#preparing-changes-for-submission
>
> (Though, there is a mix of "Fixes [YOCTO #14307]" and just "[YOCTO
> #14307]").
>
> Not sure there's a need for a v2 just for that, up to Nicolas/Richard.


Thanks for this advice - much appreciated, I'll keep that in mind!

For this particular case, since I haven't had any negative review on the
list, I'll actually update this on the "master-next" branch of the
"yocto-docs" repository. This way, the commit is clean when it is
submitted to Richard.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

