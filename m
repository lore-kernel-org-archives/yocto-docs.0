Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD521C5DF66
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17366.1786622565420986727
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=cqaRojMN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AB24B4E411F2
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A434602B8;
	Thu, 13 Aug 2026 12:02:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87E5F11C4DE67;
	Thu, 13 Aug 2026 14:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622563; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xlbUOB1wNQfhDeLBA7QoMPv9WA1S9T0yPe4ctTQMlno=;
	b=cqaRojMNacG9nsnmic0WTjX+3KqKSu5OHlitEIeopR6CaNldMzSNl80Pch/YpJ4XTFaLTO
	pnk5R5NoPjY76Mk46oqmCZFt6HqsgNf+0kV7qC+tsqBjmC9LvlW5VFlFqWaTmPvjKLECtd
	V8YXgCUx0UIHOXDzWYMQ0u4a41V/Tf8p5yrK1Aji6E/Jkb3IQyBTJ1xQPiL9QkqyICjiHr
	vOlp9l4zgkdnHhYs5wywoZL049q35CnDWfxaBNgpaW9205kAEaFj5fZtdcXDQBFH7goqWh
	vjFULRHqHVq4iIRF/wyKK5b8CKOirN/3WPnyVPVuwt9XUPLVCIDqDz38pHHk2A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	niko.mauno@vaisala.com
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: Re: [PATCH v6] tools: Add check-confusables pre-commit hook
Date: Thu, 13 Aug 2026 14:01:43 +0200
Message-ID: <178662237164.775933.10857515539858582242.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806062556.19569-1-niko.mauno@vaisala.com>
References: <20260806062556.19569-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10284

Applied, thanks!

[1/1] tools: Add check-confusables pre-commit hook
      commit: 20f34ff460259374e16ec8f4f10f9a5f71f4e0f1

