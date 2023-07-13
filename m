Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B3DEB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 06:13:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.12879.1689315178956668998
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Jul 2023 23:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qKC2y-0007E1-HT; Fri, 14 Jul 2023 08:12:56 +0200
Received: from uol by pty.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qKC2x-008pVM-9t; Fri, 14 Jul 2023 08:12:55 +0200
References: <20230712220332.1630850-1-u.oelmann@pengutronix.de>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: yocto@pengutronix.de, Ulrich =?utf-8?Q?=C3=96lmann?=
 <u.oelmann@pengutronix.de>
Subject: Re: [PATCH 1/3] ref-manual: classes: kernel-fitimage: fix variable
 name
Date: Thu, 13 Jul 2023 19:15:39 +0200
In-reply-to: <20230712220332.1630850-1-u.oelmann@pengutronix.de>
Message-ID: <6r351rt40o.fsf@pengutronix.de>
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
 <docs@lists.yoctoproject.org>; Fri, 14 Jul 2023 06:13:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4047

On Thu, Jul 13 2023 at 00:03 +0200, Ulrich =C3=96lmann <u.oelmann@pengutron=
ix.de> wrote:
> The actual code in kernel-fitimage.bbclass checks if "fitImage" is listed=
 in
> KERNEL_IMAGETYPES (see e.g. [1]) whereas the class does not use KERNEL_IM=
AGETYPE
> at all.
>
> [1] https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel-fit=
image.bbclass?h=3D4.3_M1&id=3Dcc97d775cb402df0d4122bf54eab1a5198c98471#n9

I just stumbled across [2] in kernel.bbclass where KERNEL_IMAGETYPE and
KERNEL_ALT_IMAGETYPE are merged into KERNEL_IMAGETYPES so that my
statement in this patch is not correct. Thus, please do not apply this
series, I am going to send a v2.

Best regards
Ulrich


[2] https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel.bbcla=
ss?h=3D4.3_M1&id=3Dcc97d775cb402df0d4122bf54eab1a5198c98471#n74

>
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  documentation/ref-manual/classes.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index e555a80b5af9..c3fa9a86966e 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1599,8 +1599,8 @@ an optional :term:`Initramfs` bundle, an optional R=
AM disk, and any number of
>  device trees.
>
>  To create a FIT image, it is required that :term:`KERNEL_CLASSES`
> -is set to include ":ref:`ref-classes-kernel-fitimage`" and :term:`KERNEL=
_IMAGETYPE`
> -is set to "fitImage".
> +is set to include ":ref:`ref-classes-kernel-fitimage`" and :term:`KERNEL=
_IMAGETYPES`
> +is set to include "fitImage".
>
>  The options for the device tree compiler passed to ``mkimage -D``
>  when creating the FIT image are specified using the
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

