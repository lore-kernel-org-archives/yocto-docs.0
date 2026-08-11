Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D390C5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:40:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54267.1786455598078481808
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 06:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uabrmJ9C;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F06E64E411B6
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:39:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C00CF6033C
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:39:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92ABB11C48C39;
	Tue, 11 Aug 2026 15:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786455591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fGMr0QjdC5fpHSsuC87SR9fjAeFEy8nzJY3FTEUKHvs=;
	b=uabrmJ9CXNPTlQdxc9Xru8y/DFkNuz0s6qsESwXcvcX/IaJXY0LXVb3Vq6ZOQHdrNYIzWm
	CunJIkRdiIN2xBqEEJEN/3YS57Ifc26tcDB70vlqy9FdoP0fet82+UaAQ8wCRASW9OjUPe
	u+f+jApvpLncJER3Ubf0yIdZ8OJheQdG1J0FtJdt7Gb8nJye5ENGbfXpIhe34JEtYz7Bo9
	I1DZ8FJTRz6AzEjDaMdBbV4ZlE2rH7rGg1kaybW9P2fWdi3dMN7mNK84cEh4iToVMXUJJ5
	iFjpJSzFDhZVn3c+NBNv+w00bwj8Hy0PposaTV4vRsU20ZI7bn/Ah/9SkccffA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Quick Build: use pip for bitbake-setup (and a typo
 fix)
Date: Tue, 11 Aug 2026 15:39:45 +0200
Message-Id: <20260811-bitbake-setup-pip-v2-0-3e8ffed354f2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4XM2jEtAqIr/8OwoGWQ8UGbthAN6
 b9Lce/yJOeeu4Anx+ThnC3gaGbPZlwh32Wgh3a8EXK3MuQir0QtJSoOqn0QegqTRcsWe9V3rSz
 oVFQlrDvrqOf31rw2P/aTupMOKZSMgX0w7rOdzjJ5//qzRIFC1+pQCiGPVFyUMeHJ416bFzQxx
 i95ZzS2xgAAAA==
X-Change-ID: 20260811-bitbake-setup-pip-fbfda14e9465
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=679;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+/Zy+DjnwncQK4i6fgWoFBY+JnIZIqOmpwW+3R67XGU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqeyYl6SG3F2hVrZ6CORl4+eM4KDXkXAatG3wta
 o6kmIAgpLaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCansmJQAKCRDRgEFAKaOo
 NhdpEACSfq6xzrHI4fRzoES/+EnI+tlPDwmWpBZ0YghIWGXHlnPhfNrPhdMI7yqPr9A+S8yVfq2
 BL1n9BFQy2hLPkBNXHoeZA3eM2NDgOkuoliUldK6x8mo7syZIt6Wu+pl5SmO7escI8aIq7IrKLF
 hE3rGePtjljlbtVeOHd6jeez0+Evj71254l7R2aVzf4RDTi2/0PjF9PTRyA4VvpIFTynh4vBR6u
 vvqSdrcnQVohDh+iDIvh4rNHGAycGaNf+aOQOLU5iuYjikr2wJdb7T3T/xmHiFHEK7fnpaclqB9
 cCmaFmq/rfbMaMQw72gEoEOQpQEU6hGspUbOFbv7rMVT37mZvNXE9sy/5gRImedUafj/nsT5Akm
 XNPFfZvEynOhvjWHIH5ZCZULinaNbfuLmpgo72zH3vn+GZrr7dVWcrsEMBV3svUy+ZBGkypXeYr
 FUITXXH+H27CegVLa0ayu2+Jmu3/ePYPf9onW76ibMOC3dC154AVYJaKBghpeMkovM9JsQjbQsN
 c4/wmKT/1R3754LndLEyBVWzxrcW+BGVau7KE8pJ6rnfTUHM9VjwfiS/ziu04mxYje5B+oI1nbx
 YKB9eL8++zEZFldezwdGVQTNu5cksGmPSHzriA/Qm49rtPeYApgp8r9vFkShdMyrWHYqEzoynAK
 7sSKhhibY+c1DQA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10265

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply suggestions from Alex on patch 1 (thanks!)
- s/leading/trailing/ (thanks Robert!)
- Link to v1: https://patch.msgid.link/20260811-bitbake-setup-pip-v1-0-0c8b350017e4@bootlin.com

---
Antonin Godard (2):
      brief-yoctoprojectqs/index.rst: use pip to install bitbake-setup
      brief-yoctoprojectqs/index.rst: fix a replacement typo

 documentation/brief-yoctoprojectqs/index.rst | 32 +++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)
---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260811-bitbake-setup-pip-fbfda14e9465


