Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC91C001DF
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 17:13:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.166316.1692206028176609142
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 10:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fhJoRiPk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16C4C1C0002;
	Wed, 16 Aug 2023 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692206026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cNNRX7jfrCVG5aEJKZz5F4wth6hoXt1qzr61I9f4zLI=;
	b=fhJoRiPk8udE4nD4SpD7N5q2Zl6bR9yuBRg0mJ4jwbN/Y4Wv711P7hKBd0999+2aN7JHhO
	USFRFH/zQmA36tfF3n5KQ2SBPu4gG9YBdGklGAlEuulYNP1nzLQauJ1bNCjTLj1ODdfmt+
	nke/FLX0ttyv70V5Hj32rFJuJnv8UnG+mgxxY7NZPW7GHwZhjnCoUe25sLTlQ9Tpizl/DO
	zkAhF68vxHaWxWL5rgmmQrNWVbf1LKMsiXiU9qgG10Vk9Ub1PTT/QY+3lPtHDboBgbPrKX
	jBLdz02LLXAwY140EqSzY37d1I8uaRdC2KFrE6UG8K74DIRERdUCbz6EVu9Bwg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [dunfell][PATCH] ref-manual: ref-system-requirements: update supported distros
Date: Wed, 16 Aug 2023 19:13:32 +0200
Message-Id: <20230816171332.49190-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Aug 2023 17:13:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4152

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
 .../ref-manual/ref-system-requirements.rst    | 34 +++++++++++++------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index ac963dcdb9..3791d1bb09 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -34,18 +34,34 @@ and conceptual information in the :doc:`../overview-manual/overview-manual`.
 Supported Linux Distributions
 =============================
 
-Currently, the Yocto Project is supported on the following
-distributions:
+Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
+supported on the following distributions:
 
--  Ubuntu 16.04 (LTS)
+
+-  Ubuntu 20.04 (LTS)
+
+-  Ubuntu 22.04 (LTS)
+
+-  Fedora 37
+
+-  Debian GNU/Linux 11.x (Bullseye)
+
+-  AlmaLinux 8.8
+
+The following distribution versions are still tested (being listed
+in :term:`SANITY_TESTED_DISTROS`), even though the organizations
+publishing them no longer make updates publicly available:
 
 -  Ubuntu 18.04 (LTS)
 
--  Ubuntu 19.04
+-  OpenSUSE Leap 15.3
 
--  Ubuntu 20.04
+Finally, here are the distribution versions which were previously
+tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
--  Ubuntu 22.04
+-  Ubuntu 16.04 (LTS)
+
+-  Ubuntu 19.04
 
 -  Fedora 28
 
@@ -67,20 +83,18 @@ distributions:
 
 -  CentOS 7.x
 
+-  CentOS 8.x
+
 -  Debian GNU/Linux 8.x (Jessie)
 
 -  Debian GNU/Linux 9.x (Stretch)
 
 -  Debian GNU/Linux 10.x (Buster)
 
--  Debian GNU/Linux 11.x (Bullseye)
-
 -  OpenSUSE Leap 15.1
 
 -  OpenSUSE Leap 15.2
 
--  OpenSUSE Leap 15.3
-
 -  AlmaLinux 8.5
 
 -  AlmaLinux 8.7
-- 
2.34.1


