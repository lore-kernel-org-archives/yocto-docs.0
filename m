Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16C3C7EE29
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 13:40:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.11903.1685022040171358446
 for <docs@lists.yoctoproject.org>;
 Thu, 25 May 2023 06:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HACwE16q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685022038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8QSL8LN42LmleHrGPgelvzkK1rcM/T6rWDO/Ioz76Cs=;
	b=HACwE16qyumYJIN/kCWwqzh5qIC0JYrwGFzjLfV6HqZGWn3SdOBZ2nWVhx/FuidwzIBS+L
	D+i+QPT87U3+FDcFaVmN8w/G3t0fe/5ytY4R8s3Sgn59/4be7aP9stQLtWzLle7VD6GIf8
	TRLxKKlIN9hVmOzfnErrAEBih/xN5ped9C/k8XT0u576CxTMTXwPJ8g3wjC1VZz7GmI0aB
	Nl/tjTv1SQJUZcguVyAREvLc3f2yhsqMPr+Qs/vn956lCBGkNFauG9pFWFW7bAhwFK2YE0
	px/FaO9EsTvwweJ2V+XZJfgVajvGjIjT9z32vsR4LGLhWY4ELzRbMnNTrrM/LQ==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33354FF809;
	Thu, 25 May 2023 13:40:37 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: release-notes-4.0.4.rst: fix typo
Date: Thu, 25 May 2023 15:40:35 +0200
Message-Id: <20230525134035.1566544-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 May 2023 13:40:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3966

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Introduced by previous commit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.0.4.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.0.4.rst b/documentation/migration-guides/release-notes-4.0.4.rst
index bb4cc8b185..611109a77e 100644
--- a/documentation/migration-guides/release-notes-4.0.4.rst
+++ b/documentation/migration-guides/release-notes-4.0.4.rst
@@ -1,6 +1,6 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-Releae notes for Yocto-4.0.4 (Kirkstone)
+Release notes for Yocto-4.0.4 (Kirkstone)
 -----------------------------------------
 
 Security Fixes in Yocto-4.0.4
-- 
2.34.1


