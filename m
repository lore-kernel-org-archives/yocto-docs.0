Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F2DC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 10:06:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9484.1738145211059625880
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 02:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fV+8TTDK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9A1343156;
	Wed, 29 Jan 2025 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738145209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZs+JUSXdM2qViVQ+wPvY9lWpQhK6NFWXM8zvE3u8TI=;
	b=fV+8TTDKbrbcFk0STiC9HtLRLf9i1BhHzO9zwPPospqCbfBAeEjyhe/RGMpEArJ7xCGZfg
	TyHlw3DCxLJpvNSboLGQaLQgX1qtzGr7RHMUj/QLlhzAvpc1XRKnSF6kRt8LqLa9imy/5r
	MvWRU71FGUKhj8n8FwasCLAlo0XjSGV2/tZecR2uqXfKIBPy2IW877z/oOsR8ifIkqdvXH
	0TJ9fW8ghaxmgQcb8f0l+aky29xB8tdR5FHeHbvWzJEunig8NzkN8Oy/7BDEClP2T1fNAH
	5Z5PmR67/5J24SxSOQ7DabauO0C3uYHuerWQ3mQDttEHMvY893ERD/L+zXpHEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 11:06:48 +0100
Message-Id: <D7EH1XIIFP1V.1E5Q88E740ECO@bootlin.com>
Subject: Re: [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Simon A. Eugster" <simon.eu@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250128102308.42435-1-simon.eu@gmail.com>
In-Reply-To: <20250128102308.42435-1-simon.eu@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefhvedvudelhedvkeegudfftdfhkeffgfevtdfhieduudeljeevheeguefftefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepshhimhhonhdrvghusehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jan 2025 10:06:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6208

Hi Simon,

On Tue Jan 28, 2025 at 11:23 AM CET, Simon A. Eugster wrote:
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
> index 761be7b545..1d64ac2f28 100644
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
> +Each ``LABEL`` defined in the :term:``LABELS`` variable creates a GRUB b=
oot

:term:``LABELS`` is incorrect, it should be enclosed with single backticks =
only.

Regards,
Antonin

> +entry, and some variables can be defined individually per ``LABEL``. The=
 label
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
> index 0c5c7aab97..4eb11abede 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3320,6 +3320,11 @@ system and gives an overview of their function and=
 contents.
>        :ref:`ref-classes-grub-efi` class for more information
>        on how this variable is used.
> =20
> +   :term:`GRUB_TITLE`
> +      Specifies custom titles for GRUB labels defined in  :term:`LABELS`=
. See
> +      the :ref:`ref-classes-grub-efi` class for more information on how =
this
> +      variable is used.
> +
>     :term:`GTKIMMODULES_PACKAGES`
>        When inheriting the :ref:`ref-classes-gtk-immodules-cache` class,
>        this variable specifies the packages that contain the GTK+ input


--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

