Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22BFE7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 12:19:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.12766.1733314784077927621
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 04:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mL376Vv1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60C391C0003;
	Wed,  4 Dec 2024 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733314781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOALOwVOO1Ga3dRlZcCkNaTutESh4oDWMILkvBmbA1M=;
	b=mL376Vv14rjCuCeXh3UTYRPSp8/TvU2LO0tHtXbxNMIrsVAImibE4xN8E6248yEujbV/nB
	pbZr3NC9KGj1bpVeMuxxjouvUi9tTuklIxjw+19o7tnna6HHQ2pFQbXXSIv//tH9nvkV0U
	Z1wN+wORbrafhXqtcmW1zh7YCTZH4Gb1JVCzN/yhiV8/G6REEXpIWhk1mseFFCmajwarhT
	hOxzmkWtPlFA3yhwJj9lx4ng24whfsWGnsG8ckgpswlGJ3ed2i4gZA1Vn40BQWZr0pvvKu
	qjCN6WfdAZZQFAINFoLTgx2dT0/VT4R2JYHLlFh3X5v0svA92i2id7RoYkydMw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Dec 2024 13:19:41 +0100
Message-Id: <D62WT5QAFUR4.22N91K2Y793BO@bootlin.com>
Subject: Re: [docs] [PATCH v2 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <michael.opdenacker@rootcommit.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
 <20241204104432.2094236-4-michael.opdenacker@rootcommit.com>
In-Reply-To: <20241204104432.2094236-4-michael.opdenacker@rootcommit.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 12:19:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5880

On Wed Dec 4, 2024 at 11:44 AM CET, Michael Opdenacker via lists.yoctoproje=
ct.org wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> - Remove duplicate instructions
>
> - Detail how to run bmaptool directly if you installed it on your host
>   instead of building it through the ``bmaptool-native`` recipe,
>   as running "oe-run-native bmaptool-native bmaptool ..." won't work
>   in this case.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  documentation/dev-manual/bmaptool.rst | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
> index 37083c9c64..93c8d3a45e 100644
> --- a/documentation/dev-manual/bmaptool.rst
> +++ b/documentation/dev-manual/bmaptool.rst
> @@ -43,14 +43,16 @@ any type of image. Use these steps to flash an image =
using `bmaptool`:
>     depending on your particular setup. The following commands assume the
>     image resides in the :term:`Build Directory`'s ``deploy/images/`` are=
a:
> =20
> -   -  If you have write access to the media, use this command form::
> +   -  If needed, set permissions to get write access to the media::
> =20
> -         $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
> +         $ sudo chmod 666 /dev/sdX

I think you forgot to change to "a+w"
Also, it wasn't moved after the sudo command?

Looks like the wrong patch may have slipped in? :)

> -   -  If you do not have write access to the media, set your permissions
> -      first and then use the same command form::
> +   -  If you installed the package for `bmaptool`, you can directly run:=
:
> +
> +         $ sudo bmaptool copy build-directory/tmp/deploy/images/machine/=
image.wic /dev/sdX
> +
> +   -  Otherwise, if you built `bmaptool` with BitBake, run::
> =20
> -         $ sudo chmod 666 /dev/sdX
>           $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
> =20
>  For help on the ``bmaptool`` command, use the following command::


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

