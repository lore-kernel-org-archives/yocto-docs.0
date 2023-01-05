Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A70C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 12:24:31 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.11643.1672921464636520651
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 04:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CPpNCmyt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 98FB9240002;
	Thu,  5 Jan 2023 12:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672921463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ovZibRurTqcPPuiLyjt4yYHn6JtxaZifmgcNM7R60c=;
	b=CPpNCmytE2vOltsUyg7XFzDFVa3j6lXsN9aYrgUFDrEJtfArB5jvL3RJmxE/TPwmf2O2F/
	MqPuMFfoHgM0GEFuCZ9UTjnew4YndOa1ePthLbCpLn/1ITnL9s+u/tm4CVZ9rQp5I60koe
	fTUOWWHYMnAh8lpgzuA48Xeb+Ld12rDzT6z0qR7f1jXUyyicLet/6dtf3ZQilh+c/DAgwN
	5fB4jN/VGzZXmvOVlrN+Y6UHPZtwOm9owi2ntTHscVcWd9NLrZUPPTcmSNFLgk9zv3Kzi2
	uqmNuN5k2ltQdU+B6Fm26qhdGlINZkNy8kyCvQ+5+ZJwjUwZQTVupO7VAYwb2A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH 1/2] [langdale] docs: kernel-dev: faq: update tip on how to not include kernel in image
Date: Thu,  5 Jan 2023 13:24:18 +0100
Message-Id: <20230105122419.59421-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 12:24:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3587

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Since commit f6d963fa6d0e ("kernel: make kernel-base recommend
kernel-image, not depend"), present in Kirkstone 4.0, one should
set RRECOMMENDS and not RDEPENDS to avoid including the kernel in the
image, so let's update the documentation to reflect that.

Reported-by: Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/kernel-dev/faq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index e40e3ff372..76923f6104 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -36,7 +36,7 @@ How do I install/not-install the kernel image on the root filesystem?
 The kernel image (e.g. ``vmlinuz``) is provided by the
 ``kernel-image`` package. Image recipes depend on ``kernel-base``. To
 specify whether or not the kernel image is installed in the generated
-root filesystem, override ``RDEPENDS:${KERNEL_PACKAGE_NAME}-base`` to include or not
+root filesystem, override ``RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base`` to include or not
 include "kernel-image". See the
 ":ref:`dev-manual/common-tasks:appending other layers metadata with your layer`"
 section in the
-- 
2.37.2


