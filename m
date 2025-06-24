Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B5DC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 11:39:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.6323.1750765145237272130
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 04:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iIHCzoLg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CF231FD33;
	Tue, 24 Jun 2025 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750765143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xismkZB53JRxApxluVHJCMuAKjdP9tuAJ/jURWSCpRY=;
	b=iIHCzoLg5ce3BKppIgXcibbxdTGTdjffe1lqIpEHwrCKwfHX3o237lYjJ761nli3xHKWp9
	Sn9eTgbu+rET2n+j2SEKaB6xGByM9iuvXgiPCvmIZbDm6ROQKWjraIuhj6wDoZZzXHtA2b
	fvlhX9TDXvqKZYqz3hkED+B/76chjHN5VpcRA0bLQheY007Jo+X1KJS5BvqST0pUAeTQdM
	3mDY4onpZplDruEhmvRX2dWpq/kr+Z/zOfaWCeWzlKxtYjvEo/OmxlDpN4ZtYOES//g9Me
	wQOS0QWnOLOQOaOlbeF6tWdOE7YFyPwY53e7ZraYjesv//CiMfYyAvx7IeY94g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 13:39:02 +0200
Message-Id: <DAUQG382TCUR.1S6L7F61P1ZOX@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH 1/2] ref-manual/variables.rst: document
 BB_GIT_DEFAULT_DESTSUFFIX
Cc: <docs@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
References: <20250624-migration-5-3-unpackdir-v1-0-ef6ef00d5cbc@bootlin.com>
 <20250624-migration-5-3-unpackdir-v1-1-ef6ef00d5cbc@bootlin.com>
 <CANNYZj_qqSfRq=CSMCY+rgKxA8vRA_M=sN-YzHzm3CHS_K_Bfw@mail.gmail.com>
In-Reply-To: <CANNYZj_qqSfRq=CSMCY+rgKxA8vRA_M=sN-YzHzm3CHS_K_Bfw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffuvehfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejveeuvedvieeuhfefleduvdfgvefhudekleehkeevhfegtedujedtvedukeetjeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtt
 hdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 11:39:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7210

On Tue Jun 24, 2025 at 12:10 PM CEST, Alexander Kanavin wrote:
> On Tue, 24 Jun 2025 at 11:55, Antonin Godard via
> lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>> +   :term:`BB_GIT_DEFAULT_DESTSUFFIX`
>> +      See :term:`bitbake:BB_GENERATE_SHALLOW_TARBALLS` in the BitBake m=
anual.
>
> Incorrect copy-paste.

Ha, well spotted thanks.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


