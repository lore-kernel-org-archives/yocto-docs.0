Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF58C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:04:20 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.52649.1703171058595785637
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 07:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gGU2SZEt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C304D60009;
	Thu, 21 Dec 2023 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703171056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gLYeJAhhx6Ah4fB8/3DzJmx/zh3K3Eb2Gz6/B1yfT5Y=;
	b=gGU2SZEtw6MAhBdREkZk9/VieLKA/CUQMxBijW2lHr60x2nLz+wl/RD76TwP789LA85He1
	cuE7S0uBzbBVM8HXVefqqKXy3dHoRMQ/yU8+8A0aCtZ1sEtL4XIp7vtKungRlAMYYofo4M
	iJRsmhz/s+TKQQyFNxSRP1WhX+mzlJeEeWIrxiuFU2E25m6NN/9VK9kjZfNsVygXo6R7z3
	ZDaQRUMXRoCmLtrZdNlPjREtlzrYdlCjw660j+SnZc508k2WpHrfSziDdytKHYBDbuxaa3
	9zW4p+5QeGxn+ejSopSjsoBE30/xkKwp0LZHb5/527xg0D3snBRvYEU+Mqquuw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH] ref-manual: update tested and supported distros
Date: Thu, 21 Dec 2023 16:04:14 +0100
Message-Id: <20231221150414.761686-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Dec 2023 15:04:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4730

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to currently active workers
https://autobuilder.yoctoproject.org/typhoon/#/workers
and to the "workers_prev_releases" definition
in https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py

Also correct the text saying that SANITY_TESTED_DISTROS
lists currently tested distros.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../ref-manual/system-requirements.rst        | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e1ff51c859..4dabb67ca2 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -62,12 +62,8 @@ supported on the following distributions:
 
 -  Ubuntu 22.04 (LTS)
 
--  Fedora 37
-
 -  Fedora 38
 
--  CentOS Stream 8
-
 -  Debian GNU/Linux 11 (Bullseye)
 
 -  Debian GNU/Linux 12 (Bookworm)
@@ -78,15 +74,16 @@ supported on the following distributions:
 
 -  AlmaLinux 9.2
 
-The following distribution versions are still tested (being listed
-in :term:`SANITY_TESTED_DISTROS`), even though the organizations
-publishing them no longer make updates publicly available:
+-  Rocky 9
+
+The following distribution versions are still tested, even though the
+organizations publishing them no longer make updates publicly available:
 
 -  Ubuntu 18.04 (LTS)
 
--  Ubuntu 22.10
+-  Ubuntu 23.04
 
--  OpenSUSE Leap 15.3
+-  CentOS Stream 8
 
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


