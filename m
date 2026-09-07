Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE3DC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:31:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30050.1788769871619757120
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ZwCIfg87;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F22191A1A0C
	for <docs@lists.yoctoproject.org>; Mon,  7 Sep 2026 08:31:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF34060383
	for <docs@lists.yoctoproject.org>; Mon,  7 Sep 2026 08:31:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EC4511C7AF0A;
	Mon,  7 Sep 2026 10:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1X9v+xLuyMKLPgthaOHyciwc3vfO7L4w3EAEBbaDPQU=;
	b=ZwCIfg87zJPKS018D5uxjF0pOEaZ1iIKL3npRAp8xl3TL0QWhGY1kltJYVu8as+99DF+ym
	Iz0l90XhLCvGvAFrzgxAhjg3gCtbm1jANUPdNjgx9VTJG74y8BgCXX2OaSJnM8AnFKVG8/
	tRrh8gy3gHUHAJ3oQWuOHmtPjpgPzNBf3a4tXGrWu11aNlz5+fl76nfFBb+xRRoH4toX8g
	5rB0nutD3t63j5gMOozEDJuvg1Hs0t1zNq6UM5MxMdwDwsn3cy8HbuyKHKJIw0lc7D9IsR
	I815ZQdDQG7I9dHihjwD2FwXpoZSXHddAUFEy5RV6+Kbgn/s2eeyvPKvSp0xFA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] docs-wide: fix USERMOD_PARAMS -> USERMOD_PARAM
Date: Mon,  7 Sep 2026 10:30:19 +0200
Message-ID: <178876977259.61738.3854775189546791855.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827-missing-variables-v1-2-7ec8b525b23b@bootlin.com>
References: <20260827-missing-variables-v1-2-7ec8b525b23b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:31:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10437

Applied, thanks!

[2/4] docs-wide: fix USERMOD_PARAMS -> USERMOD_PARAM
      commit: 93ac6175a6d2c478c783c6a2a40548e9b5e49559

