Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763ACC44502
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32877.1782720281904880846
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ExQbh6mS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 478B81A0CAD
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DBB95FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D511A106F1573;
	Mon, 29 Jun 2026 10:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r1d19bULBa5reMO91wCsTAe6X4S9T3KBW9CCgcO774k=;
	b=ExQbh6mSCdq2wIyB+VbiwIzE8aSPJyvCbSl8q1JuRF0HGDATLWkEaoDFtuHL6Dp4NqEkNT
	7jltjPM4mIa789lX8GSEVnITF/tdlscf4Ciw2C0sMJN3TvUP9IYLk/0qS3assjVSfF+TwM
	2ooyWnXUHheVoDXoGO7py9AvPx7CmFWe4vCKAbT/TppRwqusr5wB5De1PxsfntQqovx7qw
	ryW/v+Y9iTaxFuUg5KpRVxJPkyVWZKU6HWsgMeB7gqV3tjAjTvuQ+1SCLW2fNtHrBwexq8
	G77i+akQ9mWsSfZrh3egAWF0uDKeiSprcm4/Y1ANJKDZYjXEaZzG9/eiS4f80A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4] Document shared state signing
Date: Mon, 29 Jun 2026 10:02:56 +0200
Message-ID: <178272012312.45179.11589027456533465928.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526-sstate-signing-v4-1-e6c91c460a21@bootlin.com>
References: <20260526-sstate-signing-v4-1-e6c91c460a21@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9926

Applied, thanks!

[1/1] Document shared state signing
      commit: f3d78e68f74f2b37d5e7207e01e723ce4dae6441

