Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E58E8FDB0
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:45:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.341.1696362329408653919
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 12:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bKjka4MP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB6CFE0002;
	Tue,  3 Oct 2023 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696362326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OChJKFy8chG2VlRLwQOhLSlqiwgLU5zMtLat+vZIcAA=;
	b=bKjka4MPAQOqxTS4SPnKpU9Bp2Cx7J9myA8Z6QqYwvHNHKgQLG6kTpAZwwKkcOGdk+glOE
	PQXZknjRrSzhTBJvQoYH9r38br1an/Vdr/UXXIN5ODlpzbZ3fX3g/803uLwSggg1Lr1DzD
	l15X9JVCOEggC9BC7BelWwkIjwGfnhWlOcDkrajhQ1cEGkAC/0Roo09RLXkiElvAlzuFo2
	VVeyzDhVGxfoniSQpJ1cwjlmQ30XxU8jFTHrLG+gYPAL/cF+4ZvSmK66owKf5SDyBnyNSD
	Z6sHIg6jtxxCtZxJnZNh+ttc6LJn8kdlQf6OKKdgaNARJgyp+stbIgD3xBN+Rw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: releases.svg: Scarthgap is now version 5.0
Date: Tue,  3 Oct 2023 21:45:21 +0200
Message-Id: <20231003194521.2732168-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Oct 2023 19:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4305

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to https://wiki.yoctoproject.org/wiki/Releases

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index e7d5c6d502..5333498d1f 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -718,7 +718,7 @@
          x="1373.233"
          y="-247.33261"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-1-4-6-5">4.4</tspan></text>
+         id="tspan10317-2-9-1-4-6-5">5.0</tspan></text>
     <rect
        style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-9"
-- 
2.34.1


