Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CEFC7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:57:36 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.3439.1750751847469833611
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gk1f5V4R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FEBA4432F;
	Tue, 24 Jun 2025 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750751845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0PraD8QFL46sgDTLypLTNbnaltdgHVAcpTRH+yph4Jo=;
	b=Gk1f5V4RUFVzjE73Thl+ET8l4eTSuYfhDWA/56JfUr4UCOS3Cq4an5jEdyVU52NNhgnS3B
	L8x2qvW68xlUS44sCtdpjDdF1XdjZm60+EUtro5Mqi9a4yLZe8a8l6QnuhaO8MTosB4ylS
	+Jei5pjBJXQBHHH+2Pr6OxK08FVNW2+R3IfFpyBAhx+c6FICEM51CUA7ktxcpKhv3d394s
	IKhQIx24liPmCZ70wbjU2mPDNbl5iNUqU+XPp1obq4NwxUFAOKnemUry21fRB5t6NRgNbK
	1voUfcDNzDSIq1SJkV2qnuApdPXSiV2j16OFQfzF5aYfAA5A2oeJ69iAepf5fg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 09:57:24 +0200
Message-Id: <DAULQE8WNN68.2YBA6IQ3BBCO1@bootlin.com>
Subject: Re: [docs] should replicating offline build use "--runonly" or
 "--runall"?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <184B5224024A6359.12316@lists.yoctoproject.org>
 <92dee52f-385b-9134-1364-c1f6e673b37a@crashcourse.ca>
In-Reply-To: <92dee52f-385b-9134-1364-c1f6e673b37a@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdro
 hhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:57:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7187

On Sun Jun 22, 2025 at 4:45 PM CEST, Robert P. J. Day wrote:
> On Sun, 22 Jun 2025, Robert P. J. Day wrote:
>
>>
>>   this section:
>>
>> https://docs.yoctoproject.org/dev-manual/building.html#replicating-a-bui=
ld-offline
>>
>> advises to fetch the sources with:
>>
>>   $ bitbake target --runonly=3Dfetch
>>
>> for the longest time now, i've used:
>>
>>   $ bitbake target --runall=3Dfetch
>>
>> although i do recall that those behaviours changed once upon a time.
>> so is that still the appropriate command to use? is it worth adding an
>> explanation at that point as to the difference for people who might be
>> curious?
>
>   as a followup, this section:
>
> https://docs.yoctoproject.org/dev-manual/efficiently-fetching-sources.htm=
l
>
> refers only to "--runall=3Dfetch". so it seems inconsistent with the
> earlier section. or, at the very least, it has the potential for
> confusion.

Yes, I also --runall should be used. I'd take a patch.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


