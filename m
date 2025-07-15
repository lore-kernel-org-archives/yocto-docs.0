Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7E1C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 07:16:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.2127.1752563755098434975
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 00:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K2Bwm27e;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC69444322;
	Tue, 15 Jul 2025 07:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752563753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oeynf15Bz58Fnah2vRNyHvWZDMWWtoJN3YgaUsrCY5w=;
	b=K2Bwm27e3ZswZ+1jO1XM6oa/lmXvbjDxo2PxszkD+SyttNDGbBP45AlrtqrcvZCO5ylGoy
	YtI3lKMEXeuYxauFhfz8VJbxIyaavNo39E2HoPG2QXHfMGlSC+8or14giqu5WGAK52R5I+
	7eTWryp5QiOxakkCOAWV4UnFNKAzVlLUL8ilbnnGZ21IQPe5ZAtcxoqg9dT1uslxDtYshU
	XV75ox8J8fM3BP7FMkVoG+5YOFH9xaIAmylxrlkeq47z/ee2MZh+wt/TH7lHXK9u+8nZsj
	5lMvK09FRMWN6518Sc6cRQKRJmedv1ui8xlaVEj9kkToEAvKSYbxj9nODx+xOw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 09:15:52 +0200
Message-Id: <DBCG015N45KK.2VT9UL6HEKN12@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] poky.yaml.in: increase minimum RAM from 8 to 32
References: <20250711-increase-minimum-ram-v1-1-2287f499498a@bootlin.com>
 <5b095559-94b5-4f1b-b8ae-54d7acbca16a@gmail.com>
In-Reply-To: <5b095559-94b5-4f1b-b8ae-54d7acbca16a@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvufhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehgeeifeejtdettedtgeeuffefudefhedugeevtefhteeuieefffekleetiefhvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmpdihrghmlhdrihhnnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhro
 hhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 07:16:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7330

On Fri Jul 11, 2025 at 5:58 PM CEST, Khem Raj wrote:
>
>
> On 7/11/25 1:08 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> In the light of the recent LLVM addition, and other such heavier
>> recipes, increase the minimum RAM requirement from 8Gb to 32Gb.
>>=20
>
> I wonder if disk space requirements will need revising too.

Yes, I didn't mention here, but I'm running the builds locally to see how t=
hat
changed too.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


