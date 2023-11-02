Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24CCC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 09:58:26 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.27094.1698919098344818723
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 02:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qyUSu-0002Ck-2m; Thu, 02 Nov 2023 10:58:16 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qyUSs-0062U0-SL; Thu, 02 Nov 2023 10:58:14 +0100
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qyUSs-002vfd-JN; Thu, 02 Nov 2023 10:58:14 +0100
References: <20231027092935.1601588-1-michael.opdenacker@bootlin.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: michael.opdenacker@bootlin.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, "Michael Opdenacker via
 lists.yoctoproject.org"
 <michael.opdenacker=bootlin.com@lists.yoctoproject.org>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document KERNEL_LOCALVERSION
Date: Thu, 02 Nov 2023 10:55:23 +0100
In-reply-to: <20231027092935.1601588-1-michael.opdenacker@bootlin.com>
Message-ID: <6rjzr0tr2h.fsf@pengutronix.de>
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
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 09:58:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4564

Hi Michael,

just a small typo, otherwise a good description.

On Fri, Oct 27 2023 at 11:29 +0200, "Michael Opdenacker via lists.yoctoproj=
ect.org" <michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Introduced by
> https://git.yoctoproject.org/poky/commit/?id=3D66ed174ccdf7a89cb998f503cc=
6b631e2d1adcc0
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 03234d3f78..771eb91af6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2485,6 +2485,16 @@ system and gives an overview of their function and=
 contents.
>        external tools. See the :ref:`ref-classes-kernel-yocto` class in
>        ``meta/classes-recipe`` to see how the variable is used.
>=20=20
> +   :term:`KERNEL_LOCALVERSION`
> +      This variable allows to appends a string to the version

s/appends/append/

Thanks and best regards
Ulrich


> +      of the kernel image. This corresponds to the ``CONFIG_LOCALVERSION=
``
> +      kernel configuration parameter.
> +
> +      Using this variable is only useful when you are using a kernel rec=
ipe
> +      inheriting the :ref:`ref-classes-kernel` class, and which doesn't
> +      already set a local version. Therefore, setting this variable has =
no
> +      impact on ``linux-yocto`` kernels.
> +
>     :term:`EXTERNAL_TOOLCHAIN`
>        When you intend to use an
>        :ref:`external toolchain <dev-manual/external-toolchain:optionally=
 using an external toolchain>`,
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

