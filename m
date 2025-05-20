Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048C3C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 11:20:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.18592.1747740001185834337
 for <docs@lists.yoctoproject.org>;
 Tue, 20 May 2025 04:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aFYMS5RG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93B37433F6;
	Tue, 20 May 2025 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747739999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wGptcjq8Ii+PgvKSYcudWtbXloNnbnfN+dL5Rf4V7y4=;
	b=aFYMS5RGvP5OCO7xHWvBBnxRB7+D5bdQ2ALockmhWC9ZehTJRvoEf3mbtIxz1jAPJEflIb
	RNwqcFPWQoeNZudctI8JVII8obwKeEG6Jv8CQ0c2FxYoLt295tQa2jV213X+MT6DTmb+FC
	r+brVCEETRy7WiKt9oZQ0kI+Rjzxo4omdIfxgVJjNb8DuOIZGTtYFAflt+QWcG1C1MPOdH
	EFse8OK1vB8tYBcaLxldkbr32AXL9IXONNmm5GODvFsNmqD93FYHFdgUaEaGWnuYTvUATG
	oVlkJny/KTtdTVGkr7WR5KeVK0FF1MOiXQw5QGiyuXj90fyJPlhgx7uLGBszMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 13:19:56 +0200
Message-Id: <DA0Y4E4J1HEH.3Q0NIY8TZ7LCH@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Christos Gavros"
 <gavrosc@yahoo.com>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v5] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
Cc: "Yoann Congal" <yoann.congal@smile.fr>, "Randy MacLeod"
 <randy.macleod@windriver.com>
References: <20250520101952.4951-1-gavrosc.ref@yahoo.com>
 <20250520101952.4951-1-gavrosc@yahoo.com>
 <084a9aa6-e650-4ca6-bf0f-7a061352d7b0@cherry.de>
In-Reply-To: <084a9aa6-e650-4ca6-bf0f-7a061352d7b0@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffuvehfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelkedthfeuieevjeeihfdtieethedvhfdtleegiedvtdfgheehleekhfefveelfeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehgrghvrhhoshgtseihrghhohhordgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtt
 hhophhrohhjvggtthdrohhrghdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtoheprhgrnhguhidrmhgrtghlvghougesfihinhgurhhivhgvrhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 May 2025 11:20:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6851

Hi,

On Tue May 20, 2025 at 12:58 PM CEST, Quentin Schulz wrote:
> Hi Christos,
>
> On 5/20/25 12:19 PM, Christos Gavros wrote:
>> This variable specifies the maximum allowed size
>> of the initramfs image in Kbytes.
>> Fixes [YOCTO #15797]
>>=20
>> CC: Yoann Congal <yoann.congal@smile.fr>
>> CC: Randy MacLeod <randy.macleod@windriver.com>
>> CC: Antonin Godard <antonin.godard@bootlin.com>
>> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
>> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> v4->v5
>> * add Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> No need to send a new version just for that, the maintainer will (may)=20
> add it when applying the patch.
>
> If a new version is necessary because of feedback, then please add the=20
> Reviewed-by and other tags when sending the new version.

Indeed, thanks Quentin. :)

Christos, do you plan on working on updating the documentation for
IMAGE_ROOTFS_MAXSIZE like we discussed, or are you out of time? Completely =
fine
if you're out of time, I'll handle it later and merge your patch as-is, jus=
t let
me know.

As a reminder, the idea was to propagate the documentation you wrote for
INITRAMFS_MAXSIZE to IMAGE_ROOTFS_MAXSIZE.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


