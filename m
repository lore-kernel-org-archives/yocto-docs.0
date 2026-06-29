Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BCFC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32895.1782720310804181495
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=inpVy7CF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2A48C1A0CCC
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC95E5FF96;
	Mon, 29 Jun 2026 08:05:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BA19106F157A;
	Mon, 29 Jun 2026 10:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rkzg6bleC9BlfVVuTZUFoR5lgExhgnpA74L/dKieTBI=;
	b=inpVy7CFhCYO+RQj81mIFBdbw/nIn3niaDdG6TLn+6cs5mxIJ87qxoL24lKgNdepMP8MPA
	X+DRytW/I///II8Se1l/NZzFtMp6gBHClM9yK04pc9y6eH+HkG/yrChpCaxPaNS92JVq0f
	LLtpX3cGb288xsUJ8WNmQboVRPT3Sr0mII97HLjlmtLK8z8bDQmXy0XVQXgATl7sEEcPBC
	Hluyz87gOocktopmDfin92hz2JWCfF0CI9B1p/GnQr7JP2GRZtgd5bwOcWNtwrmlYkLpvS
	/N4zOrqa0DbqwZkDGLDUZrM8/cV295t7CPzJmiskqPD6t+iP8AZoe4rAanfgdg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: clarify use of "PACKAGE_ARCH" in a packagegroup
Date: Mon, 29 Jun 2026 10:03:16 +0200
Message-ID: <178272012553.45179.17173469580744853926.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <70a7a488-e6f7-3997-230c-ce8deb26308c@crashcourse.ca>
References: <70a7a488-e6f7-3997-230c-ce8deb26308c@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9946

Applied, thanks!

[1/1] ref-manual: clarify use of "PACKAGE_ARCH" in a packagegroup
      commit: 98a14fe885370d52a6f46e940834c725bad6933d

