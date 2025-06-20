Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8CEC7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 07:32:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.2412.1750404720173708160
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 00:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j2iIUyk0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41651442C9;
	Fri, 20 Jun 2025 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750404718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBSD9HAGsRb6BF5+LQD6st0W1vbuyZRYQf3CEAXTsc4=;
	b=j2iIUyk0mXZIGaw+bjaxrKycY3HruMPFqEGASjigJ3yqv2x/ITJZazfgFkkWnJwxVp4neM
	JFalxy1LXJanvI4ZH1JYGq6f8DCn4+iTDnX4c4DUwyN7XfZqoD77FTEKcAvoyoOkkyRqeH
	diPgHPYqAdKOM8+mGwB+7AFNZD5NgkqKgt+7bAlC70D//9iy58vEVnaWZDWRkEEEyHpwXE
	+YAzLeRZDK8VGNSY5th403fccLHS8V3Q9blY9wYcdt8bnKISjD4nfuaxHkTWGeVLWCGTaK
	fEAa6LhRy7vw6HPpy78Jbnhr601BmSgyJKO/R3rKN9XNLSHe+Yc3v1HjzsouwQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 09:31:57 +0200
Message-Id: <DAR6OQCYE0FP.25D9PH44TPXXK@bootlin.com>
To: <daniel.turull@ericsson.com>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v2] Add SPDX_INCLUDE_COMPILED_SOURCES documentation
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250619132257.2050864-1-daniel.turull@ericsson.com>
In-Reply-To: <20250619132257.2050864-1-daniel.turull@ericsson.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuedvieeukeelgeeufeeufeefieefudeivdevtdffffehueeltdfgkeekffehgfegnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepuggrnhhivghlrdhtuhhruhhllhesvghrihgtshhsohhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 07:32:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7113

On Thu Jun 19, 2025 at 3:22 PM CEST, daniel.turull wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Adding documentation for the new feature to store in SPDX
> only the compiled sources.
>
> Merged in oe-core: c6a2f1fca76fae4c3ea471a0c63d0b453beea968
>  - spdx: add option to include only compiled sources

Thanks a lot for clarifying!

Applying to master-next.

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


