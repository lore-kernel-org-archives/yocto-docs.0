Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C513E81A2B
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 14:27:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20432.1771252014739913699
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 06:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=luNNTZwG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 933661A0F9F
	for <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 14:26:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6843D606CF;
	Mon, 16 Feb 2026 14:26:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8A0D10368D81;
	Mon, 16 Feb 2026 15:26:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771252011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gNfLtzhoorlnkZwBFOdX72iELKuRifPpssys4GUvO8Y=;
	b=luNNTZwGNORQK9EadeUYpFd4+XbTlAnW5LYSiMVEXoiqMSW7q56G8rv/YiD0x4N7ycyZeC
	9AkHIdXM7RK4KUT1IpVfDtZQ/uDsRgk85QlGqaT147kTNK+J+3lULbBc0TmRAXjrEh8dqn
	ub0Q1XYSLaSRZG+OLhz/S1zPu/8BsuoXq4pJPNU7MNnoDcaPH+bada6S6nc+ouaIgkhXV2
	Zu28wWdemlPk+HROZJTAKBqhefQFInX1QgaK11lVoPUJE60cAGpd8t0SasSfOzQdbWL8rU
	J6I1BHxYbbOibl1VQU1EzQ/8Z7CYDaOuwciaM5I0UVTdf3475tROrB/zY6RBqQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 15:26:50 +0100
Message-Id: <DGGGFO6KUB95.16VEII2QZY3MJ@bootlin.com>
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss+yocto@0leil.net>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v4 0/3] migrate Debian/Ubuntu to pip packages for docs +
 fix epub and latexpdf targets not finding glob images
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
In-Reply-To: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 14:27:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8929

Hi,

I have an issue after applying the series:

  $ ./documentation/tools/build-docs-container almalinux:9 latexpdf
  [...]
  latexmk -pdf -dvi- -ps-  'theyoctoproject.tex'
  make[1]: latexmk: No such file or directory
  make[1]: *** [Makefile:28: theyoctoproject.pdf] Error 127
  make[1]: Leaving directory '/docs/documentation/_build/latex'
  make: *** [Makefile:53: latexpdf] Error 2
  make: Leaving directory '/docs/documentation'

You reported an error with latexpdf on IRC, was that it?

Antonin

