Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B37CCFA03
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:30:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.14256.1761913854538024167
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=2F4yFnXg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 921F71A17AE
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6409B60704;
	Fri, 31 Oct 2025 12:30:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AFAA118125BE;
	Fri, 31 Oct 2025 13:30:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ovR31elJuWtpEixyRk05ZRCPoYnIb76oHSzmqHd1vM8=;
	b=2F4yFnXgpkk2ANkjVsf2iKsCcdGdE5FNGPztqvODR1wLY8UVTzhj6/jTBjFd1URNLJsh+m
	nygsaRSmkWx+joEk+R4iHv/Lt9Fed/fs/WaXzJcmuy9G+qFhrUbVXMLVXgzcwGbty5jVDW
	3KRuSWxQfuaK9ngvszG/kvLlxsC7FxFAOyPd1AZs0F+96WKkb/ijHIEy5r2zYLEReHiK0e
	kUBotXWVGWTD0vu5rpjh0KLNxqWYl6uZepORATsdgPauOYayBS7Zu3UKMzTAAwlPHwQB8S
	RtbchtxIVXn4ddlW2NL1G02kQQXL7CvosNgEXF9QvtfK7jcFf03H1Neua+F+PQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2] ref-manual/classes.rst: uboot-config: improve documentation
Date: Fri, 31 Oct 2025 13:30:07 +0100
Message-ID: <176191376988.156612.2276360465636154923.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022-improve-uboot-config-class-v2-1-914788ce5888@bootlin.com>
References: <20251022-improve-uboot-config-class-v2-1-914788ce5888@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7942


On Wed, 22 Oct 2025 12:05:00 +0200, Antonin Godard wrote:
> Improve the documentation of the uboot-config class. It was not
> explaining any of its entry in UBOOT_CONFIG. Mention that using
> UBOOT_CONFIG and UBOOT_MACHINE at the same time is not possible.
>=20
>=20

Applied, thanks!

[1/1] ref-manual/classes.rst: uboot-config: improve documentation
      commit: 3bbd85798f4c9a8b7f930e9f156cf6e970593da0

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

