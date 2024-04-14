Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F659C04FFE
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:20:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.3488.1713118829115835049
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n5PmVnu0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BF271BF203;
	Sun, 14 Apr 2024 18:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713118827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ejnpPPWNIGPV0t894NbW6MGvNRbe5HDMZfjhTgo6jU=;
	b=n5PmVnu0zw4dLhyOT5KOpKlFOsWw9JgdT2RqG9tQsoyBAyLRhpCZQlWszw0KCp0cFhzcQ+
	YlzRrcRgIgrt9DCn3w/Nq0RNYdrwRNFXvQ/c8SMa8pcn83FxN96eV/rDJWz5eBzNbsw5oD
	HkzM9R/CDjGjSweLKRUQLbL07wLhyWsRxcepW8GLWvXDfwQujTjxzMwkhRxl7RiqklITuj
	xWoZApf6Ha0y96HoT1wfrzUfPikVfKZKEIbNXfyPGuEYw+XA8mOEZfkF8jiUId9AXTQU4h
	EqLgaCPe4ffFQ8oDD0jAzWJmUGR499vstf8fmUWG13qKLW+G8icXDurfcJyrHw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [kirkstone][PATCH 4/9] manuals: fix duplicate "stylecheck" target
Date: Sun, 14 Apr 2024 20:20:06 +0200
Message-Id: <20240414182011.994356-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
References: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5128

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index e5f0effeb5..20dab5725c 100644
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
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
-- 
2.34.1


