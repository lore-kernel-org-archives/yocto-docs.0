Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152E3C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 13:47:56 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.15744.1636724875290430876
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 05:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D116C240005;
	Fri, 12 Nov 2021 13:47:53 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/4] documentation: prepare for 3.1.12 release
Date: Fri, 12 Nov 2021 14:47:40 +0100
Message-Id: <20211112134741.170835-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112134741.170835-1-michael.opdenacker@bootlin.com>
References: <20211112134741.170835-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 13:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2133

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 529d00e70e..03545f487d 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -45,6 +45,7 @@ Release Series 3.1 (dunfell)
 - :yocto_docs:`3.1.9 Documentation </3.1.9>`
 - :yocto_docs:`3.1.10 Documentation </3.1.10>`
 - :yocto_docs:`3.1.11 Documentation </3.1.11>`
+- :yocto_docs:`3.1.12 Documentation </3.1.12>`
 
 ==========================
  Outdated Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 6038dbb5a7..26153b4e2b 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -6,7 +6,7 @@
     '3.4': '3.4',
     '3.3.3': '3.3.3',
     '3.2.4': '3.2.4',
-    '3.1.11': '3.1.11',
+    '3.1.12': '3.1.12',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.25.1


