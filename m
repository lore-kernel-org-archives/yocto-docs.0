Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7BEC4706E
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.3215.1702935906315090521
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YyqmgKii;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5900E0004;
	Mon, 18 Dec 2023 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbU4bxh3vB2FtjtbQuPK+zCe/LmL5vd2YvDh29ATveQ=;
	b=YyqmgKiihb+EiHoCOpm9UqkZw9lB6IEHVohs716GF9swfybBsyUMKfV3/2DG2U11Zcxz6c
	skNKCsc/x4NesdUBRWDPd1Pkg3ATls0hWitAEe/WJkWn5idSyad35Fn5Jtna+5GnVdQJK+
	HRyPxgQ0ednFkQbb8AtLOf8BF7hsIqK/IbUzWdrglljIoXR4FKhwwjYJG/FKntZ1SKWBzl
	8JzeP1udsS955rNWiQQm0kl+iywCB4b3+ik86HZv4RsWz+5AxO/ClvILTvi1bu5m26x/65
	vCLpAQF5SYiAj9eUVwOp1nXYdZQv0j+BBVlbI+mV6UqNR1gmPSR/OFnIedyEPA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Steve Landherr <steve-yocto@chiquapin.com>
Subject: [kirkstone][PATCH 02/18] manuals: fix URL
Date: Mon, 18 Dec 2023 22:44:26 +0100
Message-Id: <20231218214442.147385-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4710

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #15279]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by:  Steve Landherr <steve-yocto@chiquapin.com>
---
 documentation/what-i-wish-id-known.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index fa5d55ff41..4843f02276 100644
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


