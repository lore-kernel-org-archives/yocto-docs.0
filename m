Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDE0C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 10:26:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.39743.1670840791123697470
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 02:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vy9Q4Ey+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E6AD1C000F;
	Mon, 12 Dec 2022 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670840788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+KRLhZ7LKc6gDKEbBEx4io0pmBsfBtfRir3PUJQrCo=;
	b=Vy9Q4Ey+gHhelIrb/NAn94WW+Sn5EQr99EAy1vkVq1FaLOBKn9Xqgwz5Utt1h7DMyHHu8z
	MDvIZs1RsssAmc13t44ovvEIsH07DlNJTTpjm67WXJmWA66hGGjCwGHcX7tf+UPdRIcWN5
	X/RsKeD36kWiU9rD9orx5dvgv2E42c2YVbIsRwnl2eLbzKhdYV1aGsLsNy2eMM/qQ1mpIQ
	LHkVim2jCkhZtMKy4W8Jksi1DjMEmAzgKQXnFla/sWpjTV7Onx1BmbwFg2ZvK1KU/pFUFm
	h3KGV2J+w7fDN5/FpVkxRgJMiFMn3Cpk8x7feXE2tHBbQ/I7YGnGq2J3my1gIQ==
Message-ID: <09e50cc2-dd35-9b5c-d05b-c1f002e038b5@bootlin.com>
Date: Mon, 12 Dec 2022 11:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: final removal of SERIAL_CONSOLE variable
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20221212094955.58455-1-michael.opdenacker@bootlin.com>
 <14b23bc2-f744-4452-64ac-ba1926324b7d@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <14b23bc2-f744-4452-64ac-ba1926324b7d@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Dec 2022 10:26:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3547

Hi Quentin,

Am 12.12.22 um 11:22 schrieb Quentin Schulz via lists.yoctoproject.org:
> Hi Michael,
>
> On 12/12/22 10:49, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> This deprecated variable has been removed for good through
>> https://urldefense.com/v3/__https://git.openembedded.org/openembedded-core/commit/?id=9d053af1fb570b4e3483de4ecd6827e1e0be61b7__;!!OOPJP91ZZw!mdIhsk9314XecKGpMxgc_65hSaYE2VoOo41x1ne13KiL-CTEfSgyidbnwYhCshdThpFx9pkMiUToxlsznioCpyDfYgQ641L54bUJg6MTpZwevFvYDYzv$ 
>>
>>
>
> Should we start a migration manual for 4.2 that we update every now 
> and then rather than a big change to review right before (or sometimes 
> after :/) the release has been made?
>
> I don't know exactly what's the workflow/process here, just asking.


Yes, we already started writing the migration notes ahead of time for 
the previous release. This sounds like a good time now for the next one.
I'll submit a first draft that people will be able to contribute to.
Thanks for the reminder!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


