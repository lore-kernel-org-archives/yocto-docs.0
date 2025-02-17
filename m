Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE353C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 09:19:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.47521.1739783970661498352
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 01:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gdhim9l3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EF3B43287;
	Mon, 17 Feb 2025 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739783968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=snVAUHi+dEpCT4zHIDcNQ5Le4XnJqQdBv7m3CjR2UxE=;
	b=gdhim9l3GUqSxwyeCYy6IdH5bPcRTDJ2kwO7squ9WGnhMjmB3+SKeJ1pFqtoYymlQY4fEN
	q+cx/mOV+CO9b/2RbfY0LV4caxpjNYBSfqDBIbbA9/aTZfd8zRICDEkrB0L6YBsX6kik+h
	+t9gm/4AgwrGnlJRe4nEwmQ2BWXdYwzpw8u381WRFzCBSwMGkXvPpxIg8u9m0On7oXBgA9
	RPHx7RkrnbizF/Wt2QmV5GLTb8pE0Iv+v936vXHA1jXi8ELgMYQ1KOVPrn+sFvGCCfmeJO
	wla64GliV9vAN59awMp7Bo7awDVeggmWYYWqBpXBZepEX6ru/GXR3Ppw6WyC+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Feb 2025 10:19:28 +0100
Message-Id: <D7ULY18W66Z1.2AWLVOMC005DH@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] ref-manual: cover UBOOT_ENV variables
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213220405.3920122-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250213220405.3920122-1-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkedtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiueehfeeikeeftdffvdevffeileehveekiedvfefhvdfhuefftefgudejieefnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpuhdqsghoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehli
 hhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesshhivghmvghnshdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 09:19:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6373

Hi Adrian,

On Thu Feb 13, 2025 at 11:04 PM CET, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 42 ++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index adbef69d8f3..e44a105c53e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3180,6 +3180,12 @@ system and gives an overview of their function and=
 contents.
>        The default value for this variable is set to "2048"
>        by the :ref:`ref-classes-kernel-fitimage` class.
> =20
> +   :term:`FIT_UBOOT_ENV`
> +      This variable allows to add a u-boot script as a text file to the

s/u-boot/U-boot/

> +      fitImage. Such a script can be sourced from the u-boot shell, as
> +      documented here:
> +      `U-Boot source command <https://docs.u-boot.org/en/latest/usage/cm=
d/source.html#fit-image.f>`__
> +

When reading this, my first question was: how do I use this variable? A pat=
h to
a file? Can you add an example below?

>     :term:`FONT_EXTRA_RDEPENDS`
>        When inheriting the :ref:`ref-classes-fontcache` class,
>        this variable specifies the runtime dependencies for font packages=
.
> @@ -9777,6 +9783,42 @@ system and gives an overview of their function and=
 contents.
>        :ref:`ref-classes-kernel-fitimage` class to specify the load addre=
ss to be
>        used in creating the dtbo sections of Image Tree Source for the FI=
T image.
> =20
> +   :term:`UBOOT_ENV`
> +      Additional environment variables or a script can be installed alon=
gside
> +      U-Boot to be used automatically on boot.
> +      This file, typically ``uEnv.txt`` or ``boot.cmd``, gets packaged a=
long
> +      with U-Boot (installed into /boot) as well as placed in the deploy
> +      directory.
> +
> +      Machine configurations needing one of these files should include i=
t in
> +      the :term:`SRC_URI` of the U-Boot recipe.
> +
> +      If the variable :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` the scr=
ipt is
> +      packaged as a uImage (``mkinage -T script..``) othersise it gets

s/mkinage/mkimage/
s/othersise/otherwise/

> +      installed as it is.

Extra newline here?

> +      Some Examples:

s/Examples/examples/

> +
> +      -  Adding a script ``boot.cmd`` as an uImage to /boot::

s@/boot@``/boot``@

Above you mention that "Machine configurations needing...should include it
in the :term:`SRC_URI`..."

In this example it seems that you are setting these from the machine conf
file, at least the first two variables. But the third one should be placed =
in
a bbappend, most likely. Can you make it stand out?

> +
> +            UBOOT_ENV =3D "boot"
> +            UBOOT_ENV_SUFFIX =3D "scr"
> +            SRC_URI +=3D "file://${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
> +
> +      -  Adding a script ``uEnv.txt`` as a plain text file to /boot::
> +
> +            UBOOT_ENV =3D "uEnv"
> +            SRC_URI +=3D "file://${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"

In the first example you are setting UBOOT_ENV_SUFFIX but not
UBOOT_ENV_SRC_SUFFIX. I think your examples would be better if you set all =
of
the variables, even if you are overriding a value with the same. Just to im=
prove
clarity of the examples.

> +
> +   :term:`UBOOT_ENV_SUFFIX`
> +      If this variable is set to ``scr`` the script referred by
> +      :term:`UBOOT_ENV` gets packaged as a uImage before it gets intalle=
d.

s/intalled/installed/

> +      The default is ``txt`` which means the script gets installed direc=
tly.

I would rephrase to "which means the script is installed as-is, with no
modification".

> +
> +   :term:`UBOOT_ENV_SRC_SUFFIX`
> +      If :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` this is the suffix o=
f the
> +      plain text script file as it is referred by the :term:`SRC_URI` of=
 the

s/as it is referred by the/as is it specified in the/?

> +      U-Boot recipe.
> +
>     :term:`UBOOT_ENTRYPOINT`
>        Specifies the entry point for the U-Boot image. During U-Boot imag=
e
>        creation, the :term:`UBOOT_ENTRYPOINT` variable is passed as a

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

