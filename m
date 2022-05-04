Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B22C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 15:41:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.1117.1651678845245209690
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 08:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OY1yi3YQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6BF7D1C0013;
	Wed,  4 May 2022 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651678842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PRahK/D/Y2gdmd/tAJdadHqpIyU28FhPE0VmeJonv+A=;
	b=OY1yi3YQfAi2C8AWndS51Njmd7wdUlUll4YReLYMH+j/AbHVXsnkyE0cGErdAkDOEihF4V
	XsM6+qlc9vohRueDH6QZmTfOfuW1wHfdsbzl/p8iPItCwPiVGWbU3fDQWcVxAvwN7/1qqS
	/8ynw36Obj5ts9E84T5BNbwdrhKzNI9ZyzEpIJcdTfJhykWSlTgOzhb43nTZ60uaH3enlU
	Yp9V4iwDf17uPgJcRj4WJ1P/chNMJacZx4TrPb1zR9kTTq8qS88beMUku/yufRyzRdiQWc
	ns2dOiymYNK7ys/fY5tX4ocRW2OmmggvxaUWqNkF3/rPjpTuxuPEWgH9+V5PGw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] doc/Makefile: fix epub and latexpdf targets
Date: Wed,  4 May 2022 17:40:39 +0200
Message-Id: <20220504154039.690761-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 15:41:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2914

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fixing "make clean" followed by "make epub" or "make latexpdf"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/Makefile b/documentation/Makefile
index 33bbca0bab..9fb6814c8f 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -47,9 +47,11 @@ clean:
 	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js
 
 epub: $(PNGs)
+	$(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
 latexpdf: $(PDFs)
+	$(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
 all: html epub latexpdf
-- 
2.25.1


