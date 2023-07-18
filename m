Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBCFEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 10:01:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4259.1689674472859249115
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 03:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZexlpnQl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADAEA40005;
	Tue, 18 Jul 2023 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689674471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ScidO55lUQLmvqVwBU52uwEvdcIeEWypStBaoC2hNUE=;
	b=ZexlpnQluEAEAZTT+ZVwrR4Fv6tw2d/rs0oqpx7QpbhFckq9oLsRSCnqVP+NH6K+DIDIyu
	+JU5uJByjH/2o37WZ4WHfbc1PrJQINdpk19D4t1Xfja53ReN4x5CLYmKhx+KXpe1uQnq+Y
	psUCsyYuxxAySUFAYsIlijJMuUMLhOAq0+IJtquw4umsga6Eqz9RrsC+GOiLWAIKKOSSeS
	oZed3dvUaqtvMIgkiY/u/pEcYyqJU3SbQrAqcefqmFqqHvoWxB5YkuTzjt5Hkjv8NrkZc1
	DqD2HLK/64AIjWD9dsly7f1h6U7JHDdGgsLKIqE74s6c7bSdf81aXCYoLuypSA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] [kirkstone] docs: ref-manual: terms: fix typos in SPDX term
Date: Tue, 18 Jul 2023 12:01:08 +0200
Message-Id: <20230718100108.182738-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jul 2023 10:01:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4057

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
index a9c84fe3a5..d94fa4a5c9 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -401,11 +401,11 @@ universal, the list includes them just in case:
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
       and the ":ref:`dev-manual/common-tasks:creating a software bill of materials`"
-- 
2.34.1


