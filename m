Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10EEC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 15:29:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.11007.1633706946257467586
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Oct 2021 08:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7097460007;
	Fri,  8 Oct 2021 15:29:01 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] dev-manual: warn about license compliance issues when
 static libraries are used
Date: Fri,  8 Oct 2021 17:28:55 +0200
Message-Id: <20211008152855.1027365-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16AC16B7401F40C0.1121@lists.yoctoproject.org>
References: <16AC16B7401F40C0.1121@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Oct 2021 15:29:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1972

This partly addresses [YOCTO #14407]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 8ab45193b8..4683b1c045 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11158,6 +11158,26 @@ this function, you have to follow the following steps:
 For more usage information refer to :yocto_git:`the meta-spdxscanner repository
 </meta-spdxscanner/>`.
 
+Compliance Limitations with Executables Built from Static Libraries
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When package A is added to an image via the :term:`RDEPENDS` or :term:`RRECOMMENDS`
+mechanisms as well as explicitly included in the image recipe with
+:term:`IMAGE_INSTALL`, and depends on a static linked library recipe B
+(``DEPENDS += "B"``), package B will neither appear in the generated license
+manifest nor in the generated source tarballs.  This occurs as the
+:ref:`license <ref-classes-license>` and :ref:`archiver <ref-classes-archiver>`
+classes assume that only packages included via :term:`RDEPENDS` or :term:`RRECOMMENDS`
+end up in the image.
+
+As a result, potential obligations regarding license compliance for package B
+may not be met.
+
+The Yocto Project doesn't enable static libraries by default, in part because
+of this issue. Before a solution to this limitation is found, you need to
+keep in mind that if your root filesystem is built from static libraries,
+you will need to manually ensure that your deliveries are compliant
+with the licenses of these libraries.
 
 Copying Non Standard Licenses
 -----------------------------
-- 
2.25.1


