Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8598C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 18:36:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.1430.1636742166854941170
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 10:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 08E8460006;
	Fri, 12 Nov 2021 18:36:04 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: remove reference to TOPDIR
Date: Fri, 12 Nov 2021 19:36:01 +0100
Message-Id: <20211112183601.180362-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 18:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2151

Already described in BitBake's manual
As it is not specific to OE / Yocto Project

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3bf600ca9e..bcae976c69 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8211,11 +8211,6 @@ system and gives an overview of their function and contents.
       information on setting up a cross-development environment, see the
       :doc:`/sdk-manual/index` manual.
 
-   :term:`TOPDIR`
-      The top-level :term:`Build Directory`. BitBake
-      automatically sets this variable when you initialize your build
-      environment using :ref:`structure-core-script`.
-
    :term:`TRANSLATED_TARGET_ARCH`
       A sanitized version of :term:`TARGET_ARCH`. This
       variable is used where the architecture is needed in a value where
-- 
2.25.1


