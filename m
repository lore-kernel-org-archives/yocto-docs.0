Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F47DCD98E3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:06:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156776.1781622374005544974
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 08:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=y15gm6Da;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2D2B04E42E23
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:06:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01303601A9;
	Tue, 16 Jun 2026 15:06:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29117106C9CAE;
	Tue, 16 Jun 2026 17:06:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781622371; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wJgtxxknkFGoI9pzj1RSKtwhLHkOLM6ZMYdrWZ4hPqU=;
	b=y15gm6DaH0rwxQxf3YooBeKydNQyQJxCJK98pctO4ATMolyrqJuBZuideEJRug4zmrQTer
	jAu1hMYFzKwXMS2+Mj/nl5Qa+kas84fsxupjaNbXI2E7Fd0aOo3qw2BkTmg6cYnLwgTIme
	igDFJsQlTN9yqhM0cHoykvjJg+jcxZa0Olu2kSlXGJLk5yW4v6FoadgdHOubVP1JUx+TGl
	eVPBJBwMjTlhKShzmBvPcrSew7RL1ygWZDWfl4pSjyP0uapxeHALV6NPge/TcufwcDUTGL
	tVKxDxES6HirW/qf+1OEiS4yjXayEJgM3B0MnmEjmZFdpvAIGzGN1tjY56jyXg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:06:10 +0200
Message-Id: <DJAKF642PGUJ.38GYK6HMEVQ0I@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <eeebe32f-3a88-90e7-555f-96ada6016c5f@crashcourse.ca>
In-Reply-To: <eeebe32f-3a88-90e7-555f-96ada6016c5f@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:06:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9752

Hi,

On Tue Jun 16, 2026 at 3:17 PM CEST, Robert P. J. Day wrote:
>
> Warn the developer that if they need to set "PACKAGE_ARCH" in a
> custom packagegroup file, that setting must precede the "inherit
> packagegroup" line in the packagegroup recipe file.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/dev-manual/customizing-images.rst b/documentat=
ion/dev-manual/customizing-images.rst
> index 6eed9ef56..606252fe1 100644
> --- a/documentation/dev-manual/customizing-images.rst
> +++ b/documentation/dev-manual/customizing-images.rst
> @@ -183,6 +183,18 @@ build an image using these package group packages, y=
ou need to add
>  :term:`IMAGE_INSTALL`. For other forms of image dependencies see the oth=
er
>  areas of this section.
>
> +.. note::
> +
> +   If you're defining a packagegroup and need to set::
> +
> +      PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +   for the packagegroup, you need to do that *before* the
> +   ``inherit packagegroup`` line in the recipe file.
> +   Setting it afterward can break BitBake parsing, result in
> +   an "allarch" architecture mismatch error, or allow
> +   architecture-independent defaults to override your intent.
> +
>  Customizing an Image Hostname
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Again, I think this belongs to the packagegroup class documentation.

Antonin

