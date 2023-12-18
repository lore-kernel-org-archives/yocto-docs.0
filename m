Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFB4C47077
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.2933.1702935253955455206
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j1wGI48F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA0D940003;
	Mon, 18 Dec 2023 21:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eUIlGvdjQLQVtE2coaAPC86KaNJX/qXjpFereQGxkc=;
	b=j1wGI48F3yA0ph0AFnxEE/LlsDy/8jvuQqgcDhJ8XiXUs+x9d0mcrJuf1KATUJLV1ZdnvG
	KEptLyP5OlmHbRP30qlbgvSsy3zlnswwkem9L9ED5mZD1sgLuexh/bCY05ZXiICNo01ag2
	vJmXV4zxZOa6Pd3sI3wjgCF0HLmc/K5X7UVpzSOJpPZLR5kkZGKg5272l8RctR9rXfSQvx
	gHMR4To0wohzkt0CobbGV6LRqii/OAjrEuk2o9PTFkF5Y6otNAuedQCv3E09xTVLLz7tS0
	h1NFoJRnFiZiPiywPuPubu9NCjXZKfsDrCc87oEiA6CD314Zru7gpt2VNHIN+w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Steve Landherr <steve-yocto@chiquapin.com>
Subject: [nanbield][PATCH 07/20] manuals: fix URL
Date: Mon, 18 Dec 2023 22:33:21 +0100
Message-Id: <20231218213334.146370-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4693

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


