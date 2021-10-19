Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745E0C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 16:38:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.12456.1634661485169917772
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 09:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 514BBFF804;
	Tue, 19 Oct 2021 16:38:03 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: document TOOLCHAIN_HOST_TASK_ESDK
Date: Tue, 19 Oct 2021 18:37:54 +0200
Message-Id: <20211019163754.1999572-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Oct 2021 16:38:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2003

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-3.4.rst | 2 +-
 documentation/ref-manual/variables.rst           | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 9ef1982026..797bfde41e 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -182,7 +182,7 @@ in this variable it uses native recipes instead - a very different
 approach. This has led to confusing errors when binaries are added
 to the SDK but not relocated.
 
-To avoid these issues, a new ``TOOLCHAIN_HOST_TASK_ESDK`` variable has
+To avoid these issues, a new :term:`TOOLCHAIN_HOST_TASK_ESDK` variable has
 been created. If you wish to extend what is installed in the host
 portion of the eSDK then you will now need to set this variable.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 85f65cae35..cc55f33d98 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8158,6 +8158,15 @@ system and gives an overview of their function and contents.
       information on setting up a cross-development environment, see the
       :doc:`/sdk-manual/index` manual.
 
+      Note that this variable applies to building an SDK, not an eSDK,
+      in which case the term:`TOOLCHAIN_HOST_TASK_ESDK` setting should be
+      used instead.
+
+   :term:`TOOLCHAIN_HOST_TASK_ESDK`
+      This variable allows to extend what is installed in the host
+      portion of an eSDK. This is similar to :term:`TOOLCHAIN_HOST_TASK`
+      applying to SDKs.
+
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
-- 
2.25.1


