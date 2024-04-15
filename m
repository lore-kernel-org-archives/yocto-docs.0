Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BBEC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 10:31:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.17893.1713177058012294400
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 03:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R8YmPjWJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FEAE60009;
	Mon, 15 Apr 2024 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713177056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7fTC9kvlUI8kXPt1zOVaBM4TWsAj40xi82iK0QUsBo=;
	b=R8YmPjWJnyFgB9hxmsyOKGUvCxFybmitssZoWeWU3nvgBaAk6u5Har6kkoGQXn2vDqOs5b
	mBK0iJxt0fuZZlVd1QFi8c2bYDEENeoeUIrzu6eoDpMxRCHeZV7S8c9o5IfaeSFjSq9fA9
	eANRfugngCrszy+bqD0Kig/7IOz5ADCiILdi1PK7RAqEN/DOTMn8ndUmX/uOQBDP0AUArI
	CUwWYz8Klevq4rluy1bU4ajv6YHKTcxOS3gMTuRflVdbK0DSuIpYPGzakGCpuYFk+a+lzI
	tQhT+s9pO7RLXwDYQFk+VGy8tN6jz7DDcFIT9I3RX9/4pI816SRRC6w9RaTSTA==
Message-ID: <efc44689-a0ad-4f16-b0e8-441ef17a6cd6@bootlin.com>
Date: Mon, 15 Apr 2024 12:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [RFC][PATCH] manuals: standards.md5: add standard for project
 names
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20240415100555.1054695-1-michael.opdenacker@bootlin.com>
 <44ff31d4-4100-4f81-9421-6b8743ebbbdf@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <44ff31d4-4100-4f81-9421-6b8743ebbbdf@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 10:31:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5148

Hi Quentin,

Thanks for the quick feedback!

On 4/15/24 at 12:11, Quentin Schulz wrote:
> Hi Michael,
>
> On 4/15/24 12:05, michael.opdenacker@bootlin.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Set a new standard to introduce project names with single quotes,
>> so that they appear in generated text with an italic font,
>> to make them easier to distinguish from command names and from
>> ordinary English words.
>>
>> Rework and move the standard for command and file names
>> to make the whole description "flow" better.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>>   documentation/standards.md | 31 ++++++++++++++++---------------
>>   1 file changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/documentation/standards.md b/documentation/standards.md
>> index e0c0cba83c..05c5afffe8 100644
>> --- a/documentation/standards.md
>> +++ b/documentation/standards.md
>> @@ -70,27 +70,28 @@ cannot be split without infringing syntactic rules
>>   or reducing readability, as well as for command output
>>   which should be kept unmodified.
>>   -### Project names
>> +### File, tool and command names
>>   -Project names should be capitalized in the same
>> -way they are on Wikipedia, in particular:
>> +File, tool, command and package names should be double tick-quoted.
>> +For example, ``` ``conf/local.conf`` ``` is preferred over
>> +`"conf/local.conf"`.
>>   -* BitBake
>> -* OpenEmbedded
>> +### Project names
>>   -There are exceptions in which such names can be used
>> -in lower case:
>> +Project names should be introduced with single quotes, to have them 
>> rendered
>> +with an italic font and make them easier to distinguish from command 
>> names
>> +(double tick-quoted) and from regular English words.
>>   -* When referring to a package name
>> -* When referring to the corresponding command name
>> -* When used in a cross-reference title. Such
>> -  titles are usually in lower case.
>> +They should also be capitalized in the same way they are on 
>> Wikipedia, or on
>> +their own project pages if they are not described on Wikipedia.
>>   -### File, tool and command names
>> +For example:
>>   -File, tool and command names should be double tick-quoted.
>> -For example, ``` ``conf/local.conf`` ``` is preferred over
>> -`"conf/local.conf"`.
>> +* ``` `BitBake` ```
>> +* ``` `ftrace` ```
>> +
>> +An exception is when such names are used in a section title, or in a 
>> cross-reference
>> +to a section. In that case, capitalization and quotes are ignored by 
>> Sphinx.
>
> Looks good to me but I'm wondering if we shouldn't have an exception 
> for BitBake and Yocto Project? Those will be extensively used across 
> the documentation and I think there shouldn't be too much confusing 
> about the word (as opposed to some other programs which mean something 
> in English for example, e.g. `perf`).
>
> The idea behind this is that we'd then have an exception for those 
> words in Vale and that would help us catch typos and have some kind of 
> consistency across the documentation, without having to check manually.


Right, perf and ftrace are typical sources of confusion. I agree with 
what you suggest for very usually names like BitBake, Yocto Project, 
OpenEmbedded. This could also include frequent project names like Linux.

Hey, a more relaxed rule could be to only use single quotes for 
uncapitalized project names, once again such as perf and ftrace. These 
are the ones that can be harder to distinguish from English words. On 
the other hand, having all project names  (like Docker or Toaster, with 
the accepted exceptions) styled this way, would make the distinction 
clearer to readers.

What do you think?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


