Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4755C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 13:59:58 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.42026.1656338387793281431
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 06:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q1WyF+EB;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D8A37240008;
	Mon, 27 Jun 2022 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656338386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O3TUVP47GBna8rI2TN6Lj3ofbRi8sZr/BAK/9hgqqAY=;
	b=Q1WyF+EBx578YUCrQXeBxgNifvsrtYGLaY7YcXGmq8zreA2UM0gxM5QgUfpOYEVq+UzM5a
	F399dVkrLIUG14YEwzRu8jGibSUFKWJUeQOiHsQ1yxpIXE7eGoDo8AkOXwHEnoGMWuZHVj
	EdtTAEECo1Qyt9U6En0MpFUHvYIVqVikokWTgFPOp/1afC4vbmMZuqJxM920TLd3jMfOUT
	acARsDlJljrMBj27LGaM351Ij5Z9zl4HygRlItL+F6unu8uM2Hqr0f3Z1uWeycJ3v9ZarJ
	uoKM85RVtPw0DMJ07k0LmHd6zVXMlyf5UlmPqQacxl4/gO/jG2TpoyoqwW7aLA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [dunfell] manuals: switch to the sstate mirror shared between
 all versions
Date: Mon, 27 Jun 2022 15:59:43 +0200
Message-Id: <20220627135943.1626963-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jun 2022 13:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3034

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Following https://git.yoctoproject.org/poky/commit/?id=cf7d8894545b83f55420fa33f7848e1bfc6754ff

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../brief-yoctoprojectqs/brief-yoctoprojectqs.rst | 15 +++------------
 .../overview-manual/overview-manual-concepts.rst  |  4 +---
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index c9622d3647..6a44511af2 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -222,19 +222,10 @@ an entire Linux distribution, including the toolchain, from source.
    .. tip::
 
       You can significantly speed up your build and guard against fetcher
-      failures by using mirrors. To use mirrors, add these lines to your
-      local.conf file in the Build directory: ::
+      failures by using mirrors. To use mirrors, add this line to your
+      ``local.conf`` file in the :term:`Build Directory`: ::
 
-         SSTATE_MIRRORS = "\
-         file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
-         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
-         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH \n \
-         "
-
-
-      The previous examples showed how to add sstate paths for Yocto Project
-      &YOCTO_DOC_VERSION_MINUS_ONE;, &YOCTO_DOC_VERSION;, and a development
-      area. For a complete index of sstate locations, see http://sstate.yoctoproject.org/.
+         SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index d9f50e5194..3401f534b1 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -1986,9 +1986,7 @@ Behind the scenes, the shared state code works by looking in
 shared state files. Here is an example:
 ::
 
-   SSTATE_MIRRORS ?= "\
-       file://.\* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
-       file://.\* file:///some/local/dir/sstate/PATH"
+   SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 .. note::
 
-- 
2.34.1


