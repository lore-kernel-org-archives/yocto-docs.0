Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F2AD3C932
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 12:10:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16766.1729599022513631416
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 05:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kU0mLEul;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84CCD1BF203;
	Tue, 22 Oct 2024 12:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729599020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=feaEbeWO47MqSkRMPufJ9LiFi+U61x0NNJzqZ3Jo5Og=;
	b=kU0mLEuljFNgAYDHorRQ7JtRA60e1pC48PS34VqsSN4xbBa3adkGDyNFu9QZhfCavSg2YN
	7wDbf+18Nvo+E5aCZVsrKl8PX7w3/yX6oZ9n8q0npScguLABKXQNf8krGvQQ2Woc1i7W9P
	13+6n0VPkEp4UFkGA0XJdmwuxCLZknmFYzhlRuHD3C44PS0xZS6TuEUhFMIQZJIHoQle2M
	OyMZnkqYGMeGAtMEpej+2hSjuhYBRNyOfq8JuJBN2gr9nJgvpJ5CUEMlsElt9UlpMB+pVZ
	Rr1+HFAs7PFCemVwGsrQsbujk1LAUktSuKH9uROw97/ap2SY37vXoLcdjRokzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 14:10:20 +0200
Message-Id: <D52BOKSQ5RMM.31B7I4X4AJMN3@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <chris.laplante@agilent.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
 <79f143c4-7d78-4090-88bb-2b0e5ec4c404@cherry.de>
In-Reply-To: <79f143c4-7d78-4090-88bb-2b0e5ec4c404@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 12:10:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5559

Hi Quentin,

On Tue Oct 22, 2024 at 1:57 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
>> 1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2
>
> Yes, but isn't it done automatically if IMAGE_FSTYPES_DEBUGFS and
> IMAGE_GEN_DEBUGFS are set?
>
> We have a selftest here: meta/lib/oeqa/selftest/cases/gdbserver.py that
> doesn't seem to be adding tar.bz2 to IMAGE_FSTYPES, so I assume it's fine=
?

I think it might be because qemu.inc adds it by default (not a oeqa expert
though :) ). Here's what I have by default with qemu:

```
$ bitbake-getvar IMAGE_FSTYPES -r core-image-minimal
#
# $IMAGE_FSTYPES [3 operations]
#   append /build/../work/openembedded-core/meta/conf/machine/include/qemu.=
inc:18
#     "tar.bz2 ext4"
#   set /build/../work/openembedded-core/meta/conf/documentation.conf:215
#     [doc] "Formats of root filesystem images that you want to have create=
d."
#   set? /build/../work/openembedded-core/meta/conf/bitbake.conf:844
#     "tar.gz"
# pre-expansion value:
#   " tar.bz2 ext4"
IMAGE_FSTYPES=3D" tar.bz2 ext4"
```

> meta/classes-recipe/image.bbclass and
> meta/classes-recipe/image_types.bbclass are the only places where
> IMAGE_FSTYPES_DEBUGFS is actually used, and it seems that we're adding
> the content of IMAGE_FSTYPES_DEBUGFS to those of IMAGE_FSTYPES if I am
> not misreading it?

In image_types, the following:

  fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())

Is an union, so if tar.bz2 is not in IMAGE_FSTYPES it won't work actually.

About the other IMAGE_FSTYPES_DEBUGFS references, it does look like it shou=
ld
add IMAGE_FSTYPES_DEBUGFS to IMAGE_FSTYPES, but it didn't when I tested it,=
 so
I'm not entirely sure :/ Maybe this is a problem in oecore?

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

