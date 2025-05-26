Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19AEC5B542
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 06:41:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.23682.1748241698946127748
 for <docs@lists.yoctoproject.org>;
 Sun, 25 May 2025 23:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WQzTSoQO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E09343A52;
	Mon, 26 May 2025 06:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748241696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/iapNKpOqkQVazIeKOqgsEmF2M8EStQ7QP02PnaUf4=;
	b=WQzTSoQOWYDHFyJGMmghWvyRPf582oQHf7bTjvLRKtZbRZj2QBzr3CBiEu6aPqz3dAiaUl
	7S5hJZjtkSAkfXeUOjr7neA0NQufLtAMz6M91pnmYE774DCCQNmqMlVgezDp7p+yGVSJwu
	wXdsZQD2gePeav2YthEjd6bp19gWshAPvdk9OsnT+rF2jJ7adkc2KV0ewANF66KpxJMVlz
	Z/nZiYpSzeeeSMPURBGhNVVxcy79ehtaIX+2egs16VV6KXaQmR2BEP99Za5JR1GlQJBOwQ
	PidHzy22/LVr90uz8ISxTx026a2crBnsz2LzPufdmBWa+Y3HU2lhgmZaxxuDsw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 08:41:34 +0200
Message-Id: <DA5VYJ7Z52JB.X035ZSW9HF3T@bootlin.com>
To: <jamin_lin@aspeedtech.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual: uboot-sign: Support firmware
 property in FIT config
Cc: <troy_lee@aspeedtech.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250523084314.775497-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20250523084314.775497-1-jamin_lin@aspeedtech.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieekfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkvffuvefhfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtuefhudfggeefjeeukeeitedtkeevffduteeuffeltddvfedtjeehudfgleefnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrt
 ghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 06:41:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6903

On Fri May 23, 2025 at 10:43 AM CEST, Jamin Lin via lists.yoctoproject.org =
wrote:
> Add documentation for the UBOOT_FIT_CONF_FIRMWARE variable, which allows
> users to specify an image to be assigned to the "firmware" property of
> the FIT configuration node. This explicitly defines the primary image
> to boot, instead of relying on the first entry in the "loadables" list.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  documentation/ref-manual/classes.rst   | 2 ++
>  documentation/ref-manual/variables.rst | 8 ++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 5187033f7..54a98bf24 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3426,6 +3426,8 @@ The variables used by this class are:
>  -  :term:`UBOOT_FIT_USER_SETTINGS`: adds a user-specific snippet to the =
U-Boot
>     Image Tree Source (ITS). Users can include their custom U-Boot Image =
Tree
>     Source (ITS) snippet in this variable.
> +-  :term:`UBOOT_FIT_CONF_FIRMWARE`: adds one image to the ``firmware`` p=
roperty
> +   of the configuration node.
>  -  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds one or more user-defined =
images
>     to the ``loadables`` property of the configuration node.
> =20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 643a3e7ae..b382e2281 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10327,6 +10327,14 @@ system and gives an overview of their function a=
nd contents.
> =20
>           do_compile[depends] +=3D "trusted-firmware-a:do_deploy"
> =20
> +   :term:`UBOOT_FIT_CONF_FIRMWARE`
> +      Adds one image to the ``firmware`` property of the configuration n=
ode
> +      of the U-Boot Image Tree Source (ITS). Sets the firmware property =
to select
> +      the image to boot first. If not set, the first entry in "loadables=
" is used
> +      to boot instead::

Reading this a second time I think it is a bit odd to put the example below
after that sentence.

I would suggest:

"""
Sets the firmware property to select the image to boot first::

   UBOOT_FIT_CONF_FIRMWARE =3D "fwa"

If not set, the first entry in "loadables" is used to boot instead.
"""

What do you think?

> +         UBOOT_FIT_CONF_FIRMWARE =3D "fwa"
> +
>     :term:`UBOOT_FIT_CONF_USER_LOADABLES`
>        Adds one or more user-defined images to the ``loadables`` property=
 of the
>        configuration node of the U-Boot Image Tree Source (ITS). This var=
iable


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


