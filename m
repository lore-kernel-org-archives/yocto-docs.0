Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142BBC77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 10:06:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.20363.1683885988953509897
 for <docs@lists.yoctoproject.org>;
 Fri, 12 May 2023 03:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c2FPmf8r;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 54C22C000C;
	Fri, 12 May 2023 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683885986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rrqjA1BWuqgCcqXUI1dCdJf4WQ6rU8FmyRQsFFg0LwY=;
	b=c2FPmf8rYjrAc6eRnbILB9rHzva2Mta6IuvbEBtShc90NvB0pdmEz8uyeRbM3RC9cgH2x7
	6lpII3+edqzwGvem/0mcc5cHEXEIBD7D6zEcBAihM+glWbXtx5zY36B7ga7iG67a5A8bB+
	WJuP3kM0YTZwPQbDl/q2CH8E/lfTC9NeFRvh7PEPBBhqz1O1YnfLsaNn8k76ZJ3BTo9U5/
	J50jZlI5AkO0MbrXkOYhQ5Nx5Lp+IJYrXOZd5U9HBcW3eRWUQS09tN4JP2nkHqKJF9xHU9
	BCTYfj3ljVCNMc4qNaPL7KwoEz2GUD/k7qRkxBBJn5YK0MyMwLp+H3VV64Qi0A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: update 4.3 release notes
Date: Fri, 12 May 2023 12:06:23 +0200
Message-Id: <20230512100623.2426777-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 May 2023 10:06:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3942

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/release-notes-4.3.rst      | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 63ee186af2..1cae8f19b5 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -10,6 +10,13 @@ New Features / Enhancements in 4.3
 
 -  New variables:
 
+   -  :term:`FIT_ADDRESS_CELLS` and :term:`UBOOT_FIT_ADDRESS_CELLS`.
+      See details below.
+
+   -  :term:`KERNEL_DTBDEST`: directory where to install DTB files.
+
+   -  :term:`KERNEL_DTBVENDORED`: whether to keep vendor subdirectories.
+
 -  Architecture-specific enhancements:
 
 -  Kernel-related enhancements:
@@ -22,14 +29,20 @@ New Features / Enhancements in 4.3
 
 -  QEMU/runqemu enhancements:
 
+   -  QEMU has been upgraded to version 8.0
+
+-  Rust improvements:
+
+   -  Rust has been upgraded to version 1.69
+
 -  Image-related enhancements:
 
 -  wic Image Creator enhancements:
 
 -  FIT image related improvements:
 
-   -  New :term:`FIT_ADDRESS_CELLS` variable allowing
-      to specify 64 bit addresses.
+   -  New :term:`FIT_ADDRESS_CELLS` and :term:`UBOOT_FIT_ADDRESS_CELLS` variables allowing
+      to specify 64 bit addresses, typically for loading U-Boot.
 
 -  SDK-related improvements:
 
-- 
2.34.1


