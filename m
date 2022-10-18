Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA508C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 06:58:48 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.4034.1666076322951571377
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 23:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H2hP1HnO;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D10AA240006;
	Tue, 18 Oct 2022 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666076320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SKcgXXVvUJwunWsdVJHcyRj3cDvlL9M/kdx1Gx3KJS8=;
	b=H2hP1HnOnl8mDPg4KHwYtujNUS3dpgNTvL6KysEqDjK1N1Wo8UU5anfcuzObU80Y9vl3hY
	OAg1Yvg+nBBYioOrx0pdy/joa/oZUxHS5FgvI/BgqyR459Z1kta766Rop714PxQNe76XEY
	Zqa4GXTSUpYHIHU8u139BJnFOFpbJ1Atvwr/ZJv30w2+NHA0963tYGLjzvhyUEQJ49iJI7
	3n9zWS0WevID0xWkEIQ93ttdUFLea8OaszGoPFAC/74jf4vagtFnCwG4+7q6rBp+5FXl/y
	eZsyyDHmmmdqFO0ndSuWI/xxQCJfhg/Hd1sRjzqEEVYCYsvYgFiVV8mk+V5cpA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: use contributor real name
Date: Tue, 18 Oct 2022 08:58:39 +0200
Message-Id: <20221018065839.273379-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Oct 2022 06:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3370

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-3.4.4.rst | 2 +-
 documentation/migration-guides/release-notes-4.0.1.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-3.4.4.rst b/documentation/migration-guides/release-notes-3.4.4.rst
index ec426a73a1..38e3965169 100644
--- a/documentation/migration-guides/release-notes-3.4.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.4.rst
@@ -82,7 +82,7 @@ Contributors to 3.4.4
 -  Ross Burton
 -  Tim Orling
 -  Wang Mingyu
--  zhengruoqin
+-  Zheng Ruoqin
 
 Repositories / Downloads for 3.4.4
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-4.0.1.rst b/documentation/migration-guides/release-notes-4.0.1.rst
index 1a7147fe7e..e4bfd5bb3d 100644
--- a/documentation/migration-guides/release-notes-4.0.1.rst
+++ b/documentation/migration-guides/release-notes-4.0.1.rst
@@ -175,7 +175,7 @@ Contributors to 4.0.1
 -  Russ Dill
 -  Steve Sakoman
 -  Wang Mingyu
--  zhengruoqin
+-  Zheng Ruoqin
 
 Repositories / Downloads for 4.0.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.34.1


