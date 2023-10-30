Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E81C41535
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 17:36:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.155743.1698687394418758354
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Oct 2023 10:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Lvmb7NBc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA6CD1BF20C;
	Mon, 30 Oct 2023 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698687391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZY3xeil4MNLeyd7qJJTmPRzHxJo7RRdoAaxnfByVs58=;
	b=Lvmb7NBc8/iFSbBMAzrd4vz+BdcaRIrMOvrU7axU/cIqRLbdhfx/A22ckDv6fs0pFpAqZ4
	EZRU0CD53qbN6oybYkSeawrD79mkKnRJyGE0G0+zczWWSbmlMJVGtBBnfsYVaz1nO0jrL7
	W9Yk93wCf5VYdYgXaJHyDXvapybjAlLsaJVJCtez9GSmHv5R4ewWL/HfydOpaGwrlgjqYj
	S+GgwJ+d9PtMr3yki1eJ5D1z3lzJBqmeCIOEFQc/XcG4pHYFNQS4BfGmih68JMmmkSFziR
	gsJHXdw7hSQAAVQ/Bz47dxk9QQRY4Umw59fwGdyqxiVECyRwD52TH1cb0WjQSw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables: mention the new CDN for SSTATE_MIRRORS
Date: Mon, 30 Oct 2023 18:36:29 +0100
Message-Id: <20231030173629.1773483-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 30 Oct 2023 17:36:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4526

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3eff516f62..52e3e59588 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8214,6 +8214,16 @@ system and gives an overview of their function and contents.
              file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
              file://.* file:///some-local-dir/sstate/PATH"
 
+      The Yocto Project actually shares the cache data objects built by its
+      autobuilder::
+
+         SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+
+      As such binary artifacts are built for the generic QEMU machines
+      supported by the various Poky releases, they are less likely to be
+      reusable in real projects building binaries optimized for a specific
+      CPU family.
+
    :term:`SSTATE_SCAN_FILES`
       Controls the list of files the OpenEmbedded build system scans for
       hardcoded installation paths. The variable uses a space-separated
-- 
2.34.1


