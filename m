Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055F2C87FD3
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 06:58:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12353.1754290698565497156
 for <docs@lists.yoctoproject.org>;
 Sun, 03 Aug 2025 23:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oUee6aNg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E7D9443DD;
	Mon,  4 Aug 2025 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754290696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nz5xmfNRleC96DQqouRa9g9dpbdVFYjsLeTILj+TO60=;
	b=oUee6aNgNJRNvi36qLKmUoVBb7o3SZQXde2S04pUlopkOBRwreoqpAJuoswU5M9ghA7FkW
	xgsGwIt1CtPlsw+MucVBLHkS/bj+9QSn3YqH33KMktG9u49UF+rzREFyhU++kIand8BBwL
	eLNvQeBbt/69N5HBd3Q5SucnApJVYUw3WQWLAxlwfF2khWuOTyizSd/RAy8J3vLvVD+B3P
	J40v8ZilLsB45o4VQvI9ot8kHfJ25H3BzO/OTnbAA48ueNKb3+SftVWD7CK84eo4uXw17c
	irsYIwaXdfEE1lBzfkuLzlp/WtrYj+7MWXrXge6prP2Is5A7hjdGXqflcv9xAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 08:58:16 +0200
Message-Id: <DBTG5G28RM7K.1L0XGVRA8XDS1@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 3/3] ref-manual: gather all QA checks in
 qa-checks.rst
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com>
 <20250723-refactor-qa-checks-v1-3-3a72c751ba83@bootlin.com>
 <f569c5e8-30b5-4f46-8952-02b9eecc1d97@cherry.de>
In-Reply-To: <f569c5e8-30b5-4f46-8952-02b9eecc1d97@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtuefhudfggeefjeeukeeitedtkeevffduteeuffeltddvfedtjeehudfgleefnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhoj
 hgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Aug 2025 06:58:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7431

On Fri Aug 1, 2025 at 12:50 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 7/23/25 4:27 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> There was duplication between qa-checks.rst and the doc for the insane
>> class, so move all of the QA checks in this qa-checks.rst. Remove the
>> documentation for these checks from classes.rst and link to the
>> qa-checks.rst document from there.
>>=20
>> For QA checks that were only documented only in classes.rst, add them to
>> qa-checks.rst.
>>=20
>> Also sort qa-checks by their names in qa-checks.rst.
>>=20
>
> This makes it difficult to review, it'd be nicer to do this step by=20
> step, e.g.:
>
> - sort qa-checks.rst
> - moving duplicates from the insane bbclass documentation to the=20
> qa-checks.rst and link to qa-checks.rst instead in the bbclass documentat=
ion
>
> maybe that'll help make the diff a bit easier to navigate?

I agree, sorry, that could have been split.
>
> I've limited access to network today, and I tried to apply your mails=20
> exported as eml from Thunderbird with git am but this one fails to apply=
=20
> on top of master (f9f1c87424d307d2df60024bc448bd6778605cf8) maybe my=20
> local master is outdated? Does  it apply cleanly for you?

This is part of master now :/ Though if you have any comments of the qa-che=
cks
file itself, feel free to send me an email.

I did not add any new doc with this series though, I've only added the line
printed on the console for checks that were _only_ part of classes.rst.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


