Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A97C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:22:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.32828.1744287761403824646
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Apr 2025 05:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GGAL+OQ/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65CE5444D8;
	Thu, 10 Apr 2025 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744287759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcBIASqE4lL0FTjZNGvzvWol5B/BayYpJ7vGBOZyo4M=;
	b=GGAL+OQ/16mIwu9AKg2Ti9JGL+AoclLXZBOPNUk1lL6CB7djG2N74UtleBovXwqbQUT9ji
	gKpIsyOBYbbkJ58ouTaW2DN7kDYawHw0iUsPAKHL1OlUQsEVmhXWZOvqDWwLIs0rFRGJ3D
	+sHautfTJ6gV90dDoE/H89hybWBA5SAk8TWzLtgL7cn7eEFHidEcdCvD1YLxs3T91FPk89
	UAnRjhLJ45A26VCbBJ67VOhGhTDcDahAhVNNMjoNyWE31rS4EQla+qpLmlrRN9UzJL81zv
	fium+a6K5mzJ5kYbs2LAhI3AJh7lIdyweZRY0w0M7zvSEmJYm6vDfa2P2zOTNQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Apr 2025 14:22:39 +0200
Message-Id: <D92YEM8R321R.27O1ZFHCK188Q@bootlin.com>
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: encourage
 patch version changelogs
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250318035605.1221-1-twoerner@gmail.com>
In-Reply-To: <20250318035605.1221-1-twoerner@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtkeekfffffeehtedttedtueegvddvleefffektefgtdeiudekheduhffhledtveenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Apr 2025 12:22:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6724

Hi Trevor,

On Tue Mar 18, 2025 at 4:56 AM CET, Trevor Woerner via lists.yoctoproject.o=
rg wrote:
> Add a section after the 'git format-patch' information encouraging develo=
pers
> to add patch version changelogs to their patch updates.
[...]

Do you plan on sending a new version of this patch? :)
(Did I not receive it?)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

