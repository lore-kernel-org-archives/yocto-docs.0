Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB2DE9B34D
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157073.1772445260364359549
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=OuwgGkky;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9F254E424DD
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A259A5FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13FA91036954B;
	Mon,  2 Mar 2026 10:54:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o8rZ/7rrkIuVoUwuse6rsI0MACA+/0VoY7VDHY8xxqM=;
	b=OuwgGkkyUlm13SHbYHn+xFX9b6c1+zGkb8TXkQlYVOBA1FhnLJrj2rfMA3VS4zxFQ+pYy0
	P2LWTDEd9CLWeN4zJL4drXan9aHDobr2ucz77a6GSrI7aeothaaW8T5/+OZ6TZAozL2jYo
	jFsef3hS828g0kDP29Y8ys+GZQ2DK48p/z5wb9Ke/xAQXXso56OGGXeEpKKEG3+zqtmfrJ
	cqGnjOdsGShAXIPEk1nJCw4q5fDpRxPWeaP5B+0RkoVzAe0iNc52t63R8RCMuN2qylQyB3
	decFupFJlFq4flUi96YPOGrl3FtouR5FDkdpwafM7xw9Blkr2BK5B9+rkuTr6w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] what-i-wish-id-known.rst: replace figure by the new SVG
Date: Mon,  2 Mar 2026 10:53:36 +0100
Message-ID: <177244519643.106718.6113008547581718074.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223-update-what-id-wish-diagram-v1-1-da99f5c74c22@bootlin.com>
References: <20260223-update-what-id-wish-diagram-v1-1-da99f5c74c22@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9030

Applied, thanks!

[1/1] what-i-wish-id-known.rst: replace figure by the new SVG
      commit: 538b554188f6efbde66b688e7448907874f387f6

