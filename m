Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5439C4451C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 07:27:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42775.1784705269428100114
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 00:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0hh9c8C0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0CDA24E40E9D
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 07:27:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CECB860388;
	Wed, 22 Jul 2026 07:27:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55AB511BD0424;
	Wed, 22 Jul 2026 09:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784705266; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4wNkFLxbb/gjJ9Kwv8azcDcRY1Lvtn2hbh+kSTIZ2KA=;
	b=0hh9c8C0llImQHMMLMOW1otKpuvACY50KqMKqcBB+rrhW4KriD2g+CkKLzGQnHXKT1fiBk
	nY1MSCngJMZMaIEVUjlNLyA5nfXJXCntUBYVT21ql8SxFx225PNoRNJ91Fpd8ILNJCP1tO
	GXB9CrN9L8jIJ8fdnnesuv3cwWvoRuXmM88xraA1EJvHO1IfEc3ibh8UEUHlgA4PObP+17
	9pH72Q8dDXyIIwMFQf7T1FiaHUxrKRfdlrwNUg2PK38fhIYqEcw0ZKTqLSRUGWWgHiIl0i
	TB2FExqj/lTi1xAgUyV9hu0TeA8ntQ2rjqzWDfRW16BZ+eTteMNDWT9WMQEfcw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 09:27:44 +0200
Message-Id: <DK4X7S13OQF3.1QZSEPR2SD10M@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <JPEWhacker@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH] migration-guide: Add guide for converting
 licenses
References: <20260721214707.2129954-1-JPEWhacker@gmail.com>
In-Reply-To: <20260721214707.2129954-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 07:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10107

Hi,

On Tue Jul 21, 2026 at 11:47 PM CEST, Joshua Watt via lists.yoctoproject.or=
g wrote:
> The LICENSE variable is now required to be SPDX license expressions, so
> provide a migration guide to describe the changes required to integrate
> this change
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../migration-guides/migration-6.1.rst        | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/documentation/migration-guides/migration-6.1.rst b/documenta=
tion/migration-guides/migration-6.1.rst
> index 8786cd699..48777e16c 100644
> --- a/documentation/migration-guides/migration-6.1.rst
> +++ b/documentation/migration-guides/migration-6.1.rst
> @@ -75,6 +75,61 @@ And::
> =20
>     oe.utils.any_distro_features("x y", ...) -> bb.utils.contains_any("DI=
STRO_FEATURES", "x y", ...)
> =20
> +``LICENSE`` is now a SPDX License Expression

s/a/an/

> +--------------------------------------------
> +
> +The ``LICENSE`` variable is now an `SPDX License Expression`_ instead of=
 the

s/``LICENSE``/:term:`LICENSE`/

This applies for all the variables below.

> +custom license expressions that have been used historically.
> +
> +The changes required for the new expressions are as follows:
> +1. The ``&`` operator is replaced with ``AND``
> +
> +2. The ``|`` operator is replaced with ``OR``
> +
> +3. Any license value which is not a valid `SPDX License Expression`_ is =
an
> +   error.
> +
> +4. Custom (non `SPDX License Identifier`_) licenses are still allowed, a=
s long
> +   as they are prefixed with ``LicenseRef-``. The behavior of looking fo=
r the
> +   license text in ``LICENSE_PATH`` (with or without the ``LicenseRef-``
> +   prefix) or ``NO_GENERIC_LICENSE`` is unchanged, and may still be used=
.
> +
> +5. ``CLOSED`` as a license is deprecated and will issue a warning. This =
license
> +   is effectively "no license" (usually meaning e.g. "All rights reserve=
d"),
> +   but a more precise definition is to provide some sort of actual licen=
se text
> +   using a custom license. This provides a more consistent definition of=
 the
> +   license text, since the meaning of "no license" may vary by jurisdict=
ion.
> +   Keep in mind that you can still have a common license file in
> +   ``LICENSE_PATH`` and refer to it with a ``LicenseRef-`` license. Note=
 that
> +   when you this, you will also need to provide a ``LIC_FILE_CHKSUM`` va=
lue to
> +   point to your license file.

I see most of the CLOSED licenses in OE-Core have been replaced with MIT, b=
ut I
also see "LicenseRef-PD" being used in other places. Maybe we could suggest
using one of the other as a replacement?

> +
> +6. The ``WITH`` operator should now be used to describe an exception to =
a
> +   license, instead of a bespoke license identifier. For example, the ol=
d
> +   bespoke license ``Apache-2.0-with-LLVM-exception`` would become
> +   ``Apache-2.0 WITH LLVM-exception``.
> +
> +7. Because of the change to use ``WITH`` instead of bespoke licenses, th=
ere is
> +   a change in how ``INCOMPATIBLE_LICENSE`` works. Anything listed in th=
is
> +   variable will match a single licenses (unchanged), but it will also m=
atch the
> +   left-hand (license) side of a ``WITH`` expression. To allow a license=
 with a
> +   specific SPDX license exception, the SPDX license exception must be l=
isted in
> +   ``INCOMPATIBLE_LICENSE_EXCEPTIONS``.
> +
> +   Practically speaking, the place where this comes up the most is when
> +   attempting to exclude GPLv3 code using ``INCOMPATIBLE_LICENSE``. Prev=
iously,
> +   this would have allowed any ``GPLv3-with-exception`` license, since t=
hey
> +   were bespoke licenses that did not match the ``GPL-3.0* LGPL-3.0*``
> +   expansion. Now, however, the licenses will match because they are e.g=
.
> +   ``GPL-3.0-or-later WITH exception``. As such, any exceptions to the G=
PLv3
> +   that should be allowed must be listed in
> +   ``INCOMPATIBLE_LICENSE_EXCEPTIONS``.
> +
> +Currently, the older syntax for license expressions is still parsed and
> +automatically converted to an SPDX License Expression, but a warning is =
issued
> +when this occurs. This support will eventually be removed and the only v=
alid
> +values for these variables will be SPDX License Expressions.
> +
>  Removed recipes
>  ---------------
> =20
> @@ -93,3 +148,6 @@ Removed classes
> =20
>  Miscellaneous changes
>  ---------------------
> +
> +.. _SPDX License Expression: https://spdx.github.io/spdx-spec/v3.0.1/ann=
exes/spdx-license-expressions/
> +.. _SPDX License Identifier: https://spdx.org/licenses/

Thanks!
Antonin

