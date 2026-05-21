Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3694CD5BB2
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31342.1779347248829370336
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=1Z1fH9kG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 57CAEC2C650
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:08:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5740760495;
	Thu, 21 May 2026 07:07:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 971A9107EA6BC;
	Thu, 21 May 2026 09:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cCt1GY7mXe1rIJOoejBazS2eIlmNCtE3ABgSUM6rpfA=;
	b=1Z1fH9kG8G/uWNymeIO6/V0Bj5bWsUtvLdUgPdiSs6abS7H12Kneu9si3uxNqQetWR5zyY
	gD9UHIog13pe4hPxctG9ST/RnBzcQQrUeg3sV81/DKYhHt+QRw9tvQ2ZAd3lPaa2AN4BPQ
	LzvhSQRtbXmemt+XVXvbovXQrPFr8q/mbs75jl/WJ0K+5rMsjJQ+Gyd0a1JM9DMtprRtyn
	Knn9et7KcDnP4KmFpPL+QPY+omAztBlzWfx5m43FGcAVUET9rCrsmKDpOKzOG7grN2PmH4
	/XH8dqOi8RtUYBuBKxLEV4r1WpkcQ6f3XHvXAedfEkIagZNxfSIYbfb1cPJZNQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] yp-intro.rst: delete really old references
Date: Thu, 21 May 2026 09:06:31 +0200
Message-ID: <177934712454.33890.16346708671206927903.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <53c32b6c-b28d-f8d9-11f0-a1ca06fe0bbe@crashcourse.ca>
References: <53c32b6c-b28d-f8d9-11f0-a1ca06fe0bbe@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9511

Applied, thanks!

[1/1] yp-intro.rst: delete really old references
      commit: 5b4ffc020a9b0c7a877c119058cd43a51f91687f

