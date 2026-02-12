Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15039EDF05A
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 08:37:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41528.1770885470611219125
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 00:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aIIKZNXs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 177731A0A06
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1279606CD
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF159119714C3;
	Thu, 12 Feb 2026 09:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770885467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ld0RLJlzGsy3PhZ65eOjvomo7C3EdyhN46Zs2Bn4a4E=;
	b=aIIKZNXsVn3btejJP6xeA+mRwerqGYnRzic5I8zpLbMIIy1LklwyVEocSS1D3MnnC15aoq
	phWJH5UbmF5IBXrxkibUn8U/ztOXHydOeEfDAHJEGJPC1h+h/c2I0nJpk69v+n5lzgF/c9
	f6xJPv+Q4u07Vgp1n3DVyx6kQl5AwzlyV6jXE55kNW/xZ1CkQWuFg9Rd2hV1JfEI2hz6Bn
	dZYO6BNPYJEeWgHvMkbyQKhC5Odx/+xRMqboUxPrO5sOY7bSdtLqbaKse/9emOha+rHKDB
	tc/sFbyDfFRdJXr7A05jpUDEY/9uDwuwXBwRDSibf7QzNQiViLRGUQkGLlZHnw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Rework the logic of the switcher menu and improve it
Date: Thu, 12 Feb 2026 09:37:36 +0100
Message-Id: <20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTNJqaY2XMWwgHG000U1M6Akh
 LtbdPkl7/0bGKuwQd9soPwWk2ep6NoGKI3lwSi3avDOB+ddwLusaB+ZKbEaZsMuBh/oMsbTmaD
 eXsp180teh79tmTLTfHRg378RWdKXdAAAAA==
X-Change-ID: 20260206-fix-switchers-js-18626c7a834c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=580;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SXUvTKvOSLtVCvqLT8Tvn3rm4DBVhbtQ6vbu3GHUnpA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpjZFaFnzQXgm5eAuYoazHHxWmXZLMFgYyKzNmN
 SrYTXA1nreJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaY2RWgAKCRDRgEFAKaOo
 NgoBD/9Hjg7tyRfFCfjlwHT49CCPMlUpRBwhCmvOiLAzIOaSgI3vx+ZSTpM1Si4LQkb0Dz5BFYr
 a9EDDkvzpW/inlqWNSpyYOj17r7R3NWBL6YfaXqankUdmmfxK4PO5vyEWeK7725wODwqO520KYD
 GqYLKxk/q8qyRltVn8Tgx6kCQnD7yLOaemE8yU93kVqN00RyfHKwaRgI+I7K/tUkpXAC16J6M5O
 YIdplocqmPO9hdduMMCSpqUaTz5mfJFOG+MKLk1sLEPh7qWu1/uza1tCwKI+ahjdSVyuEatOIkf
 CnW3RhOSaOP5T76kUPfZq9Y6bRH78YBx6lfy5e6GPM95h1rCf4oCGjgAJGusmvrtl/KmHLRxBHZ
 1+dx0217CjnozdA7bW5gd3gDGHPRSjY+qgK96xd8C0QSeiczzcPds5wGvJ70nQ3Q49j2hcDUNfc
 oQpbpCYDQ7rlW1t0zH6bYNhFLykj7EgvwCizUnJymGhb5PCn22b4itjP9v/RNksrJo2uBNGQso4
 26xrTzKJfvzzLCKOwe81h7MdaDG4dzCdd/JrPcNeFPdpizY/snRxLXCZMbBV0oOwmJLZLkLFDOt
 imFwKLYWhhE5jUmRx5U/Mz+4Kc7pgGgzbABTRzqF2M1inUR7gOTTYlwYSYRMFyEWuM4H4D2Uyip
 5pjLxqVys4wCJNQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8895

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      set_versions.py: remove duplicate and unneeded logic
      switchers.js: rework the logic and improve it
      set_versions.py: set a more accurate DISTRO value

 documentation/set_versions.py               | 167 +++++++++++++++++-----------
 documentation/sphinx-static/switchers.js.in | 132 +++++++++++++++-------
 2 files changed, 189 insertions(+), 110 deletions(-)
---
base-commit: 3ec23e9fb7ddc294bac6f68300591239c9cedf4b
change-id: 20260206-fix-switchers-js-18626c7a834c


