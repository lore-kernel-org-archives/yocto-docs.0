Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB0ACDE009
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7327.1782380026040250264
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FNoSCDUK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E9D1E4E408CA
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEFAA5FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90D14106F00C6;
	Thu, 25 Jun 2026 11:33:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fwa84HMXRjFBPJCWtsLDVIY3s0jVt+i4r6gzuCVW3ME=;
	b=FNoSCDUKMlfeF7c4zE70UNuMh1/BIg+d6Xq8KnLwSJPUP9wiHCXrQRDe9wTWzYZWpTh6eP
	SOqQYYHtVem6/GoV1QE4kljsQ3D83MiWLCaUn+NvvKOY9qW5ZlNKkm1zmV4RlbsAHT7Rvv
	9HTO2PiuSC7KISsf9CQU6qFjRJcVkPYN4T9fdaAB3U8iI6oN8oKpHiK4TFxsQMOZ5QqZED
	60L+/8pbSr59H77Im6uX0E1bOKAz4BAcc9fhceN72X0pMKvKbrtLOdh4ngO08Kzat7dDyR
	IZC3a0sr8LSifEfyfGXrsXSoftn1sy7JT8h0EpnmqcMz0xxC5YTaVLghDamccA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/11] Migrate WIC documentation
Date: Thu, 25 Jun 2026 11:33:27 +0200
Message-Id: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQqAMBBE0atIrw1kUBdeRVy0sdUWHEicIHh3o
 y4fVP0AnhyThzIJ4Ohgz8scodIE7IBzT4LbaNBSF7LQmTjZiol7h1tcCjRKmhxzI1FB/KyOOr6
 +XlX/9nszkt3eCNz3A2blXlVxAAAA
X-Change-ID: 20260624-wic-migration-a31035a530a1
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=x2RYqZFMetyaADRSz8CoAn3wIkOKV1DZ0+x8CEJSkd0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPXzQtXnnHbA6Z6jDxE9eE8OcABJyqz8cfJDA
 BSjMExA9eyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz18wAKCRDRgEFAKaOo
 NvUBD/439P69PXkhGq3ofpK2Exc5TRi6e2T73DPu0s/GbIZJKtCbd+Z+gb1xGrbLjYX26FARWkN
 mxhIXwvHLU/UpNjiUxOVRKxRpHDlyAoRXO7Wkx2xwSWDd3JWkpHzK0qDN2E9VyAT125R20rew7m
 nemOM66NIcGZVe1c+Ts7XSG7nFqK19bqRSjFgkzA2tjOipB69GHg1dD/oYRBrPzs+9C8Nvg+Kek
 WzQRPAreDAKslBOD+BVrYvM0yPvDvVUy9t6I8gVwUimO3crmf1xqVKRaxcAonYV8aqtnLyAhUC/
 wxtP0V8Cgojv0PgGKuFwT5/PCxBcy8lQ3733TSLEdmEfZZ7xZUkaqf/VwEpQtoM/jBsIu+EhiJl
 HWT5OfFRkaPRxvIZYgEu3NM89PQZAjMKNRr+aeOhdJ8BoKkbGsmPW4xAq5cDH6dPyIb4qBGGSwL
 MnSzJqCXyefs/A6QApO6S1u7v7Rv8bZwOOxgeQFFtPcVreWZUdcy5NS0u2TIrwCv5iozULs8if9
 HTk2Wkq/TdIQHlO24H+UkEW6r2dREBQSOBOBILWDa2s486Prgnc4Ue7B8kLD0A2xCA7crN4FOE6
 3t6SX0cEvcqx4EPk2A74ioRuY5HodOJ90FInOCfCqr+gvVKmC45kRbFPraA1ABU8XKKNlLc8QCk
 fFC19LQKTQ6x4yQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9883

Since Yocto 6.0, wic has been made an external tool of the project, and
WKS are located in a new files/wic directory in layers. This series aims
at migrating the existing documentation with these new changes in mind.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (11):
      dev-manual/wic.rst: replace deprecated wks directories
      ref-manual/classes.rst: replace deprecated wks directory
      ref-manual/kickstart.rst: replace deprecated wks directory
      bsp-guide/bsp.rst: fix raspberry layer content example
      dev-manual/wic.rst: remove note on wic-tools
      dev-manual/wic.rst: remove bullet point on host requirements
      dev-manual/wic.rst: add where to set IMAGE_FSTYPES/WKS_FILE[S] from
      dev-manual/wic.rst: add a requirement to use wic from the build system
      dev-manual/wic.rst: convert code snippet to code-blocks
      ref-manual/kickstart.rst: remove note on available commands
      ref-manual/kickstart.rst: document the include directive

 documentation/bsp-guide/bsp.rst        |   3 +-
 documentation/dev-manual/wic.rst       | 213 ++++++++++++++++++++++-----------
 documentation/ref-manual/classes.rst   |   3 +-
 documentation/ref-manual/kickstart.rst |  24 ++--
 4 files changed, 157 insertions(+), 86 deletions(-)
---
base-commit: 47f0f69651280151a52f41fd6b425d55427401e9
change-id: 20260624-wic-migration-a31035a530a1


