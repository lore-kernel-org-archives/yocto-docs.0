Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B04BC79F96
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 13:53:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64167.1767621183379776819
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 05:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=NG3H36aD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 50F28C1E485
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 13:52:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E98860726
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 13:53:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 838C5103C8549;
	Mon,  5 Jan 2026 14:52:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767621180; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1JnIR04etmz6u4Kdb+coZlFE6OzcEQAdBtxkl0AbwOg=;
	b=NG3H36aDK5nJUD+UxF2XjngnigLmr53t0lal7rQdrC34GtPaO8yf30upcqfZ7+aQvB2F43
	oaImyfVfKzqcKUix4E7QLWI+KNaOK0Kr8gsBFmGsNFhG5sSrjtozodrS4xcsK7kjz3Qkhn
	EUCTICpj32F0cTr8Tw5paOaHL9wDsv9DgvBSNi7BHW8T0Ct18UpKZ9oCuYwpJel3tQ37SP
	JEccAzpCn345ADwbic0PYhLGLkYXw+DMSSB36INi3MEua98niFiUGy6YZT9mCIkqEdsMbL
	JiWmHYbXBLrLCmJwx9lSK//auJnNyko1vo3vlowEHsEJZUwWi95k23bKeohOmw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] migration-guides: add Wrynose release note templates
Date: Mon,  5 Jan 2026 14:52:27 +0100
Message-ID: <176762113057.481362.18130887783926905101.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218-release-notes-templates-6-0-v1-1-61690583cef2@bootlin.com>
References: <20251218-release-notes-templates-6-0-v1-1-61690583cef2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Jan 2026 13:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8383


On Thu, 18 Dec 2025 10:40:05 +0100, Antonin Godard wrote:
> Add templates for the next release, Wrynose, coming out in April 2026.
>=20
>=20

Applied, thanks!

[1/1] migration-guides: add Wrynose release note templates
      commit: 2cd203ea709f291150ece0819385e3d8237c007a

Best regards,
--=20


