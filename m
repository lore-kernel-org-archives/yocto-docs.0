Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53397C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 19:47:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.6798.1681760836914122398
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 12:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AlToC6Mu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D7B73FF804;
	Mon, 17 Apr 2023 19:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681760835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FYT4Mg/tLJgjN5hKjlsvJ3fB1pKPeqx4q050Oj1oLiI=;
	b=AlToC6MuamxWlisNLBDX/X1aC6ru5eHwcq60GAuFi9B0CZ3CpbNF6NkIY9mRbDlOQ9NtYm
	f0hIiprayCYtbyCMaXGjAMxqQHZaJg9zAHDYiC/mCVPF1GpDcsd9sCirJ4M3axHyAkfnKt
	YXqWG7piO5lCMMaT2XJi1a1JE5TW5fHHvieemm5ZJafr54qQvs6cw+n4Ro+JCESOEbeS9o
	ETJPJqePP5ajEPbg1XX1sFEYHYaskNMMd4C40rUzCrr9t+e7wkxbIr4pQb0Zi5KKKRDz4U
	+H9ViMC2KNagGsmU7SqjbTG9xv+/oNl9T1U1lMSk60K+4B8CV9y8d8t5WFyaSw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: remove unused and obsolete file
Date: Mon, 17 Apr 2023 21:47:12 +0200
Message-Id: <20230417194712.1251800-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Apr 2023 19:47:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3840

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/TODO | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 documentation/ref-manual/TODO

diff --git a/documentation/ref-manual/TODO b/documentation/ref-manual/TODO
deleted file mode 100644
index 0510f54710..0000000000
--- a/documentation/ref-manual/TODO
+++ /dev/null
@@ -1,11 +0,0 @@
-Handbook Todo List:
-
-  * Document adding a new IMAGE_FEATURE to the customising images section
-  * Add instructions about using zaurus/openmoko emulation
-  * Add component overview/block diagrams
-  * Software Development intro should mention its software development for
-    intended target and could be a different arch etc and thus special case.
-  * Expand insane.bbclass documentation to cover tests
-  * Document remaining classes (see list in ref-classes)
-  * Document formfactor
-
-- 
2.34.1


