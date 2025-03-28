Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65302C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:49:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.13051.1743173379264960484
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 07:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ir/W6kax;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4EAE442B8;
	Fri, 28 Mar 2025 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743173377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRHXCHjMKgFPZ4nGNqvllQi753b/AhJy0dzWprahLCs=;
	b=Ir/W6kaxQe//kY12VTLIwC1s5DQWASbKrSFbIdi3LI5iRhl4Lv8lMOQp3B+jACb+A1MhMc
	0fOTaURYPpr8w9Qg1p2NShtbmS6uvftoLZ+P9G4ruGwuqMqJqwIAv99xMzb0QUGQW3w10d
	N0cYynzY5ZMAKb1V991SSQ5fSXNE0lJ9CxHqpLlOLhyqrJ2VGgj9WAUV7mvup1ska/hXsJ
	WyWRC+4Cy2xc7ICl4bNewAGec3laTvQbOVMvL1gmbVnPwHfmGkK+9nmEF6JzNZZ5ohWops
	zQomnAuxghACfNWdjNnsiEg69w2VEjQ6lUCgR8FPsF3dF2epKnaixEdLCeoNxg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 15:49:37 +0100
Message-Id: <D8RZE2BZV20O.1JDF6VIZWNL2F@bootlin.com>
Subject: Re: [docs] [PATCH 00/11] Final release note updates for 5.2
Cc: <docs@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-42-g7f7db0373f6c
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com> <CAMSfU+5tH=CG2HQp+A6U-ScX4QyetPh7xfK1YyYxKNf2JXZ5Lw@mail.gmail.com>
In-Reply-To: <CAMSfU+5tH=CG2HQp+A6U-ScX4QyetPh7xfK1YyYxKNf2JXZ5Lw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeduheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeugfeifefgkeekveetudduiedvhfejveejuedvfffhgeejvdeuhffhkeeikefhffenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdihrghmlhdrihhnpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghru
 gessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 14:49:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6677

Hi Yoann,

On Fri Mar 28, 2025 at 3:44 PM CET, Yoann Congal wrote:
> Hi Antonin,
>
> Le ven. 28 mars 2025 =C3=A0 14:07, Antonin Godard via lists.yoctoproject.=
org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> a =C3=A9crit :
>
>> This series makes the final updates before the 5.2 release, which
>> includes adding the recipe upgrades, license changes, as well as cleanin=
g
>> up a few empty sections.
>>
>> It also updates the release notes / migration guide and overall
>> documentation with regards to the latest changes on Poky.
>>
>
> I don't see
> [PATCH] poky.yaml.in: Raise minimum GCC version to 10.1
> https://lists.yoctoproject.org/g/docs/message/6606
> in your 5.2 branch. I feel like it should be in it.
>
> It might conflict with
> [PATCH 08/11] poky.yaml.in: bump minimum required Python version to 3.9
> https://lists.yoctoproject.org/g/docs/message/6663
>
> Tell me if you want me to rebase/resend to a branch.

Sorry, I just forgot (and didn't get that you were talking about this patch=
 on
IRC, I confounded it with your C++ toolchain flag sanity check patch someho=
w).

Applied to master-next, thanks for the awareness!

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

