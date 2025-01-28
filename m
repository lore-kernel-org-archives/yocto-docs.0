Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A64CC02190
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 08:20:36 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.13222.1738052429671970319
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 00:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XPj1UFjb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C92F1C0002;
	Tue, 28 Jan 2025 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738052427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fguLfINWCU1sONlCmnlJwgKAukVNNibO+BrR3TeRLWI=;
	b=XPj1UFjbBiLIhUw/iMUaHNwqNCgvukV0E3l8Kyuhf2AoRPkmDYBjWqH5Uz/C50f2VS/kle
	Hu288Vx3ZWf9SuktxQWQOsB2fFdupRLa257twhUgRl2ZbcQ7rtPZ0y3RkFlUiP7Eb73PKD
	3fzsY5lCDPbEIkwQ/5wM87i2c550uSrDYvD3/aFLIMtYgmkiMgWbg28zdsglOmJMwxHv6D
	H8HKCyugWZETtYCRXj40Ay61lz1X5Vyx+hxDAbD1CFALqcpgqkUha3aepKHgSLFVn2H9bp
	M3sPrLhySVzDX4SoEkBRcfaL0JYj/URNodeOLbufhe21PyO4dyVpKzXbBddlkQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jan 2025 09:20:27 +0100
Message-Id: <D7DK5YLXCDJ3.31RLRC7EGPYS4@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Simon A. Eugster" <simon.eu@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v2] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250128075328.20912-1-simon.eu@gmail.com>
In-Reply-To: <20250128075328.20912-1-simon.eu@gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jan 2025 08:20:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6203

Hi Simon,

On Tue Jan 28, 2025 at 8:53 AM CET, Simon A. Eugster wrote:
> This patch describes how to use overrides for grub-efi-cfg because that
> is otherwise only clear after reading the .bbclass file. It also adds
> a description for GRUB_TITLE.
>
> Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> ---
>  documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
>  documentation/ref-manual/variables.rst |  5 +++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 761be7b545..1de362e864 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -991,6 +991,7 @@ This class supports several variables:
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
> +   LABELS:append =3D " factory"
> +   APPEND:grub_factory =3D "factory=3Dyes"
> +   GRUB_TITLE:grub_factory =3D "Factory Install"
> +
>  .. _ref-classes-gsettings:
> =20
>  ``gsettings``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 0c5c7aab97..16ffbf0e85 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3320,6 +3320,11 @@ system and gives an overview of their function and=
 contents.
>        :ref:`ref-classes-grub-efi` class for more information
>        on how this variable is used.
> =20
> +   :term:`GRUB_TITLE`
> +      Specifies custom titles for GRUB labels defined in  :ref:`LABELS`.=
 See

Here you make a :ref: to LABELS, but like GRUB_TITLE, it needs to be added =
to
variables.rst, otherwise it produces a compile error. You would also use :t=
erm:,
not :ref:.

Can you add documentation for it?

Since "LABELS" by its own does not refer to Grub, just make sure to start t=
he
description with:

"""
When inheriting the :ref:`ref-classes-grub-efi` class, ...
"""

So someone reading the description knows in which context it's used.

If you do, please also use :term: in the class description above.

Thanks for the separate mail/Signed-off-by!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

