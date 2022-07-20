Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA00C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.51513.1658306750230647973
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 01:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fISs3QJn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 32FDD24000B;
	Wed, 20 Jul 2022 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658306748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cupw7CigtG+A0npENW9olaLV3603t3QUkxZLE3o3liU=;
	b=fISs3QJnbWl110TE6Z8C6y16W7hiDuFUteZg0gVJnQeI8TmYi8azUpRw/NSSIreZeCDHSX
	2MmIjhOOZkDpuslB+MDqMiIwmJRnc9DamEUkICeKWKFk77RB7rqe7aGLxlQj66UcGvtApL
	h8QAKZEGH/kLJu1FXosFdg8r2ZjoD55EAK38pXdvI33qPOBmKbqEpqACLzaum/G//jUj0d
	ES4c+KGyQR3W7J254N5o6mqkbF09QYlE9hNDH6jh0I4q1F4PslUUS9ee58uyG2bIFABBax
	gYtwvU1BBpZ58Dk/nAoAmUVh8Snwv2MGpMKSirZ8gFbYicavUzSAjAhJ3qem1g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: BB_HASHSERVE_UPSTREAM update to new host
Date: Wed, 20 Jul 2022 10:45:45 +0200
Message-Id: <20220720084545.540595-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Jul 2022 08:45:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3073

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst         | 2 +-
 documentation/migration-guides/release-notes-4.0.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 3cf2f76f55..7ae0ddc349 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -256,7 +256,7 @@ an entire Linux distribution, including the toolchain, from source.
 
          BB_SIGNATURE_HANDLER = "OEEquivHash"
          BB_HASHSERVE = "auto"
-         BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
+         BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
          SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 #. **Start the Build:** Continue with the following command to build an OS
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 4bf680db5d..b675cae217 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -22,7 +22,7 @@ New Features / Enhancements in 4.0
 
      BB_SIGNATURE_HANDLER = "OEEquivHash"
      BB_HASHSERVE = "auto"
-     BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
+     BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
      SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 - The Python package build process is now based on `wheels <https://pythonwheels.com/>`__
-- 
2.34.1


