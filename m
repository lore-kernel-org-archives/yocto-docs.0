Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E74C0015E
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 09:09:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.38748.1691744968961641522
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 02:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aVaLaNHh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 757824000A;
	Fri, 11 Aug 2023 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691744967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oshqusyqMjcJEG5Zqc6/4a9g8brV6WZMcu4EXtDzRsc=;
	b=aVaLaNHh059ccvbPXg+ZKaLQxdjOMJ81WwC7DlQVu4u1IyDRnH+JmY7UMvaG84dMSyiZqU
	ZtoQQyOmneKzM6TitKg95D7daD4wyqLPyay+U8MFhxuC1TT9RAeqCiJGrsRIBaTIwIzjGw
	zBcMhvlAXGLaUBu9rwPxdDPPRP+gi0mKSsPyuBV2BT6oBq7RX04QZKy4MF6xOPzpnIvu69
	QZi/KB095aWx5oAS0JQHHhWkAKweqzxUSLbAQVSWZue3BMYfq1sUKK7frDQpOjioArOBZi
	LcyKnHPBCH7u+q5pJw0YoFvJNaYu0+bcka+rH3J8xLLj2tU+ebWgVuvWHKJoqw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Yoann CONGAL <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Josef Holzmayr <jester@theyoctojester.info>
Subject: [PATCH] dev-manual: disk-space: mention faster "find" command to trim sstate cache
Date: Fri, 11 Aug 2023 11:09:20 +0200
Message-Id: <20230811090920.1095076-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 09:09:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4142

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #15182]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Yoann CONGAL <yoann.congal@smile.fr>
Reported-by: Randy MacLeod <randy.macleod@windriver.com>
Reported-by: Josef Holzmayr <jester@theyoctojester.info>
---
 documentation/dev-manual/disk-space.rst | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index c63591cc7a..670f3d2792 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -27,19 +27,25 @@ Purging Duplicate Shared State Cache Files
 ==========================================
 
 After multiple build iterations, the Shared State (sstate) cache can contain
-duplicate cache files for a given package, while only the most recent one
-is likely to be reusable. The following command purges all but the
-newest sstate cache file for each package::
+duplicate cache files for a given package, consuming a substantial amount of
+disk space. However, only the most recent cache files are likeky to be reusable.
 
-   sstate-cache-management.sh --remove-duplicated --cache-dir=build/sstate-cache
+The following command is a quick way to purge all the cache files which
+are older than a specified number of days::
 
-This command will ask you to confirm the deletions it identifies.
+   find build/sstate-cache -type f -atime +$DAYS -delete
 
-.. note::
+OpenEmbedded-Core also offers a command which can be used to look for
+cache files only for enabled architectures, and purge all but the newest
+ones on each architecture::
 
-   The duplicated sstate cache files of one package must have the same
-   architecture, which means that sstate cache files with multiple
-   architectures are not considered as duplicate.
+   sstate-cache-management.sh --remove-duplicated --cache-dir=build/sstate-cache
 
+This command will ask you to confirm the deletions it identifies.
 Run ``sstate-cache-management.sh`` for more details about this script.
 
+.. note::
+
+   As this command is much more cautious and selective, removing only cache files,
+   it will execute much slower than the simple ``find`` command described above.
+   Therefore, it may not be your best option to trim huge cache directories.
-- 
2.34.1


