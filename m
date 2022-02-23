Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DCBC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 16:47:57 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.10123.1645634875723626715
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 08:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dVJn0Qx3;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F025620000F;
	Wed, 23 Feb 2022 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645634874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x/fgVCwghBDCGAH9G9YwoMBjLRP38S5H54kYg6aI+R0=;
	b=dVJn0Qx3xdmutiPNnYixbFXBPIfNu1gNnIX8tNKfPmCv9KUvRAAlA1kZS9JOTWiBlcRdOU
	7/X38rTSOZot9HrPToNN6L+n27P8chxDNJU64/YPlYqMp1spOIhOZanUhQ/iWSMF2gOmmb
	rhEAgXq6/gUzlto/lD6/9TwfqlwRdBu/D6tcHSJgJqST9NyBopTC4w2wkO3L8TknH1KKef
	xPGkXylLVHHsi3iZ8NFcmjS2ayIAtaOyjry2r7/Co0GG9vVWoMTbkbKKX6fBRSljfGLHPg
	hCvEvAzzm35HnNNOkeZmyvlDkW5SrSdEbVi1fLPRyNbYjRvGS9vO4bDZJmyHvg==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [transition] documentation/Makefile: add "clean" make target
Date: Wed, 23 Feb 2022 17:47:46 +0100
Message-Id: <20220223164746.129427-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Feb 2022 16:47:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2499

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 30c16943dd..564a906e20 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -6,7 +6,7 @@ SOURCEDIR     = .
 BUILDDIR      = _build
 TRANSITIONS   = $(sort $(patsubst $(SOURCEDIR)/transition/%/index.rst,%,$(wildcard $(SOURCEDIR)/transition/*/index.rst)))
 
-.PHONY: Makefile publish transition $(TRANSITIONS)
+.PHONY: Makefile publish transition clean $(TRANSITIONS)
 
 transition: $(TRANSITIONS)
 
@@ -20,3 +20,6 @@ publish: transition
 		mkdir -p $(BUILDDIR)/final/$$ver ;\
 		cp -r $(BUILDDIR)/$$ver/html/* $(BUILDDIR)/final/$$ver/ ;\
 	done
+
+clean:
+	@rm -rf $(BUILDDIR)
-- 
2.25.1


