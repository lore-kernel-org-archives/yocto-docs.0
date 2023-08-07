Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAE7C001DE
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 18:47:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.43196.1691434036356978701
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Aug 2023 11:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V1QQWhZk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44E0EFF803;
	Mon,  7 Aug 2023 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691434034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W8JP6KKwzVH5vQXfC9jjqdtnm8+5lLXcTul7k7IwajU=;
	b=V1QQWhZkDV6zA3+/9LZm4oU0v701TRCVZcbnsufcSaeJJYtTkJLWjgdc9fSVMXQ5s0t2b1
	ssVNno0CyPGhSm7TlZEbSNP8Lr6ga7MbBGB0z4Rt9mKjTueBDbYxIu9xD0rNQ8NbqxWHqs
	q0WXxzyt7x5XImKzssCp+r/TUlzBDKfY0Qw5x3jum6zN7V1Gb9ZNZR+eTxyUFUYDlM2rv2
	cSTpXzJvzml3lhLyy2XQZ8gftp0OdjboEwkkMZG01IcsBY8Pvbhz1B4LenkUnBbM79F3gM
	bp8zNqoiQVmYQteYSa9ypDpOkJEaXOO/fxkQbtHntw78boqodXL+iV+9NluWxw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [kirkstone] ref-manual: system-requirements: update supported distros
Date: Mon,  7 Aug 2023 20:47:10 +0200
Message-Id: <20230807184710.109051-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Aug 2023 18:47:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4108

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
 .../ref-manual/system-requirements.rst        | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 060a5dde02..1a05965576 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -34,15 +34,27 @@ and conceptual information in the :doc:`/overview-manual/index`.
 Supported Linux Distributions
 =============================
 
-Currently, the Yocto Project is supported on the following
-distributions:
-
--  Ubuntu 18.04 (LTS)
+Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
+supported on the following distributions:
 
 -  Ubuntu 20.04 (LTS)
 
 -  Ubuntu 22.04 (LTS)
 
+-  Debian GNU/Linux 11.x (Bullseye)
+
+-  OpenSUSE Leap 15.3
+
+The following distribution versions are still tested (being listed
+in :term:`SANITY_TESTED_DISTROS`), even though the organizations
+publishing them no longer make updates publicly available:
+
+-  Ubuntu 16.04 (LTS)
+
+-  Ubuntu 18.04 (LTS)
+
+-  Ubuntu 21.10
+
 -  Fedora 34
 
 -  Fedora 35
@@ -61,9 +73,14 @@ distributions:
 
 -  Debian GNU/Linux 10.x (Buster)
 
--  Debian GNU/Linux 11.x (Bullseye)
+Note that the Yocto Project doesn't have access to private updates
+that some of these versions may have. Therefore, our testing has
+limited value if you have access to such updates.
 
--  OpenSUSE Leap 15.3
+Finally, here are the distribution versions which were previously
+tested by the &DISTRO; release ("&DISTRO_NAME;"), but no longer are:
+
+*This list is currently empty*
 
 .. note::
 
-- 
2.34.1


