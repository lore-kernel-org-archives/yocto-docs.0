Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5832FCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:00:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156448.1781622016178189221
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 08:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Nge3e0pT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F37E71A395A
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:00:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFEC3601A9;
	Tue, 16 Jun 2026 15:00:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4C72106C9E9E;
	Tue, 16 Jun 2026 17:00:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781622013; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rFS6566jl+KXKupUSl1644NGdTbam/ey959dtiX68s8=;
	b=Nge3e0pTnEjQJb2z2Oz9a26cbMB+NDo86ejjtFl8nbPFede6/0X2MBFKhL4m5LXMszs4j0
	b/i5jTOmnQbLHvCaUXOKctnBC3tE5KzkSspbml8RVwekQ9PA8hU4Idb6ZdhuoWr6CC/DPc
	ZImEH/Xe3jl9ga6R7ouocg/2IP5EhquLuxitsOyfTX9Q9rQ0/ryFxhWKLhX6JGExE4uUcz
	ap2+qLrKyhBNOsXITEC724zCREiLRAcs/f+ryzLxjst9qk2lWHygBY/YTMaQlFieR2KMVB
	zbWM1HiWjzsNyhljKmMKdzP3hQdy9GldjuxDCI3oR27Y3nCehOhctI1f05xVNg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:00:11 +0200
Message-Id: <DJAKAL8C465B.CTTNV2GIAZN0@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] test-manual: add more detail to the ptest
 section
References: <46ed8884-f3d1-ee7d-1da6-a73a6e07c74c@crashcourse.ca>
In-Reply-To: <46ed8884-f3d1-ee7d-1da6-a73a6e07c74c@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:00:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9749

Hi,

On Tue Jun 16, 2026 at 11:34 AM CEST, Robert P. J. Day wrote:
>
> Expand the ptest section to show how to distinguish between adding all
> ptest packages to an image versus adding only a selected set of
> packages to the image.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   The ptest section really should be considerably longer, perhaps
> using actual examples from the OE-Core code base. But I'll add just
> this bit for now.
>
> diff --git a/documentation/test-manual/ptest.rst b/documentation/test-man=
ual/ptest.rst
> index 1c946f81d..dc493b72c 100644
> --- a/documentation/test-manual/ptest.rst
> +++ b/documentation/test-manual/ptest.rst
> @@ -31,12 +31,29 @@ see the :yocto_wiki:`Ptest </Ptest>` wiki page.
>  Adding ptest to Your Build
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> -To add package testing to your build, add the :term:`DISTRO_FEATURES` an=
d
> -:term:`EXTRA_IMAGE_FEATURES` variables to your ``local.conf`` file, whic=
h
> -is found in the :term:`Build Directory`::
> +Adding package testing to your image is done in two steps:
> +
> +#. Select that all ptest packages should be built and packaged, and
> +
> +#. Identify which of those ptest packages to add to your image.
> +
> +First, in order to build all ptest packages, add the following line
> +to your ``local.conf`` file::

While we're at it: s/to your ``local.conf`` file/to a :term:`configuration =
file`/

>
>     DISTRO_FEATURES:append =3D " ptest"
> -   EXTRA_IMAGE_FEATURES +=3D "ptest-pkgs"
> +
> +Note that this will cause all ptest packages to be built and packaged,
> +but will not add any of those packages to your image; that comes in
> +the next step. You can then add ptest packages to your image in one of t=
wo ways.
> +
> +#. If you want to add *all* of the generated ptest packages, add the lin=
e::
> +
> +      EXTRA_IMAGE_FEATURES +=3D "ptest-pkgs"
> +
> +#. On the other hand, if you want to add only a select few of the ptest
> +   packages, you can use some variation of::
> +
> +      IMAGE_INSTALL:append =3D " e2fsprogs-ptest zlib-ptest"

You can also say:

"""
You can list available ptest packages with:

.. code-block:: console

   oe-pkgdata-util list-pkgs "*-ptest"

>
>  Once your build is complete, the ptest files are installed into the
>  ``/usr/lib/package/ptest`` directory within the image, where ``package``


Antonin

