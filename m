Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D207C7618E
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 20:48:14 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.3768.1678999684238594008
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Mar 2023 13:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MiM4ffqi;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8AC6A240004;
	Thu, 16 Mar 2023 20:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678999681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hyuEPn6Co0djKZ0ZPABp9Y/ageQCeBY+0V0J966/p58=;
	b=MiM4ffqiQhn8y8y3rNhgKhbsjwURtHPsNbvFs5gH5Iue3bWdbkVBZV9WT7HjaNc/obl7CS
	DtMXiAwAAiPuk4JPzBEBf83tM1MmlZjC2QvBNXYPIoDKA2HKaArjAkuZtPX8at4TdwJ0QS
	Ix7ByNW2m3uyOaSQOrHEaQvSOac0aMkxMsQ3+zwfKB1Cg/D15odoDG+6LJPQEsBu66ciJN
	CE3guUijWTVG077lN3CQSEm3y8iMIHqDIPBIN4v4GnT8hU1xX2WtrPpqukflGnyupiV9lM
	ZDbjs5MlIeateQPLR+wrW5McclLfbvecHEhTs0H+2B1TDzHNKeAtsLrrtt+Zqw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] manuals: update disk space requirements
Date: Thu, 16 Mar 2023 21:47:49 +0100
Message-Id: <20230316204750.4156695-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Mar 2023 20:48:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3801

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Tests made on Poky master on March 16, 2023.

Add a "Free Disk Space" section to the "System Requirements" document.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     | 2 +-
 documentation/poky.yaml.in                       | 2 ++
 documentation/ref-manual/system-requirements.rst | 9 +++++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7b8baf233a..5410036a30 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -40,7 +40,7 @@ Compatible Linux Distribution
 Make sure your :term:`Build Host` meets the
 following requirements:
 
--  50 Gbytes of free disk space
+-  &MIN_DISK_SPACE; Gbytes of free disk space
 
 -  Runs a supported Linux distribution (i.e. recent releases of Fedora,
    openSUSE, CentOS, Debian, or Ubuntu). For a list of Linux
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 30e1050824..7810b8d2a5 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -41,3 +41,5 @@ MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
 MIN_GCC_VERSION : "7.5"
 MIN_MAKE_VERSION : "4.0"
+# Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64), rounded up from 87
+MIN_DISK_SPACE : "90"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 0fbe3f12c8..1add92e85d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -31,6 +31,15 @@ and conceptual information in the :doc:`/overview-manual/index`.
 
 .. _detailed-supported-distros:
 
+Free Disk Space
+===============
+
+To build an image such as ``core-image-sato``, you need a system with at least
+&MIN_DISK_SPACE; Gbytes of free disk space.
+
+If you have a shortage of disk space, see the ":doc:`/dev-manual/disk-space`"
+section of the Development Tasks Manual.
+
 Supported Linux Distributions
 =============================
 
-- 
2.34.1


