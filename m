Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3F5C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:10:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.84363.1749553828664966844
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 04:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BYRA/J9p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFC94433B6;
	Tue, 10 Jun 2025 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749553827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q2nODk4OZKrQ5uXZjv9+clEla6girgXwaGzhtbIKqA=;
	b=BYRA/J9pVzdXuzZxabPrn6sWSlws+i3DfP9dz2MFZ9wNUETOVe0ohBrWqgXSa2uXhVjHmq
	e+u4vcpy9NmwXauUQobRGntHilX7yiq6VjR9Jw/wp8ogC/JzNEBC1boPAG60RaVV0xPbnK
	aes1amq25bCWJwVWYKYHAfEeVTL0+1bUez8sFT2D80GnY6/lo7213Qg5gGkNJaOim2g9h9
	ZdnNBz7wuTk1YR9lSqKlzt03WD5Hl7CHn0kkQLajBk05BoUo6F9jUgOVm0Bx17duzr51du
	Bu8KLHBYuK3DzdUVSBn5JBlkdJyEyyNVKRMcCfIZ9j9pfD3GfhsedtUr+PNqAg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 13:10:26 +0200
Message-Id: <DAIT2K0K3LCH.1WT45FSKPZOM3@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: classes: add recipe-naming QA test
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <ross.burton@arm.com>, <docs@lists.yoctoproject.org>
References: <20250610101926.2235143-1-ross.burton@arm.com>
In-Reply-To: <20250610101926.2235143-1-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedttddugffgledvjeeihfegvedvuddtgeeggeejfffhtdektddvieeugfevtdeuudenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 11:10:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7047

On Tue Jun 10, 2025 at 12:19 PM CEST, Ross Burton via lists.yoctoproject.or=
g wrote:
> Add documentation for the new recipe-naming recipe QA test.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/ref-manual/classes.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 54a98bf24f3..9be1c2c587c 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1591,6 +1591,10 @@ The tests you can list with the :term:`WARN_QA` an=
d
>     For example, assignments such as ``FILES:${PN} =3D "xyz"`` effectivel=
y
>     turn into ``FILES =3D "xyz"``.
> =20
> +-  ``recipe-naming:`` Checks that the recipe name and recipe class match=
, so

> +   inherit :term:`nativesdk`.

:term: are not defined for those, but :ref:`ref-classes-native` and
:ref:`ref-classes-nativesdk` are.

Maybe also say that BBCLASSEXTEND should be set appropriately, so users
encountering the issue know what to do?

> +
>  -  ``rpaths:`` Checks for rpaths in the binaries that contain build
>     system paths such as :term:`TMPDIR`. If this test fails, bad ``-rpath=
``
>     options are being passed to the linker commands and your binaries

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


