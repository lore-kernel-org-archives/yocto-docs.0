Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67751CE79B0
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:16:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.32327.1695197767377895129
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aDhVwgbj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE0171C000E;
	Wed, 20 Sep 2023 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwE8mlT5jSMESeNK3tN7LKOp8jV4pHC8vKw3RMAsjdk=;
	b=aDhVwgbjd+j15A3S8/0+5Fy2dUNXimnJ97MQYasyAmVOMEpNSS5B5EWdvNKMG7v0zBcmxW
	+sAHL0GC9xNexHdXi7vmUxZyPox2e68+FSIR2XXeuFh2klpYxvT5weKLaL0doF9UVTkP/H
	h5GV3UXD69+nFthkoVpECPk4CDqZIx5K2y4vB7M9GpyTrI4gRpPbOD91VFHPJ+215wiEoe
	ps1mMvktSLQE5kt8MVb+WAxsXOUW0L8pixQRXSAw9TSBxxFmXzT/Ri5IzTxbX0PYhPCNl5
	st55T+JNDNwaiqwlIjeDTxaMmW115xTlatXOwKUPVF2SlGL/9tWzdrRpxM5HrQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [kirkstone][PATCH 07/10] template: fix typo in section header
Date: Wed, 20 Sep 2023 10:15:41 +0200
Message-Id: <20230920081544.1226760-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
References: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4254

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


