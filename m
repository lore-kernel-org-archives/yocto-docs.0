Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E376EC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 14:45:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.9674.1637333118526085092
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 06:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 22D2F20015;
	Fri, 19 Nov 2021 14:45:15 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [honister] ref-manual: drop support for Ubuntu 16.04
Date: Fri, 19 Nov 2021 15:45:14 +0100
Message-Id: <20211119144514.1902270-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Nov 2021 14:45:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2165

There are no more free updates to Ubuntu 16.04
We can no longer test the latest updates to this distro.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index d12e8dfbe3..c2dabb0a65 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -37,8 +37,6 @@ Supported Linux Distributions
 Currently, the Yocto Project is supported on the following
 distributions:
 
--  Ubuntu 16.04 (LTS)
-
 -  Ubuntu 18.04 (LTS)
 
 -  Ubuntu 20.04 (LTS)
-- 
2.25.1


