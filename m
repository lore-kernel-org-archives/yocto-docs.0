Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281E3C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 17:12:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.12034.1637341971825419882
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 09:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 21134C000B;
	Fri, 19 Nov 2021 17:12:48 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: drop support for Fedora 30-32
Date: Fri, 19 Nov 2021 18:12:46 +0100
Message-Id: <20211119171246.1972676-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Nov 2021 17:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2169

These versions have reached their end of life
and we don't test them any more.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index c92b3b0770..1d4c0e3b63 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -43,12 +43,6 @@ distributions:
 
 -  Ubuntu 20.04 (LTS)
 
--  Fedora 30
-
--  Fedora 31
-
--  Fedora 32
-
 -  Fedora 33
 
 -  Fedora 34
-- 
2.25.1


