Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91E0CAC5BD
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 06:45:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.47620.1759128333766305949
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 23:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=oLLjnCMP;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 129B2C00DBF
	for <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD66E606AE;
	Mon, 29 Sep 2025 06:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D048102F1847;
	Mon, 29 Sep 2025 08:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759128331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kCRYttvtPfRsjnE2iZ4Pk96jFpJ8/s1SzjQ5DvEjj9A=;
	b=oLLjnCMPHpxMi1V7hjJd5e9cql9pBtnTS7GjcwWTnfJ83W0tClb1ZHPuCjrJ5pFA366e0n
	uthYl2XfUlP+88HqwLRRQ5YeBwG0mGDJw+taj0fvNn1Dtp2Vnc+AIompiAbId88figKjcS
	SC3/11z2Pb6bASjScetyT4dY+9LU4SVBldBhOvPAVwE/5bQE1wtgnfk7py+lH8KgDCK9aI
	0ZbHsGsekuwu+brGXz2hTA9tM+VKxwJttECyx3G+/VqHfqX+qOeznLPzuoIAbEWOv30F00
	tIudeUKbOf6aetAXMHnYhfs/LmWVwr9633oxuDDbXJg3nVF+LuQealsugOqqag==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Barne Carstensen <barne.carstensen@danfoss.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] test-manual: update runtime-testing Exporting Tests section
Date: Mon, 29 Sep 2025 08:44:28 +0200
Message-ID: <175912824404.5757.9312946633494148893.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916110116.1227-1-barne.carstensen@danfoss.com>
References: <20250916110116.1227-1-barne.carstensen@danfoss.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7622


On Tue, 16 Sep 2025 11:01:22 +0000, Barne Carstensen wrote:
>=20


Applied, thanks!

[1/1] test-manual: update runtime-testing Exporting Tests section
      commit: 2caa8e581feaf3640bea68108f9a02583b17b21b

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

