Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24730CE7D08
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 10:09:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.77573.1727777384886291333
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 03:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TLmequKg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04319FF80D;
	Tue,  1 Oct 2024 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727777383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlrnyVx5afYErhABdlxYNXJq51Rx/0H9Jtz1c4uTVWE=;
	b=TLmequKg036S/1AMaq+jPUrEhxy3upAQTI6UE9mVXrw5IuDZIpUbiGsFO4tI8Oa4G2WO9b
	DxDTBLd03M2yLKIL3p1sfG2nij6ESkqxq+rKwq1LrGbtqOYrYlup1qUHJRWj3iGzxOTmT0
	qp+I+9XWvUT1E1u8NLvO+HJHT6BTDG1sd2rissjs72AF99mzbCT3DzLsPsv76P5EXcvIRA
	P+2w+ObGI16HLBRE4YuNn1JvGhqrLNCwR923/pWUydOLxZGdsJ0aMSAwMqGlGq28nS6Wy4
	zRAuKKj2ydJW2LhnTcxKErKOc7aN0EgMwZAQWeOA2hjrAid2bFJdnu/x8JGqCg==
Message-ID: <2bde7e98-b39e-4ea2-916f-b7fb043bc84e@bootlin.com>
Date: Tue, 1 Oct 2024 12:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: quentin.schulz@cherry.de
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
 <20240927220033.3941455-2-yoann.congal@smile.fr>
 <f71bb041-ad48-4294-aaf6-ab8d86b32a28@cherry.de>
Content-Language: en-US
Cc: docs@lists.yoctoproject.org, yoann.congal@smile.fr
From: Antonin Godard <antonin.godard@bootlin.com>
In-Reply-To: <f71bb041-ad48-4294-aaf6-ab8d86b32a28@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 10:09:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5386

Hi Quentin,

On 01/10/2024 11:40, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Yoann,
> 
> On 9/28/24 12:00 AM, Yoann Congal via lists.yoctoproject.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> This covers the Poky commit:
>> 61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely 
>> point to builddir, 2024-09-10)
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>> v1->v2: Reviews from Quentin Schulz:
>> * environnement -> environment
>> * oeqa/selftest now only rewrite*s*
>> * Add exemples for the selftest change
>> ---
>>   documentation/migration-guides/migration-5.1.rst  | 15 +++++++++++++++
>>   .../migration-guides/release-notes-5.1.rst        |  2 ++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/documentation/migration-guides/migration-5.1.rst 
>> b/documentation/migration-guides/migration-5.1.rst
>> index b43fecc2d..4625ff0e1 100644
>> --- a/documentation/migration-guides/migration-5.1.rst
>> +++ b/documentation/migration-guides/migration-5.1.rst
>> @@ -141,3 +141,18 @@ QEMU changes
>>   Miscellaneous changes
>>   ~~~~~~~~~~~~~~~~~~~~~
>> +-  oeqa/selftest now only rewrites environment variable paths that 
>> absolutely
>> +   point to builddir (i.e ``X=$BUILDDIR/conf/`` is still rewritten to 
>> point to
>> +   the selftest ``conf/`` directory but not 
>> ``Y=$BUILDDIR/../bitbake/`` which
>> +   still point to the ``bitbake/`` directory)
>> +
>> +   For example (taken from autobuilder environment): ``BB_LOGCONFIG`` 
>> is an
> 
> nit: could use :term:`BB_LOGCONFIG` here since we have it defined in the 
> reference manual? We could probably even avoid explaining what it means 
> here (not necessarily though).

Good catch, you can indeed use :term:`BB_LOGCONFIG` and avoid explaining
its purpose.

>> +   Environment variables containing relative paths from tested build 
>> directory
>> +   to outside of the original build directory may need to be updated 
>> as they
>> +   won't be changed by selftest.
> 
> selftest should be single-tick-quoted as defined as standard in the git 
> repo, c.f. 
> https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md
> 
> This was done by Michael but he's not the maintainer anymore so I guess 
> whoever replaces him may have a different opinion, in which case 
> extending or replacing it would be most welcome, is that you Antonin

Indeed, I am slowly replacing Michael in this role and getting familiar
with the documentation details. I'm also writing the release note for
the next release at the moment (will send a series of patch this week
hopefully).

Thanks for your reviews, they also help. As for selftest, I haven't seen
it referenced with single-tick quotes elsewhere, unless you meant double
ticks for code?

> On a side note, I still wouldn't really know which variables I need to 
> look after or what happens if I don't (is there an explicit error, are 
> there side effects, if so, how do they show up?). But admittedly, I have 
> zero experience with oeqa or selftest so people in the know probably 
> know what this is talking about? In any case, I guess we can revisit 
> this later on, it's not written in stone, and better have something than 
> nothing :)

Agree with you, and having no experience as well on oeqa and selftest,
it's hard for me to also making a proper judgment.

Cheers,
Antoni

