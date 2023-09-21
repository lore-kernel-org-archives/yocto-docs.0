Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38080E706EE
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:27:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.11295.1695284849802921340
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Sep 2023 01:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YjZZl9Tj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52A842000E;
	Thu, 21 Sep 2023 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695284847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S8EMYoQQp9taWm5GcKZnav3MnHizx8S3GOXtVJeltzE=;
	b=YjZZl9TjKuBPzYdKtGJas6MRCVyNuGtFXkQeF0dSDckpEfxsJsCkIVH49N5L/Qe1jDMqWi
	BThFFFbeMFj0dBAOs0U3qZ1i2VG6ZHXMukff+dWhTv+DaiDRVnIHyiBMGruGvnNuLE6Z/A
	Jm5aKh98mayCQjzzC/p71R2i77BtO99i9sJHBotLsVjYkDTRu9C4UGdelxadvyk1meE/aC
	KT0TdDjUZEla1ylCp55CllJDvAM/vGu5zCzpvUCIlNtoi+U1GJRXiiQY69cPxpA3dW6LX/
	6PtNci+vBe1qaUsbt/0faLSvmCHV2VNwYgN7tpL+FpLRflZ0AxtitIEZa/KRLA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: new-recipe.rst: replace reference to wiki
Date: Thu, 21 Sep 2023 10:27:24 +0200
Message-Id: <20230921082724.2519518-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Sep 2023 08:27:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4283

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 457f9632ce..02bb08474f 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1395,9 +1395,9 @@ doing the following:
 Following Recipe Style Guidelines
 =================================
 
-When writing recipes, it is good to conform to existing style
-guidelines. The :oe_wiki:`OpenEmbedded Styleguide </Styleguide>` wiki page
-provides rough guidelines for preferred recipe style.
+When writing recipes, it is good to conform to existing style guidelines.
+See the ":doc:`../contributor-guide/recipe-style-guide`" in the Yocto Project
+and OpenEmbedded Contributor Guide for reference.
 
 It is common for existing recipes to deviate a bit from this style.
 However, aiming for at least a consistent style is a good idea. Some
-- 
2.34.1


