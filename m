Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B80C46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 17:36:42 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.70437.1672767394656696430
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 09:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 2573CC000C;
	Tue,  3 Jan 2023 17:36:31 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>
Subject: [PATCH 1/2] docs: kernel-dev: faq: update tip on how to not include kernel in image
Date: Tue,  3 Jan 2023 18:36:10 +0100
Message-Id: <20230103-no-kernel-rootfs-v1-1-33f7abb94410@theobroma-systems.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103-no-kernel-rootfs-v1-0-33f7abb94410@theobroma-systems.com>
References: <20230103-no-kernel-rootfs-v1-0-33f7abb94410@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Jan 2023 17:36:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3574

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Since commit f6d963fa6d0e ("kernel: make kernel-base recommend
kernel-image, not depend"), present in Kirkstone 4.0, one should
set RRECOMMENDS and not RDEPENDS to avoid including the kernel in the
image, so let's update the documentation to reflect that.

Reported-by: Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/kernel-dev/faq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index ceb5dda3f..4dffa90db 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -36,7 +36,7 @@ How do I install/not-install the kernel image on the root filesystem?
 The kernel image (e.g. ``vmlinuz``) is provided by the
 ``kernel-image`` package. Image recipes depend on ``kernel-base``. To
 specify whether or not the kernel image is installed in the generated
-root filesystem, override ``RDEPENDS:${KERNEL_PACKAGE_NAME}-base`` to include or not
+root filesystem, override ``RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base`` to include or not
 include "kernel-image". See the
 ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
 section in the

-- 
b4 0.10.1

