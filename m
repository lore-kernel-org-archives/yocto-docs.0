Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB03C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 07:48:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.14914.1713512912302219064
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Apr 2024 00:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g1Jrz64y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45EB42000C;
	Fri, 19 Apr 2024 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713512910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DkKrtPllKSpzsq36RTX8bxwjmpYr1vatMLSZ9VnjT4=;
	b=g1Jrz64y9bmIN/lXdVm6ztHilmm2Qqd/8hG8VqQdtAkieBf7NugEqCl+fy4WDyS+EHl3+l
	aiIDem9pNgrWePZa7BI9aEYncWR80Fw/fJUIIJ+cMQ7RTeaFech94POGuPyvuM2GP/FlhT
	hlSrVCxbeF+FkYqhnbtUmtyViETPtMJdNbBlsm4WsttIwd9XJ1vyFN0xP/AXPS3FuRKwGl
	jjTPZLPskNVDYlCGDCVI4mbMTvKyeSuPFpbcLHxR7W31WVXiy6wCEZtK1FHgRU2x90rSil
	1648OXXZdJS+M2H/JXcB+a7eb7gc8Ua51gMf7p4ZmCWTsvgmi/saJIogOd4dSA==
Message-ID: <bb3657d8-b3a7-4a88-b868-77af56698f90@bootlin.com>
Date: Fri, 19 Apr 2024 09:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH] manuals: standards.md5: add standard for project names
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20240417070703.3883433-1-michael.opdenacker@bootlin.com>
 <f75050ee-83eb-4edc-910c-005cbcabc480@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <f75050ee-83eb-4edc-910c-005cbcabc480@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Apr 2024 07:48:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5169

Hi Quentin,

Thanks for the review!

On 4/17/24 at 10:48, Quentin Schulz wrote:
> Don't forget the v3 in patch title :)
>
>> Changes in V2
>> - Specify that uncapitalized project names should remain so
>>    even at the beginning of a sentence. This follows what Wikipedia
>>    seems to be doing, e.g. on https://en.wikipedia.org/wiki/Perf_(Linux)
>> ---
>>   ...s.md5-add-standard-for-project-names.patch | 70 +++++++++++++++++++
>
> [insert "yo dawg" meme with "Yo dawg I herd you like patches so I put 
> a patch in your patch"]


Oops twice. Never send a patch when you are in a hurry!

>> +An exception is when such names are used in a section title, or in a 
>> cross-reference
>> +to a section. In that case, capitalization and quotes are ignored by 
>> Sphinx.
>
> Can you provide code examples, this isn't that obvious to me and I 
> have done a bit of Sphinx doc writing, so not sure total beginners 
> would know what this rule applies to?

Correct, referring to a section title in a specific document is a very 
special case. Let's drop it.

I also tried to use something like this:

Building a `Meson` Package
--------------------------

And it turns out to be formatted in italic in the title too. So, let's 
not make an exception here :)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


