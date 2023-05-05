Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC85C7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 16:35:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.306.1683304501766713068
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 09:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OP9tCJIu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8FF0B20004;
	Fri,  5 May 2023 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683304499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IqIfnpIgI4MsNG+b45bhopTTk4iyaXL9VKOlKfNRfnI=;
	b=OP9tCJIuY0Q+5PHCDrMynAoSKs1TI6MK6bKgM1Jz/geN8+6pMEy8KaAEmhcDfyimFsvePB
	gFKD9edCjruhx64buAqcygw4pYwFsMUcUSBMP6D+1XKR6Ll0ksw2VEGtjNo82Hc4nmoweU
	Y0ZY/A278dwNnJiZg78p8ywV3vpxdQpNZKPY2Cy+CPvWFK0RjmM1wXjoAZG4WczAf7Dvqj
	GQ+By2htsK8d4yGwxxp4vW0p4B5eZZyG1ajlu1Ne1m+JS4rDtDdT/mFNFlkIDbv/IyPB2D
	1Kjf5aD79tDxIbxP7+SRNUnsqE5/SnOeDzTfmm1qbzpGU7XFD3PQJZTUHR/KMw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: release-notes-4.3: add stub section for documentation changes
Date: Fri,  5 May 2023 18:34:44 +0200
Message-Id: <20230505163444.2127065-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 16:35:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3917

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.3.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index ede3dc41aa..63ee186af2 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -44,6 +44,8 @@ New Features / Enhancements in 4.3
 
 -  Packaging changes:
 
+-  Prominent documentation updates:
+
 -  Miscellaneous changes:
 
    -  Git based recipes in OE-Core which used the git protocol have been
-- 
2.34.1


