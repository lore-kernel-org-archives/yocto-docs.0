Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BC6C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:47:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10715.1749023223047624498
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 00:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GkdwfGlT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 855E843B3C;
	Wed,  4 Jun 2025 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749023221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=leWrMaKjnZqj3dqocyd8GKNu+bFJ2lTRMCPhx+LxgtY=;
	b=GkdwfGlTbw9vtaAj7GKF9glpbigMORd+lWfvdjuydA920TAoSxDeeMsHhlbjhCrmabfXx4
	rTHMXw0MmlfUL58ejhSExlZ5Q5AVRSdoV5H7SQaNzhFhRh/kBoMBLHZbuJnEz1Fo12DEfi
	/4cNj10ZyVfxdtqmdCQmzL9jVzf9lDx7vDZedPup5/Xe4m4Qn+jeUsU/k/e+E38kaWacdq
	PYbm6hiz5P8VYiTQr41TrW3DSP4eFyd0ajJcwpursPbn/i03WA/vrSrl3K3PeUve9AVuhQ
	Inj4wcSYwrEf/1TIEjhCthASiiLu6VQhsBivoMF7E1YPAThhrPCPBeRCPBElhg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 09:46:59 +0200
Message-Id: <DADKZIPNS4NH.348N34F0WS0XD@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alperyasinak1@gmail.com>, "Quentin Schulz" <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 KERNEL_EXTRA_FEATURES
Cc: <docs@lists.yoctoproject.org>
References: <20250531154900.53941-1-alperyasinak1@gmail.com>
 <4f224337-e7c7-4ccb-a0cc-861fddcabc07@cherry.de>
 <CAGpma=4nc0DcTEddK0FFb6sj2yenN91DnZrcit2poyqOQ_jYSQ@mail.gmail.com>
In-Reply-To: <CAGpma=4nc0DcTEddK0FFb6sj2yenN91DnZrcit2poyqOQ_jYSQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeevueevvdeiuefhfeeluddvgfevhfdukeelheekvefhgeetudejtdevudekteejnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrlhhpvghrhigrshhinhgrkhdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Jun 2025 07:47:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6997

Hi,

On Mon Jun 2, 2025 at 5:41 PM CEST, Alper Ak via lists.yoctoproject.org wro=
te:
> Since the KERNEL_FEATURES variable is handled in kernel-yocto.bbclass
> and KERNEL_EXTRA_FEATURES is usually appended to it, I wanted to
> emphasize that this class should be used.
> That's why I made a connection between them and assumed that they were
> complementary. Apparently I misinterpreted it.  As you said, it always
> in final/leaf recipes and not .inc files or classes.
>
>> > +      such as Poky may set a default value using a soft assignment (`=
`?=3D``).
>> Does it? I don't see it, only an :append is used.
>
> "bitbake-getvar KERNEL_EXTRA_FEATURES" shows that it is
> appended(:append) in poky.conf but somehow I missed it and wrote soft

I don't think we should document variable default values based on poky.conf=
, as
Poky is only a reference distro after all.

What bothers me is that KERNEL_EXTRA_FEATURES does not have any default val=
ue in
the kernel-yocto class. And I don't see the added value compared to
KERNEL_FEATURES, since what happens in the end is always:

  KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"

Meaning users are fine modifying the KERNEL_FEATURES variable directly, I
believe. What do you think?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


