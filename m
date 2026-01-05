Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78762C79F9A
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 13:53:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64245.1767621183588268624
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 05:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=pLb79s3R;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E8D71C1E486
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 13:52:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E60D060726
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 13:53:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48C98103C854E;
	Mon,  5 Jan 2026 14:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767621181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=biB0m7fLdyovP8uK4qyIERPA0TxT+aFXFnPsEQV6BHo=;
	b=pLb79s3RPovSPV1uLuxBzat6YQQVfVKQThNKSuMuGHiDoSfLevduJqXE9e/1bUCGNyI0xM
	yd/gun1KKUT0uhOMbKb/qTySzirQyU8PFXNfn4xmNsUHsV+TCXQmuduBEUlhbITLANoL/1
	62E5DkRMEfeWONN1XDzmiJy37jCAaG49v2RHeh60u+jpDnucgSjq4yUmV6XVFbAlpvFSpt
	7GQWTwwJFRv+bqcKEAPkh1kOZhwBXsJp0OI4lUc0o0gI3jSmp7+OG3KhSxqrYbhhgNURU3
	rDoZfIhuNEjw5iaceVuPDFou9W+rg6wDuBTNOfc5IxPWWAex+cNh/y9WyF4/mA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual: drop documentation for oelint class
Date: Mon,  5 Jan 2026 14:52:28 +0100
Message-ID: <176762113060.481362.3835417754041467351.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219-drop-oelint-v1-1-3b40014fef28@bootlin.com>
References: <20251219-drop-oelint-v1-1-3b40014fef28@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Jan 2026 13:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8384


On Fri, 19 Dec 2025 10:36:54 +0100, Antonin Godard wrote:
> Dropped with commit f35f00c5fe8c ("oelint: Remove obsolete class") in
> OE-Core. Add a note in the migration guide.
>=20
>=20

Applied, thanks!

[1/1] ref-manual: drop documentation for oelint class
      commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18

Best regards,
--=20


