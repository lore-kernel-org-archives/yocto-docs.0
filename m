Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850C5CCF9FF
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:30:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.14393.1761913853198474362
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=XqAor4Ln;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E4C97C0E953
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 716EE60704
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D775F118125BD;
	Fri, 31 Oct 2025 13:30:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dTUJDPuqAeKJZaRWTmSjkMNU6//3qJy4O9Jn2QJO4K4=;
	b=XqAor4LnKPJAptrkEJyGE986trySdPZ2WBWcO46VaKM4zGlADB+cMA+cRfdLYLMdSfek2z
	43ge88WwpqJBqwcCAvdFp2O3GzD4uvIEnnZLnciizT9lHnrvkzExCmdDi6xLFi5VZSkrVC
	Vs1bAoDSffVqvbAwmTG2k+ajl6pC0gB6gsRo2PgqbnaQLh7/A8dtYX4Q9qZKjEuHLMEkFU
	jp+SbIC5ZH3zSPdyX0dwkjhCaoVZcTeb6AdjgAuaKEPh36W3JNQ2lQSzR1I+gYayDUtkBW
	DPCD6YYRvdNGIoS1tyfo73U950XKdXZdB5cqngqEtvFq2IVWbxXyNHjTHASHeQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/variables.rst: fix a typo in UNPACKDIR description
Date: Fri, 31 Oct 2025 13:30:06 +0100
Message-ID: <176191376982.156612.12555483306818044103.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020-fix-unpackdir-typo-v1-1-597d02a2c6b1@bootlin.com>
References: <20251020-fix-unpackdir-typo-v1-1-597d02a2c6b1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7941


On Mon, 20 Oct 2025 08:49:40 +0200, Antonin Godard wrote:
>=20


Applied, thanks!

[1/1] ref-manual/variables.rst: fix a typo in UNPACKDIR description
      commit: abcb3b7aa449e2cdab9bda1a96b5c63c4e376759

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

