Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36C4CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 08:51:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.6660.1758790311725239474
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 01:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MKBOj/7u;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DECAA1A0FBB
	for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 08:51:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B44FD6062C;
	Thu, 25 Sep 2025 08:51:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E2A6102F187A;
	Thu, 25 Sep 2025 10:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758790308; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LXmfCBj0nu30tNCmab/nH23I+0v5s2x9TLM3KghgLl4=;
	b=MKBOj/7uiZZROcZagiWpLhIUc5lSDYiUWkDXXNLOO5+35lsRapccCzWRScol3VRjkGgr9x
	mBpUmvjCHL6YlUib4UlTSF+CHoInnBXp/CMvOdHA+ss7aF27PC2DhVGLKDYz04ITbdIhRw
	JwnVUUtKWL9WVpRPNa1dTAwgzHyBmHu2+pBhPQxg9PlYkk/3s5tL9pwaoXT5DUHGP4tzNb
	lwrg/BQIUHUL+Tdy7Q2PVzjG867kx1NlhAD1aNVC/0IYG7I0cmzZ+NQ/o8DORqoJp2RcHQ
	v2ajYCQ4LFo5koGTTCAHkZO6F51dGEcW2lovKxpG4Ih2TyYjmUEBKOjFrf8R1Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Sep 2025 10:51:46 +0200
Message-Id: <DD1R4OC249CA.3QCJ0Q1LI5ELE@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] kernel-dev/common.rst: fix the in-tree
 defconfig description
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adam.blank.g@gmail.com>, <docs@lists.yoctoproject.org>
References: <20250923121422.24593-1-adam.blank.g@gmail.com>
 <20250923121422.24593-2-adam.blank.g@gmail.com>
In-Reply-To: <20250923121422.24593-2-adam.blank.g@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 08:51:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7594

On Tue Sep 23, 2025 at 2:14 PM CEST, Adam Blank via lists.yoctoproject.org =
wrote:
> The description of the relation between KBUILD_DEFCONFIG and
> SRC_URI is reversed. In fact it is the SRC_URI provided
> defconfig which will be dropped by the kernel-yocto class
> if both are provided.
>
> Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> ---
>  documentation/kernel-dev/common.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-d=
ev/common.rst
> index 654c4e0a0..c7b25765a 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -655,7 +655,7 @@ Aside from modifying your kernel recipe and providing=
 your own
>  :term:`SRC_URI` to use a ``defconfig`` other than your "in-tree" file (e=
.g.
>  a kernel's ``linux-``\ `machine`\ ``.inc`` file). In other words, if the
>  build system detects a statement that identifies an "out-of-tree"
> -``defconfig`` file, that statement will override your
> +``defconfig`` file, that statement will be overriden by your

s/overriden/overridden/

Thanks, I can also verify that behavior so the logic is indeed reverted.

In this case I think the previous sentence should also be removed:

  Aside from modifying your kernel recipe and providing your own ``defconfi=
g``
  file, you need to be sure no files or statements set :term:`SRC_URI` to u=
se a
  ``defconfig`` other than your "in-tree" file (e.g. a kernel's ``linux-``\
  `machine`\ ``.inc`` file).

And instead only have one:

  If the build system detects a statement that identifies an "out-of-tree"
  ``defconfig`` file, that statement will be overriden by your
  :term:`KBUILD_DEFCONFIG` variable.

What do you think?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


