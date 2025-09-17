Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55916CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.24171.1758118445721280828
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=gLA4PTZC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D65E61A0E87
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85FCD6063E
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C6F8102F1A16;
	Wed, 17 Sep 2025 16:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NeYr3vCQpOIX/fmesCvy1I9N03WJyfio4uVPiNmy+kQ=;
	b=gLA4PTZCWoB2jyqFD3sHjonEurwqw2noFYfJLvxtPLt1/Yi/gJKcRkA0UvTbzAQz1L0Jna
	DOBRYsI5krCgml5Fw5vydspGDaGJUPY5F0XEIl/s4e51HZNd2o5Tk11BnAzuJiabsYTySh
	EKzK757NIZ62Jbi6SpoZyJfKAUapgFR2sHp9skAhnDrfw4h9H0QV7NYEW5k9xd0gMTj6g2
	ymCLVpLGCSPfwTLc0aUeWG12kfVORHa0zXCQ+6loQkQH6duXd2aCtrORtY/CggzgB5Aa9e
	TO+CXpE5PMz5raCTdb+VtuE9s9xCnfyiSq7S+cMqq9WEbsEQPIYL252irSEJ5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dev-manual/security-subjects.rst: update mailing lists
Date: Wed, 17 Sep 2025 16:13:15 +0200
Message-ID: <175811826406.690097.6083624722835712907.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829-update-security-lists-v1-1-42d02ed2eb24@bootlin.com>
References: <20250829-update-security-lists-v1-1-42d02ed2eb24@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7530


On Fri, 29 Aug 2025 11:08:25 +0200, Antonin Godard wrote:
> Update mailing lists following changes by Michael Halstead
> (https://lists.yoctoproject.org/g/yocto-security/message/1478).
>=20
> Also fix formatting/spacing.
>=20
>=20

Applied, thanks!

[1/1] dev-manual/security-subjects.rst: update mailing lists
      commit: 8066aa92a1acae6c99fbee92d24ee1feea65d974

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

