Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9180DECAAD4
	for <webhook@archiver.kernel.org>; Sat,  3 Sep 2022 06:44:37 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.808.1662187474718325598
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 23:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PCkRENf9;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 98854100007;
	Sat,  3 Sep 2022 06:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662187473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLdMTAYAZQHSEF2p6yG590AKkgUMBqcHS2PE1LNPoYg=;
	b=PCkRENf9c/t2QEZlzYeMMl7LO1x8PowGSRAC47dmOd/J3/ib0NExnqP14T2F4Eu3x21QDh
	55pewlxebUYRnY+AXSaZGDmp+sqozEswlY+7rsBL7b5MRPF+xtU5YIjMNpd4DRdD9/qFIl
	LzH4VI6Lfabcp7GNiecJdBviygvVgbXoM03r79DA4dvy8jbGox1Ijp1mVc4uuUG7aXnj7X
	Jtar4iw6zGkeJwnMivuQv6DvMfTmDMJKkN7JetlDfjqI8YBvaRaA0TCuSF1sZLWzYqvf9G
	WhgsnXBRzZIoysoxeuSjBfX184B9Md1XRZ24Brkk42z1sZ5FtoqFr9CfSl+1Vg==
Message-ID: <c3234ff5-46af-818a-6c50-f1441f00b916@bootlin.com>
Date: Sat, 3 Sep 2022 08:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [Yocto-Advocacy] [docs] [PATCH] ref-manual: remove obsolete
 product listing from FAQ
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "yocto-advocacy@lists.yoctoproject.org"
 <yocto-advocacy@lists.yoctoproject.org>
References: <1711247857DEC2A1.15579@lists.yoctoproject.org>
 <1d26f4ca-372f-bc45-6baa-873a024bbd0c@bootlin.com>
 <de6258ac6f23d5beb7be13f1518d39ec601a2edd.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <de6258ac6f23d5beb7be13f1518d39ec601a2edd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 03 Sep 2022 06:44:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3139

Hi Richard,

On 9/2/22 22:52, Richard Purdie wrote:
>
>> Following this proposed update to the manual, removing an obsolete
>> reference, I'm surprised not to find any page listing success stories of
>> products built using the OpenEmbedded build system. Don't we have this
>> anywhere?
>>
>> I guess this can be sensitive information for some product or platforms
>> vendors, but I guess some others could be proud to put forward their use
>> of OE / Yocto to build their products.
>>
>> Of course, I guess it's complicated to promote some users / contributors
>> and not some others. Maybe an informal page on the wiki would work
>> better than an official list on the project website.
>>
>> Any thoughts?
> You mean like:
>
> https://wiki.yoctoproject.org/wiki/Project_Users#Products_that_use_the_Yocto_Project
>
> ? :)

Exactly, thanks!
Maybe it's just me but maybe this page should be easier to find. I'll 
see what I can do.
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


