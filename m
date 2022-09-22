Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD13C6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 14:58:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.18.1663858697972956156
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 07:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bvO2xr8a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0DA4D20012;
	Thu, 22 Sep 2022 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663858695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bOdl+nnj8/4USOzGvkgaQtoULCj5bLvQ1+KgwSJzzlA=;
	b=bvO2xr8amts/S+UMkxrCF02Dtcb4uPpiWChbqeL1gMba8wIRETk2TX9E90vBM2fFKCPHyc
	E16EQ4SlGmzBfwIBauuLF8k8v2Q3NZ9qYn2TzzUp+IQxsRf5LzjWpSRLjkYN8CfMB0gKc4
	esEXCXCooilF23/D+x3AEylJpe95Pc/jinNOz9Zx7zEvOtc2vnn/wqw4MNUKeC3BxH2f+F
	D+caofFeBztvKT2Gzq1aK61BwPQGOnx62JZ4kDcj2X15kDSqBTTC+D/iIC1uec49XYyNow
	TugxxeOlH70K6ZonAyCDfYHutNEALd8YpukuJIUwzQ4XzIJo01MTHiYRIDMXxA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables.rst: correct templateconf.cfg file name
Date: Thu, 22 Sep 2022 16:58:12 +0200
Message-Id: <20220922145812.2404547-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 14:58:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3210

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to code in
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/populate_sdk_ext.bbclass

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fe845bf375..916649856c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6591,7 +6591,7 @@ system and gives an overview of their function and contents.
 
    :term:`SDK_CUSTOM_TEMPLATECONF`
       When building the extensible SDK, if :term:`SDK_CUSTOM_TEMPLATECONF` is set to
-      "1" and a ``conf/templateconf.conf`` file exists in the build directory
+      "1" and a ``conf/templateconf.cfg`` file exists in the build directory
       (:term:`TOPDIR`) then this will be copied into the SDK.
 
    :term:`SDK_DEPLOY`
-- 
2.34.1


