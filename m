Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A25C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:13:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18936.1784898790878021710
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2nZWOlsH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A0FE54E40F26
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:13:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75A3760395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:13:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A28811C124C6;
	Fri, 24 Jul 2026 15:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784898787; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7lQI20CYQiZZYCHT/GxvUSpslP4TLJYq5TV2waV4l1U=;
	b=2nZWOlsHQ8qEnkId1AVOUdbEMkRGJL8L57gSnz4DsKoCn0LxIo2W91HuBnTP3xCP2b22da
	mflCkQF02tXTlOGC8eqxyBBax+NyxLmUWJeNLhULJwkweq42G3AS6L8DSbn9hbtK9iXAfm
	jaudTgW5QGRkrhG83+xPjhGhS6woS4Kwj4rODKexse0iniMkoaRpvluEX7C3QiJgplhmqt
	X7A5VtcS+zwG7SpyrOS2SX7glm0nFXJYQJpLAtNaApEXdWqPEtA0UK13t+Fyf1EuyOgeC3
	nRGA5u1k+tEmcBTYAGhhpVkpT9ZC28EQH5LkHFEgAQTgHulwi97Ct8cJ0WvEXg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:12:49 +0200
Subject: [PATCH] ref-manual/faq.rst: limit systemd as default question to
 Poky
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rephrase-systemd-faq-question-v1-1-ec769dac4965@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw6CUAxG4a2Qjm0C9UFwK4bBBX6kJiK0F6Mh7
 N2rDr/BOSs5TOF0zlYyPNX1MSYUu4zaIYxXsHbJJLmc8lIObJgGCw72t0fcO+7DzPMCj6nkBtU
 epRxDVQilx2To9fX7X+q/fWluaON3Stv2AbDfbI+BAAAA
X-Change-ID: 20260724-rephrase-systemd-faq-question-be93e725a912
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FLclRL6LB5PqrJRDM6emZCWG485ESFIB4TBCn68nnCk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2ThF1/vxrf9nwskddYmyl5H2m99+crFmCIa/
 UhBiRfLamWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNk4QAKCRDRgEFAKaOo
 NjeRD/93o8NtBJ4oy9GXt5N8CX+Mw4nbHhpsR3DW7N5cRAO9k7dci3dKmc5E2H9x+Zt3hNbmZGq
 Dem8aHh/7XTCwnuR3aPSy3/CO74rPBG1QDZJoMOuQkb9V34jKFhDArzuCz4tcJxxOtC+TxLsWwd
 Eot8FbQxuOQtNhB6WdgAyWPw6krN64+UmRTdn1XFgG/SLMoiu1B7a+PyCbEKmj5XMhQecuRTMgx
 TcksYkdwiqs4sPVOtOwJiFA9dNz2Xi47esiXLaRMCEOYBtt0lExFSq5etTT0jSJ//rQ1Go/aiBL
 zbWVtpmLR3919h7NnOSzzlNq8mjj3AlMjohHF1YEKHevCykiE8AInpUgQCsLuFwYxpQuB+9zJKo
 pBugZ6oWhrEB1ebAlv8Iy8aOi1kgV0hiYp6KTtBZsd1uBeuQgUtrtLoWpNFbh4icSW/khA1BpgD
 iM/tIHpGxuHitEVYmn1Ivx34yOd1vqpSwS+j4kadte4aIyCGlN9SAwCs5R7/TiZgzfUNUT0/etU
 ruhAAg3ygcq2HpId3/n+Gk2KiyAnD/Q+5rRvu9cswTQhlQsR/2+8JBMf2HA66NTVEeBkyQcI8ga
 qAOg/RCHXgkLb0jx3+GKWbDJDWxTIaz0sTlJOMn+RyeXk9imejlYkY1HAn+oCR5raUG7i9rpQyv
 foQHmz3lidJkPlg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:13:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10127

systemd became the default init manager of OpenEmbedded-Core with
0b4061c5d502 ("conf: Switch to systemd by default and simplify init
manager selection") in OE-Core, therefore this question is only limited
to Poky (the distro) now.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/faq.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 01bea4d57..6f460b80d 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -66,8 +66,8 @@ See :yocto_wiki:`Products that use the Yocto Project
 Wiki. Don't hesitate to contribute to this page if you know other such
 products.
 
-Why isn't systemd the default init system for OpenEmbedded-Core/Yocto Project or in Poky?
------------------------------------------------------------------------------------------
+Why isn't systemd the default init system in the Poky distro?
+-------------------------------------------------------------
 
 `systemd <https://systemd.io/>`__ is a desktop Linux init system with a specific
 focus that is not entirely aligned with a customisable "embedded" build

---
base-commit: 9f081d9a78ff38e6b0bdc00f809c39aaafad5b6a
change-id: 20260724-rephrase-systemd-faq-question-be93e725a912


