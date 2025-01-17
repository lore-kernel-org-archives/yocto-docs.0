Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AEAC02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:46:18 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8073.1737110772553863147
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 02:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OG7yeOs+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C7F4C0008;
	Fri, 17 Jan 2025 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737110770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RL59j9NIllEP4/U0P9LbW3rB0zqvw9iGB2Ler7zB2NU=;
	b=OG7yeOs+FXImO0iLCYTmsPIP1Z1eIlWFCxVzYU8SXckB5rdE7DwTZc5OmgiWdzxZ7Wu2QX
	HZZB0NlEzF9h3NyPiM4b2yoSHBwFNSnOldViAG2Re5khKD7t54gD9p6D7M/C3IRtPzAiVx
	Lr1YdS3oBQNmd4MMcIFc71BNy1Drrcx6imHQZUOCazu4O9Ab5lcbi38Vgfvam8251Hz/v+
	1oaaB/h7w8JSFS9PBeW2LELaSxP/gYOOTyonVAN84S+IJ3jMyvOCwlnnLl+yW9UqEqhRae
	s+6AbPhf+57YsW1Ou6f6mYxVUv+cnBa5O735LaPS+xHddsN9izm4I22PlObIYg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 11:46:10 +0100
Message-Id: <D74ADJ3114PX.PP5KW6UZKD31@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <simon.eu@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250115080758.27000-1-simon.eu@gmail.com>
In-Reply-To: <20250115080758.27000-1-simon.eu@gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 10:46:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6128

Hi Simon,

On Wed Jan 15, 2025 at 9:07 AM CET, Simon A. Eugster via lists.yoctoproject=
.org wrote:
> This patch describes how to use overrides for grub-efi-cfg because that
> is otherwise only clear after reading the .bbclass file. It also adds
> a description for GRUB_TITLE.
> ---
>  documentation/ref-manual/classes.rst | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 761be7b545..460f94b232 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -987,10 +987,14 @@ introspection. This functionality is only enabled i=
f the
>  The :ref:`ref-classes-grub-efi` class provides ``grub-efi``-specific fun=
ctions for
>  building bootable images.
> =20
> -This class supports several variables:
> +This class supports several variables.
> +The label specific override names are ``grub_LABEL``.

"...are defined as ``grub_LABEL``"?

> +To specificy an override for the label ``mylabel``, the override name is=
 ``grub_mylabel``,

s/specificy/specify/

Also please wrap the lines to 80 chars, as recommended by our standards.md =
file.

> +for example ``APPEND:grub_mylabel =3D my-appends``.

You are missing quotes in this example, it should be ``APPEND:grub_mylabel =
=3D "my-appends"``.

I think it would also make sense to give this example after the bullet list=
. I
would move the text starting from "The label specific override names..." to=
 the
APPEND example, after the bullet list. And you keep your real life example =
with
the factory.

>
>  -  :term:`INITRD`: Indicates list of filesystem images to
>     concatenate and use as an initial RAM disk (initrd) (optional).
> +   Can be specified for each ``LABEL``.
>
>  -  :term:`ROOTFS`: Indicates a filesystem image to include
>     as the root filesystem (optional).
> @@ -1004,6 +1008,9 @@ This class supports several variables:
>  -  :term:`APPEND`: An override list of append strings for
>     each ``LABEL``.
>
> +-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.

In addition to adding the variable here, you also need to add its definitio=
n to
documentation/ref-manual/variables.rst, otherwise you cannot make a
cross-reference to it here. Mind that the variables.rst file had the variab=
les
alphabetically ordered.

> +   Defaults to ``LABEL`` if it is not defined.
> +
>  -  :term:`GRUB_OPTS`: Additional options to add to the
>     configuration (optional). Options are delimited using semi-colon
>     characters (``;``).
> @@ -1011,6 +1018,14 @@ This class supports several variables:
>  -  :term:`GRUB_TIMEOUT`: Timeout before executing
>     the default ``LABEL`` (optional).
>
> +For the label ``factory``, a custom GRUB menu entry titled "Factory Inst=
all" with the additional parameter ``factory=3Dyes``
> +can be achieved as follows::
> +
> +  LABELS:append =3D "factory"

I think you need a space after the quote here:

  LABELS:append =3D " factory"

> +  APPEND:grub_factory =3D "factory=3Dyes"
> +  GRUB_TITLE:grub_factory =3D "Factory Install"
> +
> +

Unneeded extra newline here

>  .. _ref-classes-gsettings:
>
>  ``gsettings``

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

