Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40982C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 09:10:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.22693.1683277819000279782
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 02:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m2Q6D1mc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 446951BF212;
	Fri,  5 May 2023 09:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683277817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KqKZHmkfthl+718ofik04cG4pwfT4X2angg/mvTPK7A=;
	b=m2Q6D1mcre6HQ+1rPB3RXgQ2nuZm+kmDDl78ykIviIIXakZQ+T+6ojm9sB4ntKTiVamJA0
	mIULgUii84dCnuU6x6QxjFwH/0j+YwhS/fiti6uN8GDPa7Hyc5dnyPp6rLoOBxh0dy2klF
	cA7NATASPC40skLj11IQ95ByglyosEnjgn+d5ryW81+R97FRPPWi5hNmW6/VrWmTktcX8z
	n4/P7ltMDSQnZgTm8CmJ4dNvBxgHYBpY1qQg0bb43tYgDsmLpoWD5hJ15PYkiyFwPmni6J
	P9xzDznmWq9Z3nks5hd+khVPCh92A1YmJST7twALtaDXlo08xEeV7h/N5vPRWA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 2/2] ref-manual: classes: kernel: document automatic defconfig usage
Date: Fri,  5 May 2023 11:10:06 +0200
Message-Id: <20230505091006.1888595-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505091006.1888595-1-luca.ceresoli@bootlin.com>
References: <20230505091006.1888595-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 09:10:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3912

Since a very long time the kernel bbclass uses a defconfig file from
SRC_URI automatically. Document this feature.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 documentation/ref-manual/classes.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index de2d97de3038..8f7cbf2b456e 100644
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


