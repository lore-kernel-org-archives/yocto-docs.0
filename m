Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E717CC433FE
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 12:23:07 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.10938.1633522973225370636
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 05:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id D30C920000D;
	Wed,  6 Oct 2021 12:22:51 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/4] docs: add "make all" to build old types of docs (html,
 epub, pdf) at once
Date: Wed,  6 Oct 2021 14:22:38 +0200
Message-Id: <20211006122238.959343-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006122238.959343-1-michael.opdenacker@bootlin.com>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 12:23:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1929

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index f015026562..f04f381bd2 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -20,7 +20,7 @@ endif
 help:
 	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
-.PHONY: help Makefile clean publish epub latexpdf
+.PHONY: all help Makefile clean publish epub latexpdf
 
 publish: Makefile html singlehtml
 	rm -rf $(BUILDDIR)/$(DESTDIR)/
@@ -52,6 +52,8 @@ epub: $(PNGs)
 latexpdf: $(PDFs)
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
+all: html epub latexpdf
+
 # Catch-all target: route all unknown targets to Sphinx using the new
 # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
 %:
-- 
2.25.1


