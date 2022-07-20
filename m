Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90340C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 09:04:45 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.51785.1658307877542023677
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 02:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c0T2sr8a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 842AB20008;
	Wed, 20 Jul 2022 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658307875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVMS+zTe7V7BLmaVYxPFM2RZ9C/NFVs2DH/Du/1RLPA=;
	b=c0T2sr8a86OxYxbHpzhhM+iI2yFoKucJwppF9QwrrzKcoHSBf3sqeJzjnG+1YeoKzCSBPy
	ve84noZzPOw4uOiS5ffYiQWrLvYimV87dYK9TkCpsxoaCV5DUChJd+lTpDgJLYQsm5I/1J
	Wg979pZNEWO8je7orctBGfP5wuMvLWQicH/8sTV1nfRXEADL6c7d0+gV9mnrEBBDhRN/VT
	GXD7QOrZf0hPU4xXUiU38K+IWyaQrhSp5J7wQl441/aAG+6y30u6G5ueUEcVBoExo8Scnm
	9FhypOWvuBSz1NDDovjOgPbV01V/gMl9IUuw8MG1Uo1UFWSPhKjdmRv7V1ricw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] [kirkstone] docs: BB_HASHSERVE_UPSTREAM: update to new
 host
Date: Wed, 20 Jul 2022 11:04:33 +0200
Message-Id: <20220720090433.542726-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <17037D9816BDE87B.9127@lists.yoctoproject.org>
References: <17037D9816BDE87B.9127@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Jul 2022 09:04:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3075

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---

 Changes in V2:
 * Add missing "[kirkstone]" to the commit title
---
 documentation/brief-yoctoprojectqs/index.rst         | 2 +-
 documentation/migration-guides/release-notes-4.0.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7ba05c78a0..a982eae207 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -255,7 +255,7 @@ an entire Linux distribution, including the toolchain, from source.
 
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


