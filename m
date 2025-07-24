Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2961AC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 10:53:03 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.9610.1753354378041847832
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 03:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ngc19Hhs;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A87E74313C;
	Thu, 24 Jul 2025 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753354376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ar2nIFYokQQcKu3Y623Rxjtjs4FZD3mqox0i/Snvif0=;
	b=Ngc19HhsqLw44W4dIlgbfXDR94Wkl8QmRo200GFKDvEDU4kddmoH4NoX8stRomRLblncCR
	wycNVvNGA55Xc/5uG2EI2LYegjBrVYwkxeMme7aib9gKEen3sXx7AaRRtJE6mJ/T0Xhp4g
	LvHKZh+N2UG8crQM12Mtv2EiSUgOQbPbxj4YnyHEu9CyGYc4NogygViLnGqToXCkPJPiAH
	v37tGFD8q+90NJFxyaOw+CSIAC/EQOYScGgMmgunmiW59Gl1IvIHQESAshsICmydTHx5/U
	P6IY8Jx5zYiXuWhOfrBM2IiAXewDoQb30fwQdzhuCYoOhluM0+hiJZwQuO8VIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 12:52:55 +0200
Message-Id: <DBK8946R23RD.37VXXEBFMPA69@bootlin.com>
Subject: Re: [docs] feature "EXPORT_FUNCTIONS" doesn't seem to be documented
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <2a3b6210-3c12-a83a-8dee-a82ab8ea970e@crashcourse.ca>
In-Reply-To: <2a3b6210-3c12-a83a-8dee-a82ab8ea970e@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektdegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtt
 hdrohhrgh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Jul 2025 10:53:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7374

On Thu Jul 24, 2025 at 12:40 PM CEST, Robert P. J. Day wrote:
>
>   seems important, where should it be covered?

Hi,

Take a look at:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manu=
al-metadata.html#flexible-inheritance-for-class-functions

Creating a entry in the variable glossary and linking to this section above=
 from
the glossary would be great though. Would you like to send a patch?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


