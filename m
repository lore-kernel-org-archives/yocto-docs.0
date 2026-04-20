Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB26F588C1
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 12:19:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17829.1776687539894713773
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 05:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=P4yHtFLz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0EA8DC5C997;
	Mon, 20 Apr 2026 12:19:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B9305FFA5;
	Mon, 20 Apr 2026 12:18:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D4FA10460815;
	Mon, 20 Apr 2026 14:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776687537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WL7PWwCfDjS06iNojErQ/TE3GuMLSkrC7SPESQaxarA=;
	b=P4yHtFLz/4RYLs83HJd27pjQA/QoFueaXjSQimF61IiU4Yn9pc1kMopxafZOqDrZ1yyfAd
	LuwQ5HBCHd5RGez17aGnl6PTf+ZZyJ+cV8eA6970E5DbnxGdfXDcDR/8bj0qZQBJcn9+Nw
	7GmB+KqMTl5lxOEYjzt6txqrLutUOvC81Ag8Ji+v/EAOahWc4QjdkTPOJeziiGmTKvIi/2
	jyiVAqe7SSrqs4zAvq8E1HRD/+Uza5tSUIkbhqVJELkUopcPWKw9513tg+gJ4NxOa4ARxN
	ZSi9717XtIw6W8tFd9xw3iSk3Be7R6rQ2+Iz5Z4UBiKoMtkpTWC8w6GzWVauQw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 14:18:56 +0200
Message-Id: <DHXZ62I2QYS9.3AJ5ANBEDXGWP@bootlin.com>
Subject: Re: [docs] [PATCH] Document shared state signing
Cc: <docs@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>, "Antonin
 Godard via lists.yoctoproject.org"
 <antonin.godard=bootlin.com@lists.yoctoproject.org>
References: <20260417-sstate-signing-v1-1-5df11613249e@bootlin.com>
 <6reckcnx3e.fsf@pengutronix.de>
In-Reply-To: <6reckcnx3e.fsf@pengutronix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9294

Hi,

On Sat Apr 18, 2026 at 4:48 PM CEST, Ulrich =C3=96lmann wrote:
> Hi Antonin,
>
> didn't know that we can sign the sstate - thanks for writing things down!
> Just a few typos.

Thanks for the review! Glad you learned something thanks to it :) v2 should=
 be
on its way soon

Antonin

