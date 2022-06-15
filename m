Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39036C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 09:12:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.2435.1655284336416300646
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 02:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m5fC0or/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C2400E0009;
	Wed, 15 Jun 2022 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655284334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TKglURMyQxcLSniTagcN8LkKKK5FTzzrpZDLW9a6Rzs=;
	b=m5fC0or/YpavjBM6JPCZgiuciVoAFzbiwKZ9ciD+JRk8AZcKvSnUxY/akFdjqoHWoMZCSe
	m/nJvxuoYDmXeXtjVJPU3Zy8jVgSImI9AeK9jOKG7QsHZPDe828Q+TgKxK9dsRJo7xaD0d
	kKtiGUh+1AkUu0S4iSw+6f367bEXt2ycmIXZK6nMa24jyTTAPsX2D8Nx8pMvhHu440TqRs
	3YaFEqxlsAFc1/8TtM6Nf2jr7BxC2PhpohlyGnSIpwisezWvANNE48NZW0/8BPRtyJexSJ
	vGv5qbXdnUdijjSL9v02ClbzzbytAq9/lSMCdmfbDMgu+7jnk86zpg6Q1rfdFg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] doc: Makefile: publish pdf and epub versions too
Date: Wed, 15 Jun 2022 11:12:09 +0200
Message-Id: <20220615091209.1117442-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jun 2022 09:12:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3001

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14357]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 9fb6814c8f..e013f68e7f 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -22,10 +22,10 @@ help:
 
 .PHONY: all help Makefile clean publish epub latexpdf
 
-publish: Makefile html singlehtml
+publish: Makefile html singlehtml epub latexpdf
 	rm -rf $(BUILDDIR)/$(DESTDIR)/
 	mkdir -p $(BUILDDIR)/$(DESTDIR)/
-	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/$(DESTDIR)/
+	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/epub/TheYoctoProject.epub $(BUILDDIR)/latex/theyoctoproject.pdf $(BUILDDIR)/$(DESTDIR)/
 	cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR)/$(DESTDIR)/singleindex.html
 	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
 
-- 
2.34.1


