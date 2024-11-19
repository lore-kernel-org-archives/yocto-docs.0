Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F921D591A5
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 16:24:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.25461.1732033438000659302
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Nov 2024 08:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZXtbkLOx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF246C0006;
	Tue, 19 Nov 2024 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732033436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qddrf0Uchnav13Dxzh7504JEgaIXOJPekkfuNLc6oQQ=;
	b=ZXtbkLOxyKgRPAM7FkKddUZgsAnBPuvROq1/Y1bBs40XT9MGIyPj6kM++OXOLzJ3wGqBBW
	VrZ0oy8TL7L4HIG6BuMerQ6/RYlPxji2nhheNNk+ZgbuXikVtBYoyodn383aLOeCIkSctB
	SsnRYND5p5oS/t23ZowMJrVmpMX6197oU4Pa4Jh7gqGU0Pst8BvI5xin9pSYraVQ3VfD4r
	sjPTgloS4b5oWFIj9pCEm0bueN8aROtZKBzhFfMp1+Wz25LYuQ7Bu+UaS23a8+Uq+HDiSc
	fSerHH4XRPV6yeGSQcz541o97hLxCddH7mmgERskmzlFjwCW9FUIL1gSkO5q1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Nov 2024 17:23:55 +0100
Message-Id: <D5QALZQ41WNU.3DHEEMS149GUY@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto-docs PATCH] ref-manual: classes: bin_package: fix
 SRC_URI example
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com>
 <5b61d56f-b04f-4fa0-8249-83c605036726@cherry.de>
 <D5Q8XTH54W4A.227VGN0AOS29E@bootlin.com>
 <82c3cacd-edcc-4385-8403-3e997e2650fd@cherry.de>
In-Reply-To: <82c3cacd-edcc-4385-8403-3e997e2650fd@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Nov 2024 16:24:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5771

Hi Quentin,

On Tue Nov 19, 2024 at 4:15 PM CET, Quentin Schulz wrote:
[...]
>>>> -      SRC_URI =3D "git://example.com/downloads/somepackage.rpm;branch=
=3Dmain;subpath=3D${BP}"
>>>> +      SRC_URI =3D "git://example.com/downloads/somepackage.rpm;branch=
=3Dmain;subdir=3D${BP}"
>>>>   =20
>>>
>>> This is not enough, subpath is mentioned in the note admonition just
>>> above a few times, those need to be fixed as well.
>>>
>>> Additionally the wording is weird for the bin_package class.
>>>
>>> "class is a helper class for recipes that extract the contents of a
>>> binary package (e.g. an RPM)"
>>> [...]
>>> "For RPMs and other packages that do not contain a subdirectory,"
>>>
>>> Maybe we should use another example of a binary package (e.g. a .deb
>>> package) in the first sentence?
>>>
>>> Also I am not entirely sure what this example is supposed to show.
>>>
>>> SRC_URI =3D
>>> "git://example.com/downloads/somepackage.rpm;branch=3Dmain;subpath=3D${=
BP}"
>>>
>>> This is very confusing to me, is this really a somepackage.rpm **git**
>>> repo? or was this a mix between fetching via git and unpacking an RPM?
>>>
>>> I'm wondering what we were supposed to show with this example. Is it
>>> about fetching an RPM from a git repo and only extracting a part of tha=
t
>>> RPM? Is that even possible? If so, we probably want a combination of
>>> subpath and subdir? subdir for the path internal to the repo to the RPM
>>> and subpath for the path internal to the RPM to extract?
>>=20
>> Actually I think I missed the point of the class description at first. I=
t seems
>> to document how to fetch a subpath of a git repository containing rpm fi=
les=E2=80=A6
>
> Would the content of the rpm files be extracted if they are fetched by=20
> the git fetcher?

Actually, no! I just tried. You can't just pass a path to a file inside a g=
it
repo to the git fetcher. You can pass the git repo URL, but the content of =
the
git repo won't be extracted, the git fetcher won't do that by itself.

The bin_package class expects content of the rpm/tarball/else to already be
extracted in S before installing it in D.

So the fetcher should be selected with that in mind.

>> Which makes me wonder: how often do you need to fetch binary from git
>> repositories? Probably not often.
>>=20
>
> Probably not, but not THAT uncommon. For example Rockchip provides the=20
> libmali binaries mostly via deb packages (they provide "sources" but I=20
> was unable to compile them into something that works, so....).

I would expect most git hosting service to provide HTTP link to files, so u=
sing
https://...<file>.rpm is probably possible in most cases?


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

