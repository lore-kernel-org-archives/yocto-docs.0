Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7EEC07E9D
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:54:09 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.571.1663955639129863315
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OQHpqgKs;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7A44E100006;
	Fri, 23 Sep 2022 17:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGVX2sxmMDzZxbHsPScpCBxa4Ch2bxPldcTf6gklzas=;
	b=OQHpqgKsi15i9EIAiHtfHmrStEJvNS8xCwO8gc6if2+iU7pHY4nI3F3xf9WOC0VnMtu3w0
	RYYjdYHbfSTRWbz+8bY2ctTKhUbapZEwc45ldKUBgoOLRiodvZDuXUtSMUqdtlUBBNDYy2
	m/UW/JjhEIqIUgkD03rbWdhpMIN/Lp/HakN+XCTujyJMnJe6kjcVEGMZ2yyyuxpyFc3Z0G
	fT4ndojZrQMFFgKyeb30E8b/zRgcWJEkYxBgNZGoZ4SmpoFMSZaqJxaXYmO0K6vpxZlNqH
	3gZrf1HU8iqNqkIXPTanRNFBy58P8fd9GbyeITS+6Y9FFqrIFI9AfrQWeD2ckw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 29/30] migration-guides: add reference to the
 "do_shared_workdir" task
Date: Fri, 23 Sep 2022 19:52:18 +0200
Message-Id: <20220923175219.6652-30-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:54:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3244

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-1.8.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-1.8.rst b/documentation/migration-guides/migration-1.8.rst
index 546c798196..f058029b30 100644
--- a/documentation/migration-guides/migration-1.8.rst
+++ b/documentation/migration-guides/migration-1.8.rst
@@ -84,7 +84,7 @@ where the ``linux.inc`` file in ``meta-oe`` was updated.
 
 Recipes that rely on the kernel source code and do not inherit the
 module classes might need to add explicit dependencies on the
-``do_shared_workdir`` kernel task, for example::
+:ref:`ref-tasks-shared_workdir` kernel task, for example::
 
    do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
-- 
2.34.1


