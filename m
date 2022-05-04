Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80096C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 18:24:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.1012.1651688644781998709
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 11:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gAJsHXPp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 12B11FF807;
	Wed,  4 May 2022 18:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651688642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XjaZJD3qwqEe0bO3UnBX3uBn60em9kYu4uJJ8XTRBzU=;
	b=gAJsHXPpgz3ov3OWY5Kxl3TUDpPxbWRx84EJXS2ni2G89tUWBHe2cjQQC7G0d+vbav6GNP
	eH6NGuGoom4mVVIdwS1p66TAFl/OMPBcUsdAc5Rpx5yLhKd1+LYoGTqFH51DAehtiT0Ahf
	u9+PBQAUqFQLp6+1Xtsn53LH3VjiPJ7QlqTEK7pGPYF0M0SNcdrRfYkZAXpowZ51DGLoYN
	bQb7Alruy2G5S18eebqS1spbWc9zlNQv85du2OlGCgvG8u1bBruzXtjMUofleOlnqKHxPr
	el4CcrvQjtX0qbjz3ExsDgROlCC2HhrdlONmFtwdvhjLbyCVioDHkk7G+kZL3Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: further gdb usage simplifications
Date: Wed,  4 May 2022 20:24:00 +0200
Message-Id: <20220504182400.702300-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 18:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2920

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index c9fc585a05..8a2bfc3bb7 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10312,24 +10312,21 @@ debug on the target hardware.
 
 To support this kind of debugging, you need do the following:
 
--  Ensure that GDB is on the target. You can do this by adding "gdb" to
-   :term:`IMAGE_INSTALL`::
+-  Ensure that GDB is on the target. You can do this by making
+   the following addition to your ``local.conf`` file::
 
-      IMAGE_INSTALL:append = " gdb"
-
-   Alternatively, you can add "tools-debug" to :term:`IMAGE_FEATURES`::
-
-      IMAGE_FEATURES:append = " tools-debug"
+      EXTRA_IMAGE_FEATURES:append = " tools-debug"
 
 -  Ensure that debug symbols are present. You can make sure these
-   symbols are present by installing ``-dbg``::
+   symbols are present by adding the corresponding ``-dbg`` package
+   to :term:`IMAGE_INSTALL`::
 
       IMAGE_INSTALL:append = "packagename-dbg"
 
-   Alternatively, you can do the following to include
+   Alternatively, you can add the following to ``local.conf`` to include
    all the debug symbols::
 
-      IMAGE_FEATURES:append = " dbg-pkgs"
+      EXTRA_IMAGE_FEATURES:append = " dbg-pkgs"
 
 .. note::
 
-- 
2.25.1


