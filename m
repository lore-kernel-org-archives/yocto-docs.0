Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE4AC021B3
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 10:45:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.86684.1740393898751764242
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 02:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MaVfMMb6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C14AD433F7;
	Mon, 24 Feb 2025 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740393897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gWHrd9ArLLBCKzwU7Hk7oE1gb8riFYJqkjqKipCoGs=;
	b=MaVfMMb6rpM9Vg7LmaYQdts6WDXgwNlE8mLevn70dGokzW0nPNtY36q2yadsSmK1usA8pt
	vWQe5pctBpGdbi6WgwxMVF7tUkESlqOvD4IN4APcBLNH/tZbragIh3NN2zBgUV3NNuR6CC
	jkbYmje1huSea09Nthe5vQIorXyiArLsXLdXp/c7Ivm6Vi+8oz3GXgNTf0OPRr9rejfuaT
	lmDHHLv8EQfVu/NRkOnroFjJKbyIMteIpMCMw398LmCazHaMyFsvlHZ6+/qidBx+8fIr72
	8dG/LU/QH5wJLE5KEgUzbAScm2ALOEKRw9qYiGoaHS44BLge5iYFZTublGuExQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 11:44:56 +0100
Message-Id: <D80M5AHQKMZ7.33540OEYICE9G@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 4/6] overview-manual: convert
 analysis-for-package-splitting.png to svg
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-4-75d23b5e7a88@bootlin.com>
 <c11747fe-fdd1-40f5-943f-a8e999573e6e@cherry.de>
In-Reply-To: <c11747fe-fdd1-40f5-943f-a8e999573e6e@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheetgeejiefgjeetveehfeduhefggfejjeejhefhkeehtddufffhtddtkeeihfffnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhoj
 hgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 10:45:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6438

Hi Quentin,

On Thu Feb 20, 2025 at 5:18 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/18/25 10:11 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Convert the png file to an SVG file, and add the UNPACKDIR reference.
>>=20
>
> Not only that, it seems:
>
> - -${PR} suffix is gone from ${PV}-${PR}

I should have mentioned that in the commit message, but forgot.

  $ bitbake-getvar WORKDIR
  # $WORKDIR [2 operations]
  #   set /build/../work/openembedded-core/meta/conf/bitbake.conf:409
  #     "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
  ...
  # pre-expansion value:
  #   "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"

See cc83e4548465 ("bitbake.conf: Drop PE and PR from WORKDIR and STAMP") on
OE-core.

> - ${BPN}-${PV} has become ${BP}

Because BP =3D ${BPN}-${PV}, and I think we better stick to the correct
definitions:

  $ bitbake-getvar S
  # $S [2 operations]
  #   set /build/../work/openembedded-core/meta/conf/bitbake.conf:413
  #     "${WORKDIR}/${BP}"
  ...
  # pre-expansion value:
  #   "${WORKDIR}/${BP}"


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

