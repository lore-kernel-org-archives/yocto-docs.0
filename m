Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F248CAC59D
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.24170.1758118445692047842
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=e9Yf+ljZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 52097C653F4
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:13:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC646606AD;
	Wed, 17 Sep 2025 14:14:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1639102F1BAB;
	Wed, 17 Sep 2025 16:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y9iOIXkPBAkR4B4lv4ywqZ0tHuUBU2vwFnyoj+43lpQ=;
	b=e9Yf+ljZPLPW+OveTIv2EwBB/6D41JK2wWyq+o9QGHu0ubvhfJxabUmPIwNd2mbhz/M7wl
	ORIm6ZoCiUXzkb1DO95qyZl0koJjhEGLy453A3RNTBCkw/KtNJLOgYAMKORAelUiZmEZeU
	oprbK092LI0iVhFFs0MpYtaYf4QGpi5oUk+6pe2lWjSk7PGbkGlv5kycSLtQqGihsSBLUs
	hzf15/EeMysJ0s6PEijL42NK/dWubLrqRZ5JRqNehRr3zvnTkf2ykFQNgp5cawNS/UwOFZ
	WChEZXgKoY3osGyzwsI3UCPN7vcXxq2FAGNyUOGocPWPvE8eQyUIMFoHXmQ8FQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH] migration-guides/release-notes-5.3.rst: add x86 qemu micro-arch level bump
Date: Wed, 17 Sep 2025 16:13:16 +0200
Message-ID: <175811826406.690097.12566162429275932073.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829-qemu-level-5-3-v1-1-d2cac1e1bce1@bootlin.com>
References: <20250829-qemu-level-5-3-v1-1-d2cac1e1bce1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7529


On Fri, 29 Aug 2025 11:04:04 +0200, Antonin Godard wrote:
> After commit c9585bb8689b ("Revert "qemux86-64: Reduce tuning to
> core2-64"") in OE-Core, document the QEMU x86 micro-architecture level
> bump in the release notes for 5.3.
>=20
>=20

Applied, thanks!

[1/1] migration-guides/release-notes-5.3.rst: add x86 qemu micro-arch lev=
el bump
      commit: 22c0fc1943c23d6f927034afdfa25ce64c5ba79a

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

