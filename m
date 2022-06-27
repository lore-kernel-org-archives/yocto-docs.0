Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9EAC43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 14:11:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.42250.1656339082891539213
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 07:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ototJys4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0482D1BF217;
	Mon, 27 Jun 2022 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656339081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bB9aJRhgUtTyGjTVAos55dcA2OEH+JxEykh4VmdKLoQ=;
	b=ototJys44oZmWa3oCfyqhzpnM9xIzOhXlAtpgWbsz59WhBx77CDjSG0Rs73xRwe6PN3Kxn
	AaXCU2aZ5mR+Wk6EH4SYsQDDT9WB9e7394wu73Z1O0p6gb7kC4hGTwaaQCME/wEanZ1OO1
	f2L22Ior4MCaojBmBq3NTFR5OhN+2aXaGeW1IsHPY9WsTLFeYX0PzTcSVmbb59qPvHCdZQ
	Twy1q2BFNLXaGP5IWeGMJje4uRDNCNiF08eXeyNdDiC2LLs408LykofJBxqYW5FZ/Ou+u1
	HWjdDUBdl2CqYgBOTFhbKEWDR0MQlC8nmeQH6EOpW9LjFbXwqQc86HmYnneeVw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [kirkstone] manuals: switch to the sstate mirror shared
 between all versions
Date: Mon, 27 Jun 2022 16:11:19 +0200
Message-Id: <20220627141119.1627926-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jun 2022 14:11:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3035

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Following https://git.yoctoproject.org/poky/commit/?id=cf7d8894545b83f55420fa33f7848e1bfc6754ff

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst         | 7 +------
 documentation/migration-guides/release-notes-4.0.rst | 2 +-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 12cab1db76..7ba05c78a0 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -256,12 +256,7 @@ an entire Linux distribution, including the toolchain, from source.
          BB_SIGNATURE_HANDLER = "OEEquivHash"
          BB_HASHSERVE = "auto"
          BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
-         SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
-
-      The above settings assumed the use of Yocto Project &YOCTO_DOC_VERSION;.
-      If you are using the development version instead, set :term:`SSTATE_MIRRORS` as follows::
-
-         SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
+         SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index eaa40f9317..4bf680db5d 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -23,7 +23,7 @@ New Features / Enhancements in 4.0
      BB_SIGNATURE_HANDLER = "OEEquivHash"
      BB_HASHSERVE = "auto"
      BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
-     SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
+     SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 - The Python package build process is now based on `wheels <https://pythonwheels.com/>`__
   in line with the upstream direction.
-- 
2.34.1


