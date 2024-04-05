Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902F5CD1296
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:04:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7369.1712311455434624951
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 03:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VAuWmkxc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE3D3C0009;
	Fri,  5 Apr 2024 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712311454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=km7miWmkZxGhmMhtwi6hRh80ehh1/1+AGvrEknxljNo=;
	b=VAuWmkxcEEZuoiB68JG6bj1iAOV6hdfbQ1OCGuTV3rpIMylDS9Ox85qRvHLmGFiUig3yEL
	aIXRoe+NviUoitey4T+Rn0KJzInLPDZ7qdEXXbGmRtsjNgzd3r8KE1ueDymbY4uLEzgIK4
	hjvS0tGbyM2fpheXWTffML/lduNWTw2BnXL8f8VDl5v15HTsLOHOw/vn+BNiZJ4y4yKpO7
	P9EZURiaEXm9G5RnpDjsmihr3Dm5hC6YpJB92Kslcttskq/QGPiGbLjEEW0FOWGCfLyd4J
	biyU31lVsVuJz1uSdQRiSx2RK9bYC8Wg5/yrx/lLHl11C8nUzqWuNZ6+GSrKkQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 2/3] release-notes: add changes to Go language
Date: Fri,  5 Apr 2024 12:03:53 +0200
Message-ID: <20240405100355.2268926-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
References: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 10:04:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5070

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Mention the new class 'go-vendor' in 'Miscellaneous changes'.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index fa18afe39..8df95ca21 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -64,6 +64,10 @@ New Features / Enhancements in 5.0
    -  ``systemd-boot`` can, from now on, be compiled as ``native``, thus
       providing ``ukify`` tool to build UKI images.
 
+   -  The :ref:`ref-classes-go-vendor` class was added to support offline builds
+      (i.e., vendoring). It can also handle modules from the same repository,
+      taking into account their versions.
+
 Known Issues in 5.0
 ~~~~~~~~~~~~~~~~~~~
 
-- 
2.43.0


