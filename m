Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CF9C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 15:26:19 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1332.1713453969366664991
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 08:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WRBbNb3Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 513D1C0004;
	Thu, 18 Apr 2024 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713453967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3ZsrAkVeLqoMtA8j8Edk6nVZDVdTIvUcJKxMgOWRhk=;
	b=WRBbNb3ZBPWbqC/aED8rNNUbVKG3ZYCyld3Qhvz5XWr57r1DV3nRQ6nvis3hcJSsyvl+Ul
	T2I/CvQTZIGghBoGU3LxciBsYfTs4j/L0mDfBLSaILQ97u+lp0X1bEg80SxIoATRV2cGRe
	bgR18HuS1ZPZvg3u0LrQppIVvWzv9ArF4oBlPeUzp2Q86kMt9rIT1Hjuh3458KDFJ5/Siq
	olp1JnliFVsPEmNRniF4P/vaJ7fsWysn+l7CU8HhL5PNs1U10ktLwJfOX0iwfgZ9F4ZSQx
	FGvo3kRKrtvGCzrCM//mxPenFfSfgbuUoAKt2EiHByoolpD1ko2+4+NLMzVyLA==
Message-ID: <3233e285-4879-40f5-970e-995652ea8468@bootlin.com>
Date: Thu, 18 Apr 2024 17:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 7/9] release-notes: Add CVEs, recipe upgrades and
 contributors for 5.0
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <d0182baa07ca6bb009b845fcadb1f7fce81a38bd.1713127068.git.bluelightning@bluelightning.org>
 <b29fd95b-fa84-4fd6-8eeb-5ec08f66c4e7@bootlin.com>
 <5f8f7c584f188422ac0fa7ba56a588b4@bluelightning.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <5f8f7c584f188422ac0fa7ba56a588b4@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Apr 2024 15:26:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5164

Hi Paul,

On 4/18/24 at 16:47, Paul Eggleton wrote:
>
>>
>> I had to replace :cve:`2023-6237 by :cve_mitre:`2023-6237` as this 
>> was a "reserved" CVE.
>
> Thanks for checking these. I wonder if we can do this in an automated 
> way (or do you have something that you use already?)


Maybe, but so far I'm using a manual way. That's slooow... :-/

>
>>>     Contributors to 5.0
>>>   ~~~~~~~~~~~~~~~~~~~
>>>     Thanks to the following people who contributed to this release:
>>> ...
>>> +-  Arne Schwerdt
>>> +-  Bartosz Golaszewski
>>> +-  Baruch Siach
>>> +-  baruch@tkos.co.il
>>
>> Removed that last line as this is the same person :)
>
>
>>
>> Cheers
>> Paul 
> Well spotted! I'm usually pretty good at finding those but somehow 
> even after looking backwards and forwards I over the list I missed it.


Same for me, I'm only good at finding other people's mistakes, but not 
mine :)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


