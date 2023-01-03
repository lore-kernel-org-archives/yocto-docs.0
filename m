Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99B0C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 17:36:42 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.70439.1672767396108468864
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 09:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 863AAC000E;
	Tue,  3 Jan 2023 17:36:33 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>
Subject: [PATCH 2/2] docs: migration-guides: migration-4.0: specify variable name change for kernel inclusion in image recipe
Date: Tue,  3 Jan 2023 18:36:11 +0100
Message-Id: <20230103-no-kernel-rootfs-v1-2-33f7abb94410@theobroma-systems.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3575

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Since commit f6d963fa6d0e ("kernel: make kernel-base recommend
kernel-image, not depend"), present in Kirkstone 4.0, one should
set RRECOMMENDS and not RDEPENDS to avoid including the kernel in the
image, so let's update the documentation to reflect that.

Reported-by: Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/migration-guides/migration-4.0.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index e11809b49..dd840f2bb 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -267,3 +267,6 @@ Miscellaneous changes
   when parsing recipes. Any code depending on the previous behaviour will no longer
   work - change any such code to explicitly use appropriate path variables instead.
 
+- In order to exclude the kernel image from the image rootfs,
+  :term:`RRECOMMENDS`\ ``:${KERNEL_PACKAGE_NAME}-base`` should be set instead of
+  :term:`RDEPENDS`\ ``:${KERNEL_PACKAGE_NAME}-base``.

-- 
b4 0.10.1

