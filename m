Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94C8D2E01D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 07:17:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.3181.1729667869836992107
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 00:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BO6iyDIL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 614ECFF805;
	Wed, 23 Oct 2024 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729667867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2dp50D8H2x9JHhrcTfimEiqLI7HOPH8B93OV8g4+X4M=;
	b=BO6iyDILobOuBL6xolOUmxEXTv6aM851TG3AQJP/gS1wwhS6t5gokBoT76X0Ibq5MqVqYu
	3wEdFC/5G/Zeo8WOOBYF5t/gAQyc+DeuEJCJVUAg+LjXfsnv/MvMHLbr67rFecYdBybGO2
	bTLG9eA7kRM6+Fo0bNVqeTSZRi/8ZnHQtrGOvQBMJe5fsTMnK4Iu7jqUVG03YaVkEe465P
	OzlL0vOkijf5TcZcgPKtL6IIFdrzoj7AlL0T9NaovFSHZW4VAsOLNcOk1DdQs8dWyuieVQ
	TVZOmm+o2jpOdA+GhSrV4HeFDeat2yGjozpIjMMna5mgCx8t7zQnQ8fk/lNLxA==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=587ced8b632992fbd2bc237421a216df09d21e24406e220fc9ff5c6d4e63;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 23 Oct 2024 09:17:47 +0200
Message-Id: <D53034PY7LFC.6OISH579B903@bootlin.com>
Subject: Re: [PATCH v2 0/2] ref-manual: release process: update LTS section
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241022-update-releases-svg-v2-0-6e7740f9a41c@bootlin.com>
 <D52B130IVLTK.28FJTB79L17DQ@bootlin.com>
 <7e5d389b-cee8-4e90-9133-0d4ff50ca5d4@rootcommit.com>
In-Reply-To: <7e5d389b-cee8-4e90-9133-0d4ff50ca5d4@rootcommit.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Oct 2024 07:17:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5571

--587ced8b632992fbd2bc237421a216df09d21e24406e220fc9ff5c6d4e63
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Michael,

On Tue Oct 22, 2024 at 6:13 PM CEST, Michael Opdenacker wrote:
>
> On 10/22/24 13:39, Antonin Godard wrote:
>> On Tue Oct 22, 2024 at 1:03 PM CEST, Antonin Godard wrote:
>>> Update the releases.svg file. Link to preview:
>>> https://lufi.bootlin.com/r/VXPQ7d5NDt#kPjQDABd0EORG6GJCMG2U0IdU1+tGuUMH=
vWk8GofBsM=3D
>> Realizing I wrote "Current" instead of "Long Term Support" in the diagra=
m. I will
>> fix that.
>
> Actually, "Current" looks good to me as "LTS" already appears next to
> the release name.
>
> Now that Styhead has been released, you should also change its color to
> "Current", the same color as for Scarthgap.

Ha I get what you mean. Indeed with Kirkstone, Scarthgap and Styhead as
"Current" releases, I'll leave the legend as-is. Thanks!

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--587ced8b632992fbd2bc237421a216df09d21e24406e220fc9ff5c6d4e63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEhkhyUYjdQBu5oNP/0YBBQCmjqDYFAmcYoxwACgkQ0YBBQCmj
qDalXxAAvu6vmOlFPEUQz5W2afpcuNxCDYCqYOHIhv0zMeoSwiA21/PmsOgG73+0
XexRyGxIgXKeM1QXlFFFyuH08LULBXhpLUA3vGtCuVMj3lZUNwkUO5HObvvmIXXE
kR1wyM2lyWEDZXgMdSr5gG7S6p3EOBNtKbrzWmC3tOli2EZF6w26B4xganxObTRt
WBylBY+b7AlGpR5EBfAQAxUSm8oWGdMRYb1EZVdCQEu6ZcOOal4dyJ3gO/UdQVwG
Qm6UToXMwuxqgydKkun3bqqkTl7aCllz+RisWETdTf2aDZqZeHHKgTbgHGkPTzee
TxJbkw1VVk8WNFf5E6FzyrFBPhPkwIo2mv9rZoMJmEWcBJENuDqlSMrKjojy2byl
rDvqJcs8kpmc/jOiwMxbc8xmwAyjQA7orCBFLiOwlPdKZWph94n69Z6dVX/p+oJW
oZldTZt8lyOmD7AeTxZ18Rcbzlca19oh6SsRMl4bHzySsNAYWLHi89zjAjw68OcC
UWW+35uaVpAL89Qd50AGdjuZ52DaHzpOY5JAluLJ0XSVEMJGOLZQMdARc+QM+Nzk
NwskMHUWUpMincDn1+LvqGa7e7jedBW2o29jMoHdvKnhXMmaesTVi6+fdCkWXeX3
KROFpYloaAESD8OlRfqxxTS/D2gJuZKBbrUaU/MBum7SXoLBPKU=
=ByEk
-----END PGP SIGNATURE-----

--587ced8b632992fbd2bc237421a216df09d21e24406e220fc9ff5c6d4e63--

