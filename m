Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A299C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 06:41:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.10022.1749019264801862154
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 23:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=haeXqgkT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74CD043B3C;
	Wed,  4 Jun 2025 06:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749019262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8B9QrucWM8VQu8nQ38Sr+9C7VwscMGaLVs+tHxIf+rs=;
	b=haeXqgkTnpKtAHPSk3wJcvBBGyisiuStUpzp2Ms4lJgWl9TILec01T/SomOo4Y13VG/JA+
	/3I51X7o0pGziSTN1pmcnDNDrLtvE008AoTAP3hpXu1ov+R/W40OmcPOUgbefSIVpWPPp7
	1GoGhLRPdN2mD5xo2lJgktgGtiRTgH3AOyWswmyA4xGClHeRdsqKgJzyzxNW2C2jY7B2GT
	jygS/PX6oGHcaTld0mtVzm8sedUcHhV/hrcF7bgnWUaV1L/GeZYmBXhU3soX6SZWtdi/9L
	AbMhH4eh2+TQ5t7NxBqtTJhaIJHu7Fq/fYpIStEbOgmRnxKttpw002gwyHouJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 08:41:00 +0200
Message-Id: <DADJKZSNOZJS.20JS57425LP0W@bootlin.com>
Subject: Re: [docs] [yocto-docs][scarthgap] brief-yoctoprojectqs/ref-manual:
 Switch to new CDN
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Steve Sakoman" <steve@sakoman.com>, <docs@lists.yoctoproject.org>
References: <cover.1748640673.git.steve@sakoman.com>
 <b24ba407835b0fd7ea70d16fb28d3e69477e46db.1748640673.git.steve@sakoman.com>
In-Reply-To: <b24ba407835b0fd7ea70d16fb28d3e69477e46db.1748640673.git.steve@sakoman.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgfetkeeuiefhffeugeejuedutddtveeugfejhfdtiedvuedvheegffekveetfeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehsthgvvhgvsehsrghkohhmrghnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Jun 2025 06:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6994

Hi Steve,

I will go ahead and also apply this for kirkstone, the branch also contains=
 the
old urls.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


