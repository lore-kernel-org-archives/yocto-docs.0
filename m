Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038BBC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 12:11:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.49366.1739189493033238787
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 04:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iDr5xEkn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4BD5442A5;
	Mon, 10 Feb 2025 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739189491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xBJM+zrr2ZoSXpNAUfHLwBJtPz8ZxwROuIcV6MMW/N8=;
	b=iDr5xEkngprFqAnYIVb1KWGYGV7ITJh1QO97t0oKtrfgkOf6ub+tiMnacZex9hWxF6c9So
	RyDjGthA5IdqkvWJSKD4TpFcoy7a5x5dhrOM6pQfcr1XBkHG+NP1LgnOqbYPOTyxxNcO2w
	ZS1s5f3cPE0Jb4OqxxgZ2H2HplX1p9i4iU45V83ohTrz09Y/dRKmA1ZA6kAZnDOir/5afX
	IBG6AqiBhgCK7i3M0TLhzBdtqNTuR9xe48eaEcSKpudA84gNVXtsLMSklntGp6DwDbZ07h
	0oJ0LRcBoU9+e7Qpim0os/TCsOAif8VG8eKEQbv/ieHYMRzw9K8GqZsWTMH3Sg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Feb 2025 13:11:30 +0100
Message-Id: <D7OR7Y1LOBSA.2KD049Z58L6ZI@bootlin.com>
Subject: Re: [docs] [PATCH 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
Cc: "Guillaume Swaenepoel" <guillaume.swaenepoel@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yoann.congal@smile.fr>, "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250206131811.86935-1-yoann.congal@smile.fr>
 <20250206131811.86935-3-yoann.congal@smile.fr>
 <6a34b601-8ddb-4101-9ae9-d0996202f79e@cherry.de>
 <481d5eeb-7042-478c-b4cb-86b1981b5a8d@smile.fr>
 <cdef73b7-8b73-447f-ba06-8256f5ac8f0c@cherry.de>
 <2c8a8f6f-d545-44b7-a9d7-ab05ee90bb34@smile.fr>
In-Reply-To: <2c8a8f6f-d545-44b7-a9d7-ab05ee90bb34@smile.fr>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedvueetgeektefgjedthfffhfejudfhtedugeffvdetjeehffeiteduhfehffeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeehfeehleemieejkeefmehfsgdvkeemudefiedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeehfeehleemieejkeefmehfsgdvkeemudefiedtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidru
 ggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehguhhilhhlrghumhgvrdhsfigrvghnvghpohgvlhesshhmihhlvgdrfhhr
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Feb 2025 12:11:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6321

Hi Yoann,

On Sun Feb 9, 2025 at 11:46 PM CET, Yoann Congal via lists.yoctoproject.org=
 wrote:
> Le 07/02/2025 =C3=A0 10:12, Quentin Schulz a =C3=A9crit=C2=A0:
>> Hi Yoann,
>
> Hi,
>
>> On 2/6/25 7:17 PM, Yoann Congal wrote:
>>> Le 06/02/2025 =C3=A0 17:08, Quentin Schulz a =C3=A9crit=C2=A0:
>>>> Hi Yoann,
>>>>
>>>> On 2/6/25 2:18 PM, Yoann Congal via lists.yoctoproject.org wrote:
>>>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>>>
>>>>> Shows an example of the new variable
>>>>> OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
>>>>> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that
>>>>> were
>>>>> shown earlier.
>>>>>
>>>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>>>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>>=20
>> Since this is your v1, I believe you're not allowed to provide Reviewed-
>> by/Acked-by/Tested-by/etc... given privately. Guillaume should give
>> their Reviewed-by on the mailing list before you can add it.
>
> I did not know this was a thing.
> I did private reviews (with my Reviewed-By) for my coworkers for more
> than 2 years now and nobody told me.
>
> I'll remove it for v3.

Also, if you add a cover letter to the series, and if Guillaume sends their
Reviewed-by in reply to the cover-letter, it counts for the whole series. A=
t
least, that's how b4 behaves on my side when applying the patches. So Guill=
aume
doesn't have to reply to each email. :)

Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

