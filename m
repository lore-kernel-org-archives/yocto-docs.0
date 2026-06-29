Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4F9C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 07:52:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87273.1782719547817232025
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 00:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WysEn2rD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95B251A0C9B
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 07:52:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B1575FF96;
	Mon, 29 Jun 2026 07:52:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46AE3106F1536;
	Mon, 29 Jun 2026 09:52:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782719545; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p2T22m8SsLxtAH8i+bZWYtgSa2/pTPv9YlLqdGRvzZE=;
	b=WysEn2rDpQxgruzpPdLTGYlffIcR+S4KqkaneCEFkMaTn7nKoK5hebbcd/pEHgORtMlfW4
	7f0c3HO/HyKxMkl12cxx94W5uVOpfG8sbqCclkJLgNENO/AhcIY/z3xNWKubOBYFXVBgF1
	K2dOuFJTVK/C8hZagcgRZCxjnq+Bs2nnJUCSa15ZjPC+s6kD1wPDyOXngL/YW2jEwVPfpZ
	zNEAeZGbf47PIMf2BJVYx/jKHT2E5huBZLyW/kuHyOvCgPNIpcGkbZ1J/E7tzxYKN5vuJo
	0ZEj076ccEHblj+SgBjTBSe/ygXuR648gDIxI8xyQpuO9LT+SK5koJ6XIejZCw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 09:52:23 +0200
Message-Id: <DJLDC44CFJYL.1C6ACT3B4ATW6@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add intro content to Ref Manual
 "Tasks" section
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <be80b3e5-3887-e388-cf4d-8c947775c10f@crashcourse.ca>
In-Reply-To: <be80b3e5-3887-e388-cf4d-8c947775c10f@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 07:52:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9920

Hi,

On Fri Jun 26, 2026 at 11:11 AM CEST, Robert P. J. Day wrote:
>
> As in done in the "Classes" section, add a couple paragraphs to
> explain how the developer can examine the tasks for a recipe.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manua=
l/tasks.rst
> index e6301e708..7c8bd0a82 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -9,6 +9,35 @@ tasks to complete configuring, compiling, and packaging =
software. This
>  chapter provides a reference of the tasks defined in the OpenEmbedded
>  build system.
>
> +To see the tasks defined (in alphabetical order) for a given recipe,
> +you can run:
> +
> +.. code-block:: console
> +
> +   $ bitbake -c listtasks recipename
> +   do_build                              Default task for a recipe - dep=
ends on all other normal tasks required to 'build' a recipe
> +   do_checkuri                           Validates the SRC_URI value
> +   do_clean                              Removes all output files for a =
target
> +   do_cleanall                           Removes all output files, share=
d state cache, and downloaded source files for a target
> +   do_cleansstate                        Removes all output files and sh=
ared state cache for a target
> +   do_compile                            Compiles the source in the comp=
ilation directory
> +   .. etc etc ...

Nitpick, but I think "..." is enough.

> +
> +In addition, once a recipe has been built, you can find in that recipe's
> +``${WORKDIR}/temp/`` directory not only all of the "run" and "log" files

It would be nice to also explain what those "run" and "log" files are. Righ=
t
now, the phrasing implies that the reader already knows what they are. Just=
 a
quick sentence or a rephrasing would be better I think.

> +for every task executed for that recipe, but a ``log.task_order`` file
> +that lists the order of execution of those tasks:
> +
> +.. code-block:: console
> +
> +   $ cat log.task_order
> +   20260626-045459.439754 do_fetch (3798706): log.do_fetch.3798706
> +   20260626-045459.805253 do_unpack (3798765): log.do_unpack.3798765
> +   20260626-045501.005518 do_patch (3798918): log.do_patch.3798918
> +   20260626-045501.012781 do_prepare_recipe_sysroot (3798919): log.do_pr=
epare_recipe_sysroot.3798919
> +   20260626-045501.210527 do_populate_lic (3798933): log.do_populate_lic=
.3798933
> +   ... etc etc ...
> +
>  Normal Recipe Build Tasks
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Thanks!
Antonin

