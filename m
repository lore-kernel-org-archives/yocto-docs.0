Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851FCD2D0F7
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:10:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58451.1768309820674106660
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=sdiUge+f;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0D5CF4E420AC
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D704D60701
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BA1A103C9331;
	Tue, 13 Jan 2026 14:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768309818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZpBBQhe5S8iGSG68K7vdeHlBpZBFPI4ju3yEIL5AKxc=;
	b=sdiUge+fE8AR7AazyBU/t2u02X5lEHqWK2gPelkzgYnR00Z1EJyh1A39xosSPJ0E9VZk8i
	FDzn+LZu+SJ9H3q4m2oBzle9WdtZPYt3PpbYA3u47cgX9pRBgLqutlL8nCbseFyScVmrKF
	1WH3IuLuHaZcCofr4g1ge1JLMX2oe8hbqiJ1sfs77JjghHv624UACkua+9dGNjuu8ZnUP6
	Z9LjkElH4unRMMPkebh5iQrKLAydQtIwtC0gnNjaDq4WMbh3DkcMtezdsKiMBZDkGiJZ7g
	ldvhqpnzwP8uNXBIn3TMpF4UiLIMfZPuZX1T1YaKneVx/KypXpNmzqE4wrKiCA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dev-manual/qemu: add an example for the snapshot+nographic mode
Date: Tue, 13 Jan 2026 14:09:52 +0100
Message-ID: <176830971049.418327.12048257513360277315.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105-qemu-snapshot-v1-1-b598171f513f@bootlin.com>
References: <20260105-qemu-snapshot-v1-1-b598171f513f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8498


On Mon, 05 Jan 2026 17:06:07 +0100, Antonin Godard wrote:
> The snapshot option was added by OE-Core commit 8fec4a5a004f
> ("scripts/runqemu: Add snapshot support"). Along with nographic, this
> execution mode is useful for temporary tests in an environment that doe=
s
> not have graphics support (like a remote server, or a container).
>=20
> Add it as part of the listed examples.
>=20
> [...]

Applied, thanks!

[1/1] dev-manual/qemu: add an example for the snapshot+nographic mode
      commit: 84a55c77a228319d224cde9bdff24025c7ccb0d6

Best regards,
--=20


