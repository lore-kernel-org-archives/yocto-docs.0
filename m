Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FC8D10F43
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12340.1764162016319895079
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IXq9vzJ8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B218F1A1D77;
	Wed, 26 Nov 2025 13:00:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88D9D60721;
	Wed, 26 Nov 2025 13:00:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD40B102F08ED;
	Wed, 26 Nov 2025 14:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162014; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ibYrKI6MWaseYiib2RlNcFLyNut94mSuTgDfsGggnT8=;
	b=IXq9vzJ8/LMZeSd9nKjVtZdBsMskN4x0FNkqzmHgZguEFnUJXfzA0FGSo5/xamBq2MOcSc
	Ywto4ikwPnsvuXXAgcERkwje9J65zRbDpgnI1MBMKPMbscqon6Vd2qfyqZDgxcq/Dlho6R
	tgWnUDG8aHr45zMekRLQyPvAGdMHedV1NokxLa9mgEjv/wfncPwwZ7dWPfLv6+WoCOwwrX
	vum2vGAh4nv1HkJ3zRiHorRDvIJ5MBN1iXdEzS/4Z+AGOJKKLmaLy/OPEOAhgZyPoLTclI
	sP630PuBkWiCZJDhTlS/bomMaeo07UcsQWfuKbO9Qyq5OGpXy+Kn0LKUBi6UCA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH] overview-manual: migrate to SVG + fix typo
Date: Wed, 26 Nov 2025 13:51:29 +0100
Message-ID: <176416145945.617433.4354365727471351177.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029-overview-typo-v1-1-e7d3c6bd9cf8@cherry.de>
References: <20251029-overview-typo-v1-1-e7d3c6bd9cf8@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8135


On Wed, 29 Oct 2025 18:07:01 +0100, Quentin Schulz wrote:
> The original PNG had a typo (YP-Comptible instead of YP-Compatible).
>=20
> Instead of patching a PNG, let's migrate to an SVG with the typo alread=
y
> fixed.
>=20
>=20

Applied, thanks!

[1/1] overview-manual: migrate to SVG + fix typo
      commit: 9f3c2a9113b329f7efdd22d3b3fbe272a44bc654

Best regards,
--=20


