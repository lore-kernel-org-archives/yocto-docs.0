Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A75DCAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:14:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.12845.1758276860399937889
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 03:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Z7DOwJP2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2649C1A0F0D
	for <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:14:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB77C606A8
	for <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:14:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E550102F1D1B;
	Fri, 19 Sep 2025 12:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758276858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c1jBuvjqKX44MlWxbSGtZ4hjA1Jhgg/H0u+7din5bDc=;
	b=Z7DOwJP2rQPr6YXZCOhI1hae0e+wWIjqm38twzNqA737W2YoP71oTNZj8KPvJLoHb0F7JM
	+SJb9VCwmovet7cZan31FqV2G2a3ILg8qnAWjPzfFuHWj/9lafzxqBnEbgQDwQ4jfSLqDq
	7almsPw5LAiFScF9fmpI9ldXpR+gceJXIC+YiTg2mNsm+kdrQ3P5UZzw6TbDs5WY8URXH+
	PEHJmRvTIc+vZ4mPFwZ7ysAMovQQHaNlADivnEEeqmCEJioWZ/LkU1ZcW5mdmvs/db0haX
	bF1+X6s90B/bPisROB1JJhKhB2xnkTSoK+SjeL2zv4oFVNBjRQUSCwq0l2dUtg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 19 Sep 2025 12:14:04 +0200
Subject: [PATCH 2/2] test-manual/yocto-project-compatible.rst: fix a typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-update-compatible-doc-v1-2-f3a343914503@bootlin.com>
References: <20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com>
In-Reply-To: <20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uG44GTTLKuSjIxWy9z55usA70jTszYs2KZ6pD+f+288=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBozSz0WG7RiQf7NXD01MnCqdvPERuIYealh47cB
 Mo884RQa2qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaM0s9AAKCRDRgEFAKaOo
 NtzVD/wKJ/zuxa2NU+08quOYvXjb/1LSw1FVTlubTzniBG6N8qVJw0VDRhr+XbtErQ9t+27vV5p
 C+/JKwMY3MkNkdM3h7fFyAF4n20+YVJjKDEb1NC8BA+I6zEtBmnDal6hWJzIqboMHweOs4gOSRJ
 wXWoG7Pl+HzJjokNe5b2Nux8Hlz8vDVrYLhXdYgzaKWOsS8dNdFXLVs2SGmcuoEQmtdAMC8iVXm
 m/SMFy5RTNpAcNDVnvDqT4SsCVHXjP8uDzhv6NIAU7z3xQGfP5OMsIEmncN3QuPMjcJTanxy4xC
 PQrTz9JKwES0vCsvT1cGPfM8146Q9zmRC7SAvIAjtPSPL8YKPsgTQZ4VZ5a2RUXxQ7GStR35Ehk
 4Phmn34pMd4gBEcLVgf9i8ckLASjisZoRYLVTsCUcHzTCxo7s7UMb2On7VAc6v07FYayip1WB7G
 nNyjPlyu8tuq8mynR6P7Gl3bGbVljIbIs1iC+3Up/XPq8kkuZ6fn4r6heDafhIy5i9YFuDW7Gmo
 fOJtghCGadrSHXJcw81FqENV4WusMk2t9uTD6oxS9bC7Rc38aXQWfK/Kun0ZNOAkZn+f7Wrk89k
 BIWeqFrzxfE3KAv6G+PQ1JIWpzrjd93Y0UlK8X/uVVTxAPac+W6+J/QEBx2VfPEL6uwMVI5D4Sg
 HBQoFpFAjGK2UBQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:14:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7556

Fix a typo in yocto-project-compatible.rst.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/yocto-project-compatible.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/test-manual/yocto-project-compatible.rst b/documentation/test-manual/yocto-project-compatible.rst
index 65d924fad9..7a2e00a99e 100644
--- a/documentation/test-manual/yocto-project-compatible.rst
+++ b/documentation/test-manual/yocto-project-compatible.rst
@@ -38,7 +38,7 @@ Benefits
 and flexible: it gives users the ultimate power to change pretty much any
 aspect of the system but as with most things, power comes with responsibility.
 The Yocto Project would like to see people able to mix and match BSPs with
-distro configs or software stacks and be able to merge succesfully.
+distro configs or software stacks and be able to merge successfully.
 Over time, the project identified characteristics in layers that allow them
 to operate well together. "anti-patterns" were also found, preventing layers
 from working well together.

-- 
2.51.0


