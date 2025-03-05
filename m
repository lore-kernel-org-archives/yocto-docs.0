Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64177C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 08:34:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.9141.1741163633219427048
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 00:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cfrHd9SK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE3F044316;
	Wed,  5 Mar 2025 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741163631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zvRPXrzKexfMsq05WbEmVvEJn2b25sictE03HXrYwp0=;
	b=cfrHd9SKY5H3RGrA2nNyM017QFxaOVbB/2rp6ke++L7lDm10dkD/OLnrWsx0XMaLOucesu
	sFltgwyYny6SGEkgNohdX2jd3z2M5RvgTOZ3QwJX/8WBYlF4qGJEHIrEytG1MG4YXeeLA5
	HzBYNEQ6md6Pftkt4uaCBCM2EzWmSThFCrG0r0uOY7EjfT55e0x9YWDbktoZc3wCK4Z1Jw
	6rXnyTxlQ7Uo+w/AFJVbjg5tVpy8kaQbMhhr74QkFLhQAQECTVQNNvPmvSTsk+g4l8/9L9
	aN96yLtwx0FRBBdkvKfFspYdTrVgCDaOCzfbzzP5vFRHDEqBx2FqARbfXaWfeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Mar 2025 09:33:50 +0100
Message-Id: <D886ZTDWTHA6.2HDNFFQX60J6B@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/variables: document KMETA* and
 KCONF_AUDIT* variables
Cc: "Bruce Ashfield" <bruce.ashfield@gmail.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250225-kmeta-audit-vars-v1-1-d39d3e253b00@bootlin.com>
 <423ecc6e-841b-4edf-9824-debea1db5fa0@cherry.de>
In-Reply-To: <423ecc6e-841b-4edf-9824-debea1db5fa0@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdegfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffveejtedvudekfffgjeffkedtveeggfefvdfgffffjeeugfekhefhleefvdfgieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheps
 ghruhgtvgdrrghshhhfihgvlhgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Mar 2025 08:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6498

Hi Quentin,

On Mon Mar 3, 2025 at 5:40 PM CET, Quentin Schulz wrote:
[...]
> Aside from this, not too familiar with the code and won't have time to=20
> dig into it, so don't wait for further review from me :)

Thanks a lot for the review! I'll send a v2 soon.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

