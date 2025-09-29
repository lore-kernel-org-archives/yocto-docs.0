Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC70CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 06:45:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.47700.1759128331765689863
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 23:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=cYmE447o;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3880C4E40D06
	for <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10112606AE;
	Mon, 29 Sep 2025 06:45:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44BFD102F183D;
	Mon, 29 Sep 2025 08:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759128329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3cahB7HRVSa4/QTsPAq25PKu3/x5Mm4vdykq24pepR4=;
	b=cYmE447oL2H63amcI2O0jN/6kct7e4ZgILRB6581Z2HjjCinTC4Rcm7rqp6vo3RAiyqF/H
	+RdVBGc9kaUggawXi7VKeka5sofMw3wOJClAWPGJEIVvKe5Dkv33JKfG2PDZ20vNpDEoZR
	vYMtyTDr9xjwY1HUDBZUFUYVpwpVnMuN/23r895/0h1ggq5Yen56PMJ3W29ENTX1N+91BU
	n1vurRs9rksaoEnRgEiOEq1KQkifDAJR0pDF4DQqt4WibClNUE28y6UpeX/fgji/9TyKxb
	PfknjaKZF3xOz+nKaal03VV0uIm+DgP4SZYQWAaQF1gWGhjoRlmw/KmPoFixlA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 0/2] Update yocto-check-layer documentation
Date: Mon, 29 Sep 2025 08:44:26 +0200
Message-ID: <175912824410.5757.4601898189719081765.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919-update-compatible-doc-v2-0-c428da260487@bootlin.com>
References: <20250919-update-compatible-doc-v2-0-c428da260487@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7620


On Fri, 19 Sep 2025 14:18:42 +0200, Antonin Godard wrote:
>=20


Applied, thanks!

[1/2] dev-manual/layers.rst: yocto-check-layer: mention --machines and --=
dependency
      (no commit info)
[2/2] test-manual/yocto-project-compatible.rst: fix a typo
      commit: a84c234acfedfa714419006c743405e2f9acaedc

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

