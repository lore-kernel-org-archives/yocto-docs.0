Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC61D116F9
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:36:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17001.1764578190420965937
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 00:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=TYZjJxHJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 955E3C17B54;
	Mon,  1 Dec 2025 08:36:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7D8E606BB;
	Mon,  1 Dec 2025 08:36:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 029ED1191211F;
	Mon,  1 Dec 2025 09:36:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764578188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1xg9HV9o8pI1/GesmpFSMP4IBhEWHMUvbPSuAf/pE1g=;
	b=TYZjJxHJcNtBRqgTMTxQKBvJ6deX0T8AxC4R1otYIkwpOd3X0FyOlJIbpOUIgHtpxRApqF
	zbgHADW3x7sFkvnPX/a0SkSdAjNzrR28wyoABy9mSvp6qEMyS6fZtki5Znc003UFfs7uzb
	N5IiIIbOXGnada75tyvlfTBa0IzKMTHMTqWTpEbF2CpWn/5gRJfR1M6PJPvHo22tH/ta5v
	jYR1ItdYlKA0OflMs6CSYrJJj4OZreEm7s0olTfHeLUtb8BWx0faCK5fnXGMHeNWysoO15
	t+m1nXLJ2ageJ2VcTfejMq5mF6j0frXxfdVbMhXJw4YxMG/BQm2RFRYpIsfhag==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH] brief-yoctoprojectqs: specify what "recent Ubuntu Linux distribution" is
Date: Mon,  1 Dec 2025 09:35:53 +0100
Message-ID: <176457799699.63554.16645475222354786711.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125-quick-starting-guide-v1-1-45386c7b678e@cherry.de>
References: <20251125-quick-starting-guide-v1-1-45386c7b678e@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 08:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8178


On Tue, 25 Nov 2025 14:49:18 +0100, Quentin Schulz wrote:
> The docs from any release can be read at any moment. The time-specific
> "recent" doesn't actually help. The user could be reading the
> instructions for kirkstone and try to build on Ubuntu 25.10 as that is
> the most recent version. It'll likely fail though.
>=20
> Instead, point at the list of supported Linux distributions so that the=
y
> know which are supported for the version of the docs they are currently
> reading.
>=20
> [...]

Applied, thanks!

[1/1] brief-yoctoprojectqs: specify what "recent Ubuntu Linux distributio=
n" is
      commit: e1b4c64cec702dd41657002a62dfbacaabca3587

Best regards,
--=20
Antonin Godard

