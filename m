Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8831DC001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 18:29:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.42695.1691432973972987757
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Aug 2023 11:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mM68nS1k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 577CBC0003;
	Mon,  7 Aug 2023 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691432971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vvt/M27R8aqC2yMdKo5xY45eL40RQg5qI0+t4Dv0Ggk=;
	b=mM68nS1kJMvi/TSBBMCMGCFolAj4cYjVgjAvTLr1oe0RHI2lkLaKQz/Wt1zL74YI+6wjmC
	bUdyeH8nFaVLmVBYGbhmU3xAxqvvZzQEQm56ItxF5ksf6SpQEpeQfWmLBfpt6VdIHSwjYZ
	RBJOAZl/DV1PcvA6DOcIoJ3/nfHFie2OQX7nV7EM6fc34sMe0lXiNglN5vehpQ3hdJ6awd
	CgU64PTwt2ymSjqUb7CwyyVFmveMLPY5d/TOeKwVVGLG6mC4Vq7T4q0fC5dszGDyf6GONC
	Qs7bIPmpQsHqwMeujgYjKckObIa8a8sFRJPHALGoqhrlGyO7O/meQ1y29CUmzw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [mickledore] ref-manual: system-requirements: update supported distros
Date: Mon,  7 Aug 2023 20:29:27 +0200
Message-Id: <20230807182927.106792-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Aug 2023 18:29:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4107

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
 .../ref-manual/system-requirements.rst        | 28 ++++++++++++++-----
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index d6e8b4583c..c0df9bd44d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -55,27 +55,41 @@ as much RAM and as many CPU cores as possible.
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
+-  OpenSUSE Leap 15.4
+
+The following distribution versions are still tested (being listed
+in :term:`SANITY_TESTED_DISTROS`), even though the organizations
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
 
-- 
2.34.1


