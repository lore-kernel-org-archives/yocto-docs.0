Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB58DD609C6
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:14:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26745.1765901637851206459
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Ui//9tzv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E25E4E41C3A
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:13:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0FDCF6071C
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:13:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84A96119A8FB7;
	Tue, 16 Dec 2025 17:13:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765901635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zzk7G/WLxTUEPmW0/Tfwb60fV9HwFYazOl+ke56or1Y=;
	b=Ui//9tzvYu3AXvWKDLZ0PTqvlXIGfg6NkU4ZGI9OusXSrwbvxlmDuliLaEzlf6u3uwh4zp
	GO9mS/yKKC8144a5Rpx+sfU5ZO9O7o824+MxeaIF0xjv5vOibKyacaaKFC8DyI3gouKP9T
	pQjRElPyj+MT2WshfyR6nEVGqh3+d+g8PfeVO6I0jbUHKHnDvrrWDCsPA/dwu1uNe3NFby
	tfg6G2yHHEJ7agG6IxXLreaM82q8CiFlAu/4IYBPP/vGpEk46Vx+wurvvDQbz8MeQm4yWw
	2z55MB6cm901rqPh3SoO5FXuOUp00bojwviCwjpK7CUbRVZ4wqBshkhAxZZBmA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] Add a new "Security" section
Date: Tue, 16 Dec 2025 17:12:39 +0100
Message-ID: <176590152204.120473.7995651565629792868.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204-reorg-security-section-v1-1-75aeeb741c83@bootlin.com>
References: <20251204-reorg-security-section-v1-1-75aeeb741c83@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8293


On Thu, 04 Dec 2025 16:23:05 +0100, Antonin Godard wrote:
> The current security-related documentation is a bit hard to find and
> hidden within the development manual. However these are processes that
> are not part of a development task but is rather a vulnerability
> reporting process.
>=20
> Create a new "Security" section in the documentation to gather this
> information. This will be directly visible in the sidebar when opening
> the documentation.
>=20
> [...]

Applied, thanks!

[1/1] Add a new "Security" section
      commit: b7f5b8ee510eeec286f2b0daece2717245b5b177

Best regards,
--=20


