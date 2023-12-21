Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9CFC46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:18:20 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.52949.1703171898875829803
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 07:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KBOUhUWV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8437F60003;
	Thu, 21 Dec 2023 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703171896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/vVlNMU9RJ0Z8xKPmt/agc2xBEKbkSh1RjWWyxPj5FQ=;
	b=KBOUhUWV8dUAvuU5F6x16P3a1tuEea5cQfaAXsazxc/eXkP9Vr9HIqvETBBQDvxwEfZpCf
	Bd9iaxF2k4pSbcvZm7ngeYTckD9c84kN/g+V+6662iM9cp4yEuPHQmVpf5jLry7sjAgaeH
	HogInntwYWHuCdcxm77bCE4jKcq22z9sAgGCfF6fV3kzsUg3a2/NS1GE7AVlaC+D5p8Hl6
	56qKwpt4AkDtimdY7gbV3vJIXRIVT8hr258YLLrF5yHH1wa0meRWCLahE69aPcblzWPRce
	u0tLdYZ6p2MLgrgJIyaljJkemba4AJNRxuKWc2bnTio7DPlVfD+4E+GxOkdDiw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH v2] ref-manual: update tested and supported distros
Date: Thu, 21 Dec 2023 16:18:12 +0100
Message-Id: <20231221151812.763135-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Dec 2023 15:18:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4732

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to currently active workers
https://autobuilder.yoctoproject.org/typhoon/#/workers
and to the "workers_prev_releases" definition
in https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py

Also correct the text saying that SANITY_TESTED_DISTROS
lists currently tested distros.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---
Changes in V2:
- CentOS Stream 8 is still a supported distribution
---
 .../ref-manual/system-requirements.rst        | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e1ff51c859..bc5e5232db 100644
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


