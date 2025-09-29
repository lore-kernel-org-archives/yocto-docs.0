Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010E6CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 06:45:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.47623.1759128338735033317
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 23:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Hz9acFgw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 61D674E40DF1
	for <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39CC8606AE;
	Mon, 29 Sep 2025 06:45:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACD77102F1848;
	Mon, 29 Sep 2025 08:45:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759128336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jfuz5Roi6K553o3D2SKl6yWXlEg7kLQ+wbhlE91pbBc=;
	b=Hz9acFgw6n4qzn05VNiiT1dS6Ayak3hOKT9ikZUmnA6O7BO+td8FMtpF2EH7vmaEABnbwx
	/GMgRA5bGKMYrgeXFEze0ntjksVmzMp/k8pPe31bSFS7CZ2rfZkRrhKaxNmIcJe+X+TOUV
	Ar/Lky73CA99jx9RvVxhrsJYlDsr8STA3ZEAtRSG8CEnVoQUa4dU5rEvcQHsXXCXfQb494
	6Y0urVeGaqP7WZ+Q1yM16b3p5rCncXB+4f60WzqTQAkHO4JW0fGcidNEHzr/4qyGBERwCc
	vMv+OTvLranPbCh6XIwEdO1+dr/IA4AzkRTqz9nd8QuL9AZr+2GvtwVqrk4B0Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Yoann Congal <yoann.congal@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides/release-notes-5.3: using runqemu with compressed images
Date: Mon, 29 Sep 2025 08:44:31 +0200
Message-ID: <175912824412.5757.11001804484675159362.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922210249.467942-1-yoann.congal@smile.fr>
References: <20250922210249.467942-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7625


On Mon, 22 Sep 2025 23:02:49 +0200, Yoann Congal wrote:
> In OE-core commits:
> * b5f8c3e029 (selftest: runqemu: add tests for booting zst compressed i=
mage, 2025-07-31)
> * e069fe2480 (runqemu: Add support for running compressed .zst rootfs i=
mages, 2025-07-31)
> runqemu gained the ability to run compressed image (+associated test).
>=20
> Add this information to the release-notes for 5.3.
>=20
> [...]

Applied, thanks!

[1/1] migration-guides/release-notes-5.3: using runqemu with compressed i=
mages
      commit: f268c1b649227d533d02e1a6df797b784fcf80de

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

