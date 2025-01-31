Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3B6C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 13:11:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.18855.1738329086805235280
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 05:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FO8FF++o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCF0F42CCD;
	Fri, 31 Jan 2025 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738329085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iJKci+g1wvJPiyb7BIU2pIauXsvNsazSORvL7z0VlE=;
	b=FO8FF++odID9MxNdRT3N2Y/RpRs2RKyQOdxvTO0Gdj1/yVS4Af7utTbyfU3mu12DL9NNGU
	Z3rj82tAc0cXVoyLc5KjYyLAt8RjvPBwJrt8WRq5kpcfRxVQh39RLxcQ6tlB78JZjw+fnW
	qAtkTdSIm4DmqHlMN/ykX4ay58xgqcKWdVi/2B7MTJZ/+g+F0o6XNNiZmKiH1AClC+K3La
	N7Ytdi2X2HD+IryxoAld8bZU3tVSzEd1FWsuQlGzI3dknSQzJr5qGBAnFvmIa7K1JZgDPj
	pVwEGPd9+/LJnsPe8bJVixlRDCDXNQ3pHXxNPXXI8J98EOe7InBCXNk9Er8xfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jan 2025 14:11:24 +0100
Message-Id: <D7GA8CWSJ9TW.1JPAAOY483ZK9@bootlin.com>
Subject: Re: [PATCH v4] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
Cc: <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Simon A. Eugster" <simon.eu@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250131121705.88535-1-simon.eu@gmail.com>
In-Reply-To: <20250131121705.88535-1-simon.eu@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhedtteetheefgfejleeiledvieevleduffejgeeufedujeeufeefjeefveegudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehsihhmohhnrdgvuhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepqhhuvghnthhinhdrs
 hgthhhulhiisegthhgvrhhrhidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 13:11:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6232

Hi Simon,

On Fri Jan 31, 2025 at 1:17 PM CET, Simon A. Eugster wrote:
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
> index 761be7b545..8bc60e24aa 100644
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
> +-  :term:`GRUB_TITLE`: A custom title for each ``LABEL``. If a label doe=
s not
> +   have a custom title, the label is used as title for the GRUB menu ent=
ry.
> +
>  -  :term:`GRUB_OPTS`: Additional options to add to the
>     configuration (optional). Options are delimited using semi-colon
>     characters (``;``).
> @@ -1011,6 +1015,18 @@ This class supports several variables:
>  -  :term:`GRUB_TIMEOUT`: Timeout before executing
>     the default ``LABEL`` (optional).
> =20
> +Each ``LABEL`` defined in the :term:`LABELS` variable creates a GRUB boo=
t
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

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

