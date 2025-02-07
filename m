Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51124C02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:26:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.65413.1738920379024222408
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rn2JAOIV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 053C0431F3;
	Fri,  7 Feb 2025 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738920377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=te4zp1Kqh4VwJMTsn0w0RjehSYeveymFEFGPYCfBy00=;
	b=Rn2JAOIVHt8n/vkv/8ZL//mML8hk8qm6LVva7vBruQ9AU9yrWG92B08016K+sNQFQWtNFp
	T6sX3xoYNfS3pm4EZ9e9Alrk/CFT6kBefmpjYA6bh64k9QkqCC0/qJwLpH2Yv1zCjf+vAk
	e3tqhx/vZhCyeo4nRc6eFNPQkqVDSRzfBxEM0kd+a+ApkrqzQ+UgbTP4R3yBdBs6lIO9De
	WTZtznUfbGz+FBTNuv9msouewYsJvsaxmT4wWun8CFoeG1xdZwsjc+qqrN2SNnFJAda4e5
	hDP8tdBr+0lbWMUFxZLbixSlpPtIkkZEYDQ1oyCyMHCcIPAC0OxAJms85R3GYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:26:16 +0100
Message-Id: <D7M3TSUJOIGB.2BRVP84IG8GLH@bootlin.com>
Subject: Re: [docs] [PATCH v2 1/3] ref-manual/variables: document
 OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Cc: "Guillaume Swaenepoel" <guillaume.swaenepoel@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yoann.congal@smile.fr>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250206215711.154194-1-yoann.congal@smile.fr>
In-Reply-To: <20250206215711.154194-1-yoann.congal@smile.fr>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffehueelteefhfdvtddtffevffejvdegkeeiudfhueetheefgeegkeegieeliefhnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdprhgvphhrohguuhgtihgslhgvrdhphidpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohepughotghssehli
 hhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehguhhilhhlrghumhgvrdhsfigrvghnvghpohgvlhesshhmihhlvgdrfhhr
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:26:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6285

Hi Yoann,

On Thu Feb 6, 2025 at 10:57 PM CET, Yoann Congal via lists.yoctoproject.org=
 wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> This documents the variable used in the "automate testing a single
> recipe's reproducibility" feature [YOCTO #15701]
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> ---
>  documentation/ref-manual/variables.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 47d4e814f..32e91b6db 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5802,6 +5802,11 @@ system and gives an overview of their function and=
 contents.
>        For additional information on how this variable is used, see the
>        initialization script.
> =20
> +   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
> +      Set build target for build reproducibility testing but activate
> +      :ref:`shared state <overview-manual/concepts:shared state cache>` =
build
> +      for most dependencies. See :doc:`/test-manual/reproducible-builds`=
.
> +
>     :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
>        Set the package manager(s) for build reproducibility testing.
>        See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest=
/cases/reproducible.py>`

This is nice to see :)

My suggestion on top of Quentin's: you can add this to
documentation/migration-guides/release-notes-5.2.rst's "New variables:" bul=
let
list.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

