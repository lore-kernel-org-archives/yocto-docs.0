Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650B3C7EE24
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 12:41:02 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.31189.1683636055741074439
 for <docs@lists.yoctoproject.org>;
 Tue, 09 May 2023 05:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UthxJMYV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D0C30E0009;
	Tue,  9 May 2023 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683636054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wj5IdP2cEA2/sC4hsghWI6I7Fsm1yS95ZKSVyyEm8fE=;
	b=UthxJMYVmK8fxKy8MfjuokI3T6oS5NQlC57Kg6lADTmZ4pLXLmNLC9MnZIDpBjgkD/tdE6
	IhFS6Lrr6o/47XHfwhBTUz2AXEZ/aFtfrJiCd2nY1GNvmvH/+JLIinnJOtxuiXit7aIb4Y
	NBADSfgf6/U6O6Ryf4VU0rkjW2Td06A9OfrRZcJGSJc4zvKAhbWHiujMnD/cykj9lFRhuB
	N+vNp6Ho/hd0v4zOQuV1pCFtnWH44w98M4pAdyQbXn9uvMUyIeP9aGAG6fhfv9QRbvBlmi
	DyliijJuRkZdpnG8KfAfqL0HxbAmDvdnj6/1sdT3YN9ZRGNEbq2iwehUWLHyGg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 4/4] ref-manual: classes: kernel: document automatic defconfig usage
Date: Tue,  9 May 2023 14:40:38 +0200
Message-Id: <20230509124038.2265185-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509124038.2265185-1-michael.opdenacker@bootlin.com>
References: <20230509124038.2265185-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 May 2023 12:41:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3927

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Since a very long time the kernel bbclass uses a defconfig file from
SRC_URI automatically. Document this feature.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index de2d97de30..8f7cbf2b45 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1532,6 +1532,13 @@ code to build all kernel trees. All needed headers are staged into the
 :term:`STAGING_KERNEL_DIR` directory to allow out-of-tree module builds
 using the :ref:`ref-classes-module` class.
 
+If a file named ``defconfig`` is listed in :term:`SRC_URI`, then by default
+:ref:`ref-tasks-configure` copies it as ``.config`` in the build directory,
+so it is automatically used as the kernel configuration for the build. This
+copy is not performed in case ``.config`` already exists there: this allows
+recipes to produce a configuration by other means in
+``do_configure:prepend``.
+
 Each built kernel module is packaged separately and inter-module
 dependencies are created by parsing the ``modinfo`` output.  If all modules
 are required, then installing the ``kernel-modules`` package installs all
-- 
2.34.1


