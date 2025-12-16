Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC03D609C3
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:14:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26746.1765901638223582460
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=oah/D8qC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B13B44E41C3B
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:13:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 831F56071C
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:13:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04D13119A8FB9;
	Tue, 16 Dec 2025 17:13:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765901636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3RWSgNxkZDvyEs5VnLXTdSrcurVv6mtCtCBTxa5WzT4=;
	b=oah/D8qC0Y2bjKV8P1CDrYxLmf60NhVC5CC+hvL5oVFTX1NNpSgRk/G9ZTWNOxkdw21Exq
	pB/6MYh+B78eJWqlkSFnioWG91p8qcrRmuUOtJNlm2TuL9gYmUKw6ViqAS/L255UijY80q
	RVpMX6/mngc18mvnO2K3f1eXzFmpSgoa8rhfhYEksAKSaw0BZkgXzH1ZtvF/WzDFV9Gjmj
	i/m5+P/iE8dRzaNhnV6oAPqYq571dbzQf0JrRDAWtyGn5XAdEAKApXzJwbHj0ZotkHzIMZ
	xaCi4CJbue0maIrZgiRghHiUiGiuVxL1bzQxsdXjBA3RqZhHOm0kFDeNZLD70g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] contributor-guide/submit-changes.rst: remove mention of Upstream-Status
Date: Tue, 16 Dec 2025 17:12:40 +0100
Message-ID: <176590152202.120473.1041717757005403030.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251202-remove-upstream-status-mention-v1-1-410d15493349@bootlin.com>
References: <20251202-remove-upstream-status-mention-v1-1-410d15493349@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8294


On Tue, 02 Dec 2025 18:00:30 +0100, Antonin Godard wrote:
> The Upstream-Status tag is not used for patches sent on mailing lists,
> but for patches to be applied to recipes. To avoid confusion in this
> Contributor Guide, remove the mention of this tag as part of the
> Patchtest examples as it can be misinterpreted as something to include
> in a regular patch.
>=20
>=20
> [...]

Applied, thanks!

[1/1] contributor-guide/submit-changes.rst: remove mention of Upstream-St=
atus
      commit: 23098728b57520d1d8e417500009279226ce8080

Best regards,
--=20


