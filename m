Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3691D358C7
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17091.1769700251847020781
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Te87yZAo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5AB121A2B0C;
	Thu, 29 Jan 2026 15:24:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31FB3606FD;
	Thu, 29 Jan 2026 15:24:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F40C119A868D;
	Thu, 29 Jan 2026 16:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VpYKcDTTcogeqaCVbM4jBAFNeloASAcPE4C0A6b/u0U=;
	b=Te87yZAoBu12aUKanXYNXWUPiRftf98NLtdDUvT3/ulymFsDpwclfQ/hEQjnsfTpb39yod
	5tGNWTZR5PeEwIO3WfP16DQAUq7U8owastVnzV87NIQEjRDiZ/idkvPxk1r9tg8HX7RmYj
	kwS5V10xvAkwDgnuQB28f2Uljfg1sUZFtsNpv+uVlGoS6AC4Bu2ZSBoMOCcmIBUjfJj8aS
	tTYokJe9Jyz55Y0DItvAWTBjdNOndHgq1W2UCipHTQIofZLuRfmG1WZD5lxk6lnq4YBrKK
	pKTz9WvRXsZbr1ITqO40Rnc6N0PQXhk64jz8MtZF5itdgzea0ZAw84XEJrJQjA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:01 +0100
Subject: [PATCH v3 10/57] dev-manual/external-toolchain.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-10-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xPKQji/L9AlWcx0v2k/WP7wvR48dGI0uTihbYfUj9tA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uKkAr/5MXUuaeRksBZl33rWwlMqtZ4oEUxY
 WZwRWy4SEiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7igAKCRDRgEFAKaOo
 Nv8xEACmFRqQj2Jy0qeg/b0IF8g9LUC32zvma9ygy6EkYxiRY0skVxEMXRvI/w54ohp5mC5vbaL
 5q1Sdbgr8EHy8Jl4e7UwrbLHRi874mc1IsR/z8+3QkJdcR/afB7PxFlpnnqS7xKN4q4xPE5U/YN
 jfjsAAZGYwyTgj30B9/mk8RrxWxgUjxO+AsgduhrSgwVxqGlNNbJOxfKJCaMbDtotmYnYWjhRaK
 D3eATSFrxfjp25W/bEFe1uq0zIRnHwSCnZ4guxQS5Rrf3VoxGd5MEK1Ebo8wCQdMz3Nxv6MEUEg
 x+j+31zmiXhaR3WTzQIyKLLNGS1g2+F5gA3zNFm00bgC/g6UaYNwrIk0+rpAihoRgod+hfJAZxv
 L/BFQX743jW5qP1U/eMSpSRRG1Tl472pyJElrsL+KPK2V+SkXxDr2k97P0UqdoTa/AwZw4lhiKQ
 aK3nxi0Rby7P7cOtWVUqtF56zZhfqDlTz4bs/6tJsDFvO8j3w5CnSUhzf1USnsu8RsR2qrikPxZ
 ZQsRukdZatAFGqVEz2hGNcUUDQMfYCZhBumnOS+RFeDuSaoq+e52HCkLdvIyzmx7x0lcJXKd+Uw
 vIRBMXmJwUvPhMrXT9XoC8ghngH/KmhrtmllJrcJy13EJyn0vDaAcnJRXQGtdGANz4Ad+TrEYaQ
 IF1M9ECnURorXkQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8796

Remove the single poky repository reference in this document, after the
poky repository was obsoleted.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/external-toolchain.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/external-toolchain.rst b/documentation/dev-manual/external-toolchain.rst
index 238f8cf467..29459ea120 100644
--- a/documentation/dev-manual/external-toolchain.rst
+++ b/documentation/dev-manual/external-toolchain.rst
@@ -21,7 +21,7 @@ follows:
 The toolchain configuration is very flexible and customizable. It
 is primarily controlled with the :term:`TCMODE` variable. This variable
 controls which ``tcmode-*.inc`` file to include from the
-``meta/conf/distro/include`` directory within the :term:`Source Directory`.
+``meta/conf/distro/include`` directory within :term:`OpenEmbedded-Core (OE-Core)`.
 
 The default value of :term:`TCMODE` is "default", which tells the
 OpenEmbedded build system to use its internally built toolchain (i.e.

-- 
2.52.0


