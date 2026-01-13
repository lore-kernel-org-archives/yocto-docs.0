Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776E4D2D0F4
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:10:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58453.1768309821466477515
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=bb2i1PNy;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EDD494E420AD
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDC8F60701;
	Tue, 13 Jan 2026 13:10:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3EE2103C8A53;
	Tue, 13 Jan 2026 14:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768309819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h6rL67tT/KA81AmFYKVERaQjHcUE3OogFjuvjW1D5oI=;
	b=bb2i1PNyfKhc3tlQHO3DaPubjP4NLavf20JjSA4/xJZUI6Zcsn3cNyOKQgaEdR4cFu6//L
	Z9kC373Vl+mueZHksz9siF/QhYg1qrcQcAN0DJMnESnvuVxvBKOrBmlAMFTpMSXFnIkHGK
	15oaxYH3/LHmtlbM3Ocnq8fQYgvbgYecqI3BgrUcM+b/PFZaFuU1ojl17LaZVii8oPJ54l
	knhcJKuVU0qi2/Ohdf5okkYR88AHMmuiLS9qNPDkmgaPc48yU+WCGWTCXsPq37aeIw7rzb
	3Hi8Rvb5uwrlM2Unc4zfGQpN3na2y6pfs1ap00UQbc0mcqlSzReCjVNt85dzWg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/release-process.rst: add a "Development Cycle" section
Date: Tue, 13 Jan 2026 14:09:53 +0100
Message-ID: <176830971047.418327.2342932945023837037.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105-release-process-v1-1-6b84d409718c@bootlin.com>
References: <20260105-release-process-v1-1-6b84d409718c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8496


On Mon, 05 Jan 2026 17:00:59 +0100, Antonin Godard wrote:
> Add a new section to release-process.rst to document the development
> cycle of each release and namely the milestones and feature freeze
> occuring after M3.
>=20
> Fixes [YOCTO #15979]
>=20
>=20
> [...]

Applied, thanks!

[1/1] ref-manual/release-process.rst: add a "Development Cycle" section
      commit: 77c04cc5944acda7575546a7434e014e4a75ba58

Best regards,
--=20


