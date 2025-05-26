Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044F2C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:35:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.24102.1748244886572300375
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pK1BdTTi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FDB31FCF6;
	Mon, 26 May 2025 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748244885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v77BHYNGCYr4x7WQP7X1uoPiIln3viJAP7y+gDMYF38=;
	b=pK1BdTTi5v+Wnp/GRfdtR5mXVv1LnCzYFQgiWcQXx6Irr+R4iHMj2P+64569jPtoytSL3s
	nW7bTUMhZHU5riBXOkMc2VCtRpAUpqn7dddQU85yIvuGBJ88lZZulTvXtT0Lxx4EjC7T78
	a+X4gB8uNOHC4NtaK8wtTMlueQ8ZL1Jt6OdCskxoyfDs+evYiRVwL1FmIWjfirvZVJhyjG
	puD5gO7QkYT7XeyG6fQxHcHfuDDxqln6RIUIfoHx3IeVN6MJVcrukxovEQu7HWmc2499eN
	VdpSkclKT/FV95ShzG8+iEzG/BT/+GD+ODO69Fz30LeVy+PxBWLf8+CoVDPuSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 09:34:44 +0200
Message-Id: <DA5X38LVQT7C.1KYWHKL81WJRR@bootlin.com>
Cc: <troy_lee@aspeedtech.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <jamin_lin@aspeedtech.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3] ref-manual: uboot-sign: Support firmware
 property in FIT config
References: <20250526072601.1766915-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20250526072601.1766915-1-jamin_lin@aspeedtech.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieelfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkvefhvffufhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieevueevueeuvdeuveeggeeufefgheeuueeguddtuedugfejhefhieejudejjeefnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrt
 ghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:35:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6909

On Mon May 26, 2025 at 9:26 AM CEST, Jamin Lin via lists.yoctoproject.org w=
rote:
> Add documentation for the UBOOT_FIT_CONF_FIRMWARE variable, which allows
> users to specify an image to be assigned to the "firmware" property of
> the FIT configuration node. This explicitly defines the primary image
> to boot, instead of relying on the first entry in the "loadables" list.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  documentation/ref-manual/classes.rst   | 2 ++
>  documentation/ref-manual/variables.rst | 7 +++++++
>  2 files changed, 9 insertions(+)
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
> index 643a3e7ae..36c61e48e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10327,6 +10327,13 @@ system and gives an overview of their function a=
nd contents.
> =20
>           do_compile[depends] +=3D "trusted-firmware-a:do_deploy"
> =20
> +   :term:`UBOOT_FIT_CONF_FIRMWARE`
> +      Sets the firmware property to select the image to boot first::
> +
> +         UBOOT_FIT_CONF_FIRMWARE =3D "fwa"
> +
> +      If not set, the first entry in "loadables" is used to boot instead=
.

Thanks this looks good. I did not mean to remove the first sentence with my
suggestion, though! But that is fine, I will add it manually, no need to se=
nd a
v4.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


