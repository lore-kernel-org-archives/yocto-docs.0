Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E442BECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 20:17:17 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.3301.1662149835889402772
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 13:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Eu15wXei;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF2DE100002;
	Fri,  2 Sep 2022 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662149834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wqUlTNDtB/wyrkwbz6l9h0fdg1jMqx10kccuxNRzJg4=;
	b=Eu15wXei8fCinNWZbvM+pfQJPl6fKCXUStgF5+2JCYfqf8C6EwtD0vVhaT7eopXAXUuC0Z
	OC/uL+sjEC6KdVRdtAdh9u2IKeyDwc6weNWgrQrSBXXCs8j+cwu4XyNlTNKInEjIZHN4ik
	y1UiOdnbh5002kmt/1kH6uMLSQK9al64NIthBC82YLtXkL4Us932yut+z/ipfLOkGizrGi
	RJutwQjKmgNpo5iBuVs/ChuKWpj1d/ZHhEM2PopkzFOjUv23NeGPk9i4DPjJcorDQcq4Wy
	R484FPodVFOmp2VF7VZyF+RA5r4OVF+D+NBgFz0iA2A4krzTWpjXKsyjRtojHg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: remove obsolete product listing from FAQ
Date: Fri,  2 Sep 2022 22:17:05 +0200
Message-Id: <20220902201705.101145-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Sep 2022 20:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3136

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This removes the single reference to a product built with OE.
The URL for this product doesn't refer to OE any more
and this FAQ is problably not the best place to highlight
products built with OE.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/faq.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 61049523a0..9e489991fd 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -52,16 +52,6 @@ section in the Yocto Project Development Tasks Manual and the
 Usually, if the board is not completely exotic, adding support in the
 Yocto Project is fairly straightforward.
 
-**Q:** Are there any products built using the OpenEmbedded build system?
-
-**A:** The software running on the `Vernier
-LabQuest <https://vernier.com/labquest/>`__ is built using the
-OpenEmbedded build system. See the `Vernier
-LabQuest <https://www.vernier.com/products/interfaces/labq/>`__ website
-for more information. There are a number of pre-production devices using
-the OpenEmbedded build system and the Yocto Project team announces them
-as soon as they are released.
-
 **Q:** What does the OpenEmbedded build system produce as output?
 
 **A:** Because you can use the same set of recipes to create output of
-- 
2.34.1


