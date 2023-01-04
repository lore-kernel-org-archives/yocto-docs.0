Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D599C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 10:07:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.8584.1672826861842974947
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 02:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gtOE3j3Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2E2521C0010;
	Wed,  4 Jan 2023 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672826859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wvm6mvONexf/q9ysXaOrDNvcER9qh654os6PnxhOab8=;
	b=gtOE3j3QsPxMUXY88BNYSCznj9ZE7Ehh1DPOc6QWr0hF4qnB2wUE04qbdWaVLrL0g0xtrt
	3rkFRvvM7f7xKTd0TMq+SbrXXcszWZoB01t86esPes2SrhZvrhaaOtngVHUbXK4JG7JzEy
	ylCOu5i8Xid7hV3LYLtfBvDxHn2n49UTrHTOigA/h1XMjs/r922k4QMFhwKV6tsXEsroIv
	j70SCR15y8Bal3O8cixApiuTSLWdIQfZYQHQJsueTsdN8ODyn/ftwduHhlMZ+qpR46t2vx
	nDaAheVz3y1JCWf8xXCZJtCJTQjiBc09kJBMfJLINSo+a4v2aywVOQFMbZt5qA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-1.6.rst: fix redundant reference
Date: Wed,  4 Jan 2023 11:07:37 +0100
Message-Id: <20230104100737.1739304-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Jan 2023 10:07:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3579

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fix sentence containing two references to the same section.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-1.6.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index 1baf8b311a..32f77f9a72 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -223,8 +223,7 @@ Package Test (ptest)
 Package Tests (ptest) are built but not installed by default. For
 information on using Package Tests, see the
 ":ref:`dev-manual/packages:testing packages with ptest`" section in the
-Yocto Project Development Tasks Manual. For information on the
-:ref:`ptest <ref-classes-ptest>` class, see the ":ref:`ref-classes-ptest`"
+Yocto Project Development Tasks Manual. See also the ":ref:`ref-classes-ptest`"
 section.
 
 .. _migration-1.6-build-changes:
-- 
2.37.2


