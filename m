Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D5AC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 16:13:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.13007.1648483995420715898
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 09:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jdF/MC0U;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0385740005;
	Mon, 28 Mar 2022 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648483994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WY5n3K4n1gzMZaUisGtwCtquMhRiIbYhsyTG1Umuu0s=;
	b=jdF/MC0UXNz0QDL/fopHgrUYLf8N84kGx4SM9OkJL5KgUl0KB9TdFgoyCrx6XuM04aDjAZ
	9+NKjEHm0WoU8pTEgTE9806QPP5yP1dBpj2HPRVdK1rW8gVy45NniEnZ8r3kvENa24WLFP
	yKNPrf5SawgSJdyRViNXq/CXGoL7MU9dhzvu7KgX1Yu9gIQBsze/TrpcezjMIHXPeAMBcY
	lw151cgAdyuyLwdVja5D+/Ds/2MDTc85zDVgcdoArAuz7Np7oU7EpRPOfw56BHSRDXvMoA
	dUZRiQ1hNDoKF9bSZR/V1UgPUSXJ8t/zMkYtOhWCj/y04dACzL16Mr9PBQ34+w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: add poky.yaml to "make clean"
Date: Mon, 28 Mar 2022 18:13:11 +0200
Message-Id: <20220328161311.325248-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Mar 2022 16:13:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2715

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index bec53399c0..267e6d7d04 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -44,7 +44,7 @@ PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCED
 	$(SVG2PNG) --export-filename=$@ $<
 
 clean:
-	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs)
+	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml
 
 epub: $(PNGs)
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
-- 
2.25.1


