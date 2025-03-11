Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681F8C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 09:44:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.4885.1741686267507368264
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 02:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XG6pgL9+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 621EA43217;
	Tue, 11 Mar 2025 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741686265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0Rj0oPf1xGgENzCKgMIU12qdgUkK5o0Rrta/3uMvYc=;
	b=XG6pgL9+XOlbldhDrUXPExeGW9YzszqvdT47WKePli9lzdGqazHuK6DomHGLuu6utdSD33
	1KYYgyhXyFVgX4Y3OyO9sqnxo5zW6Dos/4fLdIFE8CSzcUV+1xc1LPEYPxnUpWIMSqUuPg
	dAzTjGMgWSO00uM5D9Ajgs2je0l+yigNYfHQWexzS39pZtyxtLUaDkpCeL/by/1OC1Q1Sz
	pZP6bDUqejtUjTq0OQltxOGz1zTa4RiQjnh2RxKXK2okQj8jk3R97mipSkgAKS11iegwvC
	kH2C+9KUYqzb1Hgf0A9eakMvWzry2RRJ96vlFFBCrZM2V2tGc5WXWf6Px0D2JA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 10:44:25 +0100
Message-Id: <D8DC94EMPAUY.3ASDHXXPWWW8C@bootlin.com>
Subject: Re: [docs] [PATCH v4] ref-manual: variable FIT_SIGN_INDIVIDUAL
 mix-and-match attacks
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250310205619.8884-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250310205619.8884-1-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdduleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduieeuheefieekfedtffdvveffieelheevkeeivdefhfdvhfeuffetgfdujeeifeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhuqdgsohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtshesl
 hhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 09:44:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6528

Hi Adrian,

On Mon Mar 10, 2025 at 9:56 PM CET, Adrian Freihofer via lists.yoctoproject=
.org wrote:
> Incorporate the lessons learned from a regression introduced with commit
>   OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e
>                u-boot: kernel-fitimage: Fix dependency loop if
>                UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
> and fixed with commit
>   OE-Core rev: 0106e5efab99c8016836a2ab71e2327ce58a9a9d
>                u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL=3D"1"
>                behavior
> into the documentation.
>
> The use of the variable FIT_SIGN_INDIVIDUAL is explicitly discouraged.
> It is also noted that this variable may be removed. It is important that
> we try to simplify the implementation of the FIT image as much as
> possible. Adding appropriate notes to the documentation is a first step
> towards this direction.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 861b04eaab1..aa8a894bfd2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3174,9 +3174,27 @@ system and gives an overview of their function and=
 contents.
>        class will sign the kernel, dtb and ramdisk images individually in=
 addition
>        to signing the FIT image itself. This could be useful if you are
>        intending to verify signatures in another context than booting via
> -      U-Boot.
> +      U-Boot. This variable is set to "0" by default.
> =20
> -      This variable is set to "0" by default.
> +      If :term:`UBOOT_SIGN_ENABLE` is set to "1" and :term:`FIT_SIGN_IND=
IVIDUAL`
> +      is left at its default value of "0", only the configurations are s=
igned.
> +      However, the configuration signatures include the hashes of the re=
ferenced
> +      nodes. This means that the integrity of the entire FIT image is en=
sured
> +      because each hash is compared against a runtime-computed hash for =
each
> +      node.
> +      Further information can be found in the U-Boot documentation:
> +      `U-Boot fit signature <https://docs.u-boot.org/en/latest/usage/fit=
/signature.html>`__
> +      and more specifically at:
> +      `U-Boot signed configurations <https://docs.u-boot.org/en/latest/u=
sage/fit/signature.html#signed-configurations>`__.
> +
> +      If :term:`UBOOT_SIGN_ENABLE` is set to "1" and :term:`FIT_SIGN_IND=
IVIDUAL`
> +      is set to "1", then the FIT image is signed twice, which is redund=
ant.
> +      As this leads to additional complexity without providing any obvio=
us
> +      advantage, this feature will likely be removed in a future version=
.
> +
> +      Signing only the image nodes is intentionally not implemented by
> +      :term:`OpenEmbedded-Core (OE-Core)`, as it is vulnerable to mix-an=
d-match
> +      attacks.
> =20
>     :term:`FIT_SIGN_NUMBITS`
>        Size of the private key used in the FIT image, in number of bits.

Looking good, thanks

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

