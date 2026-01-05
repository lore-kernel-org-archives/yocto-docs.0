Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D35DC79F90
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 13:53:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64172.1767621185835593088
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 05:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=1KpEfDx3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4611EC1E489
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 13:52:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41C0260726
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 13:53:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91C6B103C8550;
	Mon,  5 Jan 2026 14:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767621183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cM5d2ySdFw2jo+A6ZEUGXVrW5PV7qSXvfXMzObINA3Q=;
	b=1KpEfDx3JJR/4zXa6au3beGGO313yXSrWAsACPhl4ICBpGNZKisa8tvq/mUTGvufh9rFAc
	swQw5vD35BQhXylnKkoSxGTMCfIIY6QUWSkGV0oAhA+HYSvvQmiutuuRpfAG/A0IgVtC9Y
	hrEC+0/J/lh+KH0ze4oABOI4X14wDiDsQAdjwO+YD5iqLVDCX0EUv2CHtvMeOIhqBTc2aA
	cF97riIylv0B4f0KpubIHlpuaAeOF/SBR1/dBn+RLFph/u3ZB1sRbBebhmABwPK70Ct/AN
	o1f2WiO3aAUBy7L1z3SfSyozX0medsrevMJsdMVf2Kb9hiDvzVMA7hfFp7Bimw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3] ref-manual/classes.rst: document the image-container class
Date: Mon,  5 Jan 2026 14:52:31 +0100
Message-ID: <176762113056.481362.13187576469702541573.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217-image-container-v3-1-ceb72620a254@bootlin.com>
References: <20251217-image-container-v3-1-ceb72620a254@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Jan 2026 13:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8387


On Wed, 17 Dec 2025 10:16:30 +0100, Antonin Godard wrote:
> Add documentation for the image-container class, which is a simple clas=
s
> to generate an image suitable for creating a container.
>=20
> This answers in part to questions asked in [YOCTO #14368].
>=20
> It also adds documentation for IMAGE_CONTAINER_NO_DUMMY, which was adde=
d
> in OE-Core with commit f0645e172bb8 ("image-container.bbclass: Error if
> not using linux-dummy").
>=20
> [...]

Applied, thanks!

[1/1] ref-manual/classes.rst: document the image-container class
      commit: 6ce00e5875eb3469fefd55cc22acaaeaf620053a

Best regards,
--=20


