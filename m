Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3776FC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 11:01:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.4472.1750244512619381456
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 04:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RMewY0Tr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73F4B433C9;
	Wed, 18 Jun 2025 11:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750244510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcURGh4fNSEw9bGQka3rn687wsPR4fOpyW259ZSZZtk=;
	b=RMewY0TrFxfdetnq/rKDlY2QHnqf3FF9JsubhhUPVacdC0U3CgOaMuopcMLzNDKCbLSPX+
	bl0gMV13pqKIIsRGF3rVcS6zmGUAuy5OrRJNfIMCvSeKugXqTL/fU3/zgg22NxiehQNe4p
	xTM6M4iCc0jYbTsLOFPAaSoFfwX2RnRmNZ5hH2Z/OyUiCYkfkdijdFn/ZYqyLYTINOLCx3
	iPwTeh+LRwevmBwDyxgY9UGDQeXjmAWP8XWCOyDKdFr0RY3JnVkpx2ftXH4zgLR2DGWs0G
	jaUjx3yifYodU527wj5bxw2P5il1c5nZADUWd9Ps/249zkQ4u9XxbMzlZepzig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 13:01:49 +0200
Message-Id: <DAPLWBST2Y5X.1MKB3QE3XIGVC@bootlin.com>
Subject: Re: [docs] [PATCH] yp-intro: new doc reference is missing leading
 slash
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <b08ac36e-51de-71b6-53ad-a2f05b0d31ae@crashcourse.ca>
 <c47da2d1-2878-83e6-4104-1e16a596c855@crashcourse.ca>
In-Reply-To: <c47da2d1-2878-83e6-4104-1e16a596c855@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvgeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgfetkeeuiefhffeugeejuedutddtveeugfejhfdtiedvuedvheegffekveetfeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 11:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7094

On Wed Jun 18, 2025 at 9:54 AM CEST, Robert P. J. Day wrote:
> On Wed, 18 Jun 2025, Robert P. J. Day wrote:
>
>>
>> The new ":doc:" reference for yocto-project-supported-features appears
>> to be missing a leading slash, causing HTML generation to fail.
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
>> ---
>>
>> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/=
overview-manual/yp-intro.rst
>> index 15dfb3a6b..40e9693a8 100644
>> --- a/documentation/overview-manual/yp-intro.rst
>> +++ b/documentation/overview-manual/yp-intro.rst
>> @@ -51,7 +51,7 @@ Here are features and advantages of the Yocto Project:
>>     RISC-V and other architectures. Most ODMs, OSVs, and chip vendors cr=
eate and
>>     supply BSPs that support their hardware. If you have custom silicon,=
 you can
>>     create a BSP that supports that architecture. See
>> -   :doc:`ref-manual/yocto-project-supported-features` for details on th=
e level
>> +   :doc:`/ref-manual/yocto-project-supported-features` for details on t=
he level
>>     of support for some of these architectures.
>>
>>     Aside from broad architecture support, the Yocto Project fully
>>
>   *Sigh* ... never mind, should have checked master-next.

No, you're right, this was indeed broken on master.

Thanks for the fix,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


