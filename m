Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFBEF94CD8
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:55:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73157.1776840943550087929
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 23:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EutBL5Bm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B8E94E42AA4
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 06:55:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A599600DD;
	Wed, 22 Apr 2026 06:55:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1F0E10460B43;
	Wed, 22 Apr 2026 08:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776840940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=socaRiRtUv2Gzgpx1qqpInvZyyETo52E3F8nhM9wNQc=;
	b=EutBL5BmwoEYrifzMQkOzpHTAjdkOCK4IlpeGan0x7OLFiiHSwUfxQct2sEdJ3acEqBz61
	AvkZj8vMVOJZBcIW7aPHINIX8XGvah2UTEsQ1uLY7vZBZ+rSBdoR6IdTWH4VW1AfEvvawo
	TIXEYnY+r/lsBkAWrtE+oGIlHEd1qpoYwNaeBweEdVrcpv2b5u/V+exnEB0HgWER5YN85M
	V0AIYDIwg5Sph8/3LgSdUF/BFjc7QNGjupLY+GfY12UY9XtPOUX6x/+WkqN+wvhDLHzsdL
	KRbG5JpBWVDHihTOCerhg7g3Pl56jdhPJbPwbMhJsKawnddjH9NN2eML2r3j7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Apr 2026 08:55:39 +0200
Message-Id: <DHZHJMU79QRA.QGWLX7MEM1TL@bootlin.com>
Cc: "Trevor Woerner" <trevor.woerner@amd.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [RFC PATCH 1/2] add a "bitbake" pygments lexer
References: <20260421172416.1801567-1-twoerner@gmail.com>
 <20260421172416.1801567-2-twoerner@gmail.com>
In-Reply-To: <20260421172416.1801567-2-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 06:55:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9304

Hi,

On Tue Apr 21, 2026 at 7:24 PM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
[...]
> +# Pygments does not ship a BitBake lexer, so this Sphinx extension provi=
des
> +# one.

Have you considered contributing this lexer to Pygments instead? I would ra=
ther
have it there than having to maintain it here.

Thanks,
Antonin

