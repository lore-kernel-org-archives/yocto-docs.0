Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6239EC6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.587.1663955629896811685
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iiKum+Gz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 94BB9C0003;
	Fri, 23 Sep 2022 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZJzs5jAvGC6wM5sVVJE8sPxsNtfWVMduvdfvzuT4QM=;
	b=iiKum+Gzt/lKOicYZUAgy/lv9UpxbYPDfTnhyBbjZshdjZJTcqc8QwLYu+7T04HuBlMQ3K
	ukV7PAUiZPKLCzFfYgQlUu53eZa355PXu1DhZn5dMQ5zztm+TMeqGRymuBEZ7tdcz7STX2
	mdzm9VMT5V9eX3RYj5Jxhsc7ojgih+M+fSe5qXi8PlXfXmVYljoY5fjwJRvcFjeIP3WvCh
	SHSiJ8xobCfj51X7kL4cqowhDFJYAXCwTtaJ81FioaSYUtSz3kYWOyr79EDRq+8UYmtDbC
	P+tE4AISjcf/M+06PdDSjMJnIKWAzIefRcrFiT1t0bYYI76EYuVnIwxL/vCuXw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 23/30] manuals: add references to the "do_bundle_initramfs"
 task
Date: Fri, 23 Sep 2022 19:52:12 +0200
Message-Id: <20220923175219.6652-24-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3238

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 documentation/ref-manual/variables.rst    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 8b77568d83..b20b9f374b 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3995,7 +3995,7 @@ To achieve this, you need to perform some additional steps:
    buildsystem know where the :term:`INITRAMFS_IMAGE` will be located.
 
    Building a system with such configuration will build the kernel using the
-   main configuration but the ``do_bundle_initramfs`` task will grab the
+   main configuration but the :ref:`ref-tasks-bundle_initramfs` task will grab the
    selected :term:`INITRAMFS_IMAGE` from :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
    instead, resulting in a musl based initramfs image bundled in the kernel
    but a glibc based main image.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 79c64dc97a..afe789ff57 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3633,7 +3633,7 @@ system and gives an overview of their function and contents.
          needed for the build that are not strippable.
 
    :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
-      Indicates the deploy directory used by ``do_bundle_initramfs`` where the
+      Indicates the deploy directory used by :ref:`ref-tasks-bundle_initramfs` where the
       :term:`INITRAMFS_IMAGE` will be fetched from.
       This variable is set by default to ``${DEPLOY_DIR_IMAGE}`` in the
       :ref:`kernel <ref-classes-kernel>` class and it's only meant to be changed
-- 
2.34.1


