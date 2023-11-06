Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EE1C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:49:09 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.51480.1699267744177396233
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qzxAD-0007rp-FJ; Mon, 06 Nov 2023 11:49:01 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qzxAC-0070O3-Kx; Mon, 06 Nov 2023 11:49:00 +0100
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qzxAC-008lI6-Bf; Mon, 06 Nov 2023 11:49:00 +0100
References: <cover.1699266393.git.bluelightning@bluelightning.org>
 <dab7f691e3716938a7f05d62f0ff1a6026bc5ac8.1699266393.git.bluelightning@bluelightning.org>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 09/12] release-notes-4.3: feature additions
Date: Mon, 06 Nov 2023 11:45:17 +0100
In-reply-to: <dab7f691e3716938a7f05d62f0ff1a6026bc5ac8.1699266393.git.bluelightning@bluelightning.org>
Message-ID: <6rfs1ji2cj.fsf@pengutronix.de>
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
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:49:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4601

Hi Paul,

thanks for sharing your work early!

On Mon, Nov 06 2023 at 23:29 +1300, "Paul Eggleton" <bluelightning@blueligh=
tning.org> wrote:
> Some additional feature items from combing through commits (not 100%
> complete yet.)
>
> Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
> ---
>  .../migration-guides/release-notes-4.3.rst    | 98 ++++++++++++++++++-
>  1 file changed, 96 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
> index dc689c30ada..07317888a7e 100644
> --- a/documentation/migration-guides/release-notes-4.3.rst
> +++ b/documentation/migration-guides/release-notes-4.3.rst

[...]

> @@ -225,6 +307,18 @@ New Features / Enhancements in 4.3
>        :term:`SPLASH_IMAGES`, instead of a harder to generate and modify
>        ``.h`` file.
>=20=20
> +   -  The ; character is no longer needed to separate functions specifie=
d in
> +      :term:`IMAGE_POSTPROCESS_COMMAND`, :term:`IMAGE_POSTPROCESS_COMMAN=
D`,

The term IMAGE_POSTPROCESS_COMMAND is enumerated twice here.

Best regards
Ulrich


> +      :term:`POPULATE_SDK_POST_HOST_COMMAND`, :term:`ROOTFS_POSTINSTALL_=
COMMAND`
> +      etc. (If any are present they will be replaced with spaces, so exi=
sting
> +      metadata does not yet need to be changed.)
> +
> +   -  In the ``Upstream-Status`` field in a patch header, "Accepted" is =
no longer
> +      a valid value since it is logically the same as "Backport". Change=
 any
> +      values you have (particularly in patches applied through bbappends=
 for core
> +      recipes, since they will be validated as indicated above).
> +
> +
>  Known Issues in 4.3
>  ~~~~~~~~~~~~~~~~~~~
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

