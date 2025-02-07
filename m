Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4BDC02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 10:28:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.66608.1738924112401206110
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 02:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MOgkVS0/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2D81431F3;
	Fri,  7 Feb 2025 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738924110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGhZQZvYzQovs/2Yz8mb7w9KugpGMzKrWe02SX9Rbtc=;
	b=MOgkVS0/PJI9btVB1jFfYlAl/G/QKpWAPh7F1AcCGDqoa4tG6Eb4DNaz0rYo6XK0yG8NzT
	zkTz/wL09TIUvsB3QQ6g8Nsuzbkqc3gb00cH/a4JDYiufEJgKbKbyO0ZAhSaxl6DfNbsoe
	qp01lmI1v8+yUMBIbSmaVTRsYibieL12MBnnrvA79lA4aReFMXxKJLedY0frxZ/QQGdOxP
	N+0inhtcPVcNlChog9wzDwy+G9jvZpsDyO+fPNOTdEkSZdNvciJ37yGDNqg9yTdH8D6/Ro
	2BzWWdqUhv9QbdxTgvGw7osewhfk4GJbf22VL/z21IERwfzRzymJTqfCZSp6+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 11:28:29 +0100
Message-Id: <D7M55FM70177.BPEH6BEQMQOU@bootlin.com>
Subject: Re: [docs] [PATCH v2] add basic b4 config file
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <quentin.schulz@cherry.de>, "Quentin Schulz" <foss@0leil.net>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
 <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
 <1f9d3cd9c29beb5dd645eae977e34046e277b1b6.camel@linuxfoundation.org>
In-Reply-To: <1f9d3cd9c29beb5dd645eae977e34046e277b1b6.camel@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedthfeludekkeehgeekfeegtdekkedugeeijedvieejgfetteegfefhtdeivdfhgfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhgvmhgsvgguuggvugdrohhrghdpsgegqdifrhgrphhpvghrqdhpohhkhidrphihpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehli
 hhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepfhhoshhssedtlhgvihhlrdhnvghtpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 10:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6292

On Fri Feb 7, 2025 at 10:53 AM CET, Richard Purdie wrote:
> On Fri, 2025-02-07 at 10:26 +0100, Quentin Schulz via
> lists.yoctoproject.org wrote:
>> At the same time, I've done some shady stuff with b4 for poky where I
>> check (rather **guess**) if the current patch is the last patch in a=20
>> series. c.f.=20
>> https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrapper-p=
oky.py#n44
>>=20
>> > In any case we might also use your container scripts for this
>> > (which I will get
>> > to soon hopefully!).
>> >=20
>>=20
>> That itself may be adding a lot of time to the test since we need to=20
>> compile the container first. Additionally, remember that absolutely
>> NO=20
>> message should be output to stdout or stderr by the script otherwise
>> the=20
>> check is understood as a fail. I'm wondering if we couldn't add
>> support=20
>> for a PIPE between b4 and the scripts so that we can ask it to print=20
>> stuff (e.g. "please be patient, this may take a while" and maybe even
>> print some progress). For example, I briefly added some WIP support
>> for=20
>> patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time=20
>> before returning something, not very user-friendly :/
>
> My view is that any preflight checks should be relatively fast. We
> could ask someone setup an autobuilder in a container and run the whole
> AB test matrix but that would be unfair and crazy! :)
>
> I'm fine with having two levels of checks but I do think we need
> something relatively quick by default else nobody will use it.

After a clean build, for me it takes ~10 to 15 seconds to build the documen=
tation
in html format. Most of the time is taken to index everything, so the outpu=
t
format doesn't really matter.

So, quite a long build from my perspective. Not sure there's much we can do
about it, though.

We do have sphinx-lint, which takes ~half a second for variables.rst (likel=
y the
biggest file here). So we could perhaps run that against each file the patc=
h
series modifies (per-commit).
We would have to solve the existing issues, though! :)
There are also areas of improvements for this linter, for example enforcing
three spaces for indents, etc. I'm willing to put some time into it, if tha=
t's
an option we consider for b4 checking.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

