Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B73BC61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 09:45:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2763.1787910300283532872
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 02:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qD/iy3Ix;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0F4184E413FD;
	Fri, 28 Aug 2026 09:44:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D877360537;
	Fri, 28 Aug 2026 09:44:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F73711C78176;
	Fri, 28 Aug 2026 11:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787910293; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UsJ7fQZ7uN86ovL8IE5+PFWctegdv7gmR/ULt4WAZnA=;
	b=qD/iy3IxJd6Crfh4SQx/z3HXbBeCTB2nL/EsgZPwkeNBFpf8cEpraaXlXv7wZL1swNn1In
	0yom/n2Tp3JjEW7rfHcrWWvdkBAlTAGjdgW9IAn65zdlqA+9fF+Ms2kisvcL0DH4SNSnzV
	RVz/b9n/1SULMpct5xqrR2MoHMMjTvgVJp/lwinSGNg0N1wL0RxxKw+qXVVqdD4WUYgIAT
	09tuyNq9+S3ADSrlvt1/uxgCBy3bEH6Vsbb6GJ1wl7JB1nn/ZWKOv+ZZYXE4bG+jzb9gz4
	XkZVgxQbrc2+xlAKTCrojozWm5t52BjJY7BtQ1DpOaiDXTS80C7mRgLBj9nP0g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 11:44:51 +0200
Message-Id: <DL0HAX07P2Z5.21ZPG2JB814OE@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: Remove the documentation of the
 GROUPMEMS_PARAM variable
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <peter.kjellerstedt@axis.com>, <docs@lists.yoctoproject.org>
References: <20260825181652.2993460-1-pkj@axis.com>
In-Reply-To: <20260825181652.2993460-1-pkj@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10390

Hi,

On Tue Aug 25, 2026 at 8:16 PM CEST, Peter Kjellerstedt via lists.yoctoproj=
ect.org wrote:
> It has been removed from OE-Core.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> This is obviously only true once my corresponding patches for OE-Core
> have been integrated. ;)
>
>  documentation/ref-manual/classes.rst   | 2 +-
>  documentation/ref-manual/variables.rst | 6 +-----
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 3e74bb884..631091f03 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3780,7 +3780,7 @@ The :ref:`useradd* <ref-classes-useradd>` classes s=
upport the
>  :term:`USERADD_PACKAGES`,
>  :term:`USERADD_PARAM`,
>  :term:`GROUPADD_PARAM`, and
> -:term:`GROUPMEMS_PARAM` variables.
> +:term:`USERMOD_PARAM` variables.
> =20
>  The :ref:`useradd-staticids <ref-classes-useradd>` class supports the ad=
dition of users or groups
>  that have static user identification (``uid``) and group identification
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index ae9cbfddf..5cc01cf45 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3955,10 +3955,6 @@ system and gives an overview of their function and=
 contents.
>        For information on the standard Linux shell command
>        ``groupadd``, see :manpage:`groupadd(8)`.
> =20
> -   :term:`GROUPMEMS_PARAM`
> -      Deprecated in favor of :term:`USERMOD_PARAMS`. See
> -      :ref:`ref-migration-6-1-groupmems` for more information.
> -

There are places in the documentation that still use the :term:`GROUPMEMS_P=
ARAM`
ref.

yocto-docs/documentation/migration-guides/migration-6.1.rst:39: WARNING: te=
rm not in glossary: 'GROUPMEMS_PARAM' [ref.term]
yocto-docs/documentation/migration-guides/migration-6.1.rst:46: WARNING: te=
rm not in glossary: 'GROUPMEMS_PARAM' [ref.term]
yocto-docs/documentation/migration-guides/release-notes-6.1.rst:102: WARNIN=
G: term not in glossary: 'GROUPMEMS_PARAM' [ref.term]
yocto-docs/documentation/migration-guides/release-notes-6.1.rst:107: WARNIN=
G: term not in glossary: 'GROUPMEMS_PARAM' [ref.term]
yocto-docs/documentation/ref-manual/classes.rst:3779: WARNING: term not in =
glossary: 'USERMOD_PARAM' [ref.term]
yocto-docs/documentation/ref-manual/variables.rst:12540: WARNING: term not =
in glossary: 'USERMOD_PARAM' [ref.term]

I've replaced those with ``GROUPMEMS_PARAM`` when merging your patch to
master-next.

Thanks,
Antonin

