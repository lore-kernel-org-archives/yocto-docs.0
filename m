Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AD8EB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 12:50:58 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.13940.1691067050738288041
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 05:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L6zrwI+q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7D6620012;
	Thu,  3 Aug 2023 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691067048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZnOFZB1PqfJY9srsIOz9faThu+SLzpgLR6KOjZipQUM=;
	b=L6zrwI+qTM1tFAcetOwpyRJy3D8FmT/EQSGf3mKUc3cjMMK+HbMUslC19uzSd/jg5taM6f
	LkSxPYpB713MOy81Z0a+V/GZC86NNGMGkwb8/jLTlBCFobwbbrVAtssT6GudfEFY578qbF
	raHKEN5WmD9Kg9n928jhrv4ixiP8qoHM5umlbPyMQbEi4TBzI8WVZgZrbJ7gmfq3GRI5Bs
	u1lIbvMPPsF3DIMDZTTMWL955622pTM5RMk2HwU1tq635XATe8klQtO+mbOG+lTYNc9TqG
	6fxWJNfn38B8dZe07cNfwRHQnsbUeCV54oxtsvBuSU1GAXEEILJbmZvRTRCVzw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: update supported distro versions
Date: Thu,  3 Aug 2023 14:50:43 +0200
Message-Id: <20230803125043.3025475-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Aug 2023 12:50:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4105

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Update according to changes in SANITY_TESTED_DISTROS
  (meta-poky/conf/distro/poky.conf)

- No longer declare as "Supported" the distributions versions
  which are End of Life for their vendors, as some of them
  (Ubuntu for example) ship updates to subscribers only,
  which the Yocto Project has no access to.

- List distribution versions which were previously tested
  for the branch of the Yocto Project being considered
  (should be an empty list on master, until the next
  release is made).

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../ref-manual/system-requirements.rst        | 31 ++++++++++++++-----
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 3c2f979a6d..ff26d68709 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -55,27 +55,43 @@ as much RAM and as many CPU cores as possible.
 Supported Linux Distributions
 =============================
 
-Currently, the Yocto Project is supported on the following distributions:
-
--  Ubuntu 18.04 (LTS)
+Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
+supported on the following distributions:
 
 -  Ubuntu 20.04 (LTS)
 
 -  Ubuntu 22.04 (LTS)
 
+-  Fedora 37
+
+-  Debian GNU/Linux 11 (Bullseye)
+
+-  Debian GNU/Linux 12 (Bookworm)
+
+-  OpenSUSE Leap 15.4
+
+The following distribution versions are still tested (being listed
+in :term:`SANITY_TESTED_DISTROS`, even though the organization
+publishing them no longer make updates publicly available:
+
+-  Ubuntu 18.04 (LTS)
+
 -  Fedora 36
 
--  Fedora 37
+-  OpenSUSE Leap 15.3
 
 -  AlmaLinux 8.7
 
 -  AlmaLinux 9.1
 
--  Debian GNU/Linux 11.x (Bullseye)
+Note that the Yocto Project doesn't have access to private updates
+that some of these versions may have. Therefore, our testing has
+limited value if you have access to such updates.
 
--  OpenSUSE Leap 15.3
+Finally, here are the distribution versions which were previously
+tested by the &DISTRO; release ("&DISTRO_NAME;"), but no longer are:
 
--  OpenSUSE Leap 15.4
+*This list is currently empty*
 
 .. note::
 
@@ -117,7 +133,6 @@ Currently, the Yocto Project is supported on the following distributions:
       and the ":doc:`../contributor-guide/submit-defect`"
       section in the Yocto Project and OpenEmbedded Contributor Guide.
 
-
 Required Packages for the Build Host
 ====================================
 
-- 
2.34.1


