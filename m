Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00E6C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 16:10:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10987.1698423029257396986
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 09:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AXViMMyd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8F64240009;
	Fri, 27 Oct 2023 16:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698423026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mlUD/CyCNcpYfFdx4OUpZSFHKpV4iaVuyF8CnSZP5sY=;
	b=AXViMMydUNR7bW/NvOl4cDBLymO+W77NXp568hRnhlh5iMzgBkR7vWTx2Ze+XsDxRfQG91
	eRT/nOixVi6AYbWCArRvyomk8jKOhq5dkKpRWvSsygEPzTYyhEG4w0sLW83Q+2omnnmQvJ
	en0kn7+4+X4hgT2o0nROTPVPDQpp2wJKzTshcXKRW/Vr0LzoYO4vJzak9UQYd0T8ZmatXT
	4Am0PmK+EJrMd9zMC31+36SNYn9pZTU2GmchXJV4vvKKQI7V/QXblljgOAWtjkxaLk9BO4
	gPiYlyqs7B1POj3lhQuESsAK8dbq0f8aONP3gdoISRfvkCW9EilE41TYpr9WdA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables: document new KERNEL_STRIP variable
Date: Fri, 27 Oct 2023 18:10:22 +0200
Message-Id: <20231027161022.1632536-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 16:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4520

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index dc5286c896..ef4d6a0534 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4753,6 +4753,10 @@ system and gives an overview of their function and contents.
       to the :term:`KERNEL_SRC` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
+   :term:`KERNEL_STRIP`
+      Allows to specific which ``strip`` command to use to strip the kernel
+      binary, typically either GNU binutils ``strip`` or ``llvm-strip``.
+
    :term:`KERNEL_VERSION`
       Specifies the version of the kernel as extracted from ``version.h``
       or ``utsrelease.h`` within the kernel sources. Effects of setting
-- 
2.34.1


