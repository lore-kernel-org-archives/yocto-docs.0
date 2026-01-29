Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E414D6B072
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17208.1769700269990337866
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AnRDbbXz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B0FB1A2B0C
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49703606FD;
	Thu, 29 Jan 2026 15:24:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 819EF119A8875;
	Thu, 29 Jan 2026 16:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5lWGedgMp6d5SJVOVQvGB3V6zoCnioUJVv95zER9pBU=;
	b=AnRDbbXzkhYfCHp+sDdKz1FAJNPkzQBBNhGYDTK3CKO+G9qOm6zSuL0ncEZLXa58VOXB/5
	ue2XSMG307ux3s9U3aZaeUDIm7rQOultwv3CUIQ/TL3IlpDfWKUWtnAErv/iVb/KL/NQBz
	uYLoB67wwa9+Si6IHz1qGryiU63MytffzVkaUfJm6TLGdqKH8BQrcB+NsCe9QpvdeO1UCi
	MC0DAhXglkPZOus4zQMnBSauPfICsQWY01yy0baSz6/kaMiNU2mt6VEipaoOBLBdXjBiWB
	t8TqylfD+d9HCmlkS88N/BdmLgDhfiSvN4/S/YqplGfKGJwS4FjLNGYOLuM0RQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:27 +0100
Subject: [PATCH v3 36/57] dev-manual/custom-distribution.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-36-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=e2biYZgbv6AVXFPbMCV+AeaAWoHiX/b2fQmc1CcthnU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uOulMrf6mwor5CWhilYrmkpzFgv9qIJdXcX
 hK8zuaCtwqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jgAKCRDRgEFAKaOo
 Nk3mD/4582ftJ8i4ANLCCbMG4Nk/JV6kYZF44RSvNpPamiKV1aWriEsbSjMoir9CnEpqpjsbXu1
 H2rDObCX5FXHGY6OUZKPSGV9A7FrBHrq2DaUCr5/O69pEXeZn8xLe5evrpFnsTbgLvmj747631K
 Tx00ebRnkX0PPHKuGZqwKPP6UYtuYvMff44CsY6qNoxroX0mjeYX/dXm1jBPU8jb3RvIrdcmKRC
 mwCQ/HV5sJIMPBqhGk1GgshIyKzohjO5yVRwvuo51NNVeB5koeJml8ueu7vG8cVFQKIYA0cwi8Z
 rXIZHFUROLo3xan36tUx/YH1JPH9aU/d0DT20xKEa3Kv/SoZKHPrw3OpUD/N+jXsB/8uvzkRZ4T
 VxBvqkbQsHOI4tXOkVBo0y7bRS1ExGSD25hCI/dLLy/EXugEWA5eQ8HkvfauUKQZYphqH/PrVt0
 mts3BfWgX/ezRHNShvy+eAMdwzokSCCsgw+HjNr3bGmfQ3ISDVv9RnYD6Z3OBDbIsBcMOdsEhSB
 lGvJrvR7MYbVuCSZaJhTsgRKPoUa5BNAJmK7YiRo0N0mG8qXCFOUL09jGfTJgAbqbeh+aUeboSv
 ZhwlpqKBy9SS7/4jWOB8loM0gEqMT+rJbeZXxqZ22lgRBlkn6LC9OkR9nF01ivWiC1/++j9pM75
 n/BWwEA9WRSwevQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8822

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/custom-distribution.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
index 55854f00e..4dafd2725 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -3,8 +3,10 @@
 Creating Your Own Distribution
 ******************************
 
-When you build an image using the Yocto Project and do not alter any
-distribution :term:`Metadata`, you are using the Poky distribution.
+When you build an image using the Yocto Project and follow the default setup
+showcased in :doc:`/dev-manual/start`, you are using the :term:`Poky` reference
+distribution.
+
 Poky is explicitly a *reference* distribution for testing and
 development purposes. It enables most hardware and software features
 so that they can be tested, but this also means that from a security

-- 
2.52.0


