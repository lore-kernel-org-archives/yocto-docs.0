Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD92C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:37:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.52946.1739803027701933409
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HeKAGM4R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47E2C44434;
	Mon, 17 Feb 2025 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739803025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hXQZbdfV7mQodmnZFtvK1gX8JgLSgMoeZ66zQQ4IAJM=;
	b=HeKAGM4RkQXirs0gAjzdXl2OrzTz/AI9xuW3BMai9L4cMSzQsca6tnc77kIKnfrgsusIoM
	SWvRSZWbPM+o86lnyUpAgI6fYTGvLGyhp36MIGH28ShOWDWf1X5E298LV/VLNnFKdQNLcv
	Oqa2d04aYLOXYDKYSKOpNh6h/J0iolO+PHmWHAsnqg1zsSBiLNiNyGdoZ+r9QA4M0MNRkX
	c1cU4ZQ2VksC8tJSUXgV6V3dtdCBnrvBAkY6iHqPcSWbHFsVRO9cJAkfLnU7gxlK3lgaJ7
	SRckGSd1505b3rOnZggBaOl0u/dUqL4A2er07Tsztb1vJ5v44hlnixUAVm90RQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Feb 2025 15:37:04 +0100
Message-Id: <D7USP7RNYI68.2YJEYK482TX3C@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: add policy on
 AI generated code
Cc: "tsc" <tsc@lists.openembedded.org>, "Yocto TSC"
 <tsc@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
 <178a6b27-d616-4fd0-b675-ba4f2767656b@cherry.de>
 <3bf717794dcd19ba91262b1037daf6c6118f1725.camel@linuxfoundation.org>
In-Reply-To: <3bf717794dcd19ba91262b1037daf6c6118f1725.camel@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefhhfelgfeitdeugfekgeegueetvdeghedvteegffekveejtddvhfduhfegkeehnecuffhomhgrihhnpeguvghvvghlohhpvghrtggvrhhtihhfihgtrghtvgdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehqu
 hgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhstgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhstgeslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6391

Hi Richard,

On Mon Feb 17, 2025 at 3:30 PM CET, Richard Purdie wrote:
> On Mon, 2025-02-17 at 12:20 +0100, Quentin Schulz wrote:
>> > +indication that this code was AI generated.
>> > +
>> > +For example, here is a properly formatted commit message::
>> > +
>> > +=C2=A0=C2=A0 component: Add the ability to ...
>> > +
>> > +=C2=A0=C2=A0 AI-Generated: Uses GitHub Copilot
>> > +
>> > +=C2=A0=C2=A0 Signed-off-by: Your Name <your.name@domain>
>> > +
>> > +The ``Signed-off-by`` line must be written by you, and not the AI hel=
per.
>> > +As a reminder, when contributing a change, your ``Signed-off-by`` lin=
e is
>> > +required and the stipulations in the `Developer's Statement of Origin
>> > +1.1 <https://developercertificate.org/>`__ still apply.
>> > +
>> > +Additionally, you must stipulate AI contributions conform to the Linu=
x
>> > +Foundation policy, specifically:
>> > +
>>=20
>> This is exactly the content of the link provided above. I'm not sure we=
=20
>> should duplicate it? E.g. it could be updated and we could then have=20
>> conflicting instructions there. Should we say which one takes precedence=
=20
>> when there can be a conflict?
>
> It was deliberately duplicated so that if it changes we know what it
> said previously. This version here is definitive.

I'm not sure if your comment applies to the entire patch, or just the bulle=
t
points. What should I leave as-is?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

