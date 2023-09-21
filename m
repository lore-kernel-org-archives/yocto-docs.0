Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435F8E706F2
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:37:18 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.11414.1695285434329977647
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Sep 2023 01:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q4tz1Lfc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5895BC000C;
	Thu, 21 Sep 2023 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695285432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hFudwXRfCDVigOTqDUtCWzeMuOcRKpZ101qzVgPq/98=;
	b=Q4tz1LfcRvJvWrcKtuclYl1QQsyj3A6xQWmd4vxZOZuT44RcqsQcX7/AjB/Nkejw2qAmAY
	B4HC/xLmv+QDqaKUByrCAlNqTX0+qPiGIkUGRNY1tkWh+/l3W7TlhOFgLCWWUM+FLrgpFm
	c5qhz+MIrMjYpfDXBhA+5RlEu8fBnO2lW3iPe6apnNsf1QCb7Rg4VHNaahHSML4iW8rUrw
	nVgYhVZOfiEXlex1IcWUrQxug0UDb1z2dBP+SHWqizAqWdcOtI2VbKDytAyYvvszumwyES
	ipOsuFHb7Ib9GIPDrm1tWDJeWzKJwGvbCx0GE79pVzOoqTiB0BGq6MjrtUactw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] bsp-guide: bsp.rst: replace reference to wiki
Date: Thu, 21 Sep 2023 10:37:09 +0200
Message-Id: <20230921083709.2520578-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Sep 2023 08:37:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4284

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 3be314bcf6..c78fbeb68f 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -893,8 +893,8 @@ Yocto Project:
    ``recipes-*`` subdirectories specific to the recipe's function, or
    within a subdirectory containing a set of closely-related recipes.
    The recipes themselves should follow the general guidelines for
-   recipes used in the Yocto Project found in the ":oe_wiki:`OpenEmbedded
-   Style Guide </Styleguide>`".
+   recipes found in the ":doc:`../contributor-guide/recipe-style-guide`"
+   in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  *License File:* You must include a license file in the
    ``meta-bsp_root_name`` directory. This license covers the BSP
-- 
2.34.1


