Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2244C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8048.1785319359508441145
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 03:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dwuTcNZJ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 298794E40FD9
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E81CA6039A
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1F5B11C14BD7;
	Wed, 29 Jul 2026 12:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785319352; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2F59sSwhTfcg1pXwHWVlIO9YL97J2JHS54iDyMqjjxA=;
	b=dwuTcNZJMc6VBOX6aeT2ZbRVyLD9sQ2zfaz/C5xDhq/DiVXFwQ+GWu+clvBkVObSFZc0L+
	dmmfTEIl4WC00QpSopkd1BVUqyp9vE2mDvrGLEd4uFa94L9kGk3SLOp3p82r1Zm3k7Z6jn
	hdbaFkGz5c4Xd7BcYllyuAJGhNHE7SQetI3GS7df0DMEIPxtsl1k+OKPz3ryTH+/68e/kw
	IbGT5unuB929CdwN2bMx/zbYHJI1GKGiPiqKja0N42QpxjYHV6zIwc7JX+Oj0ssNBU9A/t
	RDLiUlcGT3nGyolqyzmpl3XlXUaCpdYSb8J3xmfKdSmFSaLTCttaSFBEhUC+4A==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/5] Make the SDK section not specific to the eSDK
Date: Wed, 29 Jul 2026 12:02:23 +0200
Message-Id: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAQBCF4VfRXNtaW9R6FbkYa5ZBaAcpeXeLy
 6/O+S8QCkwCZXJBoIOFlzkiSxNwPc4dKW6jwWhT6NxYJe2o3ISBPTvc4lqURWy0R4uFJojHNZD
 n84tW9W/Zm4Hc9pbgvh//50KadgAAAA==
X-Change-ID: 20260529-sdk-clarifications-9aab0fa9a60e
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=enh7/oLSMlW+4VoJo1Fy8A6bFwTvXzvPiux5Tdg4Qjs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqac+28Q28ZREOVHjYPnO3Cwi7o7ToQRsO1EQrO
 Vxo+hVD96qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamnPtgAKCRDRgEFAKaOo
 NmdlD/wNq0702cwGmEEBvJs5t2ltPHG0t0cDn8JJt0YDPu8W1mwZuS/OGGXHWLZ+syKmw5pEAQ/
 GaoUvD6Jp7fgc9TibevnaZa4rLTozho13NLGF5SXW3nVnN2xPzUqcIGukUTYemEJ0aspQwhYugS
 o8a6kJlpeOBlB6ORPwYgjQl+ruQALQ2dtgJ+GdV+PYiNChrzBEwNMmlvYuCiB8XEZw1uY7AAA3T
 b08BOT/hBhbC/kvYnRqoOy7MFUFelUXjeeftLSBBugnXVjrKgdRaF2DleaM1cloO7YCjEucAqIz
 ylk7Sc6TEnJ2EUuVPaYJyix7K43Ep911PqLHaQ/lcR6Et3so/GRTYqUuzqMIovGfPL8GJe5OgoU
 QEitjrQSAmu4UHWcz8sNWIMXxnPu3OzGDmKxBBS5AZUFEJEXbRo4eG0Mtom7lR/RCUYi+V4RiYu
 GE7sDlswItveY7wL7SRXHR+tRvuZbTwZu169yFIdRrhFXb1Gq8rJAXX6d/wLs9NI86tsAKxheiw
 rICT9xdRv5+nMTDjuNZZbYSUaR6DKV2lb0yG2NpniC7+C8KTYBRbMoVXNbME5g9bytABx7Yc/+O
 xOv1nWvGRoIcF6yMYxTDXiixwJy68dahirPim7pExd0LPgll3rS1ZKPE191AAnpBlkx9w00K4Lc
 lwRNsB56dxH73jg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10185

While the content of the SDK section covers both the standard and the
extensible SDKs, the title only referred to the extensible SDK which is
confusing.

This series comes with other various patches to improve this section.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (5):
      sdk-manual/appendix-customizing-standard.rst: use code block for bitbake assignment
      sdk-manual/intro.rst: remove a confusing sentence
      sdk-manual/intro.rst: link to sysroot term
      sdk-manual: rename the section to remove "extensible"
      sdk-manual/intro.rst: detail differences between standard and extensible sysroots

 documentation/index.rst                            |  2 +-
 .../sdk-manual/appendix-customizing-standard.rst   | 11 ++++----
 documentation/sdk-manual/index.rst                 |  6 ++---
 documentation/sdk-manual/intro.rst                 | 31 +++++++++++++++-------
 4 files changed, 32 insertions(+), 18 deletions(-)
---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260529-sdk-clarifications-9aab0fa9a60e


