Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF3BE7E652
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 16:41:15 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.24395.1695746465265707376
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Sep 2023 09:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qlB7P-00083V-0u; Tue, 26 Sep 2023 18:41:03 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qlB7N-0099GV-JJ; Tue, 26 Sep 2023 18:41:01 +0200
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qlB7M-002KEA-RY; Tue, 26 Sep 2023 18:41:00 +0200
References: <20230926160049.1537656-1-JPEWhacker@gmail.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: richard.purdie@linuxfoundation.org, docs@lists.yoctoproject.org
Subject: Re: [docs][RFC] overview: Add note about non-reproducibility side
 effects
Date: Tue, 26 Sep 2023 18:38:12 +0200
In-reply-to: <20230926160049.1537656-1-JPEWhacker@gmail.com>
Message-ID: <6r1qekubtv.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Sep 2023 16:41:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4300

Hi Joshua!

On Tue, Sep 26 2023 at 10:00 -0600, "Joshua Watt" <JPEWhacker@gmail.com> wr=
ote:
> Adds an additional note about some of the side effects that can occur if
> recipes are not reproducible and hash equivalence is enabled.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/overview-manual/concepts.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
> index af825a98c..0c2f148c8 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1963,6 +1963,14 @@ task output from the Shared State cache.
>     the stability of the task's output hash. Therefore, the effectiveness
>     of Hash Equivalence strongly depends on it.
>=20=20
> +   Recipes that are not reproducible may have undesired behavior if hash
> +   equivalence is enabled, since the non-reproducible diverging output m=
aybe be
> +   remapped to an older sstate object in the cache by the server. If a r=
ecipe
> +   is non-reprodible in trivial ways, such as different timestamps this =
is

s/non-reprodible/non-reproducible/

> +   likely not a problem. However recipes that have more dramatic changes=
 (such
> +   as completely different file names) will likely outright fail since t=
he
> +   downstream sstate objects not actually equivalent to what was just bu=
ilt.

s/objects not/objects are not/ ?

Best regards
Ulrich


> +
>  This applies to multiple scenarios:
>=20=20
>  -  A "trivial" change to a recipe that doesn't impact its generated outp=
ut,
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

