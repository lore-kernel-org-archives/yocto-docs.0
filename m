Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EDCCAC5BD
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 06:45:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.47701.1759128332242066125
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 23:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=JpyR6iUf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E21AC4E40D17
	for <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9C17606AE;
	Mon, 29 Sep 2025 06:45:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9301102F1844;
	Mon, 29 Sep 2025 08:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759128330; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=72oiYP1t8Puwz29CX8njNzbQDmz9SzrmCyVeX0Zv2QI=;
	b=JpyR6iUfAxWXh/9ltNZb9UdwoAHVpLxDXccFcwWyK1V3zAzMEQeQ4YKlRNDEBMBdGrfzmH
	6fIBKRGZSLXS1ZpmubxITbf3+Jq/G4rybYIL4zWy0b8XwufPlDJdzwHCXartV+G4JhlFYK
	gDXdO1XJRRoXgrd793ytVh4fX9f/QrAMCSt46AU/3LdZKGD+twpSQ1ZDkqKSdKJ8MO5XNE
	CiXJltNF5FKqglud3wv5dzpsycQenF/T7CjuNQNxaZV9v1Q92TYZ+waaG7UDtuv7FVqgGB
	egeTTIfxBvmI0xTuIpCAYLhna1xZyuDxXu7em0rQFdCzaeiUSo/jvwKXUIEtUw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v3 2/3] test-manual/yocto-project-compatible.rst: fix a typo
Date: Mon, 29 Sep 2025 08:44:27 +0200
Message-ID: <175912824412.5757.698545585035217945.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926-update-compatible-doc-v3-2-3740c44e49b2@bootlin.com>
References: <20250926-update-compatible-doc-v3-2-3740c44e49b2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7621


On Fri, 26 Sep 2025 09:54:24 +0200, Antonin Godard wrote:
> Fix a typo in yocto-project-compatible.rst.
>=20
>=20

Applied, thanks!

[2/3] test-manual/yocto-project-compatible.rst: fix a typo
      commit: a84c234acfedfa714419006c743405e2f9acaedc

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

