Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CACC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 13:34:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13286.1747402490909946371
 for <docs@lists.yoctoproject.org>;
 Fri, 16 May 2025 06:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hkGufrth;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59E0F4399F;
	Fri, 16 May 2025 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747402488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5yPfaQ8oUBU0swwxj4JlnABFwYrPaW7b7yGWhGr4tDo=;
	b=hkGufrthRv3YoRKbx3Op1kBh7X5SqyE/epwUmAgwKjf7nK70tYTzBpBmtvPKo5RHR72ZAk
	K5LxgPUW9LUIVtvLSOmnMRLkN0Jr31jN6VZLHczQhCFpjiFRtrsiDm2EJ+1wJ9OfkZIdEK
	F1BSbBDIaTxAfWa45PRe0i8k0GhyFpH+q0R4pKh1nIiA38L9SBjhDiuy2NM5s54kn/+7OX
	2tgL1MkBck1b+GvuVQQZXfpZDeUf8UPWMaJAeOO0d81cOtPDpqnBx5NFb04FuGY93OVNua
	epDgSfHefun7SnccC9H9DCbA7u11xu1IGO1O+mAm7z5qx4MalwrNVkrGAz2MMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 15:34:47 +0200
Message-Id: <D9XMHGUYVHEO.2441JUQBMZPZ4@bootlin.com>
Subject: Re: [docs] [PATCH] sphinx-lint: various fixes
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Trevor Woerner" <twoerner@gmail.com>
References: <20250506180301.32610-1-twoerner@gmail.com>
 <d7d0d319-581a-486b-bffb-7ddf0f771d9b@cherry.de>
 <20250512210330.GB25174@localhost> <D9UVUL1RJXK9.HT6YMHKRHD36@bootlin.com>
 <20250513131605.GB31516@localhost>
In-Reply-To: <20250513131605.GB31516@localhost>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffgkeeiueefieevkeekveejteevleekjeeigfefiefhgefhgefhuddvjeduvddvnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtfihovghrnhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtp
 hhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 May 2025 13:34:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6828

Hi,

On Tue May 13, 2025 at 3:16 PM CEST, Trevor Woerner wrote:
> On Tue 2025-05-13 @ 10:17:05 AM, Antonin Godard wrote:
>> On Mon May 12, 2025 at 11:03 PM CEST, Trevor Woerner via lists.yoctoproj=
ect.org wrote:
>> > On Mon 2025-05-12 @ 09:50:07 AM, Quentin Schulz wrote:
>> >> Hi Trevor,
>> >>=20
>> >> On 5/6/25 8:03 PM, Trevor Woerner via lists.yoctoproject.org wrote:
>> >> > A 'make sphinx-lint' pass found the following issues:
>> >> > 	trailing-whitespace
>> >> > 	missing-space-after-literal
>> >> > 	role-with-double-backticks
>> >> > 	missing-space-before-role (role missing opening tag colon)
>> >> >=20
>> >>=20
>> >> I'll let Antonin confirm but I assume it would be a good idea to have
>> >> separate commits so we could easily backport them to earlier releases=
? Or
>> >> maybe you/someone can run sphinx-lint on older releases and send patc=
hes for
>> >> those too?
>> >
>> > okay, waiting on Antonin
>>=20
>> Ultimately the best approach would be to run sphinx-lint on each branch,=
 because
>> we might miss some lint warnings by simply backporting this patch.
>>=20
>> Do you want to take care of it?
>
> Sure. In addition to master assume you want:
> - kirkstone
> - scarthgap
> - walnascar

Yes, that's exactly those, thanks.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


