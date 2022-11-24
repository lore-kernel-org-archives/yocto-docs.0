Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F996C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 09:30:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.19874.1669282254208785384
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Nov 2022 01:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ai2aomTr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 332A240002;
	Thu, 24 Nov 2022 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669282252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WGYSnYn5toya/Q+MNcofiqFCDxvzGSnTZXpZtqoM0l4=;
	b=ai2aomTrktEGsDcd7mYv56J7vW0lah55vSL1/6dsR6n+8m49AIZydgnXkH4ZzXLv+SJ95y
	Wo5L5omYM+V/B6eoeSSXN8IDuG7trb4NaIbO+BtLUtV8CAE+8w7RhtH8pA4kfW2KbrwI4P
	8PXWk9/SjJV6gPQ2zLHgH5riU2q3Y0j6bue+bpHQuc5kcwg3WwexcvW7L2jqItGmFK7nrl
	luCsxnlg/kvxpl+IKBqSyPUXLVNxeVK+PfQJWgfpiJswR3ADVHaCGWbkmykI8bD6QNvAnd
	LFS4jwZRkhYfA6+en7aLOT/3aKhlpC4gSft+Wxwxa+6G9F0Ew+Gmfq+oJHVB/Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual/common-tasks.rst: minor correction to SBOM section
Date: Thu, 24 Nov 2022 10:30:44 +0100
Message-Id: <20221124093044.2441254-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Nov 2022 09:30:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3502

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 3ba64e1477..20b57d26f1 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11632,7 +11632,8 @@ each software component are all identified (see
 fixes are applied (see ":ref:`dev-manual/common-tasks:checking
 for vulnerabilities`"), the OpenEmbedded build system can generate
 a description of all the components you used, their licenses, their dependencies,
-the changes that were applied and the known vulnerabilities that were fixed.
+their sources, the changes that were applied to them and the known
+vulnerabilities that were fixed.
 
 This description is generated in the form of a *Software Bill of Materials*
 (:term:`SBOM`), using the :term:`SPDX` standard.
@@ -11665,9 +11666,9 @@ The :ref:`create-spdx <ref-classes-create-spdx>` class offers options to include
 more information in the output :term:`SPDX` data, such as making the generated
 files more human readable (:term:`SPDX_PRETTY`), adding compressed archives of
 the files in the generated target packages (:term:`SPDX_ARCHIVE_PACKAGED`),
-adding a description of the source files handled by the target recipes
-(:term:`SPDX_INCLUDE_SOURCES`) and adding archives of these source files
-themselves (:term:`SPDX_ARCHIVE_SOURCES`).
+adding a description of the source files used to generate host tools and target
+packages (:term:`SPDX_INCLUDE_SOURCES`) and adding archives of these source
+files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
 
 Though the toplevel :term:`SPDX` output is available in
 ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
-- 
2.34.1


