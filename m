Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BE6CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:08:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.28496.1759738077170006959
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 01:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=R48kUaQh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E70E0C085C2;
	Mon,  6 Oct 2025 08:07:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22D26606B7;
	Mon,  6 Oct 2025 08:07:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A0EE102F1D49;
	Mon,  6 Oct 2025 10:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759738070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BMNOHA3FKqO+U1zk2PwleQzR5kefTXZK8YHwDReA3OY=;
	b=R48kUaQhuGwOwJfL1Dmxx67/spQzFE6kRqR598MbcP7RJ/KerJdAN58aUz3qjkgE1dX5bB
	JPkwpCxbDhs9alqC0atrkWXpkuaWGznniR9j2CSnuu1Y69KpqOxRhn8VapcWMFkpR8qwuf
	J33vkhC3FlNkh3N6M4kr9lTe0CI423T8+UN/F6eZ4HXOzv1TOeIdeaivW0ixXm2N+wFE4O
	pw4W3bFDxhMS+QD36SO1wv+rqaimot7OGHmrYJjYpG6OgAObikU6zItuoE+QvV0cXBB/Ss
	iS25TbQvpowqR3cpKdTcJDCWjSg47tiwLeqhRSlCooTNTUk0Gcees1EYPUSmww==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Adam Blank <adam.blank.g@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual/variables.rst: fix the description of STAGING_DIR
Date: Mon,  6 Oct 2025 10:07:17 +0200
Message-ID: <175973778851.1174293.1602614548230739307.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001134636.27829-1-adam.blank.g@gmail.com>
References: <20251001134636.27829-1-adam.blank.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 08:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7647


On Wed, 01 Oct 2025 15:46:35 +0200, Adam Blank wrote:
> There is no single "recipe-sysroots" directory, but rather many
> "recipe-sysroot*" directories.
>=20
>=20

Applied, thanks!

[1/1] ref-manual/variables.rst: fix the description of STAGING_DIR
      commit: f2d6e228409cb1dd1dbf339c405699ac6d3900be

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

