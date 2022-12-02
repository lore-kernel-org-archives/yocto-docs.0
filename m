Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC54FC4708E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 15:59:42 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.79273.1669996778994635876
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 07:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=p2zjFa++;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A66AFC000C;
	Fri,  2 Dec 2022 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669996776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nT7I4tfcadYGLvO9TV5Mk5MeepgLngJepYqdg93S+M8=;
	b=p2zjFa++PlU5HOOgZ/z4p+2HvhqIpPIo5RvsG+xHgqlasHasWnkRrv+YE7t2TgG/ks6Lan
	SxsKR3Hw79Ig62NPOg5hDKvVvqWVJBMIp9UwNTox6IxLdip9vTJCIUh/tex/IYwuz9dSYw
	PxTePMstpuYZtBLI7StA7TbxgD7B2GP9VUgf57a2+5j/2sBRgOxzKW/yUZJQtiW3irSkO8
	e4IjjQoE0fKPCeJvZlu+TDcjOYnoFtbWFH/4i6gplpVwZW40+aEA9/8aAkkgyXsJdyF9/z
	X2JVKdMD2ecIeIWrzFD0tEGtAL43kAN+KqRAZbdh5zUPSaFNvY7e3O31MtGu9A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: add reference to yocto-docs git repository to page footer
Date: Fri,  2 Dec 2022 16:59:29 +0100
Message-Id: <20221202155929.343262-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Dec 2022 15:59:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3518

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To make documentation sources easier to find.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/_templates/footer.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/_templates/footer.html b/documentation/_templates/footer.html
index 508129ede4..fb3c58d845 100644
--- a/documentation/_templates/footer.html
+++ b/documentation/_templates/footer.html
@@ -5,7 +5,7 @@
         <br> All Rights Reserved. Linux Foundation&reg; and Yocto Project&reg; are registered trademarks of the Linux Foundation.
         <br>Linux&reg; is a registered trademark of Linus Torvalds.
         <br>&copy; Copyright {{ copyright }}
-        <br>Last updated on {{ last_updated }}
+        <br>Last updated on {{ last_updated }} from the <a href="https://git.yoctoproject.org/yocto-docs/">yocto-docs</a> git repository.
     </p>
   </div>
 </footer>
-- 
2.34.1


