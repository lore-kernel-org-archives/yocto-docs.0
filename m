Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CBDC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:46:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.20337.1747907170247652587
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 02:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=myEJ506F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EBB01FCF7;
	Thu, 22 May 2025 09:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747907168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TP4rP3jcbZNbhsyrBkAJFBogoFwcV5o5F03DtIrbS2Y=;
	b=myEJ506F67hZj5jYGYMG1V8sJA/fU2EKWW/lzxwNKJnqyUwQzicuTcLqv5mHQeW9K8H3Cd
	NTmxntQ4UibcKDQxHQZkwDCgQPH7q7A9son2DVO4Xl4T92JClseshaIzDhBRv+PIHb2rgD
	MWD3PxogulQ+Xx4HVskPoVsh7WrUcHebldP5EmQvQllQ4Of6eI5dlNU0XsXWlib0KxVHYG
	kUsznd4i8MDFuu7OVFnJvwSL47fpdsgPBVoTZKwe5VgW8sYNmv1ehnk0g3Q1d+KQ0iPYQ8
	lJfR2gghSzoY48fVzZl0AYtzOtHMDeesjNJ84YzhFmAzaRz6Uy1Mb8uxfhqy9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 11:46:06 +0200
Message-Id: <DA2LDN8GA216.7WD86WP3ZP2W@bootlin.com>
Subject: Re: [docs] [PATCH v2 12/12] migration-guides/release-notes-5.2:
 update for upcoming 5.2 release
Cc: "yocto@pengutronix.de" <yocto@pengutronix.de>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
 "ejo@pengutronix.de" <ejo@pengutronix.de>, "docs@lists.yoctoproject.org"
 <docs@lists.yoctoproject.org>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com> <20250325-release-note-5-2-updates-v2-12-19f050d61da3@bootlin.com> <08183d24de0d86a03d25c13dc01166389ebfe5ad.camel@pengutronix.de> <19948ea8255497b0c3979364e4e7c485695863d2.camel@siemens.com>
In-Reply-To: <19948ea8255497b0c3979364e4e7c485695863d2.camel@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieefucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffehkeeuteetkeeufeejjeevveduuddtgfeuteeiveekjeegjeegteeuveekfedunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhnsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepvghjohesphgvnhhguhhtrhhonhhigidruggvpdhrtghpt
 hhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopeihohgtthhosehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 May 2025 09:46:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6875

On Thu May 15, 2025 at 2:33 PM CEST, Alexander Sverdlin wrote:
> Hi Enrico!
>
> On Mon, 2025-04-14 at 13:12 +0200, Enrico J=C3=B6rns wrote:
>> > -=C2=A0=C2=A0 -=C2=A0 ``bluez``: fix mesh build when building with mus=
l.
>> > +=C2=A0=C2=A0 -=C2=A0 ``systemd``:
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 set better sane time at startu=
p by creating the ``clock-epoch`` file in
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``${libdir}`` if the=
 ``set-time-epoch`` :term:`PACKAGECONFIG` config is
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set.
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 really disable Predictable Net=
work Interface names if the ``pni-names``
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature is not part =
of :term:`DISTRO_FEATURES`. Previously it was only
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 really disable for Q=
EMU machines.
>>=20
>> ( s/disable/disabled/ )
>>=20
>> Quick question: My understanding (and observation) is that not having 'p=
ni-names' set in
>> DISTRO_FEATURES (which will be the default for almost everyone) will cha=
nge the network naming to
>> 'non predictable' now, correct?
>> For me, this is quite unexpected and requires me to add 'pni-name' to ke=
ep the original behavior.
>> Shouldn't we then at least add this as a hint to the migration notes?
>
> Thanks for pointing this out!
> I'm sorry this came as a surprise! The reason I didn't think about
> preserving the legacy behaviour is that the behaviour itself was inconsis=
tent (QEMU vs the rest).
>
> Do you think we should add "pni-names" to the default systemd PACKAGECONF=
IG now as a follow-up patch?

Hi Alexander,

I don't have a strong opinion on this, but I think the best way to get an a=
nswer
to that question is to send the patch on OE-Core and wait for feedback, as =
you
won't get much traction on the docs list. :)

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


