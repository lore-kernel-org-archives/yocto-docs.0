Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49552C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 16:24:59 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.669.1711815890498680302
 for <docs@lists.yoctoproject.org>;
 Sat, 30 Mar 2024 09:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i2bn8gsy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F45620004;
	Sat, 30 Mar 2024 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711815888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ESlFiLuRlUJfbDnFUvgH1tW11+4BJMNTg4wzOUGRm2A=;
	b=i2bn8gsyrvRcv+gSZXX6oUG6MeFDnvoDQfY6gHd4pfAQzMFJ3L2nF2mo91wrHyHW5ITo6E
	mtcmWs7RFpIjxPSmBUw0nXsnHTIlE4ICJJp41XwVYUmPiJ9LvXKSWolWgQePFEASdR3Y2A
	B1XZzcOyBn8GPrQPXUyPSuOg0HfyiTrrGfxx64gvkq+0pMtNJN10m2KnTkHEvR8f/ldCg8
	UlGhcTKPlPb2GPUNjR6Laf0GmVkj00h4MH+axMPSi/E5VPYbYLKmgkStg6a1urcV+E8T8Q
	Ef7TIBedJCDYGWdAXhB8ZaNRm8Szx23qlkoiCrv2KbbHFbwNxWFAgYkP+iDyvA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: fix duplicate "stylecheck" target
Date: Sat, 30 Mar 2024 17:24:40 +0100
Message-Id: <20240330162440.1734248-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 30 Mar 2024 16:24:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5032

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index c930d2d280..f3b775b3ec 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -53,10 +53,6 @@ stylecheck:
 	vale sync
 	vale $(VALEOPTS) $(VALEDOCS)
 
-stylecheck:
-	vale sync
-	vale $(VALEOPTS) $(VALEDOCS)
-
 epub: $(PNGs)
 	$(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
-- 
2.34.1


