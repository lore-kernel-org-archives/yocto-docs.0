Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27039F99351
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 08:07:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14810.1776931652506355232
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 01:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yKsThCmP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 577AB1A33B7;
	Thu, 23 Apr 2026 08:07:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E31860495;
	Thu, 23 Apr 2026 08:07:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7CB110460B49;
	Thu, 23 Apr 2026 10:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776931649; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GouRCEqo/NbqxHJET2ijJCqI/gzktUt8K8Vleva+u7g=;
	b=yKsThCmPT/AXu88VjHermYchsgyG5soAFEAWkNQwogZ5eAS2HTRfuJpjILrGFBsg0ruhoG
	tf7yApNzSf+dGMsbYyBzky5FxYwnLlpvsgSx3JPzey5WYQ6SIocKbvnn6vui2ngfFvd+OC
	gPYWBDRKuc8nREJOPhorsjn7SroAdaTo9y9UmDl2q/00kIhqehNFD/EzQF9hwjrxcKJp7k
	hRLAFEfb1AIkbTPYychrDbbC28WEJl1LZf2bMxSCdu0Pmft3DjPbfYYIfiwFtxV29ee7jU
	KW5Ah1ISb82EvMZtmqPicPIWV8VjEFZmryGgeUV8bCwfDsqpHhJuXVvsScB2ew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 10:07:28 +0200
Message-Id: <DI0DP5Y4RTU3.391J7MHDYMI6H@bootlin.com>
Subject: Re: [docs] [PATCH] overview-manual/concepts.rst: fix
 do_prepare_recipe_sysroot task description
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <bijak.dawid@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260422185404.14111-1-bijak.dawid@gmail.com>
In-Reply-To: <20260422185404.14111-1-bijak.dawid@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 08:07:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9331

Hi,

On Wed Apr 22, 2026 at 8:54 PM CEST, Dawid Bijak via lists.yoctoproject.org=
 wrote:
> The description incorrectly stated that the sysroots are set up for
> use during the packaging phase. In fact, do_prepare_recipe_sysroot
> runs before do_configure, and the sysroots are consumed by
> do_configure and do_compile.
>
> Reword to refer to subsequent tasks in the recipe and call out
> do_configure and do_compile explicitly.
>
> Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
> ---
>  documentation/overview-manual/concepts.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
> index 1faa790f3..e4a8c60f7 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -782,12 +782,12 @@ This step in the build process consists of the foll=
owing tasks:
>     This task sets up the two sysroots in
>     ``${``\ :term:`WORKDIR`\ ``}``
>     (i.e. ``recipe-sysroot`` and ``recipe-sysroot-native``) so that
> -   during the packaging phase the sysroots can contain the contents of
> -   the
> +   subsequent tasks in the recipe (notably :ref:`ref-tasks-configure`
> +   and :ref:`ref-tasks-compile`) can access the contents of the
>     :ref:`ref-tasks-populate_sysroot`
> -   tasks of the recipes on which the recipe containing the tasks
> -   depends. A sysroot exists for both the target and for the native
> -   binaries, which run on the host system.
> +   tasks of the recipes on which the recipe depends.

I think we can go further than that even.

I am dubious on the "contents of the tasks" phrasing. This does not make mu=
ch
sense to me, to be honest.

How about:

"""
This task sets up the two sysroots in the ``${``\ :term:`WORKDIR`\ ``}`` (i=
.e.
``recipe-sysroot`` and ``recipe-sysroot-native``) so that the subsequent ta=
sks
of the recipe (notably :ref:`ref-tasks-configure` and :ref:`ref-tasks-compi=
le`)
can access the libraries, headers, and similar files built by the recipes o=
n
which it depends.
"""

?

> +   A sysroot
> +   exists for both the target and for the native binaries, which
> +   run on the host system.

I think this would benefit from a bullet point list, to make the distinctio=
n
clearer:

"""
A sysroot exists for:

-  The target binaries (``recipe-sysroot``)
-  And for the native binaries (``recipe-sysroot-native``), which run on th=
e host system.
"""

What do you think?

Thanks for the patch,
Antonin

