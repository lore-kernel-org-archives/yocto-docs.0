Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0D5CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:37:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154401.1781617039900860527
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gOBpPEVQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D6F251A3957
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:37:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB3ED601A9;
	Tue, 16 Jun 2026 13:37:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D80B3106C9D50;
	Tue, 16 Jun 2026 15:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781617037; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aJZUAtaHWXA++ZsNnKKYmbUlNawMgiZkRxTqOfD54FY=;
	b=gOBpPEVQrj/7W2ul+/6zfrYJNrbh1QzFXAz0fviOrv8pTgECPmVryp7YBYDKNTambGUwcy
	77xH4GnmUYuL2jLXl3AjhdtSA7Ip27mo/xPGsptfVqR30kP9sqG+OWK4vYowtnuVzq4eFu
	UFBeYu9uC/A6orup0E/bqKu0t5Y0+5GR1iaaOucR+XocpL9KoIKLcQE+hfhH36Xt0QIPc/
	hxr0pE6JD8tn5q0nkeYJVHqR0yU5Sd73ziuMzrdk62s/iF5Leh307GTVobfveYgA9t5Bsn
	G2ByLLOTSM+kkZDYTgC2ZVw9Zt73aSZjHLU7f2VwjMOQGqF/y3kV8bhaNZFCzw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:37:16 +0200
Message-Id: <DJAIJ3JCA5SW.11J878DQ91TUS@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual: update AUTOREV explanation to match
 current file
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <6fcb9b9c-e179-6c09-e233-56919a855701@crashcourse.ca>
In-Reply-To: <6fcb9b9c-e179-6c09-e233-56919a855701@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:37:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9741

Hi,

On Fri Jun 12, 2026 at 10:09 AM CEST, Robert P. J. Day wrote:
>
> The code snippet for listing AUTOREV-enabled recipes needs updating
> since it now inherits the "poky-bleeding" class file.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/dev-manual/external-scm.rst b/documentation/de=
v-manual/external-scm.rst
> index 3ca9079b3..7971d65f5 100644
> --- a/documentation/dev-manual/external-scm.rst
> +++ b/documentation/dev-manual/external-scm.rst
> @@ -38,26 +38,27 @@ configuration file contains the line::
>
>     require conf/distro/include/poky-floating-revisions.inc
>
> -This line pulls in the
> -listed include file that contains numerous lines of exactly that form::
> -
> -   #SRCREV:pn-opkg-native ?=3D "${AUTOREV}"
> -   #SRCREV:pn-opkg-sdk ?=3D "${AUTOREV}"
> -   #SRCREV:pn-opkg ?=3D "${AUTOREV}"
> -   #SRCREV:pn-opkg-utils-native ?=3D "${AUTOREV}"
> -   #SRCREV:pn-opkg-utils ?=3D "${AUTOREV}"
> -   SRCREV:pn-gconf-dbus ?=3D "${AUTOREV}"
> -   SRCREV:pn-matchbox-common ?=3D "${AUTOREV}"
> -   SRCREV:pn-matchbox-config-gtk ?=3D "${AUTOREV}"
> -   SRCREV:pn-matchbox-desktop ?=3D "${AUTOREV}"
> -   SRCREV:pn-matchbox-keyboard ?=3D "${AUTOREV}"
> -   SRCREV:pn-matchbox-panel-2 ?=3D "${AUTOREV}"
> -   SRCREV:pn-matchbox-themes-extra ?=3D "${AUTOREV}"
> -   SRCREV:pn-matchbox-terminal ?=3D "${AUTOREV}"
> -   SRCREV:pn-matchbox-wm ?=3D "${AUTOREV}"
> -   SRCREV:pn-settings-daemon ?=3D "${AUTOREV}"
> -   SRCREV:pn-screenshot ?=3D "${AUTOREV}"
> -   . . .
> +This line pulls in the listed include file that defines the set of
> +AUTOREV-enabled recipes::
> +
> +   INHERIT +=3D "poky-bleeding"
> +
> +   POKY_AUTOREV_RECIPES =3D "\
> +       libmatchbox \
> +       opkg-utils \
> +       matchbox-config-gtk \
> +       matchbox-desktop \
> +       matchbox-keyboard \
> +       matchbox-panel-2 \
> +       matchbox-terminal \
> +       matchbox-theme-sato \
> +       matchbox-wm \
> +       pseudo \
> +       puzzles \
> +       sato-icon-theme \
> +       sato-screenshot \
> +       settings-daemon \
> +   "
>
>  These lines allow you to

s/These lines allow/This allows/

>  experiment with building a distribution that tracks the latest

Antonin

