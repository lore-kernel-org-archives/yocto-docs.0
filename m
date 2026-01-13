Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9ABD2D0F2
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:10:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58454.1768309821919037817
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=tAQpZudw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E9AE4E420AF
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34ED760701
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A028A103C9332;
	Tue, 13 Jan 2026 14:10:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768309819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rdq/jH862SvSxd9MCEOSNekKWMr+hmHXig5KR9IF5nQ=;
	b=tAQpZudwISpW6ZdO3Tf/xRpeveKKipvUjppljBYTIeKoCwDQL60A8mw/I7ueDMXxqPvscP
	wdi+0i0IcaXHj9niAfnRFJZnr5lAPsYhT0wm9X5OXFrYSPz85wAiJmapB1YU01kW1JhVoW
	2gRzVjyL71fL7iQKLjbiuFk3zu6as97R3MUZfepOlKeSuNbsRxTP2m3XzpwsCCR7AmulBx
	gnA4WefWRrciaTvMqvzfsURgQO/tGQLZQvlOVZogPNzw40IM6xrDJ6WL6qvG5MIrNGcw+r
	cKYf64rCNYp7cEb2UNBrdgp4UNIhBNzYLictqtEUFBzL2tp/Bx6YiRx9+t5XnA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/variables.rst: document the CCACHE_TOP_DIR variable
Date: Tue, 13 Jan 2026 14:09:54 +0100
Message-ID: <176830971050.418327.8611904870182906916.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106-ccache-top-dir-v1-1-a4e491160301@bootlin.com>
References: <20260106-ccache-top-dir-v1-1-a4e491160301@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8499


On Tue, 06 Jan 2026 16:22:06 +0100, Antonin Godard wrote:
> Added by commit 35d7fe73bba1 ("ccache.bbclass: Make it can be shared
> between different builds") in OE-Core.
>=20
> Fixes [YOCTO #16052]
>=20
>=20

Applied, thanks!

[1/1] ref-manual/variables.rst: document the CCACHE_TOP_DIR variable
      commit: 550ef8340b550f8d4e9c3d0672190dc09592c621

Best regards,
--=20


