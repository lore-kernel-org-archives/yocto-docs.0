Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE2CCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:04:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153615.1781615066090030391
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VAqlrghg;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B0953C2BB30
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:04:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28619601A9;
	Tue, 16 Jun 2026 13:04:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35BE7106C9D32;
	Tue, 16 Jun 2026 15:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781615063; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gUK5PPzDggAB3xlRIoPsKVDunpWKJpUqn92MUew+0bs=;
	b=VAqlrghgnvMdf78K52FT5sZkptcVg/aFq/OIf8hb4AVBZR8Cszpf/Z4zP2R237XBdl77DX
	TNXwfMHnzzQLPSW+01c+X2AlQ50fG5KRqIUK3+f0CjU1lr6tsgt7s+jQOVom0oJBUQfBJ6
	lS5ml+3anTNDUM3A3YfeSLkCk6JzrR3092B93Gb5U9b80f0lVr0pmoHJEg+aE6KLVEstWt
	rr9XoIqdgfwF3Cky3bjq1+/gZMGzguRvIIo7kn8CLDv68I6qVTS61tzQCVSPGUT7V88wYq
	G2k2VJ//TekerWdoG0kP+O4I535O1jtWZ8noGHe21SL6ALb0eUkyfsYv5i6G3g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:04:22 +0200
Message-Id: <DJAHTWUYT6NC.E9JJRMXM8L6A@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: document "RM_WORK_EXCLUDE_ITEMS" for
 rm_work.bbclass
References: <eb6dc48a-f434-3167-ad28-d348ff1f4e77@crashcourse.ca>
In-Reply-To: <eb6dc48a-f434-3167-ad28-d348ff1f4e77@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:04:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9734

Hi,

On Thu Jun 11, 2026 at 12:34 PM CEST, Robert P. J. Day wrote:
>
> Add an explanation of RM_WORK_EXCLUDE_ITEMS for rm_work.bbclass.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 95e07f85a..36b730823 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -2614,6 +2614,12 @@ which can also be set in your ``local.conf`` file.=
 Here is an example::
>
>     RM_WORK_EXCLUDE +=3D "busybox glibc"
>
> +Finally, if you are using this class for a recipe but want to prevent Bi=
tBake

s/BitBake/:term:`BitBake`/

> +from deleting specific folders or files in that recipe's ``${WORKDIR}``

s/``${WORKDIR}``/:term:`WORKDIR`/

> +(other than ``temp``), you can preserve those folders or files with::
> +
> +   RM_WORK_EXCLUDE_ITEMS +=3D "stuff_to_keep"

s/stuff/items/

> +
>  .. _ref-classes-rootfs*:
>
>  ``rootfs*``


Antonin

