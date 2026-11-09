Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5562.1794229573743243325
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Nov 2026 05:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XWxdKQZv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49C16C5845A
	for <docs@lists.yoctoproject.org>; Mon,  9 Nov 2026 13:06:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5299160051;
	Mon,  9 Nov 2026 13:06:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC2C1103292D3;
	Mon,  9 Nov 2026 14:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794229570; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4sRSnk2eqPAwqFVa5XClwNL33SKuC1+vPZT9Hl8qdBI=;
	b=XWxdKQZvhx823tzugIDmdxJ+lM8t6bO8pwq+lC3oiJ/t5FjALOQUuvg2WIzq/230IGfyhv
	yCJNwol/MMa05ivThV11Swqw74sOmlEXu/e++UwvqTXdqXNRYmkD4u1496qdLR7DRMotDU
	UV7X77oI/43JI2SbfawK4pSPKF2QsV3D3SPrPeJL3t9vyLIVW5RlXKl0XzzvKFjdDcprHU
	PrUeWIJRuHvMCUmUSEnAdVu7CtWUIg/BgGGwPXsyrDI/hj9Gc+RZTwb9I52LoUYDhQ3Zk4
	Ti6K49XFmuu62Y0HjdFWuhJuc08+iTzw4yW4KFmwI4n1KsCNdoNrerz2+jDxDQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:06:08 +0100
Message-Id: <DMQPASQ4O7OY.3MSSZ46VQT2P8@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] kernel-dev/maint-appx.rst: fix the kernel
 cache repository name
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <erik@awto.se>, <docs@lists.yoctoproject.org>
References: <20261107170135.84816-1-erik@awto.se>
In-Reply-To: <20261107170135.84816-1-erik@awto.se>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 09 Nov 2026 13:06:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10782

On Sat Nov 7, 2026 at 6:01 PM CET, Erik Lindsten via docs wrote:
> Signed-off-by: Erik Lindsten <erik@awto.se>
> ---
>  documentation/kernel-dev/maint-appx.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
[...]

Applied both to master-next, thanks!

Antonin
