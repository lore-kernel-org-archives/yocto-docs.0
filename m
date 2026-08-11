Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1282C5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 08:26:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49726.1786436783903695346
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 01:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bT+uXAJt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A7D071A1568;
	Tue, 11 Aug 2026 08:26:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B9886033C;
	Tue, 11 Aug 2026 08:26:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7079E11C4BBCF;
	Tue, 11 Aug 2026 10:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786436777; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MsnUnlfuPGNyyn+ONxLyQe/59nWeBb1nk6ACv0mDuss=;
	b=bT+uXAJtrJ0UJaT+ty0WKpYU+dXuIyCY2iKtP+1YlNqyRb5Rf8vyqKbnUMLEDsui3FKVQB
	WW/yHfRISFMvwCm53JpqlxWfG1PeFnoI8O45rLW3FqnfkD9lrTG4qxKQcY1QtdF+5FjKpq
	ItOFg02aKsuWrfsx/jdoCG8NVuNHentnad5dI7kZz9NddDUZf8KJelP6QNHxBpj/becH37
	11uRIvcH8I9X3v6cute816R69jN4H8Dc7/tHhNyMGDs2d2EQ6ECXu8xxD+nLKx62picvI2
	tTaPR/2DbDz2mniJrF64vs7GJ1AMhLyVNT3q6YO69uSMUAS7csfmcQprxeMk3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 10:26:15 +0200
Message-Id: <DKLYZH9ECL7S.13MIGDGUJPGLF@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/tasks.rst: Make do_clean description
 more explicit
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <anis.bougrine10@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260810000633.51112-1-anis.bougrine10@gmail.com>
In-Reply-To: <20260810000633.51112-1-anis.bougrine10@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 08:26:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10249

Hi,

On Mon Aug 10, 2026 at 2:06 AM CEST, anis via lists.yoctoproject.org wrote:
> The current do_clean task description is generic and does not
> specify which files will be removed.
>
> This branch adds details about the files that are removed by

This branch? I guess you mean this patch / this commit?

> explicitly listing the affected subdirectories.
>
> Signed-off-by: anis <anis.bougrine10@gmail.com>
> ---
>  documentation/ref-manual/tasks.rst | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manua=
l/tasks.rst
> index 3517d0b91..28de10d56 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -17,7 +17,7 @@ you can run:
>     $ bitbake -c listtasks recipename
>     do_build                              Default task for a recipe - dep=
ends on all other normal tasks required to 'build' a recipe
>     do_checkuri                           Validates the SRC_URI value
> -   do_clean                              Removes all output files for a =
target
> +   do_clean                              Removes all output files for a =
target (``${WORKDIR}``, sstate manifests and stamps)

Since this is an excerpt from the listtasks task, this output should reflec=
t
what's shown in reality. Maybe you should suggest this change to OE-Core to
change the "doc" flag for the task directly?

>     do_cleanall                           Removes all output files, share=
d state cache, and downloaded source files for a target
>     do_cleansstate                        Removes all output files and sh=
ared state cache for a target
>     do_compile                            Compiles the source in the comp=
ilation directory
> @@ -501,9 +501,10 @@ You can run this task using BitBake as follows::
> =20
>     $ bitbake -c clean recipe
> =20
> -Running this task does not remove the
> -:ref:`sstate <overview-manual/concepts:shared state cache>` cache files.
> -Consequently, if no changes have been made and the recipe is rebuilt
> +Running this task does remove the ``${``\ :term:`WORKDIR`\ ``}``,=20

"does remove" -> "removes" feels better here

Suggestion:

"the ``${``\ :term:`WORKDIR`\ ``}``" -> "the working directory of the recip=
e
(represented by its :term:`WORKDIR` value)"

> +the sstate manifests and the stamps.

:ref:`stamps <overview-manual/concepts:Stamp Files and the Rerunning of Tas=
ks>`

Tried to find a reference for sstate manifest files but couldn't find any :=
/

> +However, it does not remove the :ref:`sstate <overview-manual/concepts:s=
hared state cache>`
> +cache files. Consequently, if no changes have been made and the recipe i=
s rebuilt
>  after cleaning, output files are simply restored from the sstate cache.
>  If you want to remove the sstate cache files for the recipe, you need to
>  use the :ref:`ref-tasks-cleansstate` task instead

Thanks!
Antonin

