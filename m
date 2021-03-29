Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.20699.1617020258177040400
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 05:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7B3CB24000C
	for <docs@lists.yoctoproject.org>; Mon, 29 Mar 2021 12:17:36 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] SDK manual: fix reference to appendix
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
References: <20210326104942.13304-1-michael.opdenacker@bootlin.com>
 <20210326105937.koufjbc2cokcg5az@qschulz>
 <1670C350C26FB75F.5213@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <a397cb0c-df07-8800-2018-670ce67b3f0d@bootlin.com>
Date: Mon, 29 Mar 2021 14:17:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1670C350C26FB75F.5213@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

On 3/29/21 10:36 AM, Michael Opdenacker wrote:
> Hi Quentin,
>
> On 3/26/21 11:59 AM, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On Fri, Mar 26, 2021 at 11:49:42AM +0100, Michael Opdenacker wrote:
>>> This fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=14307
>>>
>> Please use [YOCTO #14307] to match the guidelines:
>> https://docs.yoctoproject.org/dev-manual/common-tasks.html#preparing-changes-for-submission
>>
>> (Though, there is a mix of "Fixes [YOCTO #14307]" and just "[YOCTO
>> #14307]").
>>
>> Not sure there's a need for a v2 just for that, up to Nicolas/Richard.
>
> Thanks for this advice - much appreciated, I'll keep that in mind!
>
> For this particular case, since I haven't had any negative review on the
> list, I'll actually update this on the "master-next" branch of the
> "yocto-docs" repository. This way, the commit is clean when it is
> submitted to Richard.

Added to "master-next":
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=master-next&id=6fa31c10bd0743d47b442c2b2812fced105c9b79

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

