Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76E0CE79B1
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:08:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.32058.1695197292079188429
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CTu2Z2w+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CC1420005;
	Wed, 20 Sep 2023 08:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwE8mlT5jSMESeNK3tN7LKOp8jV4pHC8vKw3RMAsjdk=;
	b=CTu2Z2w+ar57T9Pw5siSnA85JMOuOCcUK4vYBsf00LJlVys2abix3BM7X23Rxs4bEqN7js
	mtqvftbCNT7/P2TP/9paiDLP63IAbcyiUsGspF85CO2AMCYBiB2KdUfDz4A8e3TrtPSHVo
	fLzFnv7BzE8avZtfoUu7VhSf06nOjhr2JYLR+krzt3OZeHRJPvAaFFgi0iYkuzAR6c8iDn
	UY6paCJ/NEOzpmlOyeJc5QbFIPlEaZklOVQnXtBCojuK7cuiC78CSPLV9J4OqHEKfh+VLu
	/K2k6VLYgeUDy27ZMIiOlLa6SfZWIFPRFDGfXpOWjTS2VUYM643qwFS+JWcvSQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [mickledore][PATCH 6/7] template: fix typo in section header
Date: Wed, 20 Sep 2023 10:07:53 +0200
Message-Id: <20230920080754.1225508-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
References: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4245

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Roland Hieber <rhi@pengutronix.de>

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/template/template.svg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/template/template.svg b/documentation/template/template.svg
index 43043e3afb..50715c08b0 100644
--- a/documentation/template/template.svg
+++ b/documentation/template/template.svg
@@ -1019,7 +1019,7 @@
          id="tspan1183-1-8"
          x="-52.348656"
          y="518.42615"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Objets</tspan></text>
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Objects</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-- 
2.34.1


