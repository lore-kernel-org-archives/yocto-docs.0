Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A65D1039D
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:15 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12331.1764162008680631773
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=kZZckV3H;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76A3DC15D79;
	Wed, 26 Nov 2025 12:59:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F08560721;
	Wed, 26 Nov 2025 13:00:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8FD9102F08EB;
	Wed, 26 Nov 2025 14:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eMCQ0N0DW2q9tgINvQeXp2j3x2cmuIB4NdcMUoFFoFk=;
	b=kZZckV3HeOmxPimLy3Q7JD8pT8x4SJEh41mVPXYR26XI3kYKZC3j+rO05tET5r3EoNa011
	7VndMqLH1SElz/DMOrMFswq4kCAnC16ZD/1yLJupRPwOCsgbJ4lkiILGoFY0OdfnnEVjch
	3pYrZD9Jyre/l9F6Mzejdfs5XdV9f7akVLpHMcg55mchOIH9Z11cLpAljestgDui1G+yv0
	focYE7ZpzjMluCrFgSHofcuRskrA46ROb4QOCIE/sFrvPBkIwWZRZXSumPfAjmVyDqE0HE
	/D+eqVTPd+sgd1K/ELd/1jpIIzA9Ng8R4eLPIY8Z0WpfpPeOnuwkiT8O+WaU0A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	ejo@pengutronix.de,
	yocto@pengutronix.de
Subject: Re: [PATCH] migration-guides: 5.3: mention barebox migration guides
Date: Wed, 26 Nov 2025 13:51:20 +0100
Message-ID: <176416145957.617433.12279560862011164092.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113085516.1067909-1-a.fatoum@pengutronix.de>
References: <20251113085516.1067909-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8126


On Thu, 13 Nov 2025 09:55:14 +0100, Ahmad Fatoum wrote:
> Inspired by the Yocto migration guides in this repository, I have been
> maintaining release migration guides for barebox going back to
> v2024.09.0, the first release after barebox was added to OE-core.
>=20
> These contain actionable advice for users, e.g., rename of CONFIG optio=
ns
> or differences in the shell environment.
>=20
> [...]

Applied, thanks!

[1/1] migration-guides: 5.3: mention barebox migration guides
      commit: c059dbf78d8590ad28368a19a9c9234a56ad448c

Best regards,
--=20


