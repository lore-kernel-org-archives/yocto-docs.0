Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA707C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:51:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.20203.1747907482757892770
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 02:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WY7GhPC/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC57942E76;
	Thu, 22 May 2025 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747907481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aaVThjtekUZyQqs5nfMiK5nD8tXux0Zy0pnmukeKacg=;
	b=WY7GhPC/0n/dogbq4YPRkKQ/vgXCSf+4c5IX1MLhOEJ7P2SGqlevhimKhYh0InCl/0p0E8
	tdEtkAdhZWpEZkU5FEGiimo4v8JlLZ/vPaVodJCkFNXpY9lkceCChu6/oytqCqcS3VMuiT
	cjuf+Oyfqy3D/pvNPwaLZd2I4NbibEvV7uBpSc/Y1DZxfX4tVjOjem7a0FiMZsKp9MlwqY
	AOBOWgLLLxyFwVsREHhkauasxyhqttPtcydM+pG9P0tfp5k8/oIoBdW1iXbV9WOj8ahkqQ
	Mk9LbM4uT54rja0d+ENw/sN2Gd0K+gsIju3c4YBVW8Dq9V0PPxaiKZmwD/0CxQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 11:51:20 +0200
Message-Id: <DA2LHN94PLKU.HE3O9BEEA64K@bootlin.com>
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
 <D9UW30Q030G2.22VWR1SASAWG8@bootlin.com>
 <33eef3df-3f24-4b8e-be45-3552d43252af@cherry.de>
In-Reply-To: <33eef3df-3f24-4b8e-be45-3552d43252af@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieehucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffgkeeiueefieevkeekveejteevleekjeeigfefiefhgefhgefhuddvjeduvddvnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrh
 ihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 May 2025 09:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6876

On Thu May 15, 2025 at 9:50 AM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 5/13/25 10:28 AM, Antonin Godard wrote:
>> On Wed Apr 23, 2025 at 11:56 AM CEST, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 4/23/25 11:33 AM, Antonin Godard wrote:
>>> [...]
>>>>> I don't think we should be using &DISTRO; anymore? Most of the time w=
e
>>>>> don't want to be printing .999 on the landing page of
>>>>> docs.yoctoproject.org! For the dev page, that's different.
>>>>
>>>> I would like to agree, but at the same time, wouldn't it be confusing =
to have a
>>>> real tag (e.g. 5.1.8) when reading for the latest tip of the branch? I=
t would be
>>>
>>> Does it matter? We should only be doing bug fixing and ideally without
>>> breaking backward compatibility in a given release branch.
>>> Again, the development (master) branch is a different story here.
>>>
>>>> somewhat accurate, but not _stricty_ accurate as to which version of t=
he doc you
>>>> are actually reading (the latest tip).
>>>>
>>>
>>> The issue is that this tag simply doesn't exist so we should absolutely
>>> never use it when code is involved, as the instructions will simply not
>>> work.
>>=20
>> Right, so the code parts of the docs should be adapted to use DISTRO_LAT=
EST_TAG,
>> but I still think using DISTRO in the textual parts is useful to disting=
uish a
>> branch tip version of the docs and a tagged version of the docs.
>>=20
>
> I don't see the benefit. But we can start by fixing the code blocks to=20
> not use DISTRO and postpone the rest of the discussion for another time=
=20
> :) Progress is still progress even if it's not perfect now.
>
>>>> I'm trying to think of a way to make it clear that 999 represent the b=
ranch's
>>>> tip.
>>>>
>>>
>>> I'm failing to see how it is relevant to the user that the docs are
>>> built from the branch's tip instead of the tag?
>>=20
>> There might be a reason that goes beyond my work on the docs, but it is =
kind of
>> useful to me to monitor changes as we go, or just to provides up-to-date=
 links
>> to people.
>>=20
>> It is questionable that this should be the default landing page though.
>>=20
>
> Ah, this I disagree with :) And I think this is the reason why we have=20
> this in the first place.

I think we agree actually, I also think it is a good default for the reason=
s you
stated below. Maybe I wasn't very clear about that. :)

> There is a very simple reason for that. We never have (or at least had,=
=20
> I don't know if this has changed) the docs ready for the release before=
=20
> the release is tagged (including the docs). This means if we were to=20
> always show the latest tag we would be missing information, even for the=
=20
> tagged release (e.g. recipe version bumps, cves fixed, known issues, etc.=
)!
>
> Even more so, we want to avoid having to wait ~1+ month for the next=20
> release if there are important fixes in the documentation (e.g.=20
> misleading information). This we can only achieve by using the tip of=20
> the branch and not the release. This also apply to outdated releases=20
> which will never receive a new tag but we may still want to patch=20
> documentation (e.g. links have gone bad, misleading info, etc.).
>
>>> BTW, it seems like once you're on a tagged release, you cannot go back
>>> to the .999 from the dropdown menu, is that intended?
>>=20
>> Sounds like a bug to me!
>>=20
>
> I vaguely remember discussing this years ago. I think the issue is how=20
> to represent this in the menu? Should we really have
>
> scarthgap (5.0.9)
> scarthgap (dev)
>
> for each release?

I don't think it's necessary to do so for each release, but only for the cu=
rrent
stable release, as is done today. So I think the only real bug here is that=
 we
don't see "Walnascar (5.2.999)" in the list as it should be.

I don't really like renaming from "Walnascar (5.2.999)" to "Walnascar (dev)=
" (if
that's what you implied). I would rather put "latest" instead.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


