Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C83E9273F
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:05:13 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.25924.1696536303606778538
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dDfAYmqo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 193BF40005;
	Thu,  5 Oct 2023 20:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFudwXRfCDVigOTqDUtCWzeMuOcRKpZ101qzVgPq/98=;
	b=dDfAYmqoROBlevoxvdM2IkI6k4VBkC6C4XaaZYC8u8h93dTSGlGsfVlj1irC+cLN9/DgjN
	caqeIh6Ezo8yInyLjEOoI7rB0ubZdGMNQzdXqalHP3qvFQm9L4kCAjh/WDBMepIlVf+4N2
	1nKZVOxdx9Uvo60yT/Zu17SOwwiNfA7IXfLxjH2OlSuXhh9n2fTVbzBRHBM8BTjvQg+DRQ
	g/U54/ddCbhurKxVSjt8R5POkNLapGjy11BH3Clcqi2Z3evHNo9HI6Dh0BO1aL7gRap9hQ
	JAUDzTZ/ak69xXoTUtqwCgwrYGVkw/JkOblTzX/3hh/nfiZLzBs2v5PtV+Bqtg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 3/9] bsp-guide: bsp.rst: replace reference to wiki
Date: Thu,  5 Oct 2023 22:04:47 +0200
Message-Id: <20231005200453.2873299-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005200453.2873299-1-michael.opdenacker@bootlin.com>
References: <20231005200453.2873299-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4321

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


