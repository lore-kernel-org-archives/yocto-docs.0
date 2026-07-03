Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136A9C44502
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91456.1783079103686625586
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=BbW+V4YC;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5DA5C49F4B;
	Fri,  3 Jul 2026 11:45:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0919160300;
	Fri,  3 Jul 2026 11:45:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC65D104C94A6;
	Fri,  3 Jul 2026 13:45:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k+7ZOzLz99EkxaULJa8TqQvrrgWnLRlZGec0xaMB3oM=;
	b=BbW+V4YC2qVEB+zLCYMokLEsz3q4KhLSuJdO4AIgdJt0bVd81bp8zo0ru2SVz0Gec77Dsk
	u7Jv8n7+AIxI+K6yeXF4kxzp1cJXT3XE9Qf6DgqQam+fCHTprlyUhJR6w8FYshcJbJFeJM
	bWTMzLbrQ8okdK52P18XMuSsHeEb1merg4EMm1k1PZoEHLfoAqk9apgDgaEo+RVLtDBHiT
	W1ma0Vt6Zrt5ZFZWmi4Q4XfLgCXo8525015O1BHmvhflx+CqC+PT8uhaehJJbPTFLOtdDy
	Z6O0vf6ajUc4puBY/aPAITvDf3EGhNTNJ/hzGY/hM9Epd0UpDYpckPbylUlrKQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Paul Barker <paul@pbarker.dev>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3] recipe-style-guide: Clarify when License-Update tag is needed
Date: Fri,  3 Jul 2026 13:43:37 +0200
Message-ID: <178307887459.248663.2226081034370656883.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630-license-update-v3-1-b91ef480c929@pbarker.dev>
References: <20260630-license-update-v3-1-b91ef480c929@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10024

Applied, thanks!

[1/1] recipe-style-guide: Clarify when License-Update tag is needed
      commit: db04faf56afded6c5f846cc60a9062e0a1ffa741

