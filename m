Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A532C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 09:20:21 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.5123.1655889612396576058
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 02:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZSk4oNKV;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5AF20100004;
	Wed, 22 Jun 2022 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655889610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rNyb4NwqWF9qe05eMBSxHGJ68IEM2FOTs5t2GQhLGuQ=;
	b=ZSk4oNKVQNU1Wf64PyrHqP+LZhg5eZfYfzUr3uNYtM3DpNTJYhj8Niq8wXik3CcGtU4N2F
	0ugeY3DhAzzROZT7IGWwR6PI4yIcy2cHzGxPl8FtJkgzJeKb0kGgtsEiHtmcL9A+LC4DWq
	IoshoqKLV8CumZQPIEALvxldGxl6PKtHvD+fihMlSu8XakvFGOGQDwmIXX05zdsSDvpWaX
	Q2o+ffkIdraRNGHjNeQ6JcCavUfJOLAxbDQyFiMQtfL4g3I1LgttyV2VNh+qkQnMbTEhs2
	rxlrClycFTq9Yzv/4Z8sIlMnawPPDbyb+by1QrgEasM6J2n9F2YENbArLgq6lA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: switch to the sstate mirror shared between all
 versions
Date: Wed, 22 Jun 2022 11:20:07 +0200
Message-Id: <20220622092007.2691103-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jun 2022 09:20:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3018

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Following https://git.yoctoproject.org/poky/commit/?id=cf7d8894545b83f55420fa33f7848e1bfc6754ff

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst         | 7 +------
 documentation/migration-guides/release-notes-4.0.rst | 2 +-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 4d5ac85e61..3cf2f76f55 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -257,12 +257,7 @@ an entire Linux distribution, including the toolchain, from source.
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


