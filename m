Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B57C433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 18:35:29 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.1074.1653071720976617996
 for <docs@lists.yoctoproject.org>;
 Fri, 20 May 2022 11:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c6CSpB5E;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0C653240004;
	Fri, 20 May 2022 18:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653071719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M1fXn1J0g4rYl715YuT6uaqRwg0SSD+WLhhQ4uePlKM=;
	b=c6CSpB5E1q6nlvLCdUwhL1mRQEUFBznRGcmydH/OOdPmXSONBCrX4omzBQnmw93mP+kTS+
	GgnY18Sq3HL0jO2T3JPmirxnqWSw6MFkQq28LLdNil+pirDUBjQLFBb/Rd9nQcyS/lptWY
	4mgdvem5sij+vU3791RENk7d2YaKvvNUmV0LfBkxOTAbdxrPyTDNnzowgWJ1XDqs5pnvCk
	Ty5KxwkNs9rFRxDLtwHD/xdZsuJDtZNgK0ebwo1OIZe16meEetyg5CJ1KGtPoUwUr9O08k
	53KzLFwk1Ax5LLCWcQBYntqI6+fWVWju0cQQY9w6voeUANmIVuAn2FPk0emXiA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: add documentation for WKS_FILES
Date: Fri, 20 May 2022 20:35:17 +0200
Message-Id: <20220520183517.141145-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 May 2022 18:35:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2941

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fixes [YOCTO #14590]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst |  4 +++-
 documentation/ref-manual/variables.rst    | 13 +++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 3a47a9ff27..ca6d594386 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5481,7 +5481,9 @@ system needs to meet the following requirements:
    variable.
 
 -  Include the name of the :ref:`wic kickstart file <openembedded-kickstart-wks-reference>`
-   as part of the :term:`WKS_FILE` variable
+   as part of the :term:`WKS_FILE` variable. If multiple candidate files can
+   be provided by different layers, specify all the possible names through the
+   :term:`WKS_FILES` variable instead.
 
 Getting Help
 ------------
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 146af89e8c..ce2b6bf68a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8767,6 +8767,19 @@ system and gives an overview of their function and contents.
       previous example, some-native-tool would be replaced with an actual
       native tool on which the build would depend.
 
+   :term:`WKS_FILES`
+      Specified a list of candidate Wic kickstart files to be used by the
+      OpenEmbedded build system to create a partitioned image. Only the
+      first one that is found, from left to right, will be used.
+
+      This is only useful when there are multiple ``.wks`` that can be used
+      to produce an image. A typical case is when multiple layers are used
+      for different hardware platforms, each supplying a different
+      ``.wks`` file. In this case, you specify all possible ones through
+      :term:`WKS_FILES`.
+
+      If only one ``.wks`` file is used, set :term:`WKS_FILE` instead.
+
    :term:`WORKDIR`
       The pathname of the work directory in which the OpenEmbedded build
       system builds a recipe. This directory is located within the
-- 
2.25.1


