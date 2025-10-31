Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8332CCFA06
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:30:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.14258.1761913856777664992
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=qWDM2nsE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D4C44E41438
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EAAD60704
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A715118125BD;
	Fri, 31 Oct 2025 13:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yNuXuBS3z/KOEuMlnm5zTry9KyNUOxYbYb9nzdjVfWE=;
	b=qWDM2nsEvAG/MeNxJarfG4qhWBabf9eQqN2gcfrMBJSM73/Al+CMIKj/Idt3ozxrhodseQ
	N+ss5fiPN4aQZq4hCmZorpytOgF+5Obp7dP59drVnV4q1fZiwpDKH5bEhIIB23D+QJ7kbw
	kHL407E1ROnDifTs3vESGOW3fTjVO9McOVTqYRAN4TW1sUDipu6OMnU77ZvgqqhO5xcl68
	iS6Ou1gkeNGCzY0f/YTz10djNmHJ2vIwEQ6PSeaad9pKYNhLaFWqi2sSX2OALUh6Lmob2u
	QfWYDL7i/TNgjLMEm0AqlKqmEpvDicJEUZ6bv0TZX4DbRYxziNGKCAlP9+weVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 0/1] variables.rst: fix LAYERDEPENDS description
Date: Fri, 31 Oct 2025 13:30:10 +0100
Message-ID: <176191376984.156612.14202570859730732961.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021151918.2922354-1-joaomarcos.costa@bootlin.com>
References: <20251021151918.2922354-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7945


On Tue, 21 Oct 2025 17:19:17 +0200, Jo=C3=A3o Marcos Costa wrote:
> I didn't find any references of this variable inside any recipe (oe-cor=
e,
> meta-openembedded/*), but I didn't look too deep in bitbake's source co=
de, so I
> might not be 100% correct about this.
>=20
> Here's the patch, just in case.
>=20
> Jo=C3=A3o Marcos Costa (1):
>   variables.rst: fix LAYERDEPENDS description
>=20
> [...]

Applied, thanks!

[1/1] variables.rst: fix LAYERDEPENDS description
      commit: eec26e11adb6e3a9c4f53f825b9a1730c9ddee12

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

