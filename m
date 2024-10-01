Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAAACE7D0D
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 10:30:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.78241.1727778653093032485
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 03:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QAS1jxj7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F8B4240004;
	Tue,  1 Oct 2024 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727778651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIaIQk7IfHzTjndyXr5nC+g33FTm45yVXtxRZBDdl/o=;
	b=QAS1jxj7lPHkRVAqUQjw8QTVy1Y9Lu09joHGzDB+SXN1aMcDC7mBTXuCTXNfj9o8Hg2kKd
	ixQzNvhbjxeiyAwKrS0llJiCU8y2ZtJQgqsyXsWMHPGxmEgPtn9oxMA6obTDXgNeWbYYX5
	Rreq9BL1hLIAEpkKpc0k6Y19o/M2GShhfKV/v+Zuc5w97wWB8q3ct8OXsHErfH10/W9x71
	AE7Csw2qIAAvQjPbi5Hr52bK1xABEIEzymd7xmqlNKyXuoxm+DfbxfvOjUsr5iAs5kz+NT
	zEAl05jOMt/artKx+OB3/JYiTQ6/SXLwQtKHwtzt9/nKSFtzuwuOOtUG33fK9w==
Message-ID: <18988e1b-4c41-4363-bcc0-6046c8660c0f@bootlin.com>
Date: Tue, 1 Oct 2024 12:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [docs] [PATCH v2 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org, yoann.congal@smile.fr
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
 <20240927220033.3941455-2-yoann.congal@smile.fr>
 <f71bb041-ad48-4294-aaf6-ab8d86b32a28@cherry.de>
 <2bde7e98-b39e-4ea2-916f-b7fb043bc84e@bootlin.com>
 <9b2a68da-8ee4-4b1e-935b-c8ae0995aa09@cherry.de>
Content-Language: en-US
In-Reply-To: <9b2a68da-8ee4-4b1e-935b-c8ae0995aa09@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 10:30:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5388

On 01/10/2024 12:20, Quentin Schulz wrote:
>> Thanks for your reviews, they also help. As for selftest, I haven't seen
>> it referenced with single-tick quotes elsewhere, unless you meant double
>> ticks for code?
>>
> 
> I think what we discussed at the time with Michael was basically that 
> anything that isn't an English word, or is but shouldn't be understood 
> as one in the context (e.g. truncate as in the tool and not the English 
> word) should be highlighted so that people don't confuse it with the 
> English word.
> 
> I think this is what we meant in the standards file here: 
> https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n79

Gotcha, single-quote it is indeed.

> Note that these were rules Michael/we came up with for new contributions 
> to the docs, because we knew updating everything to match the standards 
> would take a long time.
> 
> I still remember reading every page of the docs during the migration to 
> Sphinx and I am not ready to do this again any time soon :) So patching 
> when stumbling upon things that don't match the standard while reading 
> the docs and enforcing it for new contributions made sense at the time.
> 
> Anyway, that's process and standards, they need to make sense to the 
> maintainer and the community, and can evolve over time, so up to you, 
> just putting out there the history and "current" state of affairs :)
> 
> Since 5.1 is supposed to be out soonish, maybe something to be picky 
> about after the release is done ;) Up to you!

Thanks a lot for these details and historical decisions! I will keep 
that in mind. I am okay with being picky on this, as it improves the 
overall readability of the doc. I'm trying to do that in the release 
note I'm editing atm.

Cheers,
Antonin

