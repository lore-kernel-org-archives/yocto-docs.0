Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658DDC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:01:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.15936.1738166478373204724
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 08:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=feROXr04;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E6B1442E9;
	Wed, 29 Jan 2025 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738166476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3QZQLIvXhgN4VKNZpDmbB14i2IJdCArt+qHpofVgfw=;
	b=feROXr04+529sctrGN85J9GFN20JrscxbeC2Eshz3OGgkjeaRPcoIhW4UG25AgNOM3LFEE
	FmPHR4HTfgvozAP0HcPVo0to+BmseWunbb19dbGRAD8twuyUPHnt2G2xmJLvV0FEt+gu3C
	pWAT/a+fwP64/P7VqepBDPO9JkVAPaFalDgUMNBEbBZXmy8pfxjOGLawK3q1cHE7ShyJBm
	qng12H0wVzcvFZGAtoH+jYmCM1y/JMjZ+laZuCZhYUPgFX2V7ZTIpzH9i7XRsRfvAoVmcg
	X5jUReO+Lm+eqyTDp0C2MGUD0OZ3bTZfMMXiH82F7I88LzR0TvZCNERUxIg9uw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 17:01:15 +0100
Message-Id: <D7EOLBIP4NGZ.2873VJSZNHBXI@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] dev-manual/packages: add information about
 signing changes
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <zboszor@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250129141849.838672-1-zboszor@gmail.com>
In-Reply-To: <20250129141849.838672-1-zboszor@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehvdeuteegkeetgfejtdfhfffhjeduhfetudegffdvteejheffieetudfhheffkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepiigsohhsiihorhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgp
 dhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jan 2025 16:01:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6212

Hi Zolt=C3=A1n,

On Wed Jan 29, 2025 at 3:18 PM CET, Zoltan Boszormenyi via lists.yoctoproje=
ct.org wrote:
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  documentation/dev-manual/packages.rst | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-ma=
nual/packages.rst
> index 4ba2dcae3..dba07a2c6 100644
> --- a/documentation/dev-manual/packages.rst
> +++ b/documentation/dev-manual/packages.rst
> @@ -819,9 +819,19 @@ to use signed package feeds (repositories) when doin=
g a build.
>  Signing RPM Packages
>  --------------------
> =20
> -To enable signing RPM packages, you must set up the following
> -configurations in either your ``local.config`` or ``distro.config``
> -file::
> +To enable signing RPM packages, you must modify the RPM package

I would rephrase to

"""
you must modify the ``rpm`` recipe configuration to include...
"""

Because PACKAGECONFIG is a recipe-level variable, not a package-level varia=
ble.

> +configuration to include support for OpenPGP signing. That may
> +be done either in a recipe addendum called ``rpm_%.bbappend``:

This should end with :: for the code block below.

I would rather say

"""
in a ``.bbappend`` for the ``rpm`` recipe::
"""

Two reasons:

* ``.bbappend`` seems to be the most used way in the docs to denote a bbapp=
end
* I think it's best to avoid encouraging people to use % for bbappends

> +
> +   PACKAGECONFIG:append =3D " sequoia"
> +
> +or in either your ``local.config`` or ``distro.config`` file:

This should end with :: for the code block below.

Not your fault, but modifying local.conf is also something we try not to
encourage. And in any case, `local.config` is not a known conf file (local.=
conf
is).

So I would just say:

"""
...or in a :term:`Configuration File`::
"""

> +
> +   PACKAGECONFIG:append:pn-rpm-native =3D " sequoia"
> +   PACKAGECONFIG:append:pn-rpm =3D " sequoia"
> +
> +You must also set up the following configurations in either your
> +``local.config`` or ``distro.config`` file::

Same here as above.

>
>     # Inherit sign_rpm.bbclass to enable signing functionality
>     INHERIT +=3D " sign_rpm"

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

