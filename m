Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB33AC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 14:14:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.13420.1699971256644795030
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 06:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=drCgkK6y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 144BFC000C;
	Tue, 14 Nov 2023 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699971254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+eUIlGvdjQLQVtE2coaAPC86KaNJX/qXjpFereQGxkc=;
	b=drCgkK6y3s0qnCUv/ao0pQGNBJqiopnJIir5AsneYncSGsvTOSk24gkqHASxNGnFZGCbKe
	hT9yU3R4Yk+af7esE+gs/4wUHZ7fssJlewIqdGrScYQbGVej12l8VjJfGcwzvaL+d+xaQP
	07gihCle+eddXchjQN5FD/CmN6TIFoREJCVCbLgD408M1q1Fx2GB9v0a689tTJoXfNEOoI
	ObKqt15rJFMcoEghVC7hUBv7dtfFqnYtmHBLBW03icjjJvgcSd9pHtsVrtjuZuZxbAHCfw
	11e7l4bhUKti5IpUd6wlCwqBg5jSO1qCiPvH3hgCpS3RA18JT7a7oQCgpzUmTw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Steve Landherr <steve-yocto@chiquapin.com>
Subject: [PATCH] manuals: fix URL
Date: Tue, 14 Nov 2023 15:14:11 +0100
Message-Id: <20231114141411.114795-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 14:14:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4616

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #15279]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by:  Steve Landherr <steve-yocto@chiquapin.com>
---
 documentation/what-i-wish-id-known.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 10f746ff1f..fe79bc0129 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -29,8 +29,9 @@ contact us with other suggestions.
 #. **Get to know the layer index:**
    All layers can be found in the :oe_layerindex:`layer index <>`. Layers which
    have applied for Yocto Project Compatible status (structure continuity
-   assurance and testing) can be found in the :yocto_home:`Yocto Project Compatible index
-   </software-over/layer/>`. Generally check the Compatible layer index first,
+   assurance and testing) can be found in the :yocto_home:`Yocto Project
+   Compatible Layers </development/yocto-project-compatible-layers/>` page.
+   Generally check the Compatible layer index first,
    and if you don't find the necessary layer check the general layer index. The
    layer index is an original artifact from the Open Embedded Project. As such,
    that index doesn't have the curating and testing that the Yocto Project
-- 
2.34.1


