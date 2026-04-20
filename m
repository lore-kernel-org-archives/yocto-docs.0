Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68737F557E8
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 08:44:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15483.1776674683144843656
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 01:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SPC754la;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E6CEB1A32D5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 08:44:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B02EA5FFA5;
	Mon, 20 Apr 2026 08:44:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B5A110460BFA;
	Mon, 20 Apr 2026 10:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776674680; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JfpuPvRfHjBFjDUxM+ZmXbC9BRYk6UbbWieqGpkouZ0=;
	b=SPC754laEdViaC6QTYT+ZJeEm7RgRLPkXBcwciGAfqB+2pp9w/7UlR0KUPzhIizefYANPo
	QJldG0zTonDvtBCCRJsUC5t8mbudSzBB5Qq7DhHxhaKVVOelxpwVU2a58EU+VOzbjdRBST
	sx8QHDR8+KELrDU6XuF/P+xem+6+zw1VClX6AWOvgaZ6+vF2NagemipO+at1u/e4bYK0q/
	DlPj943qXXCicXDqIcYqTpqjjJXgbM2Uw7eWvhIM9qkqJVS2U4G+3ikeBxwabI+bs9ioXu
	VyLWjl1ZHLWcRzamcmkfANwQagF1LbGCruNxy8IrAsyT3EkCHiGCHLM9Mt7M6w==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: docs@lists.yoctoproject.org, Quentin Schulz <quentin.schulz@cherry.de>
Cc: antonin.godard@bootlin.com
Subject: 
 Re: [docs] [PATCH] variables: add precision about special characters in
 CVE_PRODUCT
Date: Mon, 20 Apr 2026 10:44:38 +0200
Message-ID: <5v7y3T16QOu0Rgt-hsIBrA@bootlin.com>
In-Reply-To: <4fd140a8-d461-4fd7-866d-d9c3e701c3cf@cherry.de>
References: 
 <20260420-cve-product-v1-1-812a75eba43b@bootlin.com>
 <4fd140a8-d461-4fd7-866d-d9c3e701c3cf@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 08:44:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9281

On Monday, April 20, 2026 at 10:35=E2=80=AFAM, Quentin Schulz wrote:
> Hi Benjamin,
>=20
> On 4/20/26 10:18 AM, Benjamin Robin via lists.yoctoproject.org wrote:
> > Indicate that special characters must not be escaped in CVE_PRODUCT
> > starting from Wrynose.
> >=20
>=20
> This probably should be part of the migration manual as well then so it=20
> isn't missed when users upgrade.

Sadly, I will not have time to do that, but I can provide all the informati=
on
needed for any one who want to write that part.
=20
> It'd be extra nice if we had a commit hash in bitbake/oe-core related to=
=20
> this change

The first commit that change this behavior is:
9dd9c0038907340ba08ff4c8ee06a8748c1ac00a

A second commit was added to improve it:
3c73dafd03b1ec1f2725981664db9541fba0142b

And a third commit was added to temporarily keep the compatibility:
b86c5ecdc0699cf6ab50e2a24e2b32e42ee7ed54
But the plan is to drop (revert) this commit after a few months...
=20
> > Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> > ---
> >   documentation/ref-manual/variables.rst | 3 +++
> >   1 file changed, 3 insertions(+)
> >=20
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref=
=2Dmanual/variables.rst
> > index 317b75913396..edacb6be648d 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -2056,6 +2056,9 @@ system and gives an overview of their function an=
d contents.
> >=20
> >            CVE_PRODUCT =3D "vendor:package"
> >=20
> > +      Since Wrynose, special characters must not be escaped. For examp=
le,
>=20
> Maybe specify the version number for the release, not everybody is=20
> necessarily aware of the release names. In=20
> documentation/ref-manual/release-process.rst we word it like "Version=20
> X.Y ("Release name")", in some other places we have "release name (X.Y)".

I could replace it by: "Since Wrynose (6.0),"

> > +      ``webkitgtk+`` no longer needs to be written as ``webkitgtk\+``.
> > +
>=20
> "needs" is probably the wrong choice here, it indicates we could still=20
> be writing it in the latter form. Maybe something along the lines of:
>=20
> For example, the :term:`CVE_PRODUCT` variable for the ``webkitgtk+``=20
> recipe must no longer be written as ``webkitgtk\+`` but rather=20
> ``webkitgtk+``.
>=20
> would better fit the new behavior. What do you think?

I think this is indeed way better.

>=20
> Cheers,
> Quentin
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




