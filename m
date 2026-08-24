Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A751C61DB6
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:45:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17069.1787579155891053241
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 06:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=k2FR7M31;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 360214E4138B;
	Mon, 24 Aug 2026 13:45:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 037E25FFC1;
	Mon, 24 Aug 2026 13:45:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53FC011C79573;
	Mon, 24 Aug 2026 15:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787579153; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mWTYPmAjFeA91ykqq03IS34Qzg7cHq2rY1wxdJFTtXw=;
	b=k2FR7M319lXUkbsSaC3qkJnDOhNzheIaBkzYjzcIKn0ZxO/BRyZ/Ld6FvHMuwd3y/MUPU1
	E2saJ8LhKKULrPdSFbJE1rvO+976a7u1nFYQYTquw3VL8xPOJcYbUg5hJbKBviMIK43Nuq
	is8V6CrneY5Yx3uN21t3HBkF3uWKvWS3gBVZo+CS+eZa1MUiBm27i7AFpXze+9qU2yPcNE
	HjONbbkObV/NmqyHfmINzgrX1+mNMcSjwGY4nmtJjBbSh6BWGRHCMHjxpSU8EZ6Vj8PAw8
	PDkIzQoPeZoPkfjtGzXePpEUUzdaiiwTobvI7GBFIxfHu7rKHHSucCxZddYAJg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH] README: update instructions for installing vale and sphinx-lint
Date: Mon, 24 Aug 2026 15:44:22 +0200
Message-ID: <178757686713.159281.4431115820326592536.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821-pipenv-vale-sphinx-lint-v1-1-f108b7e3e739@cherry.de>
References: <20260821-pipenv-vale-sphinx-lint-v1-1-f108b7e3e739@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10331

Applied, thanks!

[1/1] README: update instructions for installing vale and sphinx-lint
      commit: 9955b0f099b6b42a9750f0d544944a2d8e5a39b2

