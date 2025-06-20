Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E59C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 10:03:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.4372.1750413790889174554
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 03:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mCCGI5ww;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93B8F4327D;
	Fri, 20 Jun 2025 10:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750413789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZwPQADdk8INuVVH/mrJ+uamT676CdepSESwfpw6c0E=;
	b=mCCGI5wwCyzQMzylcwBgNENpDuHd8PkeLpld6vyTwBCTzxvpJTEdxZ3nr974BvtHJTyCNV
	g3j+zlNlOUdt+wcW/WN78Hrun/MW/282br0eA9hU0hcRXPcBaWVFFcSLMPE7gu1Op8Uk0d
	NmpEqs8loU44R4B8P8CrsWt/13dDxUeA//xCVrm8h0h30HX9aqY39d84eKqFNRQCFNQA9T
	5vKmBHDGdmmpeWCaz2VfCGWyfjWY7Ig1Pw9jH78NOs2aZ7yXSR820SwdWvocLBKhY3tpqX
	dxO3kam/KggMwYNm0rdguKQyIQ7HMH9JgLtWkBaS2LBTFsiPBZcaxMooBo1eCQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 12:03:08 +0200
Message-Id: <DAR9WH6OG420.2QTYQU9FHEXRD@bootlin.com>
Subject: Re: [docs] dev manual inconsistently encourages changing "poky"
 checkout locally
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alex.kanavin@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <7da04e7f-11c4-819e-cd9b-7aaea55bd91d@crashcourse.ca>
 <CANNYZj-vcNipixa-0e+v43ww7CCfLqtFVG4WBF7U+Tq9Fg2PEg@mail.gmail.com>
 <3f1b7be8-fed6-efdd-ce87-79441aa58a8a@crashcourse.ca>
 <CANNYZj-oUWVgEaw=2NfYhhEA3bNPPtwvHb4j4a0EtB1iSVBZmw@mail.gmail.com>
In-Reply-To: <CANNYZj-oUWVgEaw=2NfYhhEA3bNPPtwvHb4j4a0EtB1iSVBZmw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffgkeeiueefieevkeekveejteevleekjeeigfefiefhgefhgefhuddvjeduvddvnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrt
 ghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 10:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7122

On Fri Jun 20, 2025 at 11:47 AM CEST, Alexander Kanavin via lists.yoctoproj=
ect.org wrote:
> On Fri, 20 Jun 2025 at 11:44, Robert P. J. Day <rpjday@crashcourse.ca> wr=
ote:
>>   it's point 5 here:
>>
>> https://docs.yoctoproject.org/what-i-wish-id-known.html
>
> "Never modify the POKY layer. Never. Ever. When you update to the next
> release, you=E2=80=99ll lose all of your work. ALL OF IT."
>
> I'm not sure what this point wants to say to be honest. Can't make sense =
of it.

While the what-i-wish-id-known document is pretty clear about it, it's true=
 that
saying "As you work with the local branch, you can periodically use the git=
 pull
--rebase command to be sure you are up-to-date with the upstream branch." w=
hen
speaking about the poky repository kind of imply local modifications. And t=
hese
two documents are unrelated.

So all-in-all, I think what we want to remove here is the "--rebase" flag.
That's the only thing implying local modifications to poky. Using "git pull=
" is
fine. I'd take a patch.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


