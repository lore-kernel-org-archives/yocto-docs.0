Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371B9CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:19:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.53164.1758550733899600629
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 07:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NsjU1HI2;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D7306C8EC45;
	Mon, 22 Sep 2025 14:18:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBA7060634;
	Mon, 22 Sep 2025 14:18:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB814102F1929;
	Mon, 22 Sep 2025 16:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758550731; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fFULrE73gTRkbuPfdl57s5IpTeUmGK2jf4FGjNqLSkc=;
	b=NsjU1HI2loonoAJIgxycj/PYD/Y7G2K+OS+TGUYybADVl6p+Uoo+H2wylzJbzj5RpJx49H
	n+mn5s8MbCqMRby3GMKBMQpH9DMJLPllSxEtJVcciQlkaepUevkOcDl4kzjdbPH/V5gGq4
	VnoKhRQPR95l1bVXvoBPVM5AsX/MckABUXcMSDfvN7Euks07Ts6YWvxzBwlMBCBijZwPnD
	LgAI9oRqMyhHtQSQbDe/BVzgy1QJJer19FniOYjvHlDIbspF/CkVvX7Jd2xsrynlr5qtCx
	XZhOTOcM7SD/HgOITu/P3VRNcoNZ3honWONvHVs3vxkdYoiHN6a1E69sYYYErQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Sep 2025 16:18:50 +0200
Message-Id: <DCZE7GR7DWSC.20I17FKZ0DHZK@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <bhstalel@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/2] dev-manual/building.rst: add note about
 globally inheriting externalsrc class
References: <20250921132033.31644-1-bhstalel@gmail.com>
 <20250921132033.31644-2-bhstalel@gmail.com>
In-Reply-To: <20250921132033.31644-2-bhstalel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7573

On Sun Sep 21, 2025 at 3:20 PM CEST, BELHADJ SALEM Talel via lists.yoctopro=
ject.org wrote:
> Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
> ---
>  documentation/dev-manual/building.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-ma=
nual/building.rst
> index 04c150094..8d00d908e 100644
> --- a/documentation/dev-manual/building.rst
> +++ b/documentation/dev-manual/building.rst
> @@ -736,6 +736,13 @@ are the statements to put in your ``local.conf`` fil=
e::
>     INHERIT +=3D "externalsrc"
>     EXTERNALSRC:pn-myrecipe =3D "path-to-your-source-tree"
> =20
> +.. note::
> +
> +   When you inherit :ref:`ref-classes-externalsrc` class globally make
> +   sure to set the :term:`EXTERNALSRC` and :term:`EXTERNALSRC_BUILD`
> +   variables to specific recipes, not doing that will redirect
> +   all recipes to one external source directory.
> +
>  This next example shows how to accomplish the same thing by setting
>  :term:`EXTERNALSRC` in the recipe itself or in the recipe's append file:=
:
> =20

Hi,

When reading this, I had the feeling that the previous paragraph shows how =
to
set EXTERNALSRC for a specific recipe, and the next paragraph shows how to =
set
both EXTERNALSRC and EXTERNALSRC_BUILD from a recipe - which is exactly wha=
t you
say in your note. So, why a note to repeat this? What was the intent?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


