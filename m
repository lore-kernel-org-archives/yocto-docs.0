Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A650C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 14:37:28 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.15787.1676299043634592337
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 06:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1pRZxJ-0003dI-UI
	for docs@lists.yoctoproject.org; Mon, 13 Feb 2023 15:37:21 +0100
Received: from uol by pty.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1pRZxJ-00449O-3A
	for docs@lists.yoctoproject.org; Mon, 13 Feb 2023 15:37:21 +0100
References: <174331ACAD9BF3F3.21535@lists.yoctoproject.org>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add missing quotes
Date: Mon, 13 Feb 2023 15:36:33 +0100
In-reply-to: <174331ACAD9BF3F3.21535@lists.yoctoproject.org>
Message-ID: <6r3579pr6m.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Feb 2023 14:37:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3672

On Sun, Feb 12 2023 at 22:41 +0100, Ulrich =C3=96lmann <u.oelmann@pengutron=
ix.de> wrote:
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  documentation/ref-manual/variables.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index a36c4c6df962..c561aae6563a 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4275,7 +4275,7 @@ system and gives an overview of their function and =
contents.
>        To use the variable, set it in the append file for your kernel rec=
ipe
>        using the following form::
>=20=20
> -         KBUILD_DEFCONFIG_KMACHINE ?=3D defconfig_file
> +         KBUILD_DEFCONFIG_KMACHINE ?=3D "defconfig_file"
>=20=20
>        Here is an example from a "raspberrypi2" :term:`KMACHINE` build th=
at uses
>        a ``defconfig`` file named "bcm2709_defconfig"::

Please forget this one, just sent an update.

Best regards
Ulrich
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

