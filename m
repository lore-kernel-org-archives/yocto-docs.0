Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00338C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 09:24:32 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.14475.1751966663613414958
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 02:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cl0pRwf6;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 794C243191;
	Tue,  8 Jul 2025 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751966660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lMVceMqcam+UMG3FtkaBxShGA+jRm/OklTQw91CfjzI=;
	b=cl0pRwf6Y4ZByMcgpgMYqx8MrbepahVPjqdJdC87peUtxG3/QfAo17saMUlXnWUU5WFVU4
	/hlfNbsLcKoTuHAOQWmSwPT92ROnoygjEEZwkk9NMU/9TPi9T9naS8hcnZ/6MNcfLNfYyr
	g3FIUPkJbwexNAmqF4enffXmxM6GmW+cyKWnrLonWkCjFTn0POFnoiMoHZLmfz8i2pxr5r
	NLFJAvvLK+uGzGXWwtT8ieA6Px82fYp9luHPODHNoPscgR+tvPCzKNSXhKkXWT1rPX6gCw
	/jTBnlHBzHeqrSMzMCs2yfG4tit/2Md4ugSeS35sz9yEd3hTlFXrryZJ7/6AHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 11:24:20 +0200
Message-Id: <DB6KCKNX3JJJ.3VF9X2K4S5HWR@bootlin.com>
Subject: Re: [docs] a couple random thoughts about YP docs and examples
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <d2261e4d-bfe5-3c97-a580-ed25d69e228c@crashcourse.ca>
In-Reply-To: <d2261e4d-bfe5-3c97-a580-ed25d69e228c@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdro
 hhrgh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Jul 2025 09:24:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7274

On Mon Jul 7, 2025 at 9:16 PM CEST, Robert P. J. Day wrote:
>
>   reading the bitbake manual (although this could just as well apply
> to YP docs in general), my first general nitpick is the number of
> awkwardly contrived examples that involve contrived variable names.
> consider this section on the ":remove" directive:
>
> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-us=
er-manual-metadata.html#removal-override-style-syntax
>
> why use variables FOO and FOO2 and arbitrary numeric strings when
> there are so many meaningful examples in the OE code base that would
> make actual sense, such as:
>
>   meta/recipes-bsp/grub/grub2.inc:CFLAGS:remove =3D "-O2"
>   meta/recipes-bsp/grub/grub2.inc:TUNE_CCARGS:remove =3D "-mfpmath=3Dsse"
>
> Examples like that actually suggest to the reader *why* one might want
> to remove strings from various variables related to various recipes.
>
>   Also, I don't see any mention in that section about override-related
> removal that would be useful to explain, stuff like:
>
> meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:DEPENDS:remove:riscv32 =3D=
 "libunwind"
> meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:DEPENDS:remove:riscv64 =3D=
 "libunwind"
> meta-poky/conf/distro/poky-tiny.conf:PACKAGECONFIG:remove:pn-opkg-utils =
=3D "python"
>
> In short, we should be using actual examples from the OE code base as
> examples, and we should try to be complete.

Bitbake is not only used with OE-Core, and so the Bitbake documentation sho=
uld
not make any references to it. Maybe more meaningful examples could be take=
n but
we need to keep that in mind.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


