Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DD9C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:56:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51152.1786442161457826710
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 02:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y7Fk4YGq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B5434E411B4
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:55:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00C846033C
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:55:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B10A11C4BE0F;
	Tue, 11 Aug 2026 11:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786442154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2iFzt+DTVYydkSTeENGvWEnUXTckc3aCrcts+HTy8hI=;
	b=Y7Fk4YGqJKCTQtSpwZ8K4XfXeqVlB806noPsqPrJBpChThEOxNdxub9j9SOewQ8FAXuo3M
	k+f0E21zWBig0Nddh1NMo5TZ1B5s3IJhPPCGBI1MD+zHbrOAGgE2HHHe+mga5c0vothfFg
	D0yzSOPY8lDMXjgMzJuZLbkPKTXzwkYCLSaecLKHX+qd5OvX7Zyb/GXdJzwlHoF1QyTtug
	x1cTRng6gEYHXSp0PJSkdySVHB2nRV8cISgUGHAELsaMJuL+zBHTRU/e0Fc685RIP+VL8L
	KyJ7+0r6LWNWXomeQeUF6LGPF7MBHt7he7xEzz15oGal4UAtSseN+gDdp9udhw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Quick Build: use pip for bitbake-setup (and a typo
 fix)
Date: Tue, 11 Aug 2026 11:55:42 +0200
Message-Id: <20260811-bitbake-setup-pip-v1-0-0c8b350017e4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrB0wYkV7leIi0T86CjZkYimId
 2/aLr/FeycpokDpXpwU8RKV555hyoLGxe4zWKZsqqu6rTpj2ElydgMr0hE4SGDv/GRNg75pb5S
 7EOHl/Xs+hr/1cCvG9B3RdX0A+OmPqXUAAAA=
X-Change-ID: 20260811-bitbake-setup-pip-fbfda14e9465
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=467;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rCRL/33Sy/I6YZ+jNKVr+Mc0nw3JwyKZaa7sLZ47Dt0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqevGofeW0Aiw2p4AL4LYtHHfZTO0cKDBnnDfCt
 IINxSf3SGqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanrxqAAKCRDRgEFAKaOo
 Np4LD/4z3U+nXzYKwsScsrZ6KmCmxx9eUiiojhPWCW6X6PvIEgYfmDoYnPwhxGZYgPXJ9pQtI4p
 gUsopNldttNOJMxs38aMr9f3VaKq5AOgWmeHrnWJaoizrj8l35H11efUcdtqhDvJA7cPU2jIuI0
 6l8Aqj15E0YWGeTrM5nufv9eI4dBrvQ7FJepYoXEBACPgel5uWxjVckWHxW1nBgg0qfSi0jkCva
 fgcU6YpNuUcU0HeOqm1l4adYZiP9QK1GHAeG04f3nh8Tb1e2RHQbSUA61LBhPJV8RlBlN4f2IAk
 aEdp71pPyFEugq8InzEffmRW4/Yg2zo9MtuLW7qgg1yqW6O+VAvE6EjJ2wCrARrBm576aBAj6JB
 s3jajkyc615CPnXPzmEdS40LXFr0LhtFHYnDzwTPxMbV+0n44vcGFsb7Y2ERiczETLpeU3lF0wW
 NqeSKFuQnXSD8I9+FVgxcTlOXkvSdTntJZV5jEcVQE8UayDOn4u0e2eSuX5IVvlpAy520wBbhce
 JJuqA2DVVTFm8fJXFd6u7zocgNynyJYCwTrEP5a3uXNDTUtq/Rsd9N2likSTRREpxLDWFgUiIIY
 PpwlXI45kYoJA8oWBsmLVFsSV97dm7mLxh2ef/Yho5eO7BJxLjjGvnjnBDZ5ejIVtJG851U3aCN
 FRi7sA0PHBrximw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:56:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10257

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      brief-yoctoprojectqs/index.rst: use pip to install bitbake-setup
      brief-yoctoprojectqs/index.rst: fix a replacement typo

 documentation/brief-yoctoprojectqs/index.rst | 32 +++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)
---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260811-bitbake-setup-pip-fbfda14e9465


