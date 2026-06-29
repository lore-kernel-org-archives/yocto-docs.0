Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E240C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32880.1782720289177045015
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=Jela0aic;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 861461A0CAD
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A40E5FF96;
	Mon, 29 Jun 2026 08:04:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3A87106F156F;
	Mon, 29 Jun 2026 10:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N/UXe33kPtaaFMDbfv9Eu4WTq0w7d0xHwAgner/GRPk=;
	b=Jela0aic+nyGBRGt+NIAGOVRN9+ffuDIjv7kBb+OEv+TGhgL7V0P1y+Bo12+6GnmLAx8Xm
	s67grHmJBA7C3grAaY7Qy9txVBGOSgkT8qd8Hx2Hf04CRhGI9nDiOuetCxUXOoRZAx1qyZ
	07gdQclnbr+Dqrr7z8htCoYQGpST/Kc2+gN0Xp5C8jsPbI9JopByqDDuBAej6K6YXXXb6Y
	6O4rpvh6REBi5V8MF6qr3rK9/Suvw7WxvG0P2mByzpQERUl9zi6lVB3kj3KozbN4CFMUM7
	lOkSwve71q9rCQY2PC8+/kc86Jevh+fmAAfqpmvaRFIK1UkFI3iQcb4EepDgwA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: change "setup" to "set up" when used as an action
Date: Mon, 29 Jun 2026 10:03:00 +0200
Message-ID: <178272012423.45179.5321291022825854351.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b74ab4e0-603a-9753-da0e-2b3cbe7e8afb@crashcourse.ca>
References: <b74ab4e0-603a-9753-da0e-2b3cbe7e8afb@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9930

Applied, thanks!

[1/1] dev-manual: change "setup" to "set up" when used as an action
      commit: 6b4f73493b144d97a5e0426ce6ac97cd97521cee

