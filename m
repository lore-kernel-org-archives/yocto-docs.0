Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8F4C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 08:39:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31894.1787819942466309872
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 01:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AUhuWT/L;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 355B74E412EE;
	Thu, 27 Aug 2026 08:39:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03B3D602B8;
	Thu, 27 Aug 2026 08:39:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9746411C78186;
	Thu, 27 Aug 2026 10:38:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787819939; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BAG4byzTF+Zl9OHkKkE2CfbRj2DT6fntctNzdc3hu1c=;
	b=AUhuWT/LRBsNjgZOwMHTqIP2L1/rXjbRqWF14+wbHSx+2QLeYkUgCX893RIlMk7O4YmlSK
	qS+Jv3GJA2dqcbX8mOFIcL2wFaCoAwa/JUdRCYgfJKAF55tcIvIdUoXgUilHBCGv9HGuRF
	0jmE3JCV4kh4MBKsP0Rw5b/FJ/XidpQ5sQFmgeYhBDzm1+VXP2Z8Ha2jN6PqDKdIXy4oH1
	6se2MGA5ZXIUIX7NCHFvSZjhJ2qvbr1q6i+v96rcF/BL0iBSiSy+Bu8nK1wVdRP8LTR+/C
	lqsksTL5gC8E+pZCedbCJLcgC/DR+IXCia7TrFWXefPusbkFltnQI2tvTWNsHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 10:38:58 +0200
Message-Id: <DKZL9X7BV6TH.1WARGZV04JK2V@bootlin.com>
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260826013502.2674000-1-twoerner@gmail.com>
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 08:39:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10378

Hi,

On Wed Aug 26, 2026 at 3:34 AM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
[...]
> Not included
> ------------
>
> Six blocks in ref-manual/ trip a defect in the released BitBake lexer,
> fixed upstream but not yet in a release. They are a separate patch, held
> until that release, so the rest is not blocked behind them.

Would it make sense to apply a patch to Pygments in OE-Core to fix these is=
sues
until a new version of Pygments is released?

Antonin

