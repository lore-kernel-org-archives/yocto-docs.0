Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E48C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:31:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18972.1784795464967520573
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 01:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nb6keFh8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C05601A119F;
	Thu, 23 Jul 2026 08:31:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 930CA602B8;
	Thu, 23 Jul 2026 08:31:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56D7711C101AC;
	Thu, 23 Jul 2026 10:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784795462; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oHd9ovpJrWuNpC+/0d9Ylknv2s6Uw/hdstX/e4Jc8Yc=;
	b=nb6keFh8tV5/8yVPMfddtynqh6e8oFp3c1r7mc89rIdszUGYF8e5Hy/wpdch2h3AvXOWlG
	IQyOw9L8oZ+ZCuxKUZS/+kwklhr2g+9tk7GHq3/Ew3fywl4F9anV5O4rH2qHtXqR+Hg1/u
	zbS0FmyS3a4FCMTis8+AaC09CfZ8V0gHRcFZQsLick6f+EG3jbjAitXuhcjXuoz/pReiRn
	n9ysDs9EDKg/4gkxGyFkwXstQQuJ2J/wB9B9DNpQD1oTrVNIJvcLGC47Yu5becN/0xHY4Z
	xrrcEskORSVwEJnggrWMAlWXJ/SnoJr+7VWYd67nqubYHwfUIRcZSaQ7xzeqpg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 10:31:00 +0200
Message-Id: <DK5T6RF9NDIP.1E6GL6Q640C0R@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <JPEWhacker@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH] variables: Update variable documentation for SPDX
 license expressions
References: <20260722184853.188733-1-JPEWhacker@gmail.com>
In-Reply-To: <20260722184853.188733-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jul 2026 08:31:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10117

Hi,

On Wed Jul 22, 2026 at 8:48 PM CEST, Joshua Watt via lists.yoctoproject.org=
 wrote:
> Updates the documentation for the variables affected by the transition
> to using SPDX license expressions
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 46 ++++++++++++++------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 394797ca3..599ef6f2e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4806,6 +4806,12 @@ system and gives an overview of their function and=
 contents.
>        - ``GPL-3.0*``: ``GPL-3.0-only``, ``GPL-3.0-or-later``
>        - ``LGPL-3.0*``: ``LGPL-3.0-only``, ``LGPL-3.0-or-later``
> =20
> +      If a license in :term:`LICENSE` has an exception listed using the
> +      ``WITH`` operator, the license will still match this variable and =
the
> +      license will not be allowed. To explicitly allow an SPDX license
> +      exception to a license, the exception must be listed in
> +      :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
> +
>        .. note::
> =20
>           This functionality is only regularly tested using the following
> @@ -4819,12 +4825,12 @@ system and gives an overview of their function an=
d contents.
>           are required to produce a functional system image.
> =20
>     :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
> -      Specifies a space-separated list of package and license pairs that
> -      are allowed to be used even if the license is specified in
> -      :term:`INCOMPATIBLE_LICENSE`. The package and license pairs are
> -      separated using a colon. Example::
> +      Specifies a space-separated list of package and SPDX license or SP=
DX
> +      license exception pairs that are allowed to be used even if the li=
cense
> +      is specified in :term:`INCOMPATIBLE_LICENSE`. The package and lice=
nse
> +      pairs are separated using a colon. Example::
> =20
> -         INCOMPATIBLE_LICENSE_EXCEPTIONS =3D "gdbserver:GPL-3.0-only gdb=
server:LGPL-3.0-only"
> +         INCOMPATIBLE_LICENSE_EXCEPTIONS =3D "gdbserver:GPL-3.0-only gdb=
server:LGPL-3.0-only gdbserver:GCC-exception-3.1"

I guess you meant "gcc:GCC-exception-3.1"?

> =20
>     :term:`INHERIT`
>        Causes the named class or classes to be inherited globally. Anonym=
ous
> @@ -5945,27 +5951,24 @@ system and gives an overview of their function an=
d contents.
> =20
>     :term:`LICENSE`
>        This is a required field in an OpenEmbedded recipe file, and shoul=
d
> -      contain a list of source licenses for the recipe. Follow these rul=
es:
> -
> -      -  Do not use spaces within individual license names.
> +      contain a :term:`SPDX License Expression` that describes the sourc=
e
> +      license(s) for the recipe. Keep in mind a few rules:
> =20
> -      -  Separate license names using \| (pipe) when there is a choice
> -         between licenses.
> +      -  Separate license name using ``OR`` when there is a choice betwe=
en
> +         licenses
> =20
> -      -  Separate license names using & (ampersand) when there are
> -         multiple licenses for different parts of the source.
> +      -  Separate license names using ``AND`` when multiple licenses app=
ly to
> +         different parts of the source code
> =20
> -      -  You can use spaces between license names.
> +      -  All licenses must be valid SPDX License Identifiers

Add a quick link here?

`SPDX License Identifiers <https://spdx.org/licenses/>`__

> =20
> -      -  For standard licenses, use the names of the files in
> -         ``meta/files/common-licenses/`` or the
> -         :term:`SPDXLICENSEMAP` flag names defined in
> -         ``meta/conf/licenses.conf``.
> +      -  Any License that does not come from the SPDX License list

Same link:

`SPDX License List <https://spdx.org/licenses/>`__

> +         must be prefixed with ``LicenseRef-``.
> =20
>        Here are some examples::
> =20
> -         LICENSE =3D "LGPL-2.1-only | GPL-3.0-only"
> -         LICENSE =3D "MPL-1.0 & LGPL-2.1-only"
> +         LICENSE =3D "LGPL-2.1-only OR GPL-3.0-only"
> +         LICENSE =3D "MPL-1.0 AND LGPL-2.1-only"
>           LICENSE =3D "GPL-2.0-or-later"
> =20
>        The first example is from the
> @@ -5981,15 +5984,14 @@ system and gives an overview of their function an=
d contents.
>        but has accompanying documentation licensed under the GNU Free
>        Documentation License 1.2 could be specified as follows::
> =20
> -         LICENSE =3D "GFDL-1.2 & GPL-2.0-only"
> +         LICENSE =3D "GFDL-1.2 AND GPL-2.0-only"
>           LICENSE:${PN} =3D "GPL-2.0.only"
>           LICENSE:${PN}-doc =3D "GFDL-1.2"
> =20
>        .. note::
> =20
>           A recipe's :term:`LICENSE` value must be accompanied by an asso=
ciated
> -         :term:`LIC_FILES_CHKSUM` value, except in the special case wher=
e
> -         the :term:`LICENSE` value is set to "CLOSED".
> +         :term:`LIC_FILES_CHKSUM` value.
> =20
>     :term:`LICENSE_CREATE_PACKAGE`
>        Setting :term:`LICENSE_CREATE_PACKAGE` to "1" causes the OpenEmbed=
ded

Thanks!
Antonin

