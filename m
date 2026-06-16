Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806EACD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:42:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154509.1781617372748881590
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sy19T7w6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1FBF51A395B
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:42:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7A7D601A9;
	Tue, 16 Jun 2026 13:42:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00790106C9D82;
	Tue, 16 Jun 2026 15:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781617370; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qBpmbROpF3KaotJkvVtJlkifU7w+Q0Yhmh78QgjSS7Y=;
	b=sy19T7w6FD0/1wteG6wGDeCqENCgidtC8Rg02UcScu8sh6wZVFLOFcqN7U3goiYCarEu4W
	ZYeTDTqRIDtbB4iLmP1ygXG/76WB/kyuDfWTQDMhT4OoT6abn0UDiES/KzRjX/mPJimY7m
	45j6SOZGbz2Cyuplz7Wy3BNvqdzmMSBLh4bA6JZtKjVX6lhO1Q+VihBe8ZKaNlxIqd24Nj
	ZqxDceCsJJStmsMLs7qH2KYMg4IC2DKcDr3q2M9OiBRekm3k99S4FBbjvoCnQvqG94inFp
	ohJjsDvrhtTiLqK+ZJYEyYt/qtNbYaj0UPifVHQxt3bVgg7g1qPCg8ws6NK5/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:42:49 +0200
Message-Id: <DJAINCHABP5K.8LYI407PP8L4@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: correct inaccurate explanation of
 buildhistory setup
References: <50ea53c0-245a-177b-52e3-c9813a99504d@crashcourse.ca>
In-Reply-To: <50ea53c0-245a-177b-52e3-c9813a99504d@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:42:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9742

Hi,

On Fri Jun 12, 2026 at 10:50 AM CEST, Robert P. J. Day wrote:
>
> At the moment, the introduction to the buildhistory class suggests
> that the developer needs to add the line:
>
>   BUILDHISTORY_COMMIT =3D "1"
>
> to their config file. Obviously, this is untrue since it is already
> set to that by default in the buildhistory.bbclass file so remove that
> directive but clarify that there is a reason why they might want to
> subsequently set it zero.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/dev-manual/build-quality.rst b/documentation/d=
ev-manual/build-quality.rst
> index c3c7ccbb2..3c1dca2a2 100644
> --- a/documentation/dev-manual/build-quality.rst
> +++ b/documentation/dev-manual/build-quality.rst
> @@ -33,13 +33,10 @@ The remainder of this section describes the following=
:
>  Enabling and Disabling Build History
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -Build history is disabled by default. To enable it, add the following
> -:term:`INHERIT` statement and set the :term:`BUILDHISTORY_COMMIT` variab=
le to
> -"1" at the end of your ``conf/local.conf`` file found in the
> -:term:`Build Directory`::
> +Build history is disabled by default. To enable it, simply add the follo=
wing
> +:term:`INHERIT` statement at the end of your ``conf/local.conf`` file::

While at it, replace

"""
at the end of your ``conf/local.conf`` file::
"""

to

"""
in a :term:`configuration file`::
"""

>
>     INHERIT +=3D "buildhistory"
> -   BUILDHISTORY_COMMIT =3D "1"
>
>  Enabling build history as
>  previously described causes the OpenEmbedded build system to collect
> @@ -52,9 +49,27 @@ build output information and commit it as a single com=
mit to a local
>     particularly for images, and increases the amount of disk space used
>     during the build.
>
> -You can disable build history by removing the previous statements from
> +You can disable build history by removing that INHERIT statement from

s/INHERIT/:term:`INHERIT`/

>  your ``conf/local.conf`` file.

Also replace local.conf like above.

>
> +.. note::
> +
> +   To enable basic build history, you need only add the line::

s/you need only/you need to/

> +
> +      INHERIT +=3D "buildhistory"
> +
> +   to your local configuration, but the subsequent generation of that hi=
story
> +   is actually controlled by the :term:`BUILDHISTORY_COMMIT` variable
> +   which is, by default, already conditionally set to "1" in the
> +   ``buildhistory.bbclass`` file::
> +
> +      BUILDHISTORY_COMMIT ?=3D "1"
> +
> +   so there is no need for you to set that variable yourself. However, a=
s
> +   you will see later in this section, you can inherit that class file
> +   yet set that variable to zero if you don't want the history but
> +   still want some of the other information produced by this feature.

This note seems too long. You just want to say that you can set
BUILDHISTORY_COMMIT to 0, and that it disables commits for the history whil=
e
keeping other information such as image content and so on. Just say that.

Antonin

