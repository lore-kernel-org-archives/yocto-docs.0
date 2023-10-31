Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F920C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:39:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.182573.1698745141170159559
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 02:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IULMsoBj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F871E0009;
	Tue, 31 Oct 2023 09:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698745139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzdTmF1NZxvmVW3HNLxQtIkxYENjYd+QBBxvTnmcpYU=;
	b=IULMsoBjtQWjKLBh5N+7VjQPNT69dUCcSC2XIY4nwGVA8vGoJxOM01/xlhG5T0ByGZWb7Q
	Np04e1eAS7wWpEn3c2D2nlyGrqcboX3cSJQYZWHOBokR67jV20xRHPxlG7mMJzh7wGdYUp
	Yl0cqlH7vGsWL081TCLpjVAT26IjlR6CfWBVUWCGCVERlEZvXjjk17roAs7X0yWm/5Z2EQ
	kjbS7eMeE+RSKE5wOnAFGPvcWquhec5KJMMBXh0utG8ZEHJ650DsYDndEtXAqqahN9Xm2u
	zX0J0R/rBy65PEoHIdDUsJui1DL4v8VaBk3fDUCpQ00xRR7b4iNxM270kvTk2g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 1/3] manuals: correct "yocto-linux" by "linux-yocto"
Date: Tue, 31 Oct 2023 10:38:52 +0100
Message-Id: <20231031093854.1792471-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031093854.1792471-1-michael.opdenacker@bootlin.com>
References: <20231031093854.1792471-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:39:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4535

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst     | 2 +-
 documentation/kernel-dev/common.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index a32555b110..4cc53f091c 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1180,7 +1180,7 @@ Use these steps to create a BSP layer:
 
 -  *Create a Kernel Recipe:* Create a kernel recipe in
    ``recipes-kernel/linux`` by either using a kernel append file or a
-   new custom kernel recipe file (e.g. ``yocto-linux_4.12.bb``). The BSP
+   new custom kernel recipe file (e.g. ``linux-yocto_4.12.bb``). The BSP
    layers mentioned in the previous step also contain different kernel
    examples. See the ":ref:`kernel-dev/common:modifying an existing recipe`"
    section in the Yocto Project Linux Kernel Development Manual for
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 1d85202df4..35c11848cb 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1005,7 +1005,7 @@ Section.
       the following sequence of commands::
 
               $ cd poky/build
-              $ bitbake -c cleanall yocto-linux
+              $ bitbake -c cleanall linux-yocto
               $ bitbake core-image-minimal -c cleanall
               $ bitbake core-image-minimal
               $ runqemu qemux86
-- 
2.34.1


