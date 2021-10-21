Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC178C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:25:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.6855.1634808330214088140
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 02:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2AE3E40014;
	Thu, 21 Oct 2021 09:25:27 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] releases.rst: fix release number for 3.3.3
Date: Thu, 21 Oct 2021 11:25:26 +0200
Message-Id: <20211021092526.2033779-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 09:25:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2022

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/releases.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index bb881a2e24..3b9c673aa9 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -11,7 +11,7 @@ Release Series 3.3 (hardknott)
 - :yocto_docs:`3.3 Documentation </3.3>`
 - :yocto_docs:`3.3.1 Documentation </3.3.1>`
 - :yocto_docs:`3.3.2 Documentation </3.3.2>`
-- :yocto_docs:`3.3.2 Documentation </3.3.3>`
+- :yocto_docs:`3.3.3 Documentation </3.3.3>`
 
 *******************************
 Release Series 3.2 (gatesgarth)
-- 
2.25.1


