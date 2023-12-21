Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676B1C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:38:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.52641.1703169512383337559
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 06:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GWlUUIHJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E796FFF812;
	Thu, 21 Dec 2023 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703169510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CiyIdeAMtluPQ5v1UwJgAboN1CbShqHwxujfHNDTUaU=;
	b=GWlUUIHJmBlyEhOXqO8mLBBP5XOM7pyCMNHtq98Qr0ZPglw3imbHkmytidIcbGMby1fXuq
	HG7BGfhnwQss8snuVE6g3RrNw2i3aaW1f/2mUu4RyXow5O4g8DJ2r5uY8CQyROeXBazTVw
	XAE/Oe33pnzQ8nr1xu1IIktJZQRdYrSXDtqsRhgN64of9CH7Ra344EHS6ZjdDxpU3U4LhD
	VkzMAB/OmzFxeWFRj0uP0VSeK/ATjRyEFUUgtWFq/w8owGvgKLPMP4IjNdHh+5YD9wnpr6
	7hOy1PYkEXgCF1lMfo8F+O27CtNFT1T8HYQvcZnlouni69eP8g3c5Yu+8XcwDA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [dunfell][PATCH] ref-manual: update tested and supported distros
Date: Thu, 21 Dec 2023 15:38:27 +0100
Message-Id: <20231221143827.759117-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Dec 2023 14:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4728

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to currently active workers
https://autobuilder.yoctoproject.org/typhoon/#/workers
and to the "workers_prev_releases" definition
in https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py

Also correct the text saying that SANITY_TESTED_DISTROS
lists currently tested distros.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../ref-manual/ref-system-requirements.rst         | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 3791d1bb09..fd5cff3f28 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -37,25 +37,21 @@ Supported Linux Distributions
 Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
 supported on the following distributions:
 
-
 -  Ubuntu 20.04 (LTS)
 
 -  Ubuntu 22.04 (LTS)
 
--  Fedora 37
+-  Fedora 38
 
 -  Debian GNU/Linux 11.x (Bullseye)
 
 -  AlmaLinux 8.8
 
-The following distribution versions are still tested (being listed
-in :term:`SANITY_TESTED_DISTROS`), even though the organizations
-publishing them no longer make updates publicly available:
+The following distribution versions are still tested even though the
+organizations publishing them no longer make updates publicly available:
 
 -  Ubuntu 18.04 (LTS)
 
--  OpenSUSE Leap 15.3
-
 Finally, here are the distribution versions which were previously
 tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
@@ -81,6 +77,8 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
 -  Fedora 36
 
+-  Fedora 37
+
 -  CentOS 7.x
 
 -  CentOS 8.x
@@ -95,6 +93,8 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
 -  OpenSUSE Leap 15.2
 
+-  OpenSUSE Leap 15.3
+
 -  AlmaLinux 8.5
 
 -  AlmaLinux 8.7
-- 
2.34.1


