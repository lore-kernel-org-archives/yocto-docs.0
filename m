Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E9DD4978C
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 19:27:04 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.158359.1733081221508456805
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Dec 2024 11:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1tHpat-0000H8-PS; Sun, 01 Dec 2024 20:26:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1tHpar-001AiO-3D;
	Sun, 01 Dec 2024 20:26:58 +0100
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1tHpas-008kzS-2C;
	Sun, 01 Dec 2024 20:26:58 +0100
From: =?utf-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
To: "Michael Opdenacker via lists.yoctoproject.org"
 <michael.opdenacker=rootcommit.com@lists.yoctoproject.org>
Cc: docs@lists.yoctoproject.org,  michael.opdenacker@rootcommit.com
Subject: Re: [docs] [PATCH 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
In-Reply-To: <20241201173801.3290796-3-michael.opdenacker@rootcommit.com>
	(Michael Opdenacker via lists yoctoproject org's message of "Sun, 01
	Dec 2024 17:38:10 +0000 (UTC)")
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
	<20241201173801.3290796-3-michael.opdenacker@rootcommit.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Sun, 01 Dec 2024 20:26:58 +0100
Message-ID: <6rwmgj6w71.fsf@pengutronix.de>
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
 <docs@lists.yoctoproject.org>; Sun, 01 Dec 2024 19:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5861

Hey Michael,

On Sun, Dec 01 2024 at 17:38 +0000, "Michael Opdenacker via lists.yoctoproj=
ect.org" <michael.opdenacker=3Drootcommit.com@lists.yoctoproject.org> wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> - Remove duplicate instructions
>
> - Detail how to run bmaptool directly if you installed it on your host
>   instead of building it through the ``bmaptool-native`` recipe,
>   as running "oe-run-native bmaptool-native bmaptool ..." won't work
>   in this case.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  documentation/dev-manual/bmaptool.rst | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
> index 5fc46c7792..e17074b65b 100644
> --- a/documentation/dev-manual/bmaptool.rst
> +++ b/documentation/dev-manual/bmaptool.rst
> @@ -44,14 +44,16 @@ any type of image. Use these steps to flash an image =
using `bmaptool`:
>     depending on your particular setup. The following commands assume the
>     image resides in the :term:`Build Directory`'s ``deploy/images/`` are=
a:
>
> -   -  If you have write access to the media, use this command form::
> +   -  If needed, set permissions to get write access to the media::
>
> -         $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
> +         $ such chmod 666 /dev/sdX

a small typo slipped in here: s/such/sudo/

Best regards
Ulrich


> +
> +   -  If you installed the package for `bmaptool`, you can directly run::
> +
> +         $ sudo bmaptool copy build-directory/tmp/deploy/images/machine/=
image.wic /dev/sdX
>
> -   -  If you do not have write access to the media, set your permissions
> -      first and then use the same command form::
> +   -  Otherwise, if you built `bmaptool` with BitBake, run::
>
> -         $ sudo chmod 666 /dev/sdX
>           $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
>
>  For help on the ``bmaptool`` command, use the following command::
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5860): https://lists.yoctoproject.org/g/docs/message/=
5860
> Mute This Topic: https://lists.yoctoproject.org/mt/109865516/3618626
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [u.oelmann@pengu=
tronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

