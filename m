Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA95C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 09:43:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.4816.1741686226737651863
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 02:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bEyrEcNh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A71B2432FC;
	Tue, 11 Mar 2025 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741686224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kqAFgxHac+XsRShu90MIwQ4n+/LD87sLzfuLHxrTJOs=;
	b=bEyrEcNhNgJ2WJVdx37JSRoeTDvnkL8LNCRcyM9j1mktPeHX8fjv9n0AjemimIS+FMXYNS
	Z+idbFL/80RdrU3RhSj84ZAnxvBO+AqKfA9DRXYQL9v3tSFhTxzVEMs01830QmbBbeN34F
	RE78I6An6tqPYRjI/dwe2ClJP75ZeBmn46gX6bXFw6zxe3c7iCBHJ2URcSfK3H5ptDOjjo
	VxZayqjqWo4+VXCKVoozlIVhpKLpgB54bGivZsCT048f5m20jSMVIqaKi8K5i92VzxMiul
	G/K9R9Sa4/QdbWHeSHFx3XR+sePsBp+UFTy1dgSir9DIFDzZsxWHYkGqMxx7Rw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 10:43:44 +0100
Message-Id: <D8DC8LODB20E.R52TATOR8S6C@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <mikko.rapeli@linaro.org>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] sbom.rst: how to disable SPDX generation
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250310153108.40579-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250310153108.40579-1-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudeivdelgfffteeguefhheektddvleeikeeljeehvddvhefhueetfedvgfdvgeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 09:43:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6527

Hi Mikko,

On Mon Mar 10, 2025 at 4:31 PM CET, Mikko Rapeli via lists.yoctoproject.org=
 wrote:
> Generating SPDX is enabled by default in poky but
> it can take a lot of build time resources so document
> how to disable it.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  documentation/dev-manual/sbom.rst | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual=
/sbom.rst
> index b72bad1554..f5a706bc14 100644
> --- a/documentation/dev-manual/sbom.rst
> +++ b/documentation/dev-manual/sbom.rst
> @@ -24,12 +24,18 @@ users can read in standardized format.
>  :term:`SBOM` information is also critical to performing vulnerability ex=
posure
>  assessments, as all the components used in the Software Supply Chain are=
 listed.
> =20
> -The OpenEmbedded build system doesn't generate such information by defau=
lt.
> -To make this happen, you must inherit the
> -:ref:`ref-classes-create-spdx` class from a configuration file::
> +The OpenEmbedded build system doesn't generate such information by defau=
lt,
> +though ``poky`` reference distribution has it enabled out of the box.

s/though ``poky`` reference/though the :term:`Poky` reference distribution/

> +
> +To enable it, inherit the :ref:`ref-classes-create-spdx` class from a co=
nfiguration file::
> =20
>     INHERIT +=3D "create-spdx"
> =20
> +In ``poky`` reference distribution, :term:`SPDX` generation does consume=
 some build time

Same comment as above

> +resources and thus if needed it can be disabled with:

"...it can be disabled from a :term:`configuration file` with:"

> +
> +   INHERIT:remove =3D "create-spdx"
> +
>  Upon building an image, you will then get:
> =20
>  -  :term:`SPDX` output in JSON format as an ``IMAGE-MACHINE.spdx.json`` =
file in

Otherwise looks good to me, thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

