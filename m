Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF99BC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:32:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.13026.1737646326295895793
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 07:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Yoql4y0L;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6FF1FF802;
	Thu, 23 Jan 2025 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737646324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5l6buU8n/20hOzzmX+biQ9qVEg+XXJZ1eqmtAhmG0VU=;
	b=Yoql4y0LnsW8IOd0/TkoNmg5sIB3od9nhTzrlef12BBESKMODBs3zD72g0KjA3cMj850Xs
	KMGOB8medNC+beqQZ8PxKLO3ajKsnjGKZm9EoRiNDezMyst2sHTjPl5RoXhpsbsWViIBba
	R3OhA+kDsUOh4iilPJscW4i33tKumuB7Ta0DZIPlxxzlQ9KeQlcM07nQvgXiSvDu0WvMHe
	t0p6K/LWOcgd3K2q6VnhE99DoKNg1ufuYuAEh656mMbfWMlC8OtyvtF7BmmdI1S1+raXKu
	xj5BUN+cJ1eyOalX1zfJza9/ZzZ/dja1upxrDszZK8TkrIB5cc6vX0s1K5PsVA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 16:32:03 +0100
Message-Id: <D79K7OUHYIKF.NURW1CBQTH14@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <simon.eu@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250115080758.27000-1-simon.eu@gmail.com>
 <20250121111836.47434-1-simon.eu@gmail.com>
In-Reply-To: <20250121111836.47434-1-simon.eu@gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 15:32:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6161

Hi Simon,

Please send new versions of the patch in a separate email thread, and inclu=
de
the version in the Subject. See the contributor guide for more details on h=
ow to
do that:
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#taking-=
patch-review-into-account

Please, also make sure to include your Signed-off-by in your patches. The
contributor guide goes over that too.

On Tue Jan 21, 2025 at 12:18 PM CET, Simon A. Eugster via lists.yoctoprojec=
t.org wrote:
> This patch describes how to use overrides for grub-efi-cfg because that
> is otherwise only clear after reading the .bbclass file. It also adds
> a description for GRUB_TITLE.
> ---
>  documentation/ref-manual/classes.rst   | 18 +++++++++++++++++-
>  documentation/ref-manual/variables.rst |  6 ++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 761be7b545..df6092f082 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -987,10 +987,11 @@ introspection. This functionality is only enabled i=
f the
>  The :ref:`ref-classes-grub-efi` class provides ``grub-efi``-specific fun=
ctions for
>  building bootable images.
> =20
> -This class supports several variables:
> +This class supports several variables.

You can leave the colon here.

> =20
>  -  :term:`INITRD`: Indicates list of filesystem images to
>     concatenate and use as an initial RAM disk (initrd) (optional).
> +   Can be specified for each ``LABEL``.
> =20
>  -  :term:`ROOTFS`: Indicates a filesystem image to include
>     as the root filesystem (optional).
> @@ -1004,6 +1005,9 @@ This class supports several variables:
>  -  :term:`APPEND`: An override list of append strings for
>     each ``LABEL``.
> =20
> +-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
> +   Defaults to ``LABEL`` if it is not defined.
> +
>  -  :term:`GRUB_OPTS`: Additional options to add to the
>     configuration (optional). Options are delimited using semi-colon
>     characters (``;``).
> @@ -1011,6 +1015,18 @@ This class supports several variables:
>  -  :term:`GRUB_TIMEOUT`: Timeout before executing
>     the default ``LABEL`` (optional).
> =20
> +Each ``LABEL`` defined in the ``LABELS`` variable creates a GRUB boot en=
try,
> +and some variables can be defined individually per ``LABEL``. The label
> +specific override names are defined as ``grub_LABEL``.
> +
> +For example, for a label ``factory``, the override name would be
> +``grub_factory``. A custom GRUB menu entry titled "Factory Install" with=
 the
> +additional parameter ``factory=3Dyes`` can be achieved as follows::
> +
> +  LABELS:append =3D " factory"
> +  APPEND:grub_factory =3D "factory=3Dyes"
> +  GRUB_TITLE:grub_factory =3D "Factory Install"

Our standards.md file recommends three spaces for code block indentation, c=
an
you fix this?

> +
>  .. _ref-classes-gsettings:
> =20
>  ``gsettings``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 0c5c7aab97..9061c206a7 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3320,6 +3320,12 @@ system and gives an overview of their function and=
 contents.
>        :ref:`ref-classes-grub-efi` class for more information
>        on how this variable is used.
> =20
> +   :term:`GRUB_TITLE`
> +      Specifies custom titles for GRUB labels defined in  :ref:`LABELS`.=
 See
> +      the :ref:`ref-classes-grub-efi` class for more information on how =
this
> +      variable is used.
> +
> +

Extra newline, can you remove it?

>     :term:`GTKIMMODULES_PACKAGES`
>        When inheriting the :ref:`ref-classes-gtk-immodules-cache` class,
>        this variable specifies the packages that contain the GTK+ input


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

