Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E298C77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 09:10:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.22692.1683277818230874677
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 02:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LyooC7OP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 050E01BF206;
	Fri,  5 May 2023 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683277816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kGLyHEjLxjyePfll8bflW6rmiPJPSSSSTbdw4qseChs=;
	b=LyooC7OPjGQ1Jo7IM7c5M50T19H5dEJE4toch0VbA4mwA4DHWqNH6IEYrL8McpHiqMFZlm
	goL19F4E0eY/hraUvgDroWTnKRFhiTe3a1wuUvw06VuPRa+WQYU8R3SRmTh94i2vWlRYjC
	kLMKA/bAx84ipJsVgGKHOv/20IPLCaH9oNkPtRASIXgM5pg8w2E1+xZO8pKf1ivp+ZYKbT
	5J7+6XEEg1aOMHyps2kxvix8R9CrHMAc9xM/ClhHKZtCO8bi3EG4BdZ47KsfhGBNStzcti
	6/9hueEmW6jWmtftgPtAO6mk/bGev8QGOxpg8Xa4RpnJSxZlQ9j91gfNaekmPQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 1/2] ref-manual: classes: kernel: remove incorrect sentence opening
Date: Fri,  5 May 2023 11:10:05 +0200
Message-Id: <20230505091006.1888595-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 09:10:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3911

"This means that" implies that this sentence is a consequence of the
previous, but this is not the case, the two sentences being quite unrelated
to each other.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 documentation/ref-manual/classes.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a78368b380f6..de2d97de3038 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1532,11 +1532,11 @@ code to build all kernel trees. All needed headers are staged into the
 :term:`STAGING_KERNEL_DIR` directory to allow out-of-tree module builds
 using the :ref:`ref-classes-module` class.
 
-This means that each built kernel module is packaged separately and
-inter-module dependencies are created by parsing the ``modinfo`` output.
-If all modules are required, then installing the ``kernel-modules``
-package installs all packages with modules and various other kernel
-packages such as ``kernel-vmlinux``.
+Each built kernel module is packaged separately and inter-module
+dependencies are created by parsing the ``modinfo`` output.  If all modules
+are required, then installing the ``kernel-modules`` package installs all
+packages with modules and various other kernel packages such as
+``kernel-vmlinux``.
 
 The :ref:`ref-classes-kernel` class contains logic that allows you to embed an initial
 RAM filesystem (:term:`Initramfs`) image when you build the kernel image. For
-- 
2.34.1


