Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FBCD2D0FB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:10:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58456.1768309823529418063
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=FoK0Kcum;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9F08F4E420B1
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7417960701;
	Tue, 13 Jan 2026 13:10:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D187103C9334;
	Tue, 13 Jan 2026 14:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768309821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UjVNQAHqyrct1n+0jEzf8jD9l036eMX+ruQRKqJ7XQY=;
	b=FoK0KcumtEOhylOJCnsBDmh3vWwxKcE1GH5NHvWkzXY12sJrnxtoZGMlHZwRMf6/LT9IbZ
	vftnR0Xne5NZj1wuB6ffo9uG2PzUUHkxxLN/n2OW98JAjOgk4q72qnov79YRhKR5Z+UNED
	f+uaOdDeUPM0ZVK1ofu2uNHv+i223dKoQBkr3yarQkROU3yjaO8YdMjkOE49BzE59HrOLw
	oUXATQtEUVM5gWmHQJSQPUeLp+ukbhNunblENfrlLmEg/EXhK/VSYUGyC9zKO9sugTPv6u
	mT/RuZURNFFv/DQfowvFLkk9bCNRGQArOl1XS/BPqq6+DLZ7dg2zdUI65JstDw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH] test-manual/ptest.rst: detail the exit code and output requirements
Date: Tue, 13 Jan 2026 14:09:56 +0100
Message-ID: <176830971045.418327.17579438329059906469.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109-ptest-output-v1-1-29b1b2039c97@bootlin.com>
References: <20260109-ptest-output-v1-1-29b1b2039c97@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8501


On Fri, 09 Jan 2026 11:45:22 +0100, Antonin Godard wrote:
> A ptest must emit at least one test result on the console, as this is
> required by the testimage class (which ignores the exit code).
> ptest-runner on the other hand, ignore the output and only cares about
> the exit code.
>=20
> Add these two items as requirements for a ptest to be valid.
>=20
> [...]

Applied, thanks!

[1/1] test-manual/ptest.rst: detail the exit code and output requirements
      commit: 9292f61d7ba89598c89033ea7ee3b11a20d873f3

Best regards,
--=20


