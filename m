Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F035C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 08:15:32 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.9035.1633508130892589265
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 01:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 194D4240007;
	Wed,  6 Oct 2021 08:15:28 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: correct NO_GENERIC_LICENSE section title
Date: Wed,  6 Oct 2021 10:15:25 +0200
Message-Id: <20211006081525.952523-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 08:15:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1920

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b81f51bf83..bcc8d056c0 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11159,8 +11159,8 @@ For more usage information refer to :yocto_git:`the meta-spdxscanner repository
 </meta-spdxscanner/>`.
 
 
-Copying Licenses that Do Not Exist
-----------------------------------
+Copying Non Standard Licenses
+-----------------------------
 
 Some packages, such as the linux-firmware package, have many licenses
 that are not in any way common. You can avoid adding a lot of these
-- 
2.25.1


