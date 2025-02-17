Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBF7C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 09:00:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.47125.1739782828530885231
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 01:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Kobb0bpa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FF5F441EF;
	Mon, 17 Feb 2025 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739782826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrCztDvVB6/SMKEI2oDrYC//v3BE91CX3Dw5mu9BYRc=;
	b=Kobb0bpaNNWLcmJB//yaR5myUnQcTkLVBqjNRwhJAXAwd6GMLd7r+ihMUXNyfD4VSZhCSD
	EgC0RJBiHU8Q9V/riFG4eRll6BKkL8IJj66Y4vkZFjVfDx9fbZQlhZFeOHNP5IOLXw/hfa
	zm8q7kuX+sgdAqa98IYdxgaKGefSEL27LOQ2tAG7sUUTVth22WxmtPWZBDknhT0LZqIRBA
	VS2UNxLtCJUKrhAtOTVeAgCdkaV6So+b12Qjs0b7q5gLyzpqjRzYlg9K7pjvoTH5Z+SDW0
	Q8KGDolDCnje3f1045ByLhxIgXPidvCEQi0X9k8e49JzZP8yb1JtNlco6Jkf/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Feb 2025 10:00:26 +0100
Message-Id: <D7ULJGLDCLNM.2F5SN59SUVGYR@bootlin.com>
Subject: Re: [PATCH v3 0/2] Document the PACKAGE_KEEP_DEBUG_FRAME variable
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mathieu Othacehe" <othacehe@gnu.org>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250211161239.5396-1-othacehe@gnu.org>
In-Reply-To: <20250211161239.5396-1-othacehe@gnu.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehjeeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtkeekfffffeehtedttedtueegvddvleefffektefgtdeiudekheduhffhledtveenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepohhthhgrtggvhhgvsehgnhhurdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 09:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6372

Hi Mathieu,

On Tue Feb 11, 2025 at 5:12 PM CET, Mathieu Othacehe wrote:
> Hello,
>
> That series is introducing a PACKAGE_KEEP_DEBUG_FRAME variable that can b=
e
> used to keep the .debug_frame ELF section when stripping packages.
>
> It is then building upon that to present how to get human-readable backtr=
aces
> on target, possibly also relying on the minidebuginfo mechanism.
>
> Thanks,
>
> Mathieu
>
> v2: https://lists.yoctoproject.org/g/docs/message/6252
> poky: https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D1044=
8200b63bdc45b39504ebcddd85b5f274f0c4

This link does not work for me. Could you give me a new link with your
commits, on master? I couldn't find them.

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

