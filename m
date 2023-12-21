Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93170C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:14:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.52847.1703171683102733236
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 07:14:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jFwpM5hu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82C62FF80E;
	Thu, 21 Dec 2023 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703171680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n2WwqJsjW9EKUUpaxA5waIZ/Br5YTQyz71dAZjbXX/Y=;
	b=jFwpM5huPNpnUbXKv1qqg8y+aJ7h7hI8s48KaqG4g2bY/Pg7pepBE6ShzhcJqBy7pmytdm
	qef/YyGOhMw4VQ9BazkiL0fwUHvbM3BMYu0dfFxIvC7HaKjyR1SUEwlaJwuVUgCdGCyIqC
	vWfU+ldZkqE6Ckr43pEV3oZ5b/wk7XQxx+Mcl/hyGru5D5k6hl2OdC4CkAyuSbbl+byvFa
	93eyovZf1KuU1fsvCsETLu93N3T/ldd8EfzQEHJ+CbFlqEt1as8J0V9qXyXucQb2g4UpOf
	+X07R73/4d7PoyV61sgkROgBc31Sp7p7Cg6+hzHfmnal1YnNy/6hAnuxdzEcwQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: update tested and supported distros
Date: Thu, 21 Dec 2023 16:14:38 +0100
Message-Id: <20231221151438.762727-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Dec 2023 15:14:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4731

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to currently active workers
https://autobuilder.yoctoproject.org/typhoon/#/workers

Also correct the text saying that SANITY_TESTED_DISTROS
lists currently tested distros.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e1ff51c859..931ffa25e0 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -62,8 +62,6 @@ supported on the following distributions:
 
 -  Ubuntu 22.04 (LTS)
 
--  Fedora 37
-
 -  Fedora 38
 
 -  CentOS Stream 8
@@ -78,15 +76,14 @@ supported on the following distributions:
 
 -  AlmaLinux 9.2
 
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


