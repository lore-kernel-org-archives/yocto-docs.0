Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF42D609C2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:15:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26553.1765901730966713505
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=qJzY9wwh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E41E3C1A585
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:15:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62F4A6071C;
	Tue, 16 Dec 2025 16:15:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C9C4119A8FBF;
	Tue, 16 Dec 2025 17:15:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765901729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zPfjGgaFDxfN1g9kxwEPhZ8iga6V0qORz2ohahWDLiw=;
	b=qJzY9wwhUAkDTdbd1spig36hvGHdTBVSruFEO2oR4srUDyIsXgjdMX0RRjQZzC02Ppra1R
	pQsbBwDIE5jz3XIYapQKhxADe4tX2dcDbrhdTjk18QPmeR1BYXmcI1rz7iVPbqsaGFGYm7
	S7XGz5YLd3p9m2FFt0jTw7L0hNg5a0AwcL7pIop3kSR/yXrNV3ZjPRs4fkrNdBGCFNhYDW
	gG4wpZkrAWiKgdUHN18kS7RNpbaaMzpciBBirgBsaG2+n3NWkX1/+LChu+1K2vdR9XVf12
	1AoGVaHQgnsnU4sv4Zin20/Du6ipJjIlaJtDVwshFuPdAVLZspIKZPogIzpkaA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] brief-yoctoprojectqs/index.rst: fix improper code-block indentation
Date: Tue, 16 Dec 2025 17:14:56 +0100
Message-ID: <176590168754.123206.4435418558765171409.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251215-bitbake-setup-v1-1-abbbeb81ffbf@cherry.de>
References: <20251215-bitbake-setup-v1-1-abbbeb81ffbf@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:15:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8297


On Mon, 15 Dec 2025 12:26:45 +0100, Quentin Schulz wrote:
> This mistake resulted in an empty code-block followed by a quote sectio=
n
> with poky-master-poky-distro_poky-machine_qemux86-64 as text.
>=20
> Let's fix this oversight by making the text part of the code-block.
>=20
>=20

Applied, thanks!

[1/1] brief-yoctoprojectqs/index.rst: fix improper code-block indentation
      commit: d84d916d4fc505e8386693306b6a90b0064c0518

Best regards,
--=20


