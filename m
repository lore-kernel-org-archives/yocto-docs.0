Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE00EF48F9
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:07:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67819.1770973653703929795
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=fCdt1Z2D;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 376881A0EAE;
	Fri, 13 Feb 2026 09:07:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EE1D606CC;
	Fri, 13 Feb 2026 09:07:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE39810368E26;
	Fri, 13 Feb 2026 10:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770973651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K7SkqgCLOXTP9YZ9VviezOD20J17Deb+/Zl92sH4y30=;
	b=fCdt1Z2DOYkUzvrHMpX9TGnQGn0sh9EokTr7Mz29E8R/TcQwH3HgHgwf9QNI1BjyEnefGe
	BV1WUSHah7qn2xi8jvLX399ODRG0dPnDMJxy4e1/um0X9ukn9YYgoNB0qNKfAleQcLYZhs
	0n+3pBT7ajjr3rxNKq1fhOEYIpTe2lmBJTlX2PNNFXYKY6SNG77p/scGpQY7OcOZ6oUx4Q
	V47qGNjkxxyd8iccZPkAEoGZ+aIHVcZ/EXX3p8b6p/wYTPlNzR+WgAUM1tlbO5T27eF4SB
	0tmQbAxudUQ+M1nauLRzo05GFhjD66KOHVu7kORkb7wEmoL2zSMtr6pCzMfDtg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: Document updated UBOOT_CONFIG flow
Date: Fri, 13 Feb 2026 10:06:54 +0100
Message-ID: <177097354646.48715.2023692570541817326.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127225706.25153-1-reatmon@ti.com>
References: <20260127225706.25153-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8915

Applied, thanks!

[1/1] ref-manual: Document updated UBOOT_CONFIG flow
      commit: d3f9b0a5a13ba94a7f9f7945c370ac0685ab6d62

