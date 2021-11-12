Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5997CC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 15:04:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.16946.1636729478876660101
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 07:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 19615240006;
	Fri, 12 Nov 2021 15:04:36 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: BBFILES_DYNAMIC - fix punctuation and quoting
 issues
Date: Fri, 12 Nov 2021 16:04:35 +0100
Message-Id: <20211112150435.173506-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 15:04:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2137

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3bf600ca9e..d8907f1c59 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -641,8 +641,10 @@ system and gives an overview of their function and contents.
       introduce a hard dependency on those other layers.
 
       Use the following form for :term:`BBFILES_DYNAMIC`:
-      collection_name:filename_pattern The following example identifies two
-      collection names and two filename patterns::
+      ``collection_name:filename_pattern``.
+
+      The following example identifies two collection names and two
+      filename patterns::
 
          BBFILES_DYNAMIC += " \
             clang-layer:${LAYERDIR}/bbappends/meta-clang/*/*/*.bbappend \
-- 
2.25.1


