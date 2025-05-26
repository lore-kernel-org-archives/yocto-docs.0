Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDA7C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:34:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.24101.1748244878427528667
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b83q5G/M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADEC81FCF4;
	Mon, 26 May 2025 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748244876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ww8XnVY+/XfDoJSf4O1oyktaAbN7vIr8TjnReZ8oKyA=;
	b=b83q5G/MrkqukycdFR612mlfdSSDDrYLljEbVlxrtj/8h742VqvJJ74y8KXho5bw+7o7Zz
	OxYd0cRDBpvuFH3EY/HpLgbOSHMQMu5RZfMpNWWW7/ttEP44XFOhtTUzXCokBq6NiBQx2/
	VCOk2BD90MgVo8g1YQunI7P6hsYKbRaqMf1b7iL/9JcMi519A/WK7QD1/aNRH6lGprm398
	/Cj5u4UI19ZKWixWdMqqWRHwz6DwFjmOJg4hSy7qPtbbdcAmnEI6n7IMfj6idsQXkW9FyU
	ou5CZJkksG8lKIcc1qWIqlxp2CS8ojucF+PGTffVgt1+fywc5xOGET2FyDNLWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 09:34:35 +0200
Message-Id: <DA5X34BFSHKJ.32WKSLGF3M9QM@bootlin.com>
Subject: Re: [docs] "Yocto Project Quick Build" renders an actual variable
 name
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <6196c48f-cc34-4a4d-7d9f-6bb4115d4446@crashcourse.ca>
In-Reply-To: <6196c48f-cc34-4a4d-7d9f-6bb4115d4446@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieelfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueffgfekhfehuddtteeftddvtdffleeggefgueduudehtdefleeuledtjeduleehnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgts
 heslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:34:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6908

On Sat May 24, 2025 at 2:32 PM CEST, Robert P. J. Day wrote:
>
>   Been a while since I've been here (was part of massive layoffs at
> Ford recently so I have spare time to dive back into YP docs), I'm
> reading https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html,
> and I see the line:
>
>   sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;
>
> so somewhere a variable is not being processed correctly? Was this the
> right place to report that?

This was definitely the right place to report that, thanks!

I've sent a patch to fix this:
https://lore.kernel.org/yocto-docs/20250526-fix-forgotten-macro-v1-1-1dad28=
6539de@bootlin.com/T/#u

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


