Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBF0C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87407.1782720290924526404
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=QwGIZH4b;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4C0BE1A0CA1
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 219D45FF96;
	Mon, 29 Jun 2026 08:04:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B6DF106F1567;
	Mon, 29 Jun 2026 10:04:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hvC8jYhhZ7lO83kb0XxbN4Fxc6xuxqdgxNsEE1tP0ys=;
	b=QwGIZH4bjW8Sc2xOLGJVKifHr70VxbQHHLK/39lQTRfFKW86wxvh0JEpLtuRFpE76H5jeP
	8LI861ZAjQ2LlwNHk1XZ3f5sBsS2klX7RYY28ME1ybNarwYmIqqIv3qfFKa7LKEx3qC3Rm
	5uxPSEUsl3FWm1mTlrDQyIvMpNj1eoI8QD0AD4jTmwRpIjO0RttNyWufDHoPoNmsh+5rEE
	LAUcwK0I9szyygLNEKikIjB1xc+higXmduNmGp4cEMBWVuD7APc9uMOr/UEEgA1WlBbJdt
	9LUdPMLxF6/ttBvXRAj6ZWtMeAH4gITaFMm8a2I9Hxt+NMcYNVGi5K4ArAmo7w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: correct example of "bitbake-layers"
Date: Mon, 29 Jun 2026 10:03:01 +0200
Message-ID: <178272012352.45179.1446430228921652419.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <afa37918-28f2-c2a9-f311-0ce6f9f160ea@crashcourse.ca>
References: <afa37918-28f2-c2a9-f311-0ce6f9f160ea@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9931

Applied, thanks!

[1/1] dev-manual: correct example of "bitbake-layers"
      commit: 820a86797fa52675921f0adc1720b87e900249e9

