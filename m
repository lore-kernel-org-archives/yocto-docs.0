Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D10C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 12:41:02 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.31082.1683636054411604653
 for <docs@lists.yoctoproject.org>;
 Tue, 09 May 2023 05:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X7WyaAKg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4CB2DFF80D;
	Tue,  9 May 2023 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683636052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQd3zjJTLqbYMoR0upt7+399Vx9DSPdeVStoAuNLV/c=;
	b=X7WyaAKgnxZkipu6AjFpHwPTQMQutbROh92zQW2+o7PvsxWcjv7HpZtO+YSYcA0SZay1HV
	XmeWaDeooWfEbTD9ZUVD9NBD5K0Mr1CliMDCbD++j8JdLErLWQKEsuOfj44xUqH/Qmvs1E
	UGkAlI3oOLfv93VMcbl7hRUwRwOQayIqddCwUcpw0dXnxnEywJus2Emdadbys10iqbm/UN
	uH5l/7murBvelUlK51uFJ2VzNxm6tJ9lxp6AVJh+2Tkr87Vey0R8Zs3cu3U4RAcMUdm/uI
	hAI1PPBrCUfYoCwyhMFd1ZoJhkIPshIIC4qQDnPDY9XHqppInGsrszHnQf30cg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 3/4] ref-manual: classes: kernel: remove incorrect sentence opening
Date: Tue,  9 May 2023 14:40:37 +0200
Message-Id: <20230509124038.2265185-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509124038.2265185-1-michael.opdenacker@bootlin.com>
References: <20230509124038.2265185-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 May 2023 12:41:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3926

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

"This means that" implies that this sentence is a consequence of the
previous, but this is not the case, the two sentences being quite unrelated
to each other.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a78368b380..de2d97de30 100644
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


