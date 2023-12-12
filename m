Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C75C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 11:11:55 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.14524.1702379514228712200
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Dec 2023 03:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V9ItMsgA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBD2F1BF20A;
	Tue, 12 Dec 2023 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702379511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d94f7TH/LthGIT7JXrWqv99gPd/Mr/CuGOin7IKR+Mc=;
	b=V9ItMsgAT6GcEORKqn0UC5GZ38oWCu5Yoymb9fOB5Jd+vEp46HpDhLFPNAbql8XxG5P+mW
	lqjdCfeNBrqAXsi2v5N3k+4e8kRZgRekVeCC7edknTaMy9Jgb1HYPQ4dq0TARQ+6kTVA6L
	Nf0fZoGofXQQxysQZKzPWeInXGHAYksBQMbFkiC6ByghlM8JeF+RHIfuHuZvGRGAUuXMAS
	uEVLnYs8evwjbbCjJoL5R2B/dVHJUD5Fhc5KqJGOpZx33ceFwDoMWrqXLNL5DNzh135Pig
	M8NFQzafL+o01bop9SSnzF9Upcj/pq5lx/Boun/zHjw6jF4BczsBVHbKpnZQnQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: runtime-testing: fix test module name
Date: Tue, 12 Dec 2023 12:11:49 +0100
Message-Id: <20231212111149.2412501-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Dec 2023 11:11:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4680

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/runtime-testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index 205a96cc59..be1e8c02e5 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -453,7 +453,7 @@ layer's ``layer.conf`` file as normal). Just remember the following:
    directory.
 
 To create a new test, start by copying an existing module (e.g.
-``syslog.py`` or ``gcc.py`` are good ones to use). Test modules can use
+``oe_syslog.py`` or ``gcc.py`` are good ones to use). Test modules can use
 code from ``meta/lib/oeqa/utils``, which are helper classes.
 
 .. note::
-- 
2.34.1


