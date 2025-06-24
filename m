Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB1DC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:38:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.4642.1750757888506412553
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WgktISaD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EFA4433F6;
	Tue, 24 Jun 2025 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750757886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RwAVVVpoxRXcTwm+SPv5D0Ne2zvojBrS/BxgJy5pYxE=;
	b=WgktISaDP9b5SV/HtGJnumvKHcY7rQnBnWQKwcvBqR9tC3mwBWGqLlwqOPcPANiFrL0vC/
	Wb/41XiaRM58CK1E/3wOFq163uZYpSM+q5EXoFYG3ZwcHf+jom8wEYeaz43AcLhmGNru2q
	RcIuEgOb1i2Gmabnjj+xUzbHbKXJuhnaw1k9NdWkFRq17q4LZ3nuaKqUUphM+mejM1Cn98
	QLTAJsOctmhKvlAZ0iNSXfXz2C1HHJVbow261VngeQzyuDo848BdVZ0u2acQbmr0/WpW8K
	olQEZauGWR+Joyrv+5m5edIwg/+TQW+HHPXgEDRhedj3y7TOtJWbyHlhEH00vQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 11:38:06 +0200
Message-Id: <DAUNVHLU8H3A.3T5UU6CW0KXR@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH 6/6] migration-guides/migration-5.1.rst: correct
 S/UNPACKDIR patterns for file-only recipes
Cc: <docs@lists.yoctoproject.org>, "Alexander Kanavin" <alex@linutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250623124257.1544615-1-alex.kanavin@gmail.com>
 <20250623124257.1544615-6-alex.kanavin@gmail.com>
 <DAULFYRC7Q5D.40A7W0LFM2UV@bootlin.com>
 <CANNYZj8epgeDnSNQmEjez-m5ixwGe4xm=0xQFqn-2=R4=xh_VQ@mail.gmail.com>
In-Reply-To: <CANNYZj8epgeDnSNQmEjez-m5ixwGe4xm=0xQFqn-2=R4=xh_VQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffteeiveetudeiveetfefgveehhfdvgeffgfejheduheehvdevheeufeduffdvgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghlvgigs
 ehlihhnuhhtrhhonhhigidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:38:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7198

On Tue Jun 24, 2025 at 11:13 AM CEST, Alexander Kanavin wrote:
> On Tue, 24 Jun 2025 at 09:43, Antonin Godard <antonin.godard@bootlin.com>=
 wrote:
>
>> The series looks great, thanks.
>>
>> I think we could also mention it in migration-5.3.rst, and also mention =
that S =3D
>> "${WORKDIR}/git" should now be removed?
>>
>> Could you send a follow-up patch?
>
> I just sent that; the content should be accurate, but the formatting
> probably isn't perfect.

Thanks a lot. I'll send a patch to document BB_GIT_DEFAULT_DESTSUFFIX in bi=
tbake
and yocto-docs. I'll also re-send your patch (who depends on it) to fix the
formatting issues.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


