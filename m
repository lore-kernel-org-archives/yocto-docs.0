Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5402.1794229573742738072
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Nov 2026 05:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=shRgIfWi;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 55C7BC5845D;
	Mon,  9 Nov 2026 13:06:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68FE9600A3;
	Mon,  9 Nov 2026 13:06:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0FE4103293A7;
	Mon,  9 Nov 2026 14:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794229570; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fgcx4UlO684LDDtFhkRBezRcG6723MS8/BTGakSqyjA=;
	b=shRgIfWiJvpDwbuXARXEUQTOXE+G+gEE9qDIPNRj5w6ok3R6f85mb3deEddDbpglUzEXUc
	fWPB16NLYdliNH4RcMsGU4pRwaKJls0pmnlzRIv9Wzjj5J5lwPF03RekeKTTptEUbQScnU
	Jm+2w5urBpXxiFr+e4csfcGIqjUMyLnAgIlmd9jaD+alv00/J1V5vSKHCYi1fDA3+phzH0
	PyXkrdxUJaQU6evHzCxrMvUQ+Nnflv/Fes4Di+DqpYz1xM+/yVXBwO+yfKcRkDjfypY0cM
	lMBiagL3D5gNhph2rIYoq7zUenoi13Abva2mUBB8XoTyKHmAg8PgCIVwISRf0Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:06:08 +0100
Message-Id: <DMQPASX75FWA.O0X6VGEALQWA@bootlin.com>
To: <saeednourian82@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] docs-wide: remove trailing whitespace
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20261107073437.1570845-1-saeednourian82@gmail.com>
In-Reply-To: <20261107073437.1570845-1-saeednourian82@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 09 Nov 2026 13:06:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10781

On Sat Nov 7, 2026 at 8:34 AM CET, Saeed Nourian via docs wrote:
> Remove the trailing whitespace reported by "make sphinx-lint" in
> bsp-manual/bsp.rst and dev-manual/layers.rst.
>
> Signed-off-by: Saeed Nourian <saeednourian82@gmail.com>
> ---
[...]

Applied to master-next, thanks!

Antonin
