Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E4BC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 08:45:04 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.9036.1633509899915834801
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 01:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 25193240006;
	Wed,  6 Oct 2021 08:44:57 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: warn about license compliance issues when static
 libraries are used
Date: Wed,  6 Oct 2021 10:44:55 +0200
Message-Id: <20211006084455.953350-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 08:45:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1922

This partly addresses [YOCTO #14407]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b81f51bf83..2c862dc1be 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11158,6 +11158,23 @@ this function, you have to follow the following steps:
 For more usage information refer to :yocto_git:`the meta-spdxscanner repository
 </meta-spdxscanner/>`.
 
+Compliance Limitations with Executables Built from Static Libraries
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When package A is added to an image (``RDEPENDS += "A"``), and depends on
+a static linked library package B (``DEPENDS += "B"``), package B will neither
+appear in the generated license manifest nor in the source tarballs generated
+by the archiving class. This occurs as the licensing and archiving classes
+assume that only packages included via :term:`RDEPENDS` end up in the image.
+
+As a result, potential obligations regarding license compliance for package B
+may not be met.
+
+The Yocto Project doesn't enable static libraries by default, in part because
+of this issue. Before a solution to this limitation is found, you need to
+keep in mind that if your root filesystem is built from static libraries,
+you will need to manually ensure that your deliveries are compliant
+with the licenses of these libraries.
 
 Copying Licenses that Do Not Exist
 ----------------------------------
-- 
2.25.1


