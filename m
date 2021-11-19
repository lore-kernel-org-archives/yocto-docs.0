Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376DEC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 16:29:09 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.11227.1637339348194287189
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 08:29:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id AD057100002;
	Fri, 19 Nov 2021 16:29:05 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: remove warning about += and :append
Date: Fri, 19 Nov 2021 17:28:55 +0100
Message-Id: <20211119162855.1970998-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Nov 2021 16:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2167

No longer necessary since a warning was added to BitBake
(https://git.openembedded.org/bitbake/commit/?id=8c31e75557dc6a8d8f407b5d24d6327889a3e3b1)

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 3eead147a3..9611a4f206 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -234,11 +234,6 @@ following list:
 
          KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
 
-      .. note::
-
-         Avoiding "+=" and "=+" and using machine-specific ``:append``
-         and ``:prepend`` operations is recommended as well.
-
    -  *Place Machine-Specific Files in Machine-Specific Locations:* When
       you have a base recipe, such as ``base-files.bb``, that contains a
       :term:`SRC_URI` statement to a
-- 
2.25.1


