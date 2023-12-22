Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1862CC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 10:50:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.20716.1703242196861945170
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Dec 2023 02:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jBY+yjSG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7488E0004;
	Fri, 22 Dec 2023 10:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703242195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vCVbwnnpJ/aPx68XYMyUgPUeLw178aFddAWlbLdEfrs=;
	b=jBY+yjSG39m8+ahXOiFY2N7WyqtD7kZU2cuhNFmirRdzAXIblp88T9nwAMTD51mZlBqOi3
	k1g4bLuzF2t61L68FDdF4Y93Zuw93ODKXZKzPf4ou9B81MzIzYB5d25hwgzDPICHxnI2R1
	KtMZC2UVwciW9da2Na8ILPPd/pOyaAvPs8ntre0acjs1K9ib9oCSfEu+BA7zCzj9HCs1tm
	hoHnLTMY/3xKDmW7JJPDeJ/wnU1nt3U90qzKOIFr+HEjEzi+4PquV9oN/saak8uyLXx2Df
	Gi2dTERg2WBhFJMLS5LQmEd1TqU75Aw1v+ZSsAYNy4l0LImNbDdD267/HsQX2Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] ref-manual: update tested and supported distros
Date: Fri, 22 Dec 2023 11:49:50 +0100
Message-Id: <20231222104950.804178-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Dec 2023 10:50:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4733

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to currently active workers
https://autobuilder.yoctoproject.org/typhoon/#/workers

Also correct the text saying that SANITY_TESTED_DISTROS
lists currently tested distros.

Also replace AlmaLinux 8.8 and 9.2 by just AlmaLinux 8 and 9,
as we update our workers anyway.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---
Changes in V2:
- Replace AlmaLinux 8.8 and 9.2 by just AlmaLinux 8 and 9
---
 .../ref-manual/system-requirements.rst          | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e1ff51c859..9e2dd532f9 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -62,8 +62,6 @@ supported on the following distributions:
 
 -  Ubuntu 22.04 (LTS)
 
--  Fedora 37
-
 -  Fedora 38
 
 -  CentOS Stream 8
@@ -74,19 +72,18 @@ supported on the following distributions:
 
 -  OpenSUSE Leap 15.4
 
--  AlmaLinux 8.8
+-  AlmaLinux 8
 
--  AlmaLinux 9.2
+-  AlmaLinux 9
 
-The following distribution versions are still tested (being listed
-in :term:`SANITY_TESTED_DISTROS`), even though the organizations
-publishing them no longer make updates publicly available:
+-  Rocky 9
 
--  Ubuntu 18.04 (LTS)
+The following distribution versions are still tested, even though the
+organizations publishing them no longer make updates publicly available:
 
--  Ubuntu 22.10
+-  Ubuntu 18.04 (LTS)
 
--  OpenSUSE Leap 15.3
+-  Ubuntu 23.04
 
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has
-- 
2.34.1


