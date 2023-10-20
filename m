Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0FDCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:52:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.54799.1697809951695595608
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 06:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ue+Dm6q4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A9074000F;
	Fri, 20 Oct 2023 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697809949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zh+hHOijIzCd9BeWcQAwdDhiuUADVTng1FJqRrV8fZk=;
	b=Ue+Dm6q4PQpMrlF9zSKzVGoKt2ReTI0o/Dwvmq8Sy7bjiNKUGT5zQjEGQU93o335bNifxO
	o8jm78Iuz7V2dCiHxQPd8k/KSglMv2wDhsSG+Cez3lUunjhtukEV+KoWPQ3l2UsFfLnNRW
	QRbCw3wpWXhrWwVOBkMECfo9z3vJs2lT6GrsJ4zQSPfHpM965+hM4bBZjJ2hYfI94nsClN
	/FoIlyxUQ+QsjbCXSNorTfb6EIZFvWenttUppp3mE9HW9/QVt00BAYUU7z39aLqMu78CqW
	6GXlahVB9vk02QeHVyt+f8xMdUNsDQrIi4NHpSveIDzTWyr1dmZ/5tTFprhQAw==
Message-ID: <20d38c0a-99bb-4a19-9cb6-0c24f548008e@bootlin.com>
Date: Fri, 20 Oct 2023 15:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [master] Pull request
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <82bbde1a-45cc-48d8-8ef8-1415ca007c94@bootlin.com>
 <4807751be630ff5f7d4f14eb9c4e6100fd191c8c.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <4807751be630ff5f7d4f14eb9c4e6100fd191c8c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 13:52:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4445

Hi Richard,

On 20.10.23 at 15:42, Richard Purdie wrote:
> On Fri, 2023-10-20 at 15:26 +0200, Michael Opdenacker wrote:
>> Hi Richard,
>>
>> The following changes since commit ceb1812e63b9fac062f886c2a1dde23137c0e1ed:
>>
>>     migration-guides: add release notes for 4.0.13 (2023-10-06 09:59:00
>> +0200)
>>
>> are available in the Git repository at:
>>
>>     git://git.yoctoproject.org/yocto-docs master-next
>>
>> for you to fetch changes up to 65b62118da6f355e56c489c6be08ba9ea94b9f04:
>>
> Thanks!
>
> As part of sorting the 4.3 relase, I did create a nanbield docs repo
> branch btw so patches are currently only merged to master. I can also
> merge to nanbield if all these are appropriate for the release.

Perfect, thanks!
To the best of my knowledge (and my checks), these changes can also be 
merged into nanbield. In particular, I checked that patchtest and 
unimplemented-ptest checks made it to nanbield (you know that).

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


