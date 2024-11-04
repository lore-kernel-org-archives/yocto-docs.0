Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EA8D132B3
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 11:30:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.55591.1730719849976323798
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 03:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lEqOYN9u;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 074CEC000B;
	Mon,  4 Nov 2024 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730719848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wC9Fjt+8fywbGfbfY0q6LemAL/+i0M6UumMJvVA1NXE=;
	b=lEqOYN9unuKoqoMrK75U7O3baOfQKXQSKz9uJ+DDJEdj4xzKse7tDCIhskhKfw6yhqyNh7
	719oQBc39n6cLKK4zIWlewyTFI1k2+6KawG+JFsY6ibG3RVCNEbSdzCmaZmql57On3KvzN
	omVoAWKYJQvs/opfFmM/Xijkc+jYmXgpeX30UpDI3Vg93e9q0maA+gYrLpBrCzMiAlTDCk
	IWEs4mTzllcmv+h5g2A0jClzmKbSch6LRgkSGCD1C5obKWtU+XgtTniqfV4XNJUO4g4F0I
	CnQwAEVGPzRyMwBJJ792W6pqJlgj+r2wj9Y42FAHuV9cGuov7eBT+nC0wrk25g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 12:30:47 +0100
Message-Id: <D5DCZDUS9A7S.1H75NE44D5Y10@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/5] README: add instruction to run Vale on a
 subset
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com> <20241031-add-bblock-documentation-v1-1-32b89093bbda@baylibre.com>
In-Reply-To: <20241031-add-bblock-documentation-v1-1-32b89093bbda@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 11:30:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5650

Hi Julien,

Thanks for your patches.

On Thu Oct 31, 2024 at 5:56 PM CET, Julien Stephan wrote:
> make stylecheck runs Vale on the whole documentation which can be long
> and reports a lot of errors/warnings. We can run Vale on a subset using
> the VALEDOCS variable, so update documentation to highlight it.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  documentation/README | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/documentation/README b/documentation/README
> index c888b666a8632a1d6f576c68e4f9ca966d79f134..6a4db97d65b9c23828163d8b5=
48485b2e302bc97 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -142,6 +142,13 @@ To run Vale:
> =20
>   $ make stylecheck
> =20
> +Style checking the whole documentation might take some time and generate=
 a
> +lot of warnings/errors, thus one can run Vale on a subset:

s/on a subset:/on a subset of files or directories:/ I would say

> +  $ make stylecheck VALEDOCS=3D<file>
> +  $ make stylecheck VALEDOCS=3D"<file1> <file2>"
> +  $ make stylecheck VALEDOCS=3D<dir>
> +
>  Link checking the Yocto Project documentation
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


