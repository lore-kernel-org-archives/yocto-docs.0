Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27445CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:19:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.14824.1758284342875828170
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 05:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nOO1zykV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 743F34E40D65
	for <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 12:19:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44F2D606A8;
	Fri, 19 Sep 2025 12:19:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B934E102F1C98;
	Fri, 19 Sep 2025 14:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758284340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=MJ34m4veOKQRhmu+Mr80mEa1cifApWhCAcBlusgfW0c=;
	b=nOO1zykVi24txb8A52UPfsjeIlyT8eFddfSOEazk44AFL5zDx4QkRJ2W1+dXrkWVDmOLYy
	ehWtZ506hpSAvgvvPvPq9zZV3V5r9WXj9rS3CyWRdXipcMuOKZ14kVKUmQsGqdLa+/56Jy
	0BCbL41tZVBajJdipXKlgGPyK2xfMJk+oaPBuv6XRU7NYfEnUU1KffPJzavlI3Q3B9u5BM
	EFO47bmCxWWoQKKSIwR4okxvMwgymrlkyHoTrWpNfrzVa7pnGsP2A5i1GWTXFxfeUzDCS1
	rKk0Wddj/eguetyfX8k34neJoSCwrhAsKMKeQ3ztfMS23aI+Hfra7w+77xpJHg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Update yocto-check-layer documentation
Date: Fri, 19 Sep 2025 14:18:42 +0200
Message-Id: <20250919-update-compatible-doc-v2-0-c428da260487@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJKzWgC/4WNTQ6CMBBGr2Jm7ZiWghFX3sOw6M8gY5CSthAN4
 e4WPIDLl7zvfQtECkwRrocFAs0c2Q8ZiuMBbKeHByG7zFCIohK1rHEanU6E1r9Gndj0hM5bPFf
 SkTH64loNeTsGavm9d+/Nj+NknmTTFtuMjmPy4bMfz3Lz/n3MEgW2SqtS1bKshLoZ71PPwymL0
 Kzr+gWldIvwzgAAAA==
X-Change-ID: 20250919-update-compatible-doc-651debba8dfa
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=804;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LynfI6C1YR1uTtS/TCEAFWqzvlekr+RYVg3v5x+TzdM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBozUoxTxY/7A9N2T92lujnbP42A7wKGTkUF16Pk
 3LJfUewMZ2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaM1KMQAKCRDRgEFAKaOo
 NjF+D/9WQjYo3aDZKtxwU0F481X+pcXsP8342aUUsxVQorFFTtpWL4ionE8VvfB1mTvLS26bUa+
 ArRtEuzI0bzRZ53sJF/bc29PbF7prTWqqxORat8tsZZHoogvZ77K7LDg9pYIEujVK7sPayumkl8
 cHWpeV/mxXSetMKTpanFh5F3z+BmK2+lnunKknLYB6ro3G3wMfqHqcw1eL8H4jbwn7CgBFf0tNR
 gonGtdpsHr59qudx+7L5K65G29tJ9j/JryQayKJBFyJMA5A1G/64u8LTL3mE4o0dhj9nGu9wsA+
 j4lVUrudBJRa0CNDc4/oimsoBZHiACFVJK8wT9jGpxj17fSB/wFRdGUklHgOno1ea2j9yq2JHoo
 oRPif+g22jVP64KtuI6IVn3YHGB62pGAZ6FHOGKTEPS7/RLfHcilb+QL8ODguu/ImdDKFNjRHAA
 LSMqsmcfkV0PeDaG72nXZ8b99cLxZKddqeUPz/IahyEuI5ABHZHKdhrORHDPgjvCT+O9oQYobEQ
 D3gXm0mZvdPoGiYxLogioba5XptXlVzVsvu/5aFp0cPcw8VhS1UHr0TqaxeNrJovwdSup59BfOS
 hiseepyqfBU0YeJ5i0fyiNXw4gDYgdnrTmkHWPBgy/Qqr3LWOc+96zKLi60xDcNmTjRn41DU/iC
 GzH3K2tIokTBWYw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 12:19:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7561

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Mention --dependency
- Pass layer dir as last argument after --
- Link to v1: https://lore.kernel.org/r/20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com

---
Antonin Godard (2):
      dev-manual/layers.rst: yocto-check-layer: mention --machines and --dependency
      test-manual/yocto-project-compatible.rst: fix a typo

 documentation/dev-manual/layers.rst                    | 15 +++++++++++++++
 documentation/test-manual/yocto-project-compatible.rst |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: e77139b5c616e6e5ad436eb91416fd804389425f
change-id: 20250919-update-compatible-doc-651debba8dfa

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


