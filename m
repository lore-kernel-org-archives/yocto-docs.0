Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F83C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 09:22:32 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.14454.1751966547299752924
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 02:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JsTl8INm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FDE41FCF0;
	Tue,  8 Jul 2025 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751966545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15xobMLoTbldU20FE7dCAqzI4jgFkSryLWDh988q1PQ=;
	b=JsTl8INmEUFCuOxOKuJ0e7ucW94Ha8pHiQcfXHG7cJC0G0iEJzsf4N670tvUzIycEmecjN
	xGoPvxUmiiAiAYstQbNXI1abUapx8tsHcnuXaYV0xOt2wriQOKZDd0479iwu46ey5bs061
	A+TG3aZNzcsahrWK4vRVv6rubdLVsYIPnthvPo3LAgswQicGxt31dF+zLQSFuRKB3zANMP
	1nqQlfCvWBorvh9Gy12UwyduueysQ4K9PsjSgpZuUl5dMzjTlOF6esq3RXTVW/gkqUSOtS
	dtcMI9LGtf5hVfZYy4gIF71DqkByfEqtrVZ7m5kQKWdJYQNgxBtTwDAmCeB5hg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 11:22:24 +0200
Message-Id: <DB6KB3M9YP3T.2ZQ8PXKODAO7M@bootlin.com>
Subject: Re: [docs] where in BB manual to mention "classes-global" and
 "classes-recipe" dirs?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <d0fbdce5-8bcc-5f78-ec23-ea218659302c@crashcourse.ca>
In-Reply-To: <d0fbdce5-8bcc-5f78-ec23-ea218659302c@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdro
 hhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Jul 2025 09:22:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7273

On Mon Jul 7, 2025 at 10:53 PM CEST, Robert P. J. Day wrote:
>
> at the end of this section:
>
> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-us=
er-manual-metadata.html#locating-include-and-class-files
>
> one reads:
>
> "In order for include and class files to be found by BitBake, they
> need to be located in a =E2=80=9Cclasses=E2=80=9D subdirectory that can b=
e found in
> BBPATH."
>
> not technically true since searching also checks the classes-global
> and classes-recipe directories (see lib/bblayers/query.py.
>
>   is this the right place to mention those additional directories?

Good catch, the classes-recipe and classes-global should be mentioned here =
too.
Can you send a patch?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


