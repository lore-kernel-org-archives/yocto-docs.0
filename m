Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5F5C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 04:47:40 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41098.1784695652759862717
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 21:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A5FDB202095;
	Wed, 22 Jul 2026 06:47:29 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1wmOrh-000gJG-1v;
	Wed, 22 Jul 2026 06:47:29 +0200
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1wmOrh-0000000C3bO-24Eh;
	Wed, 22 Jul 2026 06:47:29 +0200
From: =?utf-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH] migration-guide: Add guide for converting licenses
In-Reply-To: <20260721214707.2129954-1-JPEWhacker@gmail.com> (Joshua Watt via
	lists yoctoproject org's message of "Tue, 21 Jul 2026 15:47:07 -0600")
References: <20260721214707.2129954-1-JPEWhacker@gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 22 Jul 2026 06:47:29 +0200
Message-ID: <6ry0f3bpge.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 04:47:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10106

Hi Joshua,

just a few typos I came across.

On Tue, Jul 21 2026 at 15:47 -0600, "Joshua Watt via lists.yoctoproject.org=
" <JPEWhacker=3Dgmail.com@lists.yoctoproject.org> wrote:
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
>=20=20
>     oe.utils.any_distro_features("x y", ...) -> bb.utils.contains_any("DI=
STRO_FEATURES", "x y", ...)
>=20=20
> +``LICENSE`` is now a SPDX License Expression
> +--------------------------------------------
> +
> +The ``LICENSE`` variable is now an `SPDX License Expression`_ instead of=
 the
> +custom license expressions that have been used historically.
> +
> +The changes required for the new expressions are as follows:

I'm unsure, should there be an empty line here before the enumerated
list in RST?

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
> +   prefix) or ``NO_GENERIC_LICENSE`` is unchanged, and may still be used.
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

s/when you this/when you do this/

> +   point to your license file.
> +
> +6. The ``WITH`` operator should now be used to describe an exception to a
> +   license, instead of a bespoke license identifier. For example, the old
> +   bespoke license ``Apache-2.0-with-LLVM-exception`` would become
> +   ``Apache-2.0 WITH LLVM-exception``.
> +
> +7. Because of the change to use ``WITH`` instead of bespoke licenses, th=
ere is
> +   a change in how ``INCOMPATIBLE_LICENSE`` works. Anything listed in th=
is
> +   variable will match a single licenses (unchanged), but it will also m=
atch the

s/will match a single licenses/will match a single license/

Best regards,
Ulrich


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
> +   expansion. Now, however, the licenses will match because they are e.g.
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
>=20=20
> @@ -93,3 +148,6 @@ Removed classes
>=20=20
>  Miscellaneous changes
>  ---------------------
> +
> +.. _SPDX License Expression: https://spdx.github.io/spdx-spec/v3.0.1/ann=
exes/spdx-license-expressions/
> +.. _SPDX License Identifier: https://spdx.org/licenses/
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

