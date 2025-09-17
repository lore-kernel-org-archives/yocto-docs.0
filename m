Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6F9CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.24181.1758118456600509563
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=SGYm0W8L;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41F734E40CBF;
	Wed, 17 Sep 2025 14:14:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1925D6063E;
	Wed, 17 Sep 2025 14:14:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7078102F1BBA;
	Wed, 17 Sep 2025 16:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118454; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bO044ldhz7jcHN4YvHsSGYTkhryRBILDJ9de4zGvGP0=;
	b=SGYm0W8LLK+tVUhpcoygPAA2+cr2iKMi0z/mxhpt2ohKLjPmb/MJpWCWdqhCC7O8ZdfCDx
	zEHzNlJY56WbFGWdZbm96ySYdeHHQnUUz4i2qSRA8FUh3+FqQs6sKLigIwPSXUHiI26VV4
	hQUUDCiQOwlc/nJEy75NSGUon0bwwN51cHxv8C8khXmaXisbYxBvTcr03o8lP0YjSYMR6h
	Z//dLErjxsB17DgDF6h6vcj2URl2GLWq52tMLtodT7tQGxgUO+zsPUJi7V7oiRGEI1geY5
	fvwe6CF5tMF+bLOsDoSKGlWXEzsN69pdFCVMylsteINWrc8A2WVVC0jrYDXVKg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	pierre-loup.gosse@smile.fr
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH 1/3] ref-manual/kickstart.rst: add extra-partition-space
Date: Wed, 17 Sep 2025 16:13:23 +0200
Message-ID: <175811826411.690097.11057255953754339051.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908140048.352088-1-pierre-loup.gosse@smile.fr>
References: <20250908140048.352088-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7536


On Mon, 08 Sep 2025 16:00:46 +0200, pierre-loup.gosse@smile.fr wrote:
> After commits 47533f20a7ec ("wic: rename wks flag --extra-space to
> --extra-filesystem-space") and c7f51c23fd268 ("wic: add
> --extra-partition-space option to set unused space") in openembedded-co=
re,
> document the new Wic-specific option extra-partition-space and rename
> the extra-space option to extra-filesystem-space.
>=20
>=20
> [...]

Applied, thanks!

[1/3] ref-manual/kickstart.rst: add extra-partition-space
      commit: cba5dbb32a24c9e20e5a6066ec382cf7ff9b93e2
[2/3] migration-guides/migration-5.3.rst: wic option extra-space renaming
      commit: d3a34e8dca3c774234d3c6f4e575858869a7460d
[3/3] migration-guides/release-notes-5.3.rst: new wic option extra-partit=
ion-space
      commit: 20c6e107af0441772cf986547a7d8131ec244c8c

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

