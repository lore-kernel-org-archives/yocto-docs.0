Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C2CCDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 07:56:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38318.1782114999129186919
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 00:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=j4nJn0JZ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF63F4E405D6;
	Mon, 22 Jun 2026 07:56:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94D72601BB;
	Mon, 22 Jun 2026 07:56:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07667106C819E;
	Mon, 22 Jun 2026 09:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782114996; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XKQq736WijotFj8A6Nih3gcJj7x/ix+2zjDvlDP2VWI=;
	b=j4nJn0JZcUXjr0P5gVTAfWIbo7p9IIEk7dsryJLVqqsiFyMJxhZPp1LrTM1HEAJQuHFFjN
	sa6WlzZxH3jK+SyVUjn7Bt0K0QfiBEvuPc6C0Y531DqgqsmFOczESyailRC7ceIRP9SZ3d
	ZuidTFmc9cRX3JgHyXr3ACDAEkGd259vWKjXx7zbPgTEEu2i6K/u+Xnl8KfOZ4lliLTpwO
	PZLg09n77GrdrNMFjpI9oO/DFMgBBB3slCd+pilNk0d9dyhIxdmJoL4FneOSAF0OrBV7RI
	Nfz7WjqCtnwKDzAssVxb+3SNBdc8LsL+XzjBo5iLV0A11eCoxnF5N6SvgBbJKg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 09:56:33 +0200
Message-Id: <DJFF1HYZORWJ.5OQ9DH18UIL8@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] security-manual: clarify text on avoiding root
 logins, empty passwords
References: <e743d15e-b808-f571-22ae-7034e0155914@crashcourse.ca>
In-Reply-To: <e743d15e-b808-f571-22ae-7034e0155914@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 07:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9815

On Fri Jun 19, 2026 at 3:39 PM CEST, Robert P. J. Day wrote:
>
> Explain how, during development, it's convenient to allow root logins
> and empty passwords in one of two ways:
>
>   - explicitly setting image features, or
>   - through an available configuration fragment
>
> and advise on removing such settings for the production image.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/security-manual/securing-images.rst b/document=
ation/security-manual/securing-images.rst
> index 952808f3b..457921b34 100644
> --- a/documentation/security-manual/securing-images.rst
> +++ b/documentation/security-manual/securing-images.rst
> @@ -92,21 +92,20 @@ Considerations Specific to the OpenEmbedded Build Sys=
tem
>  You can take some steps that are specific to the OpenEmbedded build
>  system to make your images more secure:
>
> --  Ensure that "allow-empty-password", "allow-root-login", or
> -   "empty-root-password" are not one of your selected :term:`IMAGE_FEATU=
RES`.
> -   When creating a new project, the default is to provide you with an
> -   initial ``local.conf`` file that enables these features using the
> -   :term:`EXTRA_IMAGE_FEATURES`
> -   variable with the line::
> +-  During development, it's convenient to relax security in your builds
> +   and allow the use of empty passwords or root logins. This is typicall=
y
> +   done by adding the values "allow-empty-password", "allow-root-login",=
 and
> +   "empty-root-password" to your build's image features, commonly with t=
he
> +   addition of the line:
>
>        EXTRA_IMAGE_FEATURES =3D "allow-empty-password empty-root-password=
 allow-root-login"
>
> -   To disable these features, simply comment out that line in your
> -   ``local.conf`` file, or make sure :term:`IMAGE_FEATURES` does not con=
tain
> -   any of these features before producing your final image. Among other =
things,
> -   leaving this in place sets the root password as blank, which makes
> -   logging in for debugging or inspection easy during development but
> -   also means anyone can easily log in during production.
> +   to your ``local.conf`` file, or by enabling the exactly equivalent
> +   configuration fragment "root-login-with-empty-password.conf".
> +
> +   If you're using either of these approaches during development,
> +   make sure you remove or de-activate these settings before generating
> +   your final production image.

Thanks, FYI I've taken this with the following change:

-   configuration fragment "root-login-with-empty-password.conf".
+   configuration fragment :ref:`ref-fragments-root-login-with-empty-passwo=
rd`.

(Each fragment has a ref like this one)

Antonin

