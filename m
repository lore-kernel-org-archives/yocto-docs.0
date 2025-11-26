Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE23D10F4C
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12344.1764162021248483225
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Kux4ycOO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C36E5C15D78
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 12:59:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A03860721;
	Wed, 26 Nov 2025 13:00:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9FE4102F08EB;
	Wed, 26 Nov 2025 14:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cfVKrAfWrncyPgpH3gLsQ5GOc4/5IN0xH0+RVFsO0vk=;
	b=Kux4ycOOzV4hUHGH3ON0OM+4L7LpXHS7G5pYS92VjT4VjJ7d6U9IyE1I9+yaVqavN2pzVC
	QknPrRmEvkExQ2UwMWWt9O8Rsmy62g6tKY9T+QbF5kCuq5zPy3LxSDwGD0c35Rv7RuOxGD
	yZL36XXdhhX9TlmPcy05RufkvPEEVtTMx6A+nnFOXDY/+WM0KyucWw5uTN/8WjywY8poLc
	xEa64wWd2mt6yZZFeDMHBITahb2XYKbwC/Eu/8+4gPe/e7UCm/NrIV+hQD6cxsuuqjWmYb
	0Z+P/wiHkBuxF3t+7K5wG6fjur4Ht1wcKOVREMGj1pHbUuSGFyCyqd+eFHV59w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual/new-recipe.rst: typo, "whith" -> "which"
Date: Wed, 26 Nov 2025 13:51:33 +0100
Message-ID: <176416145917.617433.4666667865012611457.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <f5c9043d-4e1d-426b-58a3-ebf485c74871@crashcourse.ca>
References: <f5c9043d-4e1d-426b-58a3-ebf485c74871@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8139


On Thu, 30 Oct 2025 08:13:32 -0400, Robert P. J. Day wrote:
> Fix typo "whith", should be "which".
>=20
>=20

Applied, thanks!

[1/1] dev-manual/new-recipe.rst: typo, "whith" -> "which"
      commit: f98b25f7f7522cf223beb001cabef870d6dd8c10

Best regards,
--=20


