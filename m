Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C3EC02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:38:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.65560.1738921089551561641
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dO2xuzlU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76BA8433EB;
	Fri,  7 Feb 2025 09:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738921087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WsZ0SZ8ywkoRW9evnPiCSLmUwcg07jsQoSk6axG+c4=;
	b=dO2xuzlU+zSZizKqQSyw4Xv2x190lS5Y622/kd1UynY3yVT8aBkmYPRB15Jmgp56CWbBqV
	Xtr9ZS5thpY6GZXBotIimbR0YVP6Az8Q37KNtPK2vmkIRPZNu2wzb0Ak2UwEKLVRfKabul
	HiLupxGrGsMxTTMvOgtiseab3G5DDYHOSh9QOW/dIq/wrlZVLDmb2a/NwaXgfpnxJ28uUD
	a0NHXVI6cCbyqdU7JvhOi+O8MY2Qy0XV4LjALFwzK+XD0jGfIuN1ShIPF+R7vx7sWQkHYg
	Mbmeq+b/Jerh9iHxZ0pRqRipXgxOLtyAyvaUEfPJhSAC89yvhzF3WbG6BKYBtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:38:07 +0100
Message-Id: <D7M42V6RBSIO.MA35T6RUR922@bootlin.com>
To: <Pascal.Weisser.ext@karlstorz.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3] ref-manual: Add missing variable
 IMAGE_ROOTFS_MAXSIZE
Cc: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250206153529.2546767-1-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20250206153529.2546767-1-pascal.weisser.ext@karlstorz.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteetiedutefhtedtjeefueegkeehheevgfetuddtudduheffffetudefhfdutdeunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopefrrghstggrlhdrhggvihhsshgvrhdrvgigtheskhgrrhhlshhtohhriidrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrh
 ihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:38:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6288

Hi Pascal,

On Thu Feb 6, 2025 at 4:35 PM CET, Pascal.ext via lists.yoctoproject.org We=
isser wrote:
> This patch adds the missing documentation of variable IMAGE_ROOTFS_MAXSIZ=
E
> to the reference manual.
>
> Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
> ---
>  documentation/ref-manual/variables.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 47d4e814f..889944b0a 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3984,6 +3984,12 @@ system and gives an overview of their function and=
 contents.
> =20
>           IMAGE_ROOTFS_EXTRA_SPACE =3D "41943040"
> =20
> +   :term:`IMAGE_ROOTFS_MAXSIZE`
> +       Defines the maximum size in Kbytes for the generated image. If th=
e
> +       generated image size is above that, the build will fail. It's a g=
ood
> +       idea to set this variable for images that need to fit on a limite=
d
> +       space (e.g. SD card, a fixed-size partition, ...).

Here the indentation should be three spaces (compared to ":term:"), not fou=
r.

> +
>     :term:`IMAGE_ROOTFS_SIZE`
>        Defines the size in Kbytes for the generated image. The OpenEmbedd=
ed
>        build system determines the final size for the generated image usi=
ng

Thanks for this, I'm surprised this wasn't documented already :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

