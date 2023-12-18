Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB36CC46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.3170.1702935915315147560
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ckq2f46T;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FD61FF806;
	Mon, 18 Dec 2023 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eigl9rJT+naEEupvcCHxt08mi7eQMUi2OAusHefOxiM=;
	b=ckq2f46Tb6AnDljiKjBoP1W0KGPDVhhuCbfB1Uo3Owbv5P1lWpGgVtW0P3yFlQVEljyK0+
	o73o2h3Ogev2HZhv4pyGXZtujjbvc1coD226sWHneGwkOznU4eRqsQL72e+ALXS7mpkNHh
	GA7nt2BeKKM+wI2NAfXixnSYAi7KJfebQcVEYLkKlUNJNb06P91XR+/RxrK8Ak+vZvulb3
	O8OYUlSEPxwxKSDBayszcz69/ThBu9I7INHMscyJGGg092Qt+3RQYqinMktcpErZllnIFY
	EQFNUQg4HwDb99WdtoZtb65hqScAWmAOaYkg7JLfAaQE/Vr1ivMviK4os+tkKw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 16/18] dev-manual: runtime-testing: fix test module name
Date: Mon, 18 Dec 2023 22:44:40 +0100
Message-Id: <20231218214442.147385-17-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4723

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/runtime-testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index af3fe2c1dd..b9aa6759d1 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -459,7 +459,7 @@ layer's ``layer.conf`` file as normal). Just remember the following:
    directory.
 
 To create a new test, start by copying an existing module (e.g.
-``syslog.py`` or ``gcc.py`` are good ones to use). Test modules can use
+``oe_syslog.py`` or ``gcc.py`` are good ones to use). Test modules can use
 code from ``meta/lib/oeqa/utils``, which are helper classes.
 
 .. note::
-- 
2.34.1


