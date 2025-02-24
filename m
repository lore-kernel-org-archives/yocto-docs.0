Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E50C021B6
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 09:56:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.85474.1740390943239694050
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 01:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bZkDz3av;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33AEA433F8;
	Mon, 24 Feb 2025 09:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740390941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+f9vqBpoQnh6SMUAfaiDA2GXn4jw6jCS1AdLJAXdwpM=;
	b=bZkDz3avR3QhjULXNHjIv8noLFgLlLg3kpqrd6Yh3DQvraJm9IUHSXSHF3fEQ3Y+RrGCnJ
	pse4gY7KncIu0Ym8R6GPNAv9F2OzdZzwmjhLmfeyZc0BZGcWMnDCFSBZDDBOs5ORypgXfe
	iJWC7XJMFcO6dkawDBQcurqjwN4FvopnHNfBZ9ELJBvrEaaxbduZEEXNJZLeTlcLeZ1+ZM
	Ve0xfkDTW5KBvF+etmR0ifROwth6fh6pU38x8FHaBa6JszwWHxuBLDy5T8iXpzHMKmGTQS
	mIGxFVA0M+Bb62swOD0NEaZ0En0Or9MAGd9VjyOu6IEqFtYfgPiOCnUUL2lr9A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 10:55:40 +0100
Message-Id: <D80L3KLEZTJ9.T3ONJF2WKEGK@bootlin.com>
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 1/2] ref-manual: cover UBOOT_ENV variables
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250224082729.3325776-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250224082729.3325776-1-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfejveffudfghfehvdejhfeuleegtdevtdeludfftddtjeeggfevleejiedtueetnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpuhdqsghoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehli
 hhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesshhivghmvghnshdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 09:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6434

Hi Adrian,

On Mon Feb 24, 2025 at 9:27 AM CET, Adrian Freihofer via lists.yoctoproject=
.org wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 64 ++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index adbef69d8f3..82dd80ca130 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3180,6 +3180,30 @@ system and gives an overview of their function and=
 contents.
>        The default value for this variable is set to "2048"
>        by the :ref:`ref-classes-kernel-fitimage` class.
> =20
> +   :term:`FIT_UBOOT_ENV`
> +      This variable allows to add a U-Boot script as a text file to the
> +      FIT image. Such a script can be sourced from the U-Boot shell.
> +
> +      For machine configurations needing such a script a
> +      ``linux-yocto_%.bbappend`` file should include it in the :term:`SR=
C_URI`
> +      of the kernel recipe.

s/kernel/Linux kernel/

> +
> +      Example:
> +
> +      -  Add a script ``boot.cmd`` to the Linux kernel recipe::
> +
> +            FIT_UBOOT_ENV =3D "boot.cmd"
> +            SRC_URI +=3D "file://${FIT_UBOOT_ENV}"
> +
> +      -  Use the script file from the U-Boot shell. This example loads t=
he FIT
> +         image from a TFP server.::

s/TFP/TFTP/

> +
> +            tftp $loadaddr $fit_url
> +            source $loadaddr#bootscr-boot.cmd
> +
> +      More information can be found in the official U-Boot documentation=
:
> +      `U-Boot source command <https://docs.u-boot.org/en/latest/usage/cm=
d/source.html#fit-image.f>`__
> +
>     :term:`FONT_EXTRA_RDEPENDS`
>        When inheriting the :ref:`ref-classes-fontcache` class,
>        this variable specifies the runtime dependencies for font packages=
.
> @@ -9777,6 +9801,46 @@ system and gives an overview of their function and=
 contents.
>        :ref:`ref-classes-kernel-fitimage` class to specify the load addre=
ss to be
>        used in creating the dtbo sections of Image Tree Source for the FI=
T image.
> =20
> +   :term:`UBOOT_ENV`
> +      Additional environment variables or a script can be installed alon=
gside

Can you start the paragraph with "This variable allows..." like the other? =
So
the next sentence doesn't feel out of context, and the user instantly knows=
 what
the variable is used for.

> +      U-Boot to be used automatically on boot.
> +      This file, typically ``uEnv.txt`` or ``boot.cmd``, gets packaged a=
long
> +      with U-Boot (installed into ``/boot``) as well as placed in the de=
ploy
> +      directory.
> +
> +      For machine configurations needing one of these files a
> +      ``u-boot_%.bbappend`` file should include it in the :term:`SRC_URI=
` of

s/``u-boot_%.bbappend``/``.bbappend``/ (not limited to u-boot.bb only I ass=
ume
but any virtual/bootloader representing U-boot)

> +      the U-Boot recipe.
> +
> +      If the variable :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` the scr=
ipt is
> +      packaged as a uImage (``mkimage -T script..``) otherwise it gets
> +      installed as it is.
> +
> +      Some Examples:

s/Examples/examples/

> +
> +      -  Adding a script ``boot.cmd`` as an uImage to ``/boot``::
> +
> +            UBOOT_ENV =3D "boot"
> +            UBOOT_ENV_SUFFIX =3D "scr"

Or shouldn't you set UBOOT_ENV_SRC_SUFFIX to "cmd" here too? I'm a little
confused as why you refer to boot.cmd yet "cmd" is not defined here.

> +            SRC_URI +=3D "file://${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
> +
> +      -  Adding a script ``uEnv.txt`` as a plain text file to ``/boot``:=
:
> +
> +            UBOOT_ENV =3D "uEnv"
> +            UBOOT_ENV_SUFFIX =3D "txt"
> +            SRC_URI +=3D "file://${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
> +
> +   :term:`UBOOT_ENV_SUFFIX`
> +      If this variable is set to ``scr`` the script referred by
> +      :term:`UBOOT_ENV` gets packaged as a uImage before it gets install=
ed.
> +      The default is ``txt`` which means the script is installed as-is, =
with
> +      no modification.
> +
> +   :term:`UBOOT_ENV_SRC_SUFFIX`
> +      If :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` this is the suffix o=
f the
> +      plain text script file as is it specified in the :term:`SRC_URI` o=
f the
> +      U-Boot recipe.
> +
>     :term:`UBOOT_ENTRYPOINT`
>        Specifies the entry point for the U-Boot image. During U-Boot imag=
e
>        creation, the :term:`UBOOT_ENTRYPOINT` variable is passed as a

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

