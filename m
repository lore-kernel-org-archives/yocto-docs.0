Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A7DC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 09:33:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.4472.1745400811321956567
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Apr 2025 02:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WZ0b5ReE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 035D71FCEB;
	Wed, 23 Apr 2025 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745400809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXlzwmh1XxhKvzC0Ck7fh40iJsZ+A5q9jL+bTLHq+xk=;
	b=WZ0b5ReE3gmm7lq3YwkmCpqKnzF640tWveOEPeM/hLnwmCHFu1GOaCrn55ZpSDkOC3Le3I
	BB6soK96pyKUomv3R9Utq9Gc678QdavrWUWRrdQiAOUvgxw34Is9P0UwBIGm2Cc49QR63Q
	Hnzyl1qFZP/I/c9EDFSfp+OTtCC0zGTKSq26mO+0guInm3nvxE3lx1LjJlLPrN6SCdKXrv
	Tym6s6QSEDW1T36HByfaqiTLN4alkJP9FwM4QiGxQu6/u6rd6zvVHRuaNFfa6rcVsveXLi
	s+aSXmcXKu7rMx9bma5PRCphY1JZVixkrAO0ju8jijz1ddMAvlsspyCzChNKDg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 11:33:28 +0200
Message-Id: <D9DWY617J6W5.1G9WMLH95TIIF@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
 <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
 <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
 <D97WADVD9D0D.3PPCH5GX3DOL0@bootlin.com>
 <0f03eef3-4de5-4276-b692-0fd18571ddbe@cherry.de>
 <D98QDOH9EM5M.2LNH55O8DZ8IC@bootlin.com>
 <62fb508b-741f-458b-ab7a-2ceed64a95be@cherry.de>
In-Reply-To: <62fb508b-741f-458b-ab7a-2ceed64a95be@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeivdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeugfeifefgkeekveetudduiedvhfejveejuedvfffhgeejvdeuhffhkeeikefhffenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdihrghmlhdrihhnpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdiho
 hgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Apr 2025 09:33:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6776

Hi Quentin,

On Fri Apr 18, 2025 at 1:28 PM CEST, Quentin Schulz wrote:
[...]
>>> I seem to recall we wanted the variables set by set_versions.py to stil=
l
>>> be able to build the docs from tarballs and not force the use of git
>>> repos? But it seems like we force to fetch git tags at the very
>>> beginning of the Python script.
>>=20
>>    $ make html
>>    ./set_versions.py
>>    Please run 'git fetch --tags' before building the documentation
>>    make: *** [Makefile:72: html] Error 1
>>=20
>> It is indeed a bug!
>> Created one here: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15=
834
>>=20
>>> So I'm wondering if we should only have variables that aren't replaced
>>> in poky.yaml.in and eventually have the ones set_versions.py adds in
>>> poky.yaml (instead of replacing for example) documented in comments to
>>> explain what they are and in which context(s) to use them?
>>=20
>> That would be a bit cleaner yes.
>>=20
>> Maybe standards.md would be a good place? i.e.:
>> "Use &DISTRO; in the docs when wanting to refer to the latest possible v=
ersion"
>> "Use &DISTRO_LATEST_TAG; in the docs when wanting to refer to the latest
>> existing tag"
>> etc.
>>=20
>
> If we need to restore building the docs from tarballs, then we need=20
> default values (and appropriate ones!) in poky.yaml.in. We could still=20
> explain proper usage in standards.md , though, up to you.

I discussed this with Richard the other day, and it was decided to not supp=
ort
building the docs from tarballs in the end. As mentioned in the ticket abov=
e, I
will simply state that the docs must be built from the Git repository in a
message when trying to build from a tarball.

> I would simply split the file in two with a big comment before the=20
> second section where we would define overridden variables?

Yep, re-organizing the file seems like a good approach to me too - easy and
effective.

> I don't think we should be using &DISTRO; anymore? Most of the time we=20
> don't want to be printing .999 on the landing page of=20
> docs.yoctoproject.org! For the dev page, that's different.

I would like to agree, but at the same time, wouldn't it be confusing to ha=
ve a
real tag (e.g. 5.1.8) when reading for the latest tip of the branch? It wou=
ld be
somewhat accurate, but not _stricty_ accurate as to which version of the do=
c you
are actually reading (the latest tip).

I'm trying to think of a way to make it clear that 999 represent the branch=
's
tip.

Some ideas to replace or append to the 999:

"5.1 (<short commit sha>)"
"5.1.999 (<short commit sha>)"
"5.1+<short commit sha>"
"5.1+<short commit sha>+<branch name>"

Maybe just using an output from `git describe` (modified to render what we =
want)
could be enough?

> Cheers,
> Quentin

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

