Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005B1C0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 08:18:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.47065.1737965920436028575
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 00:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aLLuoLCe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEF1A40007;
	Mon, 27 Jan 2025 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737965918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0fknvBdK10NZaTD235qEGd+0TyCUHhd7gjAoIlvAPw=;
	b=aLLuoLCemF8qzcdo8Zc+5ItQAJTmZ0+1L0jMqbQJbgx4Ba1KvoEvQjehT2feIWpT8bJiEq
	MGcGkgwvdPLeVjBgXMcho5IYlkkFiooC1wFfrs1ANw3ibIbDPbS73l1EjcR+vRGkk9J8GJ
	1Y5Cem+9Eigc0kAMP9fd5viEGq8D+b+L9oeOd6U244cQ2SIxwqArrFr/zzYqXyueaI0A/L
	XFW5DF2iJxfp44bVnszGmybngw4nRgIJQAqzVcrqS+8wUakWBR85cuCQbiutvu4n/1LmPQ
	bsU0kdVSZ35PLmDqxs8ZEVcGAKtn/VYW4HAcPQ284gd1Om4bQXKTskX1gFk2pQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 09:18:37 +0100
Message-Id: <D7CPI0DNJOF5.887OAXQJQ2KC@bootlin.com>
Subject: Re: [docs] [PATCH] doc/wic,README.hardware: add dd option
 conv=sparse
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <docs@lists.yoctoproject.org>, <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yoann.congal@smile.fr>, <joerg.sommer@navimatix.de>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <2cef35c707ab0d985578ca4d042cfb33902dbcb5.1737894876.git.joerg.sommer@navimatix.de> <2d28b3a78a7bdc3be27bee7d9d911e87bf4ad45b.camel@linuxfoundation.org> <hxkb5rwmau5lcil6xwof2wksghwsqbyrxys67uu4xv3goep3je@sepxesev554o> <CAMSfU+5h-mNsFTRng95D1Wa_-ezrwp9WDjsJVoZmEUWHUxj_mw@mail.gmail.com>
In-Reply-To: <CAMSfU+5h-mNsFTRng95D1Wa_-ezrwp9WDjsJVoZmEUWHUxj_mw@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 08:18:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6184

Hi all,

On Sun Jan 26, 2025 at 5:56 PM CET, Yoann Congal via lists.yoctoproject.org=
 wrote:
> Le dim. 26 janv. 2025 =C3=A0 16:25, J=C3=B6rg Sommer via lists.yoctoproje=
ct.org
> <joerg.sommer=3Dnavimatix.de@lists.yoctoproject.org> a =C3=A9crit :
>
>> Richard Purdie schrieb am So 26. Jan, 12:53 (+0000):
>> > On Sun, 2025-01-26 at 13:37 +0100, J=C3=B6rg Sommer via
>> lists.yoctoproject.org wrote:
>> > > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>> > >
>> > > The GNU implementation of dd supports the skipping of sparse blocks
>> which
>> > > can speed-up the write, esp. of wic images with big holes:
>> > >
>> > >     $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M
>> > >     2683+1 Datens=C3=A4tze ein
>> > >     2683+1 Datens=C3=A4tze aus
>> > >     5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 84,2773 s, 66,8 MB/s
>> > >
>> > >     $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M conv=3Dsparse
>> > >     2683+1 Datens=C3=A4tze ein
>> > >     2683+1 Datens=C3=A4tze aus
>> > >     5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 11,3314 s, 497 MB/s
>> > >
>> > > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>> > > ---
>> > >  documentation/dev-manual/wic.rst  |  8 +++++++-
>> > >  meta-yocto-bsp/README.hardware.md | 20 ++++++++++++++------
>> > >  2 files changed, 21 insertions(+), 7 deletions(-)
>> >
>> > I'm torn on this as it is potentially dangerous. It depends whether th=
e
>> > blocks really need to be zero or their contents doesn't matter. You
>> > could leave existing data behind if you use the sparse option.
>>
>> Isn't this the same what bmaptool does?
>> https://github.com/yoctoproject/bmaptool?tab=3Dreadme-ov-file#concept
>>
>
> It look it does not. bmaptool readme is very particular on what a "unmapp=
ed
> block" is. And is not a zero block.
> TL;DR: (a gross reinterpretation) that is a block not referenced anywhere
> in your filesystem.
>
> Imagine a file filled with zeroes on your filesystem. Those zeros are
> referenced so must be flashed. bmaptool will flash them.
> "dd conv=3Dsparse" will not and this is only right in a corner case : if =
you
> already know that your disk/memory is zero filled.
> But, in the general case, you'll get a "zero file" filled with garbage.
>
> Sorry, but I'm against this change since it will be a source of weird/har=
d
> bugs.
> Maybe instead of changing the dd command to speedup we can push users to
> "bmaptool copy" (we will get speedup without compromising on the validity
> of the filesystem)?

I agree with Yoann, I'm not for providing conv=3Dsparse as a default option=
 for
dd.

I also vote for redirecting to bmaptool. This can be done with:

  :ref:`bmaptool <dev-manual/bmaptool:flashing images using \`bmaptool\`>`

I think in a `..note ::` like you did J=C3=B6rg, would be good.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

