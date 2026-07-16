Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4A6C44514
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:13:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8697.1784193177473377503
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 02:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=HqGj3Bwa;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B8F2E4E40E09;
	Thu, 16 Jul 2026 09:12:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 866BD602B8;
	Thu, 16 Jul 2026 09:12:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B58211BD3CB4;
	Thu, 16 Jul 2026 11:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784193175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=noLbE620VEx+hcSA5dNEGXs++HSis4+SlsxVdB1qLL8=;
	b=HqGj3BwaT+dhRqmOPrbucp5KFKmthzt66VIY7Dzfm9ihlhNqq2kKwPQjiYNudRb5F2g1Wt
	kmslGVbnFQZawLEYmhoPJwPd79fc+XX7aEn9icK6ycGLgkx/AjpLDYyzkiZ1iwL+dsres1
	PNufaLgYVfnyKmQCFj6tCi2sFAPN1/TxqXRn323yKcoIQh8SaKjFPUMp47izVYTjm0z7by
	o1uxOeZuKBAgfCDEUOuPQDGT1vo9upJSp8XXGk1V3WyTti27VDmNNUMSyxzVO/Qc9VRuwS
	Dnm7uZerAv3fN1opoiCAfbbzx6s1hdQWowl8oD6ucuw6Ld+g0IZ3BI+OoKmFSw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Lian Wang <lianux.mm@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Lian Wang <lianux.wang@processmission.com>
Subject: Re: [docs][RESEND] fix multiple typo and grammar issues
Date: Thu, 16 Jul 2026 11:12:17 +0200
Message-ID: <178419298516.94913.3354810517436293557.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710082347.7746-1-lianux.mm@gmail.com>
References: <20260710082347.7746-1-lianux.mm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:13:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10082

Applied, thanks!

[1/1] fix multiple typo and grammar issues
      commit: 0cd9c643c0185c60eb9aae90fe48c3597b1781d6

