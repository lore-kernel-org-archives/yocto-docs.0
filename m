Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F79D116F8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:55:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18455.1764582934392382480
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 01:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Cia3/S3p;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 294BDC17B40
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49B8E606BB
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4E0F119125A6;
	Mon,  1 Dec 2025 10:55:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764582931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=QCOgYbLRsMnba5kF2pzLkEn9PDuv+TEnFq/kJ+nK0EI=;
	b=Cia3/S3p+ivzSQmTqnQM9TCkxYDNFiHDTx6u9unJDcChXBzkOEHb/IoEMVEZRauhzCQQRs
	Ved02cclMdSaWCaRIHocqatLDpWiAVC3Zu0z83KtEXPhRvImMBFXyKT36sD4EdgyGAlG19
	Lw7wfKvuJ4WgK4GlnLhAiUf6bdGFyhGKcHBORZZWoBRQomaJR8lkjvDHmf20GVoSXMCyVy
	85Y7Romxbul8lbs6kzXPfdV6PVBBUjp5ckHjUwMH06l2EsCiP3sab9xsRa/YGwUUPhFRBR
	su3gWWk+9jnQ5vH/c47f7ZvyI9PKO3UVS/tsnBg+YA4HOhmaxR63nPw7wqpfvA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/4] Various docs fixes
Date: Mon, 01 Dec 2025 10:55:18 +0100
Message-Id: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZmLWkC/yXLQQ5AMBCF4avIrDVpNVRcRSyqBmNR0kEk0rsrl
 l/e/25gDIQMTXZDwJOYVp+g8gzcbP2EgoZkKGRRKiWNGOlCFhqN0701VS01pHYL+A0pbbvffPQ
 Luv09Q4wPhqOpM2kAAAA=
X-Change-ID: 20251107-fixes-3e7c3ba76803
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=K2pSx4nidtqkU8rKuQEJW9rhWTSYzlhs9DtldtnYSII=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLWYSz5b8w3GdfJfSxXAH8wPg0lKbLP1YOg79c
 MjFk/zaOZmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS1mEgAKCRDRgEFAKaOo
 NvPGD/9jeVKEynEdIXD5XRKNt7/VEng5L5HQJy3fJf/NkquhhrBgGzWw1hC9ymhTSPBuLJ1aTx+
 v6gosn0aYp4T+6tXxNsl073rIJcqmPVKhpKRFPQ0t+yDVcpjEWiQdpuyEWSxVabphq3/PU3Xani
 ujl9YMBeds9Z+FVS7yKThSYaXhQemeTVDNIvUDHOQUZL6SFZ0812mCuiB+Pg8m3YtE0K9QwDSYM
 B0LtbsHwKkcUAhMGaGQWWVcWLXhBr8ZeZLFeZyfZWojoRKi59ANd60M2H2N/aekgbRJDn8uxJdx
 WEuFDNLPzXDgsZrP6RtDqCjb8jUwmCZpWFPWkbUGsO1cKNVSwBjte91Br4ZkFcxZHfN0xJHxK1M
 0z27Bzhn2zgKLYZN23SfCnFeWKnQuFzQSHB8lYFnKOsTwj97tKX60J/7O/BV+NROGKIw2W46PWG
 /q8nPC8RJkaoh+bSLKJ0qDljYEvp0CQvjwvDx2W/6OhhFfx3Q9aAq8But55NN1cXuiHarwCBjCb
 jz1J80uhI3aP5Le/2Y6Y4SeTsmyTXW5GESp9e38il1a2DFPefszmBG4Va95md5MUwhpuYL2Cr4E
 Ko99Du6FGS15m3wt3iOu9m3BaWgXc/B0k29XFM98PPjK5ntPYUdvTzmKemAD4v12As0T3rNgK9S
 cuEOTLC0lAur5Nw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 09:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8180

Fix obsolete documentation in some places, after receiving reports on
the list.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (4):
      ref-manual/variables.rst: NVD_DB_VERSION: fix default value
      dev-manual/temporary-source-code.rst: fix definition of WORKDIR
      overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
      overview-manual/yp-intro.rst: link to YP members and participants

 documentation/dev-manual/temporary-source-code.rst | 14 ++++----------
 documentation/overview-manual/yp-intro.rst         |  9 ++++-----
 documentation/ref-manual/variables.rst             |  4 ++--
 3 files changed, 10 insertions(+), 17 deletions(-)
---
base-commit: c9b19880d281be41660306f1f7456b9735c21487
change-id: 20251107-fixes-3e7c3ba76803


