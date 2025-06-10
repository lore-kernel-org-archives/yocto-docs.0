Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5599C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:31:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.90288.1749569501109209333
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 08:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E14F6qAn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23DC81FD36;
	Tue, 10 Jun 2025 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749569499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RReNbweVhhTnPAxLJ7nlY2UkyoSYQ9HKbLvc/l2rgOw=;
	b=E14F6qAnS58vlJC/rNLGlGuriIyHxfbR6FfCWPpQnL8CUYKgf+HWzry9dknaRCJEYNW0U8
	lK7iaqJC7Ix8fVXkm2uIEWcOTFyce02bufXpFerABRUQU53ZQO9KV0N73bTZ1lpxDthcna
	mLgc1Gi73dgxHYZHQGvBWayxZZiZ1l43ZwOxuHXmiNImrjUyKB8mywcV/wdQiZ4h6DI5CN
	N6cHE4J/+G73TTcoZSWbNkDimrSDGbnvRkw6wkQkFGCtTHyo346KRSbQthhGIzCh+MEGnx
	KE7lC4NsqTS6mqXr4uGVBMqFCogZVcPKkcMjsWnr/R6jjOr6ae84cBkXAtV02A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 17:31:38 +0200
Message-Id: <DAIYMJTVXDR1.TL3CNDVDAHHL@bootlin.com>
Subject: Re: [PATCHv2] test-manual/ptest: Add info about fail state of
 ptest-runner/ptests
Cc: <erik.schumacher@iris-sensing.com>, <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Anibal Limon" <anibal@limonsoftware.com>, <docs@lists.yoctoproject.org>
References: <20250610015125.4276-1-anibal@limonsoftware.com>
In-Reply-To: <20250610015125.4276-1-anibal@limonsoftware.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfekieeufeeiveekkeevjeetveelkeejiefgfeeihfeghfeghfduvdejuddvvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnihgsrghlsehlihhmohhnshhofhhtfigrrhgvrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjv
 ggtthdrohhrghdprhgtphhtthhopegvrhhikhdrshgthhhumhgrtghhvghrsehirhhishdqshgvnhhsihhnghdrtghomhdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhr
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 15:31:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7054

On Tue Jun 10, 2025 at 3:51 AM CEST, Anibal Limon wrote:
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
> index 2c021af51..d01735c08 100644
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
> +During the execution ``ptest-runner`` keeps counter of failed ``ptests``
> +and use it as exit value, failing the execution if any of the ``run-ptes=
t``
> +scripts fails.
> +
> +Consequently, you might want to add this package to your image.
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
> +   :term:`SRC_URI`. Be sure your ``run-ptest`` exit with 0 to mark it

I think Yoann suggested that the run-ptest script should return 1 in case o=
f
failure. Can you also mention that? We need to be clear that the run-ptest
script must return a static code and not any non-zero code, as it could cla=
sh
with ptest-runner's own exit code (e.g. 127), if I understood correctly.

> +   as succesfully executed.

s/succesfully/sucessfully/

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


