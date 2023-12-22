Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A75C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 10:58:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.21111.1703242734316128336
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Dec 2023 02:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RDA9o8MG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC557FF818;
	Fri, 22 Dec 2023 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703242732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6/7NnpATcXS4xIBuHfOIG4tbZO6XxKdcH8LVOVOtzjk=;
	b=RDA9o8MGqvDc/LlMVRdnDJthE4LmGuM5k0ZybKGTPEPxC1yOCdz3noBUkRKdM38oXo6IOD
	AnSkmwv+up6/ZDxN1BTL0KCd92PBV0nPxdnMbbqd4+kYIRIBsBOccxUIkXQFoXIbSwng+V
	PUPiHpCXqAuWKTU2e9IyoLJgutmRuaWVGgNLuC8AoxrkGyIwKz820+Ef4KwoBCZsOD2Gvb
	DR2X16j/R3sP88ca6bAp1Mq6/mHqO/SXho0oKLSxA4JrbX+LfXH7MQ9azq4w/10uDljpob
	JSz2fOXlc3b8iW3l7jp8xeJ+VZDPNId8FmsSm5Hk0D14+bWzXU9/fV9awYXGnA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [dunfell][PATCH v2] ref-manual: update tested and supported distros
Date: Fri, 22 Dec 2023 11:58:49 +0100
Message-Id: <20231222105849.805366-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Dec 2023 10:58:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4736

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
Changes in V2:
- Replace AlmaLinux 8.8 and 9.2 by just AlmaLinux 8 and 9
---
 .../ref-manual/ref-system-requirements.rst     | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 3791d1bb09..efb60e1009 100644
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
 
--  AlmaLinux 8.8
+-  AlmaLinux 8
 
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
@@ -95,9 +93,7 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
 -  OpenSUSE Leap 15.2
 
--  AlmaLinux 8.5
-
--  AlmaLinux 8.7
+-  OpenSUSE Leap 15.3
 
 .. note::
 
-- 
2.34.1


