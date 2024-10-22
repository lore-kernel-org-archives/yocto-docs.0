Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBC3D2C547
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 12:21:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.16925.1729599710139801570
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 05:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GCE4oaGP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E16FE000F;
	Tue, 22 Oct 2024 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729599708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/SNWvlehjMMz2l1rsRb+Vx5WbnxrVfNbhqYdfaCVgzU=;
	b=GCE4oaGPkyKot2EOlsRdJQ/iu1gcxyOigzOjiKKUWLbtKkYSlZ5jsQBslagzCCWkry73g5
	53i1bHnDtA006qFi83VzVCwu6qCbOIoRGm+z7/ke7KapaOMINzVKoAHJ5JwUVnhRzFzcCJ
	Vta98AZiMSoMoWpY106a7gAV3daqaJyEMAEk9Lo4h2LzIba/NLWGO7DVEvmu41yoJnrmUz
	47zvKOJ0u7p8pToHkiM+ZWPdefNq1udup0GAgqDGK6Y4Uf+43sccNo/JotQIH7hKCz3cuI
	eJh4/SKuLqKVzvTuEjMCka+m09e3mEwsaLV59+R7ddBxYlmrjn9D0O2POG+atA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 14:21:48 +0200
Message-Id: <D52BXCQFSKUK.52RDIPVCESOW@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <chris.laplante@agilent.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
 <79f143c4-7d78-4090-88bb-2b0e5ec4c404@cherry.de>
 <D52BOKSQ5RMM.31B7I4X4AJMN3@bootlin.com>
 <fdc83afc-d274-4a90-8fbe-ef0717f099af@cherry.de>
In-Reply-To: <fdc83afc-d274-4a90-8fbe-ef0717f099af@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 12:21:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5561

On Tue Oct 22, 2024 at 2:17 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/22/24 2:10 PM, Antonin Godard wrote:
>> Hi Quentin,
>>
>> On Tue Oct 22, 2024 at 1:57 PM CEST, Quentin Schulz via lists.yoctoproje=
ct.org wrote:
>>>> 1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2
>>>
>>> Yes, but isn't it done automatically if IMAGE_FSTYPES_DEBUGFS and
>>> IMAGE_GEN_DEBUGFS are set?
>>>
>>> We have a selftest here: meta/lib/oeqa/selftest/cases/gdbserver.py that
>>> doesn't seem to be adding tar.bz2 to IMAGE_FSTYPES, so I assume it's fi=
ne?
>>
>> I think it might be because qemu.inc adds it by default (not a oeqa expe=
rt
>> though :) ). Here's what I have by default with qemu:
>>
>> ```
>> $ bitbake-getvar IMAGE_FSTYPES -r core-image-minimal
>> #
>> # $IMAGE_FSTYPES [3 operations]
>> #   append /build/../work/openembedded-core/meta/conf/machine/include/qe=
mu.inc:18
>> #     "tar.bz2 ext4"
>> #   set /build/../work/openembedded-core/meta/conf/documentation.conf:21=
5
>> #     [doc] "Formats of root filesystem images that you want to have cre=
ated."
>> #   set? /build/../work/openembedded-core/meta/conf/bitbake.conf:844
>> #     "tar.gz"
>> # pre-expansion value:
>> #   " tar.bz2 ext4"
>> IMAGE_FSTYPES=3D" tar.bz2 ext4"
>> ```
>>
>>> meta/classes-recipe/image.bbclass and
>>> meta/classes-recipe/image_types.bbclass are the only places where
>>> IMAGE_FSTYPES_DEBUGFS is actually used, and it seems that we're adding
>>> the content of IMAGE_FSTYPES_DEBUGFS to those of IMAGE_FSTYPES if I am
>>> not misreading it?
>>
>> In image_types, the following:
>>
>>    fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
>>
>> Is an union, so if tar.bz2 is not in IMAGE_FSTYPES it won't work actuall=
y.
>>
>
> It's a union, yes, but that's why it'll work :)
>
>  >>> a =3D set([1, 2, 3])
>  >>> b =3D set([3, 4, 5])
>  >>> a | b
> {1, 2, 3, 4, 5}
>  >>> c =3D set([5, 6, 7])
>  >>> c |=3D a
>  >>> c
> {1, 2, 3, 5, 6, 7}
>
> c.f. https://docs.python.org/3/library/stdtypes.html#frozenset.union

Indeed, my bad, read that too quickly. Thanks :)

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

