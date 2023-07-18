Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E264DEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 09:58:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.4233.1689674314351615396
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 02:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pz7TWtHx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A13720002;
	Tue, 18 Jul 2023 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689674312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sCuiqMGHZRQ4lrCri1w3FddkIZ+/r61JLJP4AvfP9mM=;
	b=pz7TWtHxQsu1xDsGw/KxuJ7w+jMR9AIjioekRo1kpYNfA6RLSqO0Ik23s+TXe1rWSsb7ss
	7SwxWUfB60+rhgcp8aQ2iEJKwS8ZPSDuPMbIFJNclGca9fpKgL0x2iGvtDP2A3Gla51sII
	sR9o5l3gHmzwEU6os4PGdJIubbBOswYQVDl2Hw5sUhNh0Ibg81AEMZXb3eR9O7/1v2Nc6E
	9N36tOlFl3jK2bhdALdGqWI9RPraWMzctjZe/nUNxzWsF/eZDCYV3nqroDWImPsq+SucpK
	haPPLVggZRqYv7rZvzFO/+AP+/jcEoIOJLQMApheYUOSdetgF/K8aa6c2PsdQQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] [mickledore] docs: ref-manual: terms: fix typos in SPDX term
Date: Tue, 18 Jul 2023 11:58:25 +0200
Message-Id: <20230718095825.182340-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jul 2023 09:58:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4056

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Fixes: 2c53ac40e99a ("ref-manual: terms.rst: add SBOM and SPDX terms")
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/terms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 4baef38cfd..8f7281676c 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -475,11 +475,11 @@ universal, the list includes them just in case:
      section in the Yocto Project Overview and Concepts Manual.
 
    :term:`SPDX`
-      This term means *Software Package Data Exchange*, and is used as a open
+      This term means *Software Package Data Exchange*, and is used as an open
       standard for providing a *Software Bill of Materials* (:term:`SBOM`).
       This standard is developed through a `Linux Foundation project
       <https://spdx.dev/>`__ and is used by the OpenEmbedded Build System to
-      provide an :term:`SBOM` associated to each a software image.
+      provide an :term:`SBOM` associated to each software image.
 
       For details, see Wikipedia's :wikipedia:`SPDX page <Software_Package_Data_Exchange>`
       and the ":ref:`dev-manual/sbom:creating a software bill of materials`"
-- 
2.34.1


