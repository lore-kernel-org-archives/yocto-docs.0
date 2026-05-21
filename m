Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68202CD5BAE
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31082.1779347247439755240
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=e3nPR5Yx;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D2DBEC2C64D
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:08:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D32BB60495;
	Thu, 21 May 2026 07:07:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E823C107EA6BC;
	Thu, 21 May 2026 09:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6A744lmhFOr+U6Kp6kmsguqc4pa8jBGnkwrhTaJvVSA=;
	b=e3nPR5YxHacQVRg3trKcMssku/oxxLm/jTIeE5Ufi62prE+UugpPnErwqz7XtBmifAyZp1
	I/E60ujNIliuT6Id89OJ6N8qoseSB57t+gJ2EscoGFnhJtTWxBcO8ZQnHNk3Qh6rt7+kXb
	08Xy+AUrRFXJcukveAfKA9YHXRGq+QnysLuMAcFJYTsS3PLtEPrk8/a0Fm0im3CsxBNZN6
	g8DTvsQPCOdaT+21I80rxOzn/M+yQITl51QuemU1FzfNTD6nMkbMsd1UC0Jw//BaPJkb1L
	yde4Pee6X/esTy62VxrrhyAI8WT2Rx2FeRr1mnTG2PgmFxWtcamblz/J14sCxA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] What I Wish I'd KNown: Various pedantic cleanups
Date: Thu, 21 May 2026 09:06:29 +0200
Message-ID: <177934712511.33890.5934512633964218318.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <7492d4a6-6194-d081-2266-98f33dc5ae92@crashcourse.ca>
References: <7492d4a6-6194-d081-2266-98f33dc5ae92@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9509

Applied, thanks!

[1/1] What I Wish I'd KNown: Various pedantic cleanups
      commit: ffd69f11172c2b0d8f52bd967c7983220d133e0d

