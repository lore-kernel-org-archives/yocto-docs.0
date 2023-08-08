Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5BEC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 09:17:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.57611.1691486234346460282
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 02:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ERochdRC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BF9D1C000A;
	Tue,  8 Aug 2023 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691486232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k2s8c5I6afqyy4J+CrA2nFirAwxWzXe7PgiQia5aFUk=;
	b=ERochdRCh+mEAy8Z/4vkbOzyo3EWN5TNG6nxIO85NYk62Vsq1+JXz2nYyRUKJO/bftF75S
	ASNdYPYCWOsabYMBXH56VJXtNDHIw7tjXr2FWlwR2PmbNUIMd4saDlM5dicXtqYpuVIvNM
	N1JM6EoeWw+MXaLh3dqRpv4kX1DKCvBBg5PoLbP195VtzpOPgvPrkbhqkiyVqYH74nc7wz
	EZDtMopG/jlv5PaNqQtuum2glWNQaOsXfQUB7Qv8dXSEJsB2W3Jnqlf9kRfj5wflDQ2zGu
	6cDYZTthnvK2xgU2ltbS5/9MP0DtcpufR0u9qaGNcO6jN4akSK5V1W5Lp4tCag==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [dunfell] ref-manual: ref-system-requirements: update supported distros
Date: Tue,  8 Aug 2023 11:17:03 +0200
Message-Id: <20230808091703.144011-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Aug 2023 09:17:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4112

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Update according to changes in SANITY_TESTED_DISTROS
  (meta-poky/conf/distro/poky.conf)

- No longer declare as "Supported" the distributions versions
  which are End of Life for their vendors, as some of them
  (Ubuntu for example) ship updates to subscribers only,
  which the Yocto Project has no access to.

- List distribution versions which were previously tested
  for the branch of the Yocto Project being considered.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../ref-manual/ref-system-requirements.rst    | 34 ++++++++++++-------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index ac963dcdb9..d45a88efa5 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -34,22 +34,27 @@ and conceptual information in the :doc:`../overview-manual/overview-manual`.
 Supported Linux Distributions
 =============================
 
-Currently, the Yocto Project is supported on the following
-distributions:
+Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
+supported on the following distributions:
 
--  Ubuntu 16.04 (LTS)
-
--  Ubuntu 18.04 (LTS)
-
--  Ubuntu 19.04
 
 -  Ubuntu 20.04
 
 -  Ubuntu 22.04
 
--  Fedora 28
+-  CentOS 7.x
 
--  Fedora 29
+-  Debian GNU/Linux 11.x (Bullseye)
+
+The following distribution versions are still tested (being listed
+in :term:`SANITY_TESTED_DISTROS`), even though the organizations
+publishing them no longer make updates publicly available:
+
+-  Ubuntu 16.04 (LTS)
+
+-  Ubuntu 18.04 (LTS)
+
+-  Ubuntu 19.04
 
 -  Fedora 30
 
@@ -65,7 +70,7 @@ distributions:
 
 -  Fedora 36
 
--  CentOS 7.x
+-  CentOS 8.x
 
 -  Debian GNU/Linux 8.x (Jessie)
 
@@ -73,8 +78,6 @@ distributions:
 
 -  Debian GNU/Linux 10.x (Buster)
 
--  Debian GNU/Linux 11.x (Bullseye)
-
 -  OpenSUSE Leap 15.1
 
 -  OpenSUSE Leap 15.2
@@ -85,6 +88,13 @@ distributions:
 
 -  AlmaLinux 8.7
 
+Finally, here are the distribution versions which were previously
+tested by the &DISTRO; release ("&DISTRO_NAME;"), but no longer are:
+
+-  Fedora 28
+
+-  Fedora 29
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
-- 
2.34.1


