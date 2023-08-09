Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ACDEB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 08:14:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.83608.1691568867317026037
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Aug 2023 01:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z4ve6nKC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EAB920009;
	Wed,  9 Aug 2023 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691568865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bMrCg1/ivbgeL3NOwKH8uy6vFVFd8TX+DX3Lvas7yCY=;
	b=Z4ve6nKCLkGAiY3Ix+Fd5W0AmTD5opo1efIv2BZKTLbN4lmGC01spMVCQE8YYwyi6fxMST
	4k5E2jcNOthaRab0o/iSYWtObAbczz0nGpAJLvoJe9iVa/pefTQ5cERXCOuAUmyiZd8IJe
	0GTy+EYQk31jmL+3LTyWPUre91NZ/fkBjGOoXgt+0Pw66VJ6P+g2pbw3t9oFhuR4NOSXfq
	7DcDOOZxoprisbazIRsHvYLHzaNk7HtAS9QJHc9MMgghzoxIMDS7PMxgDfMDWdjNNTXWoh
	u04qQfWzttjGCVyjN7VTPEduEfRJ5Ai0Aa4vth9j1yTEIuWqK69et2jIGyTYMg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] ref-manual: update supported distro versions
Date: Wed,  9 Aug 2023 10:14:21 +0200
Message-Id: <20230809081421.195693-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Aug 2023 08:14:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4119

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

Changes in V2:
- Update with recent update of SANITY_TESTED_DISTROS
  Thanks to this, more recent versions are declared as supported.
---
 .../ref-manual/system-requirements.rst        | 39 ++++++++++++++-----
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 3c2f979a6d..9ae7b4e63b 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -55,28 +55,48 @@ as much RAM and as many CPU cores as possible.
 Supported Linux Distributions
 =============================
 
-Currently, the Yocto Project is supported on the following distributions:
-
--  Ubuntu 18.04 (LTS)
+Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
+supported on the following distributions:
 
 -  Ubuntu 20.04 (LTS)
 
 -  Ubuntu 22.04 (LTS)
 
--  Fedora 36
-
 -  Fedora 37
 
--  AlmaLinux 8.7
+-  Fedora 38
 
--  AlmaLinux 9.1
+-  CentOS Stream 8
 
--  Debian GNU/Linux 11.x (Bullseye)
+-  Debian GNU/Linux 11 (Bullseye)
 
--  OpenSUSE Leap 15.3
+-  Debian GNU/Linux 12 (Bookworm)
 
 -  OpenSUSE Leap 15.4
 
+-  AlmaLinux 8.8
+
+-  AlmaLinux 9.2
+
+The following distribution versions are still tested (being listed
+in :term:`SANITY_TESTED_DISTROS`), even though the organizations
+publishing them no longer make updates publicly available:
+
+-  Ubuntu 18.04 (LTS)
+
+-  Ubuntu 22.10
+
+-  OpenSUSE Leap 15.3
+
+Note that the Yocto Project doesn't have access to private updates
+that some of these versions may have. Therefore, our testing has
+limited value if you have access to such updates.
+
+Finally, here are the distribution versions which were previously
+tested by the &DISTRO; release ("&DISTRO_NAME;"), but no longer are:
+
+*This list is currently empty*
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
@@ -117,7 +137,6 @@ Currently, the Yocto Project is supported on the following distributions:
       and the ":doc:`../contributor-guide/submit-defect`"
       section in the Yocto Project and OpenEmbedded Contributor Guide.
 
-
 Required Packages for the Build Host
 ====================================
 
-- 
2.34.1


