Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437DAC433FE
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 09:55:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.9626.1633514142515676597
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 02:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5A6E840011;
	Wed,  6 Oct 2021 09:55:40 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] overview-manual: simplify expression
Date: Wed,  6 Oct 2021 11:55:34 +0200
Message-Id: <20211006095535.955535-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 09:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1925

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 1ac6abe22b..89a5eb49fb 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1614,7 +1614,7 @@ them if they are deemed to be valid.
       section in the Yocto Project Development Tasks Manual.
 
    -  The code in the build system that supports incremental builds is
-      not simple code. For techniques that help you work around issues
+      complex. For techniques that help you work around issues
       related to shared state code, see the
       ":ref:`dev-manual/common-tasks:viewing metadata used to create the input signature of a shared state task`"
       and
-- 
2.25.1


