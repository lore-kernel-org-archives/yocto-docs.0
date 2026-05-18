Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCDACD4F49
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 08:15:02 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3816.1779092096509543522
 for <docs@lists.yoctoproject.org>;
 Mon, 18 May 2026 01:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0I4f8rZG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0ADE1C2B9E3;
	Mon, 18 May 2026 08:15:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45C3E602B8;
	Mon, 18 May 2026 08:14:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED9EA11AF8F79;
	Mon, 18 May 2026 10:14:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779092093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m30x+TzYcKA6ItGTOp3eU3Z008A9ooRYm+SEDWGKpYc=;
	b=0I4f8rZGpQ1s/evtDeDLcQRoLyz77hiZaMDgL/VlqX3IPKt6IJ1YZsoBsbb4tCFDKWzYkC
	tIFiZAkeOzQL23bXS+kJ7aloltqRG7YuN54RPzZ+CN0ftdSIEWyBMaKjDrBBZQI55LhUVm
	FJ8XxsyaOeAm9DhufjQBlfDZG9hQau8keVI7iOkAWJR2vHawTCMeMVynET5esqkR2u/jX4
	3+hZ5icu7lZlO7A3cVK7wGlFmBHtcpp1eSO4qDGL1WlIzNhnFLoKB/vmAuLFn4ABav0kJn
	dSFk8JS4ha9YNIAHuoui9SZDoC9v+q6gnLxE79dNaKs+sBtGt/E4qzOKDq1DDw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 10:14:51 +0200
Message-Id: <DILNIFOCANXM.UB31BJZGD5FD@bootlin.com>
To: =?utf-8?q?=EC=B5=9C=EB=AF=BC=EC=9A=B0?= <mw.choi@telica.co.kr>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3] ref-manual/variables: document the 'dynamic
 layer' concept
Cc: <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260513193105.8738-1-mw.choi@telica.co.kr>
In-Reply-To: <20260513193105.8738-1-mw.choi@telica.co.kr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 May 2026 08:15:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9477

Hi,

On Wed May 13, 2026 at 9:31 PM CEST, =EC=B5=9C=EB=AF=BC=EC=9A=B0 wrote:
> This patch documents the "dynamic layer" concept for BBFILES_DYNAMIC.
> While not previously in the manual, this is an informal convention
> widely used in major layers such as meta-intel, meta-ti, and meta-freesca=
le
> to name directories containing conditional content.
>
> [YOCTO #15713]
>
> Signed-off-by: Minwoo Choi <mw.choi@telica.co.kr>
> ---
>  documentation/ref-manual/variables.rst | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index a8cbb87cf..c16e41626 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -841,8 +841,9 @@ system and gives an overview of their function and co=
ntents.
>        previous link.
> =20
>     :term:`BBFILES_DYNAMIC`
> -      Activates content when identified layers are present. You identify
> -      the layers by the collections that the layers define.
> +      Activates content when identified layers are present. This mechani=
sm
> +      is commonly referred to as "dynamic layers". You identify the laye=
rs
> +      by the collections that the layers define.
> =20
>        Use the :term:`BBFILES_DYNAMIC` variable to avoid ``.bbappend`` fi=
les
>        whose corresponding ``.bb`` file is in a layer that attempts to
> @@ -856,8 +857,8 @@ system and gives an overview of their function and co=
ntents.
>        filename patterns::
> =20
>           BBFILES_DYNAMIC +=3D " \
> -            clang-layer:${LAYERDIR}/bbappends/meta-clang/*/*/*.bbappend =
\
> -            core:${LAYERDIR}/bbappends/openembedded-core/meta/*/*/*.bbap=
pend \
> +            clang-layer:${LAYERDIR}/dynamic-layers/meta-clang/*/*/*.bbap=
pend \
> +            core:${LAYERDIR}/dynamic-layers/openembedded-core/meta/*/*/*=
.bbappend \

For consistency could you also update this in the error message below?

 ERROR: BBFILES_DYNAMIC entries must be of the form <collection name>:<file=
name pattern>, not:
     /work/my-layer/bbappends/meta-security-isafw/*/*/*.bbappend
     /work/my-layer/bbappends/openembedded-core/meta/*/*/*.bbappend

Thanks,
Antonin

