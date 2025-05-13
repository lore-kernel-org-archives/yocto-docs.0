Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191AEC3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 08:28:21 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.71116.1747124889621960212
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 01:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gFwW559E;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 273C243ACE;
	Tue, 13 May 2025 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747124887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/3UYsb/o34iwWxk7f8duk+DfZRjQ42IJrVgH/F5KRY=;
	b=gFwW559E4Ided73VWSFRAzkGGPkEws/ls+bY1e/eFzI3M6jeaD91mBPmDgYCJpmi2AQOCl
	Sbck4Ly+EVthDMAqCX5MRGTB5NaLFwL88XdtTB+U3MfbpzD0n0hd52ZGYBnxhkKQ2TImab
	8vYljxWd9gTQxmCyllxI2lgwhra4js/tBgAXhzw/ENJgmjUTes9vQtW0wdjeZLZeDzkiEw
	g/6bvKvc2EA6uR82YWmZ99RMmEfzicKbhurnGq5cqWGam2TgiH7TS6yHqIUbLK0TcLOfj/
	2Lur8xGCRZfyhu+RI1xR2PUzIuk0nrCcdvuzXKp/M6z6slf/LkEE6IY9elwjlQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 May 2025 10:28:06 +0200
Message-Id: <D9UW30Q030G2.22VWR1SASAWG8@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
 <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
 <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
 <D97WADVD9D0D.3PPCH5GX3DOL0@bootlin.com>
 <0f03eef3-4de5-4276-b692-0fd18571ddbe@cherry.de>
 <D98QDOH9EM5M.2LNH55O8DZ8IC@bootlin.com>
 <62fb508b-741f-458b-ab7a-2ceed64a95be@cherry.de>
 <D9DWY617J6W5.1G9WMLH95TIIF@bootlin.com>
 <caeb301c-abfe-4220-b24b-1073f43efc3a@cherry.de>
In-Reply-To: <caeb301c-abfe-4220-b24b-1073f43efc3a@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdefieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffgkeeiueefieevkeekveejteevleekjeeigfefiefhgefhgefhuddvjeduvddvnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvt
 ghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 08:28:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6815

On Wed Apr 23, 2025 at 11:56 AM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 4/23/25 11:33 AM, Antonin Godard wrote:
> [...]
>>> I don't think we should be using &DISTRO; anymore? Most of the time we
>>> don't want to be printing .999 on the landing page of
>>> docs.yoctoproject.org! For the dev page, that's different.
>>=20
>> I would like to agree, but at the same time, wouldn't it be confusing to=
 have a
>> real tag (e.g. 5.1.8) when reading for the latest tip of the branch? It =
would be
>
> Does it matter? We should only be doing bug fixing and ideally without=20
> breaking backward compatibility in a given release branch.
> Again, the development (master) branch is a different story here.
>
>> somewhat accurate, but not _stricty_ accurate as to which version of the=
 doc you
>> are actually reading (the latest tip).
>>=20
>
> The issue is that this tag simply doesn't exist so we should absolutely=
=20
> never use it when code is involved, as the instructions will simply not=
=20
> work.

Right, so the code parts of the docs should be adapted to use DISTRO_LATEST=
_TAG,
but I still think using DISTRO in the textual parts is useful to distinguis=
h a
branch tip version of the docs and a tagged version of the docs.

>> I'm trying to think of a way to make it clear that 999 represent the bra=
nch's
>> tip.
>>=20
>
> I'm failing to see how it is relevant to the user that the docs are=20
> built from the branch's tip instead of the tag?

There might be a reason that goes beyond my work on the docs, but it is kin=
d of
useful to me to monitor changes as we go, or just to provides up-to-date li=
nks
to people.

It is questionable that this should be the default landing page though.

> BTW, it seems like once you're on a tagged release, you cannot go back=20
> to the .999 from the dropdown menu, is that intended?

Sounds like a bug to me!

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


