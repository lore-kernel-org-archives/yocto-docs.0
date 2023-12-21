Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F707C46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:54:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.52398.1703170431651982004
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 06:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vp+b98az;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BC3740004;
	Thu, 21 Dec 2023 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703170429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N81joFF1vFPGAHjudExKNm/2/nptDua44nFDM4nPnEQ=;
	b=Vp+b98azbAs7Pt2F8kKsOLDiK7YhIvrZS2PDPQ1RPY0A5onrOPVbynLl1MSbt3TQhdnAoR
	etUgj07So0cirQx2Tvxau62OzUaJfBwzBk9tWAlx3YvNSIpuR0aM9GiTvqIq++XD9OZ3ay
	YTfsRUcrgnQuiw4qCGGYjpBAtE27rJH+TZukF4ST5EhwG4N7CJ2D50dBVxEnyjlsBOcNFd
	ejLDr0FvpXLbMUOpVDy6LyUIJw4HBs1y42WzN7iApdli28on2jadm3Tl/WuLuEaL6BsY0c
	oDzf0wR/YJscps/FTCHK0bhYz7nwlNcQoY1SO5mTvXMukCEJgYIiWdtBN7/z4A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH] ref-manual: update tested and supported distros
Date: Thu, 21 Dec 2023 15:53:46 +0100
Message-Id: <20231221145346.760708-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Dec 2023 14:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4729

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to currently active workers
https://autobuilder.yoctoproject.org/typhoon/#/workers
and to the "workers_prev_releases" definition
in https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py

Also correct the text saying that SANITY_TESTED_DISTROS
lists currently tested distros.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 2527b5bdb6..4e4c4a9bdf 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -41,20 +41,17 @@ supported on the following distributions:
 
 -  Ubuntu 22.04 (LTS)
 
--  Fedora 37
+-  Fedora 38
 
 -  Debian GNU/Linux 11.x (Bullseye)
 
 -  AlmaLinux 8.8
 
-The following distribution versions are still tested (being listed
-in :term:`SANITY_TESTED_DISTROS`), even though the organizations
-publishing them no longer make updates publicly available:
+The following distribution versions are still tested, even though the
+organizations publishing them no longer make updates publicly available:
 
 -  Ubuntu 18.04 (LTS)
 
--  OpenSUSE Leap 15.3
-
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has
 limited value if you have access to such updates.
@@ -72,6 +69,8 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
 -  Fedora 36
 
+-  Fedora 37
+
 -  CentOS 7.x
 
 -  CentOS 8.x
@@ -84,6 +83,8 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
 -  Debian GNU/Linux 10.x (Buster)
 
+-  OpenSUSE Leap 15.3
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
-- 
2.34.1


