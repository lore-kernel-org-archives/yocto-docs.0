Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53BCC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 17:30:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.12121.1637343003780207010
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 09:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 92D7C24000B;
	Fri, 19 Nov 2021 17:29:55 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [honister] ref-manual: update system requirements
Date: Fri, 19 Nov 2021 18:29:53 +0100
Message-Id: <20211119172953.1973081-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Nov 2021 17:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2171

Assuming the same support status as on the development version.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index d12e8dfbe3..5c15b6de56 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -37,17 +37,13 @@ Supported Linux Distributions
 Currently, the Yocto Project is supported on the following
 distributions:
 
--  Ubuntu 16.04 (LTS)
-
 -  Ubuntu 18.04 (LTS)
 
 -  Ubuntu 20.04 (LTS)
 
--  Fedora 30
-
--  Fedora 31
+-  Fedora 33
 
--  Fedora 32
+-  Fedora 34
 
 -  CentOS 7.x
 
@@ -61,6 +57,7 @@ distributions:
 
 -  openSUSE Leap 15.1
 
+-  openSUSE Leap 15.2
 
 .. note::
 
-- 
2.25.1


