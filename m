Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037E6C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 08:15:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.28904.1749197720364028163
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 01:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jiuhToX9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ED2843148;
	Fri,  6 Jun 2025 08:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749197718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74J0SXawRPLcSjS5EUGTld+5ftI1B8VQizg5f9/UYKA=;
	b=jiuhToX9roj3eUOVLoFAirLFNkL/XViCFQ72QDBD3fBfVMG3w9qwmF9tndIhtdqAZdoZjo
	zlpE23d3Z5dOmF125Wxo43ZvDNsIP6Aw0Rm+rdRlPlhlwu1LD1yvfumCLyNkitC8h+A+7S
	MgVeT9W62ijs4CiZ17/0sP7YZ6ibOP1DjF8wA5wAJpxu4MFI9sdNxBW/3ooBGhLQd/Kr9n
	pjZzLQkjc/EV7olllZ069Ah9eJGP7ke3n9tH2chDA3MplZgXU8rZG7kokI7suufyglmIGJ
	jmUNYfcXZNnZoxCUKw1r3mt2T3/AhFGXIhja6uCMWrD7UXRrhz3dG2ubXzxpTw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 10:15:17 +0200
Message-Id: <DAFAUA12ZP8C.1MM959Z1Y0232@bootlin.com>
Subject: Re: [docs] [PATCH 1/1] ref-manual: document KERNEL_SPLIT_MODULES
 variable
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <dixitparmar19@gmail.com>,
 <docs@lists.yoctoproject.org>
References: <20250605140314.369551-1-dixitparmar19@gmail.com>
 <f546a7c2-5033-40f1-b47d-c519646c7026@cherry.de>
In-Reply-To: <f546a7c2-5033-40f1-b47d-c519646c7026@cherry.de>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 08:15:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7013

On Thu Jun 5, 2025 at 4:26 PM CEST, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Dixit,
>
> Thanks for the patch!
>
> Please wait a bit (a day at least) between versions to let other people=
=20
> the time to review, otherwise it'll be difficult to keep up with what=20
> the latest version is and what we should review :)
>
> On that topic, this is missing the version number (you typically add it=
=20
> with -v2 when using git-format-patch or git-send-email if I remember=20
> correctly).

Also, you can read https://docs.yoctoproject.org/contributor-guide/submit-c=
hanges.html
which goes over the process of contributing patches.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


