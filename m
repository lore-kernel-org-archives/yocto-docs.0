Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498CECCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:03:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.33336.1759755798586635419
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 06:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XUyCQU8s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D09D71A1179
	for <docs@lists.yoctoproject.org>; Mon,  6 Oct 2025 13:03:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A77E2606B7;
	Mon,  6 Oct 2025 13:03:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75D75102F1D62;
	Mon,  6 Oct 2025 15:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759755796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=pTo+JFJVsrs9vEm6Q/I2zmkmqLFH6e7RWIblf4AWAp8=;
	b=XUyCQU8stHzCdvU2Ne8XAU4bu+VA0G6YDZ4tb7YYzDdMzUGEtOhOd+i3ooe96KnX7bhD1I
	m2VKklq8c2Vh3f59LVUKfsra5RwLXm/YaCnYzjazRml0IKC/CTL/GlBB9xht3QRjSMzFiw
	ZmJz3OOStfoANncBnkhcBruIS9nwXBkSEZinmm4klVu5BC1OJdPR5OBPOyNlL7cLz4sBHh
	JX0EJDzOEoexcmIbemHbaAAhb0ID0XJw2yxmBd5T990c167Mca4JEFHp0j3rEw6gpghtWL
	85a7zKbEKPWjgMCITKXBPVxLM4ilgLoAS39Oku9J5dlCjinQQfhATnv5XYercw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Improve uninative class/variables
Date: Mon, 06 Oct 2025 15:03:03 +0200
Message-Id: <20251006-uninative-class-extend-v1-0-1a9e30e95e8f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAe+42gC/x3MQQqDMBBG4avIrB1IFFvqVcRFEn/bgTJKRkUQ7
 97Q5bd47yJDFhj11UUZh5gsWuDritIn6BssUzE1rum8cw/eVTRscoDTN5gxzg06sYtAfLbp5aO
 nEq8Zs5z/8TDe9w9tBhflaAAAAA==
X-Change-ID: 20251006-uninative-class-extend-0beeb73c91b1
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=703;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lAW3XTIAGGKhU6A1+W9aVnLEvzm7zdg7Ezq7wzX/MFI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo474R8mBtdomCfu7PBC9WFwpOuHqXKTwmkw1Go
 JzJDu8xDM2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOO+EQAKCRDRgEFAKaOo
 NgnDEACTM1nyUrrshhiGTUzdH0OMf10SzLS1syFPLA+ZfJWAo6/safCWLQzPeAC6LDvNh8WN48u
 lE0VpKm/DYh5BhG220gpmHvcrW31Ax+vRHynrLZuVSvPCj51zjFXBp7bLFnqaTCdeIJO5trpNJ0
 hjS/lYh+yhPgvVOs0UjSTnuZ03jm0Vzhs7YjWmJlPQY30cZMm+bHOf5ja1cDyJW96mBmBnnPMt3
 tLivzsATYUgKsB9xnBvYiYIaWr1FdEg1oIRL9h96GX44S92bC2q8H6tygBNQ5NEOsJ/SBicK5n8
 K6yw8qqkTcLVeqEH9/Mak7oeHaUUfCi1Gh6uWHNUSlfYk7BNsaItwdXtKwEbcSZdmscceAM2UY2
 SFo15JCIBTPeBUCjh71HGhgQGKDaDahb/Dwx9R1C5Bq7xa5g6YC1nqZssMvmmS4WJG7yW+mRSX9
 gKbex4rnXX09TvIRV7kWispgYtuWtRPk2ySU8umJKaiUSRQdKOAeY6l3GmyiBsvFWVinDQuwKqY
 nLoZU+CUDKVnwb9/JWol880weqFIXoD4OxrXQwghzuuTK60mOxH4nMJrRf47y/diRq9P8v0kgnM
 TjMa/BtL8pLderdOL8Bo6Wh3UMyOSUsCY3nzgqwOwjQ9fGLFVQyv5Ar5ngIY/Wqz7JGz9lpTSbj
 qCvlwUwxD9r+aHQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 13:03:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7655

After https://lore.kernel.org/r/061e6150ce177221f7b6ee8754b03a20347a92c3.camel@linuxfoundation.org.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      ref-manual/classes.rst: extend the uninative class documentation

 documentation/ref-manual/classes.rst   | 61 +++++++++++++++++++++++++---------
 documentation/ref-manual/variables.rst | 16 +++++++++
 2 files changed, 61 insertions(+), 16 deletions(-)
---
base-commit: 09c7800333b17b21e50d2a089a3ae1b123697243
change-id: 20251006-uninative-class-extend-0beeb73c91b1

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


