Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD237C021B5
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 09:19:25 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.85050.1740388761151953799
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 01:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g5dbsLlT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6413C41B5F;
	Mon, 24 Feb 2025 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740388758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nu7W2HXOq2w0PIL6QWgJV9uClFpeg/jUwbCsLpsEXYE=;
	b=g5dbsLlTVjXlIIsf7Kxr5LYqhtulV7bGRUPkaltHaeeURxgNByz7OfpulJlGWkAnvgooQ6
	g3ysrZ8zmFuYkHo2hcz8lacWa5O++pmjQH0Yt1inu6BGwX7ZPRv6/zTEw9qrdNHHKj9n/f
	EuyfJUsBAx1cu1suCrx8gYeGA7StbnL/+gLKlokgEjkhsHBk9D/M5VQDWFA9W30kTsBw6X
	T0X5IW+72CzXXrWZ7Zr1Bpf78Ld8uD3ikEMM4ydC0VcRJgOZAe54PvZ8Gn2ust15Ty0Yme
	Cq+zjhh2CAVOOxTXVQGczkwrCLthOI8064YeUymrFRRH/hBCE6g/6tAJQXqe2w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 10:19:18 +0100
Message-Id: <D80KBPWTCLPO.235WHNG2ZFZO0@bootlin.com>
Subject: Re: [docs] [PATCH 3/6] overview-manual: convert
 configuration-compile-autoreconf.png to svg
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-3-75d23b5e7a88@bootlin.com>
 <b78094a9-4994-4f7d-a6c4-beca36cf652e@cherry.de>
In-Reply-To: <b78094a9-4994-4f7d-a6c4-beca36cf652e@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedvueetgeektefgjedthfffhfejudfhtedugeffvdetjeehffeiteduhfehffeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhoj
 hgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 09:19:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6433

Hi Quentin,

On Thu Feb 20, 2025 at 5:13 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/18/25 10:11 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Convert the png file to an SVG file, and add the UNPACKDIR reference.
>>=20
>
> The arrows for the build directory are misaligned, especially for the=20
> machine-specific package.

Yes, I noticed afterwards too. There were some font issues, rsvg-convert wa=
s not
properly picking them up. And also having so many arrows require precision =
that
is not taken into account when converting from SVGs to PNGs.

In the end, I think having the different arrows as text (for the rightmost =
part)
is much better and will always meet the alignment no matter what the font i=
s.
E.g:

  ${PV} -------- WORKDIR

So now the output is this:
https://lufi.bootlin.com/r/EuK0sscTNP#uV4rb2CQCPCMXONMGiBTfR9PY8BTDm0g0xeIA=
I+AsH8=3D

What do you think?

> I'm also a bit skeptical about the position of the star before=20
> EXTRA_OECONF, it feels like it's somehow part of the variable name.=20
> Maybe add a space or make the star appear a bit higher (like in the=20
> current PNG?).

I will adjust that.

> A remark for the original content as well, but I don't really understand=
=20
> why B isn't passed to do_configure and do_install as well? Isn't it=20
> where build artifacts will be configured before do_compile runs and from=
=20
> where do_install will run in order to install files into $D?
>
> do_configure[dirs] =3D "${B}"
> do_install[dirs] =3D "${B}"
>
> in base.bbclass for example.
>
> I'm wondering also if we shouldn't have a bidirectional arrow for B for=
=20
> the configure and compile task as they are run from there, i.e. they=20
> generate files in there as well?

I agree, B is used in all three.

For do_install, I guess a unidirectional arrow would make more sense as D i=
s
already used to point towards the other way.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

