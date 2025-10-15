Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3FECCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:46:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.14104.1760528778913599086
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 04:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=o2yZCJ7E;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BAB1B1A13CC;
	Wed, 15 Oct 2025 11:46:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90E5B606F9;
	Wed, 15 Oct 2025 11:46:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 728E4102F22C7;
	Wed, 15 Oct 2025 13:46:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760528775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZiAvboFSrDtKAKU+tGXJyY76a8VC57wx6WD3fN31f7s=;
	b=o2yZCJ7E6elrEScRSU1mItrvlVQ0o/7QSjpyrYcJ/Mqhb2JJHn8d9zW2gf+U6qumcmVhwh
	AJw3Xo5upyBeKBW7HoCuJFkvWS2YXbj+f+NWV158IiFVkJy6r9N7kv6/Q4hYVD4Cv5RAWT
	k31hQII6XYhxTjgCiwYa7PtGXu1fyMR2COuWTdIULO6ZLLMydflRbxV2YLaTAAaSR46T3I
	D+KpIw3ppTmATp+m3rV6rUZD/Yu+SvEBOaaSmevD1mRUP0dUFajYe7OPSyAZadqhco1teo
	dA9t9md0EljpTnLajyjFNy6PmdsrTPatQVV9XtwG5+5gQxg0aKVI9Ku0X65Urw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [PATCH] ref-manual: correctly document the difference between auto.conf and newly added toolcfg.conf
Date: Wed, 15 Oct 2025 13:45:20 +0200
Message-ID: <176052868599.3167271.17502694049833768990.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006134757.36206-1-alex@linutronix.de>
References: <20251006134757.36206-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7702


Applied, thanks!

[1/1] ref-manual: correctly document the difference between auto.conf and=
 newly added toolcfg.conf
      commit: f23b93594dbe7e5df9ec55371e4aab4b7b8c50b9

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

