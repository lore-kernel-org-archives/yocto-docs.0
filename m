Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CADC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 09:50:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2840.1787910592273721179
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 02:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rQAWuA7X;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 863B94E413FD
	for <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:49:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B7B360537
	for <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:49:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A863611C78176;
	Fri, 28 Aug 2026 11:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787910585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HCjMai1tANDW+W1pvTqoNLLK+/sUx7u9YXQpIckJwU4=;
	b=rQAWuA7XJHXCOtFIyeUqOD1IiJ0jPwiy3A1HK50vlY6BlSY4g/wKSrO4+VJvucSh83p1ZC
	PcRaPCbGV5cMNHpvMlteqnkrPKcq1wUlWpUP8gXz8d7GUfG6nbC8sCf3uzgGrqj/xWmHqw
	ZqMmPiSNBMU6nrE8MJ1fpDvev+eepQBRAJwYO7dVKQEUAuWt/bIBidNSuGkZgUb8tfYYoH
	XaPdfpDCnFv9qP4XUxIqGSw+PzFeuXy089n8bDa6wT5Fb3+v53n4kuS0pF72l3U1cCj7Xp
	wU0cCCStReevHlkVQVBy0ZpKX+r+xtbqN3Yq495VM/BmMSN974FNW31T/zniHg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] conf.py cleanups
Date: Fri, 28 Aug 2026 11:49:33 +0200
Message-Id: <20260828-cleanup-conf-py-v1-0-c8925e5fe1ac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyML3eSc1MS80gLd5Py8NN2CSl2D5CRLYwNDyxSzVHMloK6CotS0zAq
 widGxEH5xaVJWanIJyBil2loAkicsI3MAAAA=
X-Change-ID: 20260828-cleanup-conf-py-0cb93019d6e7
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=474;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+s/AsRQThHdwqwuohgDr368y+l8GhGEljG0bN0vA/Bw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqkVm4EppQprvQpVC7Yhp/3QrA4+tuMA3sTDgFv
 rVvDUTubFuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCapFZuAAKCRDRgEFAKaOo
 NjtQD/9F5NOslALR68/DrR4K9SdcgmAlzdYd58FNLO/fvyDPDPYbWSLVafjPdG+GgnwI9lFf3YF
 6SZ+y30+WI57VJrdNE9MAM++ugezmsoNiXKwhokuT5qEb+mrW0RmPS0Heu+fJqsEhF4LX8455nT
 hWpjQVBf1CIB9H0Em/zgT5YMW5oymvjRwRj1S70eH2a3NwX1tPd9uDJKCNtbLvpY4OD9/mQkayG
 KII4cy1Z5WvNGxzSWsNqqc/X1i5FdJpd+DnPbR3VwFzME2cGQitkbE8Zv5ueyKi5v6zIfmumkO9
 a4VXOz8CEE5LhGmZFTJuIlwkX/pytwDLoncYrOns6j0lfF5OKgXNirIZOJCzBpAD9yfNKbH8vy2
 z3ojjg+yU7v/FSf/MyFsqixzD2heM8t26UzD4QSYaJ/2kQ8bld0LxwcRu2o1YgVPbY6ERJOIuZN
 MEV5IQLRKKcz+F1isTJmaCO9DXpvekGt7H9PtT/Qw+viz81FMqXtCADo2gDnfCm6kl/i+q4aY7i
 FRiVrpM95owes5GeB/FBQ4CyI0clOtX1+B2khIQ4IiSCQqcZK97yj8LTbCE8cdQritoA3qSPmRO
 9qtnX1awhDhom3g332iQEnMsM2m/wAkMxSt/E4eNpSH6UxisDuIdfkWMOGLyt+IctxrEfBCVHWY
 kfIF6isML7t2eeA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:50:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10391

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      conf.py: move and sort imports
      conf.py: use importlib to check that sphinx_rtd_theme exists
      conf.py: reorganize options

 documentation/conf.py | 263 ++++++++++++++++++++++++++------------------------
 1 file changed, 137 insertions(+), 126 deletions(-)
---
base-commit: 9955b0f099b6b42a9750f0d544944a2d8e5a39b2
change-id: 20260828-cleanup-conf-py-0cb93019d6e7


