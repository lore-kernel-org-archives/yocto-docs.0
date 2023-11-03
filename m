Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E961C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 10:55:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.49197.1699008942633986224
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 03:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=keP7iRu3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AEA360004;
	Fri,  3 Nov 2023 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699008940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QQX7utTrdGPalAIPKdnDF+3wtnQHLRAYJSkx5qOyDwg=;
	b=keP7iRu3vWwnK704DbN5q3c1r3pNorcFNRGDMDE55nfCkLzp1uIeNp89h2B6DRaiwfjn9q
	5mCcKtlEz6Xyhgc2yNS6yZx+x/Z9i01f7CUwuWcHgJ1OdXU716MTh7ohc3hn0Jyztxp6yo
	JvZyZmIDM5PD9pwLf1Ca4otWJcSQYHYdqpnnJ/N66uFzuOZDWszoA1uBQUI5y8pShVB2Ec
	yxYOwnVopENadpSxT99yWIApYb7pcDcH/b0at4iWzc5yzC1zrZxBBjztTkG8wx1+KXmQj5
	/efKLxuWwhTObAy8lv2YZNycxlr3jzNd4T7os/juo/Fy0uU8aw5WD3635AiRNQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] ref-manual: classes: explain cml1 class name
Date: Fri,  3 Nov 2023 11:55:37 +0100
Message-Id: <20231103105537.2010543-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Nov 2023 10:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4579

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Martin Jansa <martin.jansa@gmail.com>
---
 documentation/ref-manual/classes.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3070f13551..a8afe9f2dc 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -383,7 +383,9 @@ preferred CMake Module directory: ``${D}${datadir}/cmake/modules/``.
 ========
 
 The :ref:`ref-classes-cml1` class provides basic support for the Linux kernel style
-build configuration system.
+build configuration system. "cml" stands for "Configuration Menu Language", which
+originates from the Linux kernel but is also used in other projects such as U-Boot
+and BusyBox. It could have been called "kconfig" too.
 
 .. _ref-classes-compress_doc:
 
-- 
2.34.1


