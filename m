Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46BDC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 20:41:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.3616.1637786461909686270
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 12:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 274011C000A;
	Wed, 24 Nov 2021 20:40:59 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [honister]: updates for release 3.3.4
Date: Wed, 24 Nov 2021 21:40:36 +0100
Message-Id: <20211124204036.2093585-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 20:41:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2198

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/poky.yaml                  | 2 +-
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index f2d1e8b97f..392e3bd63b 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -4,7 +4,7 @@ DISTRO_NAME : "Honister"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.4"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.3.3"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.3.4"
 DISTRO_REL_TAG : "yocto-3.4"
 POKYVERSION : "26.0.0"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index d5a2d2aa80..a6c9a47b86 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -12,6 +12,7 @@ Release Series 3.3 (hardknott)
 - :yocto_docs:`3.3.1 Documentation </3.3.1>`
 - :yocto_docs:`3.3.2 Documentation </3.3.2>`
 - :yocto_docs:`3.3.3 Documentation </3.3.3>`
+- :yocto_docs:`3.3.4 Documentation </3.3.4>`
 
 ****************************
 Release Series 3.1 (dunfell)
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 6038dbb5a7..b15f5b3c1b 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -4,7 +4,7 @@
   var all_versions = {
     'dev': 'dev (3.5)',
     '3.4': '3.4',
-    '3.3.3': '3.3.3',
+    '3.3.4': '3.3.4',
     '3.2.4': '3.2.4',
     '3.1.11': '3.1.11',
     '3.0.4': '3.0.4',
-- 
2.25.1


