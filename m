Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D311AC43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32876.1782720280184346547
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=qEJETf9U;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5407A1A0CA1;
	Mon, 29 Jun 2026 08:04:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A82D5FF96;
	Mon, 29 Jun 2026 08:04:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2688C106F1570;
	Mon, 29 Jun 2026 10:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ckumrL9xulC1SsWwPoOSwapcTv9E0SBURHf3S2J2PwY=;
	b=qEJETf9UJyCVSfXsszmTMesd9XImQ/eJ/J1EOX0mkjgL1yPjD3Vydy7AJjpeYKwYKcLE7L
	rc2qKMjU7KsxuMXaM1oyeb2swegu7i8k7nBjNsHjeOF4xiArnNBnZxH26NUQzJpv13CRxc
	mSk4Nzc1CgPtpt7rcwvt+9IYonZXKmkaBGmOh7cEGIPZq8i6UVZEZU4BpBcg1U+qfR++tC
	aZnGzlXKeQHliMXIEoVxJnmzfirr8EW3E8emBhRSDscIbUjkJMTUWCA/RhiuqRCvdG3mPd
	ih1ueSLfhvPUSSWoS+UmyEzRuV17/l635goD0TUImvD1iH9811RzYAcP6K4GCQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] tools/build-docs-container: add debian 11
Date: Mon, 29 Jun 2026 10:02:54 +0200
Message-ID: <178272012604.45179.12748629438494136063.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623-add-debian-11-container-v1-1-8cfcf8572ee9@bootlin.com>
References: <20260623-add-debian-11-container-v1-1-8cfcf8572ee9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9924

Applied, thanks!

[1/1] tools/build-docs-container: add debian 11
      commit: 4fb323c8a1e5564a7cc20c1d1fefec7b0abd2fc1

