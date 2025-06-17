Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6996AC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 12:20:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.17195.1750162807583138666
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 05:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bH21n2GW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D0CE439C5;
	Tue, 17 Jun 2025 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750162805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2JxRUwYPvc9kMfrgPNPpH30aFDMsAvp3/esI677lnc=;
	b=bH21n2GWNBGmjQL5DsY32TfLSapLSIPFKRiT4cU9AAiqsQnvmbOwxce9z2B1qL9LmdeZBJ
	9P7/ZlSIO1ktCJA+cRiDUheyDMO+Qs3JY0K9Dv57fzHLzuCr2sN3xCc5u+aqX8B3Xzd3Aw
	x1qnEvXM05rfhmJxwruxngKUCg12ixOOhdgWrw5LTk40znEbtHF3YFgwF22CqxD6fFhgJI
	F9Mafe2gz+eol0i0U0UqM/CbeWmEglUoQGK9d/5CF2J0w8H44K/2AygPDhnGrpphK3s8fR
	+fFGYyqzqrUYEDRj0tUTcgo0C6/zHYeVR4aKL2EeVLcwHrt3ysrV+pGbkcHzqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 14:20:03 +0200
Message-Id: <DAOSXOJWO5XZ.NNSHYLHQQ40T@bootlin.com>
Subject: Re: [PATCHv4] test-manual/ptest: Add info about fail state of
 ptest-runner/ptests
Cc: <erik.schumacher@iris-sensing.com>, <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Anibal Limon" <anibal@limonsoftware.com>, <docs@lists.yoctoproject.org>
References: <20250611184034.566623-1-anibal@limonsoftware.com>
In-Reply-To: <20250611184034.566623-1-anibal@limonsoftware.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfekieeufeeiveekkeevjeetveelkeejiefgfeeihfeghfeghfduvdejuddvvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnihgsrghlsehlihhmohhnshhofhhtfigrrhgvrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtt
 hdrohhrghdprhgtphhtthhopegvrhhikhdrshgthhhumhgrtghhvghrsehirhhishdqshgvnhhsihhnghdrtghomhdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhr
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 12:20:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7083

Hi,

On Wed Jun 11, 2025 at 8:40 PM CEST, Anibal Limon wrote:
> On the ML was pointed about no specific information about
> ptest-runner/ptests so improve docs around.
>
> https://lists.yoctoproject.org/g/yocto-patches/message/1622
>
> [YOCTO #15832]
>
> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> ---
>  documentation/test-manual/ptest.rst | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/test-manual/ptest.rst b/documentation/test-man=
ual/ptest.rst
> index 2c021af51..9442387f7 100644
> --- a/documentation/test-manual/ptest.rst
> +++ b/documentation/test-manual/ptest.rst
> @@ -46,13 +46,19 @@ Running ptest
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  The ``ptest-runner`` package installs a shell script that loops through
> -all installed ptest test suites and runs them in sequence. Consequently,
> -you might want to add this package to your image.
> +all installed ptest test suites and runs them in sequence.
> +
> +During the execution ``ptest-runner`` keeps counter of total and failed

s/keeps counter of/keeps count of/

> +``ptests``, At end the execution summary is written to the console. If

Should be a "." not "," after ``ptests``.

> +any of the ``run-ptest`` fails returns '1'.

Missing a word?

s/``run-ptest`` fails returns '1'/``run-ptest``, ``ptest-runner`` returns '=
1'/

> +
> +Consequently, you might want to add this package to your image.

I would suggest:

"Consequently, you might want to add ``ptest-runner`` to your image."

So users know they can add the package "ptest-runner" in IMAGE_INSTALL dire=
ctly.

> +
> =20
>  Getting Your Package Ready
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =20
> -In order to enable a recipe to run installed ptests on target hardware,
> +In order to enable a recipe to run installed ``ptests`` on target hardwa=
re,
>  you need to prepare the recipes that build the packages you want to
>  test. Here is what you have to do for each recipe:
> =20
> @@ -77,8 +83,9 @@ test. Here is what you have to do for each recipe:
> =20
>  -  *Create run-ptest:* This script starts your test. Locate the
>     script where you will refer to it using
> -   :term:`SRC_URI`. Here is an
> -   example that starts a test for ``dbus``::
> +   :term:`SRC_URI`. Be sure ``run-ptest`` exit with 0 to mark it

s/exit/exits/

> +   as sucessfully executed otherwise will be marked as fail.

Sorry, I corrected your typo with a typo the first time. It's actually:

s/sucessfully/successfully/

> +   Here is an example that starts a test for ``dbus``::
> =20
>        #!/bin/sh
>        cd test

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


