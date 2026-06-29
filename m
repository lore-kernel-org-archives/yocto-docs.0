Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C81AC43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87406.1782720286190900692
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=aS8EMGrc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 890C11A0CA1;
	Mon, 29 Jun 2026 08:04:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 578815FF96;
	Mon, 29 Jun 2026 08:04:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82A62106F156F;
	Mon, 29 Jun 2026 10:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dLqDWlV5Ew/GjcGbtttmk6pDrkYGIna9fzru5a57iOQ=;
	b=aS8EMGrcKYt95SCzNbFb7rQB8xeaZ67FOdZdX0amH9fxzCIiLso8p+pNiWHUc10Ro0DuIp
	ik6CfPLwPsw8Gfeeeah0UsN90TlUBQyqbZ+KS9lQiBOcQuOvn+O+iOjtTTVmkvIeTlyaBX
	OEwCg1o4wqIQmiU9dqJg+Rgs2pP1aVVr/5BFJgkOIs1g2j+vFKbPncquYc/2qPrP0s1zbP
	0ggpdD+OppaZAxtyN3olooJqtePSTfRfdKubcMZI6U/CucvqkNfiC3YTtsh1nR3zLk4v0U
	dCTNke50sot/vpDhkORcMW2wVKTbKhCIWGYUPswfhCaSWTHULWyD3N4GDPsI+g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Jaekyu Lee <jaekyu.lee@lge.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guide: 5.1: Fix typo
Date: Mon, 29 Jun 2026 10:02:58 +0200
Message-ID: <178272012674.45179.4729265754939800922.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625095154.3878438-1-jaekyu.lee@lge.com>
References: <20260625095154.3878438-1-jaekyu.lee@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9928

Applied, thanks!

[1/1] migration-guide: 5.1: Fix typo
      commit: f581414afedaec241bfa359d30166f9ece1d3a4c

