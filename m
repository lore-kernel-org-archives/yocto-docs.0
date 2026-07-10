Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1C3C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:47:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.608.1783694835489302542
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 07:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZPG2QMNP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D171F1A0F41
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A731260342
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CEE211BD1324;
	Fri, 10 Jul 2026 16:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783694833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/tD5uO/LWOa6cK4gn5EgRfEqz0eRCX9a05RRb0YzYus=;
	b=ZPG2QMNPXP+6ky0bpaX26NfqUFNqp5wJ/8RPYptwBDMAi67qcZsnyQ9P/vdQItE+WlQn34
	OYLydSqTrUpkEUwjB3hz2/ae2mqamR153mqZbqFIbjoWmTkIfANUDIdB7s4u9hV4ac339L
	MhrlOgfA6z5sJI4RFBXAvS/37NE0ltziFlVqth5SlUuol2YHO5SRjttMW931flM0xFAKOr
	C1dz1eYz0QxIBD3NZZX5wHXA4EXTYlV9CH9WTzV4L5jOowb89dVEX3gIkRBvJjmFgqmwjX
	CBMFVbm+Yiqcex9TSQBPDHkG1kTmreDACfaw+I1BcajrfGGMj4NUuvAyAf0tdQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 16:46:54 +0200
Subject: [PATCH 7/8] migration-guides/release-notes-5.0.rst: remove broken
 link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-linkcheck-v1-7-999168371d5e@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
In-Reply-To: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=A0dUJeANtL0wxLHgBjwfhNbsmMljY9BHXtRtbI2QrBQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUQXrCmiZWuTu9GiqxuOBSeHttp3N+qD14KM3V
 gtzJ50Nw3eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalEF6wAKCRDRgEFAKaOo
 NvE4EACsk9VJXxDLJ/X7Xw0lWZBQRUuUqTxHAtyZIRGYpg3vv/rBrvw/1E/diHmDXDmKakiTQXz
 qlCsVuoUng7twovZUIQaumFF0Ia2FmEENZkkvSkvZd2OtKSCDfAczX3Vymw7mUBvtYMO8uGsor1
 OGCWPDewoWuJvrM4oIJr3a1CcYP2IJUrtZxzxakfC5h6MxNEFVMgqijoo/tiUb5ThYqZySIMk7n
 hX9Qjx4C4a6l3Xn705l8ELFy6TCb1tKmgfrLWLfAa9nqMTLou7qYKH/Lyvai/f9w4XdRjXZ53Te
 X5vhRYS+N+6CoDB06db5y03S+v+6bPq+E7c3x0IxU+k2N54BUdTiPfMEmJZ2BtpDYCmbjezugTh
 YAxM1i7+g3tARXLy3w/9G0In49Sidu9YRPh7P6APnxbxuYJM3dX/actKSeaDX4TQqi/4YWGGiPB
 1XG6GVgSkZBZHAK/z2QnxsFz2YrRXf53TNOogYipQvti/tYfx8bJUNG3ViaK04iKq8pNEN8dHiG
 dqmxZBzaL4/Or2m2VP6Z8s029fr1OiRkcnqrIB4brPDOKQ2VbAaGaUA9Fdk5qxe42X9hiqFdcxp
 KErku2buLvOq7SjnapOlBQOVqEzhl39Dmt/EPCxSS/SmQ1UH6R5NALWOPJJPjpWZHD7yPjCf7AI
 aD/GhV9539v2G8g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10063

https://no-color.org seems down, so remove the link.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 908f1f6a2..61ea4aa5a 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -217,7 +217,7 @@ New Features / Enhancements in 5.0
       state directory (i.e., ``/run``).
 
    -  Allow to disable colored text output through the
-      `NO_COLOR <https://no-color.org/>`__ environment variable.
+      ``NO_COLOR`` environment variable.
 
    -  ``git-make-shallow`` script: add support for Git's ``safe.bareRepository=explicit``
       configuration setting.

-- 
2.54.0


