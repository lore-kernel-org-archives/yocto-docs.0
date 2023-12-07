Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511E9C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 13:59:27 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.84235.1701957557525270100
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Dec 2023 05:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1rBEuJ-00087X-32; Thu, 07 Dec 2023 14:59:15 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1rBEuH-00ECfo-Of; Thu, 07 Dec 2023 14:59:13 +0100
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1rBEuH-004Ws8-Fi; Thu, 07 Dec 2023 14:59:13 +0100
References: <20231207134322.3185149-1-ecordonnier@snap.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: ecordonnier@snap.com
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: document minidebuginfo
Date: Thu, 07 Dec 2023 14:54:47 +0100
In-reply-to: <20231207134322.3185149-1-ecordonnier@snap.com>
Message-ID: <6rzfymun9q.fsf@pengutronix.de>
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
 <docs@lists.yoctoproject.org>; Thu, 07 Dec 2023 13:59:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4665

Hi Etienne,

thanks for your documentation of minidebuginfo!

On Thu, Dec 07 2023 at 14:43 +0100, "Etienne Cordonnier via lists.yoctoproj=
ect.org" <ecordonnier=3Dsnap.com@lists.yoctoproject.org> wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  documentation/dev-manual/debugging.rst | 15 +++++++++++++++
>  documentation/ref-manual/features.rst  |  3 +++
>  2 files changed, 18 insertions(+)
>
> diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-m=
anual/debugging.rst
> index fea2cb30a..75dc53649 100644
> --- a/documentation/dev-manual/debugging.rst
> +++ b/documentation/dev-manual/debugging.rst
> @@ -1173,6 +1173,21 @@ To support this kind of debugging, you need do the=
 following:
>     Consider that this will reduce the application's performance and is
>     recommended only for debugging purposes.
>
> +Enabling Minidebuginfo
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Enabling the DISTRO_FEATURES minidebuginfo adds a compressed ELF section=
 ".gnu_debugdata"
> +to all binary files, containing only function names, and thus increasing=
 the size of the
> +binaries only of 5 to 10%. For comparison, full debug symbols can be 10 =
times as big as

s/of 5 to 10%/by 5 to 10%/

Best regards
Ulrich


> +a stripped binary, and it is thus not always possible to deploy full deb=
ug symbols.
> +Minidebuginfo data allows, on the one side, to retrieve a call-stack usi=
ng
> +gdb (command backtrace) without deploying full debug-symbols to the targ=
et. It also
> +allows to retrieve a symbolicated call-stack when using systemd-coredump=
 to manage
> +coredumps (commands "coredumpctl list" and "coredumpctl info").
> +
> +This feature was created by Fedora, see https://fedoraproject.org/wiki/F=
eatures/MiniDebugInfo for
> +more details.
> +
>  Other Debugging Tips
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
> index dd14339bc..1320c3a58 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -161,6 +161,9 @@ metadata, as extra layers can define their own:
>  -  *keyboard:* Include keyboard support (e.g. keymaps will be loaded
>     during boot).
>
> +-  *minidebuginfo:* Add minimal debug symbols :ref:`(minidebuginfo)<dev-=
manual/debugging:enabling minidebuginfo>`
> +   to binary files containing, allowing coredumpctl and gdb to show symb=
olicated stack traces.
> +
>  -  *multiarch:* Enable building applications with multiple architecture
>     support.
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

