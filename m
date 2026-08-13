Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6B3C5CFCF
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17476.1786622569287770579
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ie7PW8hd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A1A311A15EA;
	Thu, 13 Aug 2026 12:02:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71743602B8;
	Thu, 13 Aug 2026 12:02:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC31B11C4DE71;
	Thu, 13 Aug 2026 14:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=74rt+xhTec1zqKEZ72eBfbvP04R8RQ1LlkUGc+snvIs=;
	b=ie7PW8hd6kRV1R9/OdV0Ezd86zjiQIhqoik7teRf2k3La8rMnR4EJdkjX8bMmL0rsOGuBI
	F+XVbWvU4pRy2A15LF5y0vnVJLNvk5XB9qKfCdetzKSwAIBl1yPRQfxCFTY5LKcaXgDnFW
	g9RvKM0DnhJiUDuC2XMLBkw2ujltRZoGn+qkMxRx3akNMBHGAcW9NkTLq7THa7Jxokk5iw
	Z9xpIVt+2Lj3IEcrm//XN2Id7kMa9uMH1kAtgOsEgUsHNxm+6nqPW2TmxhIU3ukZZRD7/0
	FEkworGRD0j3niUNFfozUao4H6VVuWwKvEWPxP7OSnB3kq7UJJ85/8t7wqY8DQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	yocto@pengutronix.de
Subject: Re: [PATCH] dev-manual/creating-fragments.rst: fix typos
Date: Thu, 13 Aug 2026 14:01:46 +0200
Message-ID: <178662237141.775933.6512727909129305727.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807050517.3446202-1-u.oelmann@pengutronix.de>
References: <20260807050517.3446202-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10287

Applied, thanks!

[1/1] dev-manual/creating-fragments.rst: fix typos
      commit: ce7e4d60a315afa395a05f46b92e51337ec6df4f

