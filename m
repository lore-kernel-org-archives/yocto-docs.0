Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E3ACD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:46:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154621.1781617579313232142
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KkNFNdgc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CBC78C2BB32;
	Tue, 16 Jun 2026 13:46:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41A83601A9;
	Tue, 16 Jun 2026 13:46:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3261A106C9D7A;
	Tue, 16 Jun 2026 15:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781617576; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DC8CFEDEbWqq9GnRoz6/3lTPi4NkvPyuoLp4LiXYpiw=;
	b=KkNFNdgc3OeJ+4PQoK4XuZneib+s3zsY3n+9xdBM44hm4Dm5QISE4GM7bto/cW2VPHUC9R
	jemPuuEU9yAKaZ8OEDY7eov3x5H7pt/B0+gHOaJI+OLBwu6tLfDvDiEQXOdj/OIAqLwEgX
	tR/5Fw3CHrpPOc0BGzLinXUnmcHNul3DQfClLtq6Bpi0IGVSngfmTKOBfBKpRI9vBxipv0
	8dv5yn+h3VdVtOYJ2b436vHn7QFFzNA9HM7jFIgTu8bBfr1TEP/NtBgGhdmIrT2yCT6HlW
	zoxP9AVU9B9oofhvWE3s+vDGXxo+uE4xfiRWze2cw1Bn/uTPbSoPvsGuNBiCoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:46:15 +0200
Message-Id: <DJAIPZ8J0D0P.3TE0WU9RACO37@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: clarify/correct glossary entries for
 package variables
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <be79bec5-1707-ee8b-3688-a21de2e31dae@crashcourse.ca>
In-Reply-To: <be79bec5-1707-ee8b-3688-a21de2e31dae@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:46:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9743

Hi,

On Fri Jun 12, 2026 at 2:46 PM CEST, Robert P. J. Day wrote:
>
> Either clarify or correct the packaging backend information for the
> package exclusion variables:
>
>   - PACKAGE_EXCLUDE
>   - BAD_RECOMMENDATIONS
>   - NO_RECOMMENDATIONS
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>     while i ponder how to rewrite the dev manual section for these
> variables, we can at least fix the glossary entries.
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index df3666f1c..1b98ab5ea 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -300,6 +300,9 @@ system and gives an overview of their function and co=
ntents.
>        variable), the OpenEmbedded build system ignores your request and
>        will install the packages to avoid dependency errors.
>
> +      This variable is supported for the RPM and IPK packaging backends,
> +      but not for DEB.
> +
>        See the :term:`NO_RECOMMENDATIONS` and the
>        :term:`PACKAGE_EXCLUDE` variables for related
>        information.
> @@ -6498,8 +6501,7 @@ system and gives an overview of their function and =
contents.
>           functionality, such as kernel modules. It is up to you to add
>           packages with the :term:`IMAGE_INSTALL` variable.
>
> -      This variable is only supported when using the IPK and RPM
> -      packaging backends. DEB is not supported.
> +      This variable is supported for all three packaging backends.

This was suggested by Quentin and I agree: just say "all packaging backends=
".

>
>        See the :term:`BAD_RECOMMENDATIONS` and
>        the :term:`PACKAGE_EXCLUDE` variables for
> @@ -6930,8 +6932,7 @@ system and gives an overview of their function and =
contents.
>        an iterative development process to remove specific components fro=
m a
>        system.
>
> -      This variable is supported by all of the RPM, DEB and IPK
> -      packaging backends.
> +      This variable is supported for all three packaging backends.

Same here

>
>        See the :term:`NO_RECOMMENDATIONS` and the
>        :term:`BAD_RECOMMENDATIONS` variables for

Antonin

