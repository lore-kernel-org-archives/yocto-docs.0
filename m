Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1F6C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 17:10:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.15479.1681837835071205752
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 10:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I5RGRYaY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C6FC140006;
	Tue, 18 Apr 2023 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681837833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TUhJvsf7ZF64ZStgpa57sub+yE7NnMSfe4/Ha1Q+/QQ=;
	b=I5RGRYaY3CBZXOclcntrwm80S78oww7evcsKQdQqONnTXuJJn1HTn74uMeit7/KXZTn8ur
	FPIBun4PhXpiyt6y9OvwQq1c0DiwsKYy4WTAnTNPRKFEyoMIJgduX0EKq4h3o57HNhzoWW
	SZm7mb0v/rwFfXdsmE/W8dyDN49AinNSoNcCV3v8+rlfQYhVcZt7mnAxG+wRAd9Cqogity
	eIPumq7FHU9VR1eUZFWTwXemmgsZHEuAtzoNoEO9puSMPLnGVj+r/yBgCi29SWLckXZ8H/
	/WVUNORoLCdrmoJtA9U9lfysAVYhsmn2e6lbG+u/ex3iNUnzH9I2NbK6iS8Txg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] ref-manual: variables.rst: document KERNEL_DANGLING_FEATURES_WARN_ONLY
Date: Tue, 18 Apr 2023 19:10:26 +0200
Message-Id: <20230418171026.1327353-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Apr 2023 17:10:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3847

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6a9dcfd5ba..2899bd78fc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4420,6 +4420,20 @@ system and gives an overview of their function and contents.
       You can register custom kernel image types with the
       :ref:`ref-classes-kernel` class using this variable.
 
+   :term:`KERNEL_DANGLING_FEATURES_WARN_ONLY`
+      When kernel configuration fragments are missing for some
+      :term:`KERNEL_FEATURES` specified by layers or BSPs,
+      building and configuring the kernel stops with an error.
+    
+      You can turn these errors into warnings by setting the
+      following in ``conf/local.conf``::
+
+         KERNEL_DANGLING_FEATURES_WARN_ONLY = "1"
+    
+      You will still be warned that runtime issues may occur,
+      but at least the kernel configuration and build process will
+      be allowed to continue.
+
    :term:`KERNEL_DEBUG_TIMESTAMPS`
       If set to "1", enables timestamping functionality during building
       the kernel. The default is "0" to disable this for reproducibility
-- 
2.34.1


