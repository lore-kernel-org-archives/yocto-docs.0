Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F51D10F3C
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12186.1764162014430886048
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=KNSxPksr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 701894E418F7;
	Wed, 26 Nov 2025 13:00:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4562260721;
	Wed, 26 Nov 2025 13:00:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98605102F08EA;
	Wed, 26 Nov 2025 14:00:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=33sqqhTnIk7DtbmE0bVWFyWIQK7EkCyLiOgXIHuH+Wc=;
	b=KNSxPksrcGjSZSFkNV4ktWukrY0jcIUxBJmLZLyApwk4GA9y1t4enplt3uwa2BL/Yb0iVx
	eQvoQvbADSBpBa5thBPwBoYXvm4DZjIzl7VBFlDKUMNacZi4lcOQSrAYBEphjM2q1fhkHh
	geQgKQsWiTKmCxKyBHqqb98Rvz3fVq5GLM3f+vl/6Kyng4UVVAx23LCF7YqIihfhf/sDqc
	IiLK+pqDE0fpAywvs1TI9xq4xp41ehpzXDl/Mm/6rn9POKv8uWfjcGP7cWHuobmdhku/2V
	61ZX1a3PSes5i+9whob2TdL8mpNW3JsOuVsWQW1LdJTh02FuXBjplGR06qN3VQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	yocto@pengutronix.de
Subject: Re: [PATCH] dev-manual/sbom.rst: reflect that create-spdx is enabled by default
Date: Wed, 26 Nov 2025 13:51:27 +0100
Message-ID: <176416145880.617433.1752444357666057432.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028081249.1378992-1-ejo@pengutronix.de>
References: <20251028081249.1378992-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8133


On Tue, 28 Oct 2025 09:12:22 +0100, Enrico J=C3=B6rns wrote:
> Since nanbield (b34032ec "defaultsetup: Inherit create-spdx by
> default"), the create-spdx class is pulled in by default, not only by
> poky.
>=20
> Adapt the text to reflect this and also change INHERIT to INHERIT_DISTR=
O
> since this is the more concrete variable to modify for disabling
> create-spdx.
>=20
> [...]

Applied, thanks!

[1/1] dev-manual/sbom.rst: reflect that create-spdx is enabled by default
      commit: 2b6228943443faf76c9869a0daeccfe7f93688ca

Best regards,
--=20


