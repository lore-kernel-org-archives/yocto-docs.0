Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC78C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 12:24:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.11461.1672921466290238530
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 04:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NFopXTib;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 51FA04000C;
	Thu,  5 Jan 2023 12:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672921464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMU2oI4wRWNroUGbKFih+BSwyFYrWhCe/xBlZsfzbKw=;
	b=NFopXTibRAwRwkbdtzlTfKL2ah5i/nR4frDmp94Ox3zLC5cvKO50hwgwsZNgShavUsH2nz
	KTYCTYgG0VtaG1hErDgAsZgnBtnS7Vr1r+RzfsfVzGPO2k++VCVPp2jfI5EAC5sN/bdq/Q
	n0YNb2EwZ+g1dZeo7LSe0++aGEJ7h1tBb+nf2xbweFJGpl7t6FKBrcutogyWPIDQTI3ZHx
	4YteoACtGbgIjHgFE5APeDA9PjAEfC8NbBKCjWdFEuON+D9MVY6dQ4EnJ9NC2sZcas9mtN
	ZnkVH5spnNtUhMyJWW8gmUJOgitgLb2s7r+3CqRlBGheE5BYEuAXyo8AZxZTHw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH 2/2] [langdale] docs: migration-4.0: specify variable name change for kernel inclusion in image recipe
Date: Thu,  5 Jan 2023 13:24:19 +0100
Message-Id: <20230105122419.59421-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230105122419.59421-1-michael.opdenacker@bootlin.com>
References: <20230105122419.59421-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 12:24:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3588

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
 documentation/migration-guides/migration-4.0.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 02d3c3e2bd..ab82280f5e 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -265,3 +265,6 @@ Miscellaneous changes
   when parsing recipes. Any code depending on the previous behaviour will no longer
   work - change any such code to explicitly use appropriate path variables instead.
 
+- In order to exclude the kernel image from the image rootfs,
+  :term:`RRECOMMENDS`\ ``:${KERNEL_PACKAGE_NAME}-base`` should be set instead of
+  :term:`RDEPENDS`\ ``:${KERNEL_PACKAGE_NAME}-base``.
-- 
2.37.2


