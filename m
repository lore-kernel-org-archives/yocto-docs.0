Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BBAC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 17:17:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.13346.1639675069252580213
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 09:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 770DE4000F;
	Thu, 16 Dec 2021 17:17:47 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] quick start manual: update Share State and Hash Equivalence
 settings
Date: Thu, 16 Dec 2021 18:17:45 +0100
Message-Id: <20211216171745.8637-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 17:17:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2291

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 25 ++++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index c0419531e2..99ac29a77e 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -244,19 +244,24 @@ an entire Linux distribution, including the toolchain, from source.
    .. tip::
 
       You can significantly speed up your build and guard against fetcher
-      failures by using mirrors. To use mirrors, add these lines to your
-      local.conf file in the Build directory::
+      failures by using :ref:`overview-manual/concepts:shared state` cache
+      mirrors and enabling :ref:`overview-manual/concepts:hash equivalence`.
+      This way, you can use pre-built artifacts rather than building them.
+      This is relevant only when your network and the server that you use
+      can download these artifacts faster than you would be able to build them.
 
-         SSTATE_MIRRORS = "\
-         file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
-         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
-         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH \n \
-         "
+      To use such mirrors, uncomment the below lines in your ``local.conf``
+      file in the :term:`Build Directory`::
 
+         BB_SIGNATURE_HANDLER = "OEEquivHash"
+         BB_HASHSERVE = "auto"
+         BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
+         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
 
-      The previous examples showed how to add sstate paths for Yocto Project
-      &YOCTO_DOC_VERSION_MINUS_ONE;, &YOCTO_DOC_VERSION;, and a development
-      area. For a complete index of sstate locations, see :yocto_sstate:`/`.
+      The above settings assumed the use of Yocto Project &YOCTO_DOC_VERSION.
+      If you are using the development version instead, set :term:`SSTATE_MIRRORS` as follows::
+
+         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
 
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
-- 
2.25.1


