Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E442CAC599
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.24135.1758118445719662219
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=NrokQM/5;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E30E4C00788
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:13:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AFB66063E;
	Wed, 17 Sep 2025 14:14:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B546102F1BBA;
	Wed, 17 Sep 2025 16:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vn1EeFYGUaAbMma8ig9lbpmDs6eav4UJdZjeOUzUU5M=;
	b=NrokQM/5lpFW0avAvfDZgJnmWaEKvRu9hE/1tzhSpO7YFPGfzEGl7LicdQAkkDPT6okzqZ
	ZoM9gx+wsBWyTrpZGZU1QPvMPELahjSRJs1zuOWVG5KikPGyR2aEaLlhN5Vlz8+GB/2NMT
	YxQ2P86wglEoOFpcDYrsSBTq4brAkVFK1xT6ybnAehm+waIJXnsxkiszBEncQYD3H0ZxTJ
	OE2oSJhy/OSi+YL65pVXirxn2vYbvVCLGSOreZL3sYC7/eGvPxcfY7amSXQlMDECVCVGNb
	ANgAPmnA0om2gBuuQzopaFsKhumOy5C261000+3+ur+w2q+nNEYWkkBlaItX/w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2] migration-guides/migration-5.3.rst: add note on systemd pni-names change
Date: Wed, 17 Sep 2025 16:13:17 +0200
Message-ID: <175811826411.690097.15039770576977574086.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912-systemd-pni-names-v2-1-2615197df69f@bootlin.com>
References: <20250912-systemd-pni-names-v2-1-2615197df69f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7528


On Fri, 12 Sep 2025 15:56:59 +0200, Antonin Godard wrote:
> Add a migration note on the pni-names default policy change after commi=
t
> 9b34a810496f ("systemd: stop enabling non-standard "mac" policy when
> using the 'pni-names' DISTRO_FEATURE") in OE-Core.
>=20
>=20

Applied, thanks!

[1/1] migration-guides/migration-5.3.rst: add note on systemd pni-names c=
hange
      commit: 237f28de0bf8d1e1be60a0d9429b3a98740778e9

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

