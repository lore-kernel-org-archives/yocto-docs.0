Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C386CAC5A7
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.24176.1758118447968922359
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Y5vsQ5yy;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3A804C653F4
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:13:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B708F6063E;
	Wed, 17 Sep 2025 14:14:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7A77102F1BBA;
	Wed, 17 Sep 2025 16:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=97GceXWjqPUyiMFcMMac6n35Yqi1l8oYy+Ap+CmxolE=;
	b=Y5vsQ5yyU25Qj0B/T3TvWJNY7MDGfZBCR3LdJ8mpOJk7T4OUTZP67P2xgqxheowX6jNjjQ
	lQenXSDyF/Huh+HA/+Apnluhj0WDp9xN0qm3ora1/rcbX9Dfq+jVsloPGbagrF/oy30xrZ
	ovsDdoj7guligkS1rm5NcJ3ZWRLYGDheh5PieVX4bHq3sgyY8y7c3NSHDl1q+ikMvhiq63
	S4Cfkm/Nw2sLx5CJnLY1+7kPw3ndm+CsgFw/0H/aXZrKR84ineI6pYGmd/wpzTwR27MlkM
	qHWVz1jaODKdCw6dv2wXuKQCeI6nz18FpZhQ2yEJYCjmwOWQRbBZJMCK8UfVWg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Jan Vermaete <jan.vermaete@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] sdk: The main in the C example should return an int
Date: Wed, 17 Sep 2025 16:13:20 +0200
Message-ID: <175811826404.690097.5948402851112938159.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250809062547.1329444-1-jan.vermaete@gmail.com>
References: <20250809062547.1329444-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7533


On Sat, 09 Aug 2025 08:25:47 +0200, Jan Vermaete wrote:
> see C17 (ISO/IEC 9899:2018)
>=20
>=20

Applied, thanks!

[1/1] sdk: The main in the C example should return an int
      commit: 1ebaed299f7ef80a49b68608f45bf25884900d13

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

