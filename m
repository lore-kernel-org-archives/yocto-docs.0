Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F434C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 10:54:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.21055.1703242454507705730
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Dec 2023 02:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J+D5rAai;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83E2E1BF20B;
	Fri, 22 Dec 2023 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703242452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ScURNS7XH+fGnkaqMl+SiQa80cBoeiX7cXeNcm29xnI=;
	b=J+D5rAaicL9tpFkAi8VrCqIEnkrxTTwczMd7B9esIlAf2LnTx+/83zn56BkkYxEy/4y2UV
	mNcvvRWWD1NYfvGE0QQPjfnaMdEv2u5X9YGsbLhPnMAbeC8sYb/mflPIwOronjxIw6h3ib
	AkdERvctUqTr3S8Pnkz7ddwKSh25W2XtuAXSk6ZNooKrFKsUTek+kltNiuM/4kBzePCUcC
	VhrJ3GHnJ14Wjofu4797sULJX/QXaa5WXLkIaeuK519YhCxyDHW042CiJhs76MVh2vnPpO
	V3xDFoHpntBYpgQP1gTZOgSY2E9+jBhe2jnO/QJ47VZu8Rsy9k4f+Hdwm7cUlQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH v3] ref-manual: update tested and supported distros
Date: Fri, 22 Dec 2023 11:54:10 +0100
Message-Id: <20231222105410.804763-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Dec 2023 10:54:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4734

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to currently active workers
https://autobuilder.yoctoproject.org/typhoon/#/workers
and to the "workers_prev_releases" definition
in https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py

Also correct the text saying that SANITY_TESTED_DISTROS
lists currently tested distros.

Also replace AlmaLinux 8.8 and 9.2 by just AlmaLinux 8 and 9,
as we update our workers anyway.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---
Changes in V3:
- Replace AlmaLinux 8.8 and 9.2 by just AlmaLinux 8 and 9

Changes in V2:
- CentOS Stream 8 is still a supported distribution
---
 .../ref-manual/system-requirements.rst        | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e1ff51c859..9dee24a1fa 100644
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
@@ -95,7 +92,11 @@ limited value if you have access to such updates.
 Finally, here are the distribution versions which were previously
 tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
-*This list is currently empty*
+-  Ubuntu 22.10
+
+-  Fedora 37
+
+-  OpenSUSE Leap 15.3
 
 .. note::
 
-- 
2.34.1


