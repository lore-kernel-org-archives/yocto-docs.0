Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3827DC433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 09:44:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.9306.1633599886750236492
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 02:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0C798C000E;
	Thu,  7 Oct 2021 09:44:44 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: introduce 'yocto_sstate' extlink
Date: Thu,  7 Oct 2021 11:44:38 +0200
Message-Id: <20211007094438.989124-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 09:44:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1941

---

I agree it's not profitable yet, but it may be as documentation grows

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 documentation/conf.py                        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 74167befad..666fe4c4ac 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -256,7 +256,7 @@ an entire Linux distribution, including the toolchain, from source.
 
       The previous examples showed how to add sstate paths for Yocto Project
       &YOCTO_DOC_VERSION_MINUS_ONE;, &YOCTO_DOC_VERSION;, and a development
-      area. For a complete index of sstate locations, see http://sstate.yoctoproject.org/.
+      area. For a complete index of sstate locations, see :yocto_sstate:`/`.
 
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
diff --git a/documentation/conf.py b/documentation/conf.py
index 8e15fdc869..4c3487dabf 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -79,6 +79,7 @@ extlinks = {
     'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
     'yocto_docs': ('https://docs.yoctoproject.org%s', None),
     'yocto_git': ('https://git.yoctoproject.org/cgit/cgit.cgi%s', None),
+    'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
     'oe_git': ('https://git.openembedded.org%s', None),
-- 
2.25.1


