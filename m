Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3181C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 09:51:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.17677.1693907486621962224
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 02:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IKTbYM8d;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF519FF80B;
	Tue,  5 Sep 2023 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693907484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Dsr0oBcutSRyvG1pd7AyQHTVgdswWKqjZzyC1AjT9xk=;
	b=IKTbYM8dknY1NrShPaD/JmyRkvv8z0xpHTxiEC7rNM55N6rwDOawpJCk/kGUlC3JBSqYLM
	SAyR5SpVglykJhqzbLtt49CR5wpSA1NUaEPgHpq5FKut+SvSxY1fa49DKCPA1dTXWmykAj
	907KZYjA2fsgKscI12aAibzCVKnnTX1bAi3p2IidjxiWqTTX0ASWz54o4Yf8ko40JOFl2y
	Du/ItCeNpYent+gJp5OaRkWH127OeS4UbYUFK5TkAxYSzTnuLlgg0Lv1RVhKfUhomXqmuS
	6t4EOg905O2LRYAkERI1wQOMjUlUnBb8gcBiIyqSag83EfQplUaPbjxV8wmlzA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH] ref-manual: system-requirements: update supported distros
Date: Tue,  5 Sep 2023 11:51:21 +0200
Message-Id: <20230905095121.90970-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Sep 2023 09:51:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4189

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
 .../ref-manual/system-requirements.rst        | 38 ++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index d6e8b4583c..fe6de4b3da 100644
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
+tested on former revisions of "&DISTRO_NAME;", but no longer are:
+
+*This list is currently empty*
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
-- 
2.34.1


