Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A483FECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 14:55:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.25507.1662389745877342791
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Sep 2022 07:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AUOLM5h9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 00AF140006;
	Mon,  5 Sep 2022 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662389744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xcHQMSVXnROBLbMe8lBWqv5EhyA1pQbg5s9uAzcYuMk=;
	b=AUOLM5h97FUt+TVWBydslyfhNZIYUmEeqO6h6gqvH/140rumXI3FNPJ9wdnCgjeBsbUng9
	ho8NXdktH8punmIjCZ8MyueVyzRoLlR1/e+82ZpPzoXMrC6euoMZQ9zJISVlQ4gtS1nAgF
	eUBxGFck/PkBwteyR1jzpP1Oi2iMbkoW9muFJpYAz8oPxKjHcrDQ2HgUuKjtctLMvqokQ8
	leTnwJRpkI5pvW7idz2BbSTOH4gQj498CIdPpboTQuBEb6g7h20t7apEbxaVQqDWRA/Tbe
	utDuYy1Vy4HDTk6dNN0rPrA9sPNBbtpnnXakAfzZQOJB4O8gFXeELjPB/JUygg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual/faq.rst: update references to products built with
 OE / Yocto Project
Date: Mon,  5 Sep 2022 16:55:41 +0200
Message-Id: <20220905145541.55983-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Sep 2022 14:55:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3145

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/faq.rst | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 61049523a0..5b7cb8001d 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -54,13 +54,10 @@ Yocto Project is fairly straightforward.
 
 **Q:** Are there any products built using the OpenEmbedded build system?
 
-**A:** The software running on the `Vernier
-LabQuest <https://vernier.com/labquest/>`__ is built using the
-OpenEmbedded build system. See the `Vernier
-LabQuest <https://www.vernier.com/products/interfaces/labq/>`__ website
-for more information. There are a number of pre-production devices using
-the OpenEmbedded build system and the Yocto Project team announces them
-as soon as they are released.
+**A:** See :yocto_wiki:`Products that use the Yocto Project
+</Project_Users#Products_that_use_the_Yocto_Project>` in the Yocto Project
+Wiki. Don't hesitate to contribute to this page if you know other such
+products.
 
 **Q:** What does the OpenEmbedded build system produce as output?
 
-- 
2.34.1


