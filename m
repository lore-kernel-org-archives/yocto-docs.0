Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E57C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 09:20:52 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14432.1751966451746808842
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 02:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pUQro9kA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F16743121;
	Tue,  8 Jul 2025 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751966449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOwcUVCSg0FKVi/2QN04SV5uBsXHItlRQAXOwMK1AXA=;
	b=pUQro9kAId62yW+Vmdy4ajBMsPOcvM7cVOaHdF7ZkrS1QjEduVNv3Dapw0fprFRAObWzLH
	xBz+6mqQ0XRb5oy/UfOqHkSRBnzmOztP91JefemUjs86shoSC+kS2o4gRNQ7QWowRQGCK+
	sskQ+AcKiUvYzQ0/pqH45J7WABVAooplI6vtzKcNrxzTMcRe+l7ncPZpFe8x3ouE6HoEF8
	T6PMvgJFjKOJraTEcliCRUtrCtks6gyWZRyK3fRIfltr8uigahPD35hGDZjCOmv3maJISS
	o87Ec3GIBNPVGFl0GuxC9F1ZNAnyPBe4RbpAXyXQ2/G6agCWK4eYFRhmy+Zp4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 11:20:48 +0200
Message-Id: <DB6K9VIZX58R.2SOMXERAQNX2V@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] should bitbake manual explain "bitbake-getvar"?
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <10a3c9a6-fc05-0c22-804e-0fcc7a9c350a@crashcourse.ca>
In-Reply-To: <10a3c9a6-fc05-0c22-804e-0fcc7a9c350a@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvuffhfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeegueevfedvuedtfeeuleetvdekieehjeekjeeffedtffeitdffudduheehtdeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdro
 hhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Jul 2025 09:20:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7272

On Mon Jul 7, 2025 at 4:07 PM CEST, Robert P. J. Day wrote:
>
>   i note that near the end of this section:
>
> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-us=
er-manual-metadata.html#modifying-existing-variables
>
> the reader is advised to display the value of a variable with:
>
> $ bitbake recipename -e | grep VARIABLENAME=3D\"
>
>   but the same effect can obviously be done with "bitbake-getvar".
> should the bitbake manual cover some of those extra utilities?

Sure, please, send a patch.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


