Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FD2C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 10:22:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9748.1672914146000978457
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 02:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m05Th5e3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DECCA1BF214;
	Thu,  5 Jan 2023 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672914143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5X36GtbVpRCEdOgi4MDXI1RNe/CotMXuRcds6qmoZqw=;
	b=m05Th5e3LjEDyl0w5A+S0DjihvrxYHd2FuUKQpd2HDbbmsNiKF/KTQmkCPhI4NebACmY3L
	uLC57e5HvRc3NxXzicQiO+YMOCBWPmdHbN1DKILG+wuBfjaWBhs+tuHnJBaUyJ5kzOFctc
	S59tPnqpRovRdbJTmMzVgNEkjPzhv7kaKdXuL/vXpm6wsL+J6Gvehht45sUachGK2NQznm
	3UlUNuOxAPqjuQ/JwC54Vdm7OYFwCd1aXT1ri3eo3gfWQbje7vDTA5Sl4PIhnDgfj4g/jH
	oqTZbKwQHlCIROgnpP394K4fTnfaSCEYe6UPN86vC7HT2fxupri5v8Jq0Hu+Pg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH 1/2] [kirstone] docs: migration-4.0: specify variable name change for kernel inclusion in image recipe
Date: Thu,  5 Jan 2023 11:21:54 +0100
Message-Id: <20230105102155.55177-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 10:22:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3584

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
index a8e6b4c331..fc801144b1 100644
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


