Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89737C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 10:36:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.4747.1665398163740844135
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 03:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LYG7t/Yq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 33556FF804;
	Mon, 10 Oct 2022 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665398161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAxjm42D81/e2lu4L8EeEnf0WsXJgrIPLUg+V4AanNA=;
	b=LYG7t/YqegzQBhRvt8Pf+gXlkTb6Ai014Euaoxz9P2zFHi8SU4j8VinvstCzUHHQfZxS2n
	8trK24EKDBZ2hmTjk80vq1K/5kKg1RBdlZDzSCm02kcPS476SRvJf1xZb1V/jq8RQdO83C
	lZtIRsIAeJv5URoRFAvkIDdKG/Fn8jq9ShqzBmCakeR1KJlwXdBDU5BDqrdN2xFH+1nj8d
	/JVb4O3Zqd5LMUQXO80Z9ZJnn9CJbx+FgGS0jh339evmxSxRulNZFkEHeos0u8nRPnOTXK
	LjAwJcq4WKNfoTt4QLG6oLovM26NLQIrjfnk+RMMxeIxYgwRdvRNfKWk71J+sA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] ref-manual/variables.rst: clarify sentence
Date: Mon, 10 Oct 2022 12:35:51 +0200
Message-Id: <20221010103551.26455-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <171B885700B16EF1.3322@lists.yoctoproject.org>
References: <171B885700B16EF1.3322@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:36:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3338

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1685a26776..89c9618469 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3546,7 +3546,7 @@ system and gives an overview of their function and contents.
 
 
          Although you can use other settings, you might be required to
-         remove dependencies on or provide alternatives to components that
+         remove dependencies on (or provide alternatives to) components that
          are required to produce a functional system image.
 
    :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
-- 
2.34.1


