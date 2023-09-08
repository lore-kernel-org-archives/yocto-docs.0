Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7991EE57E0
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 07:28:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.34438.1694158086082254062
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 00:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J8t3XLXy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F31D60014;
	Fri,  8 Sep 2023 07:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694158084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7AlPBGD8hlk86oHzU0QZlB8apRYuF8VZ0YoOqel+kgo=;
	b=J8t3XLXy+9EQt1jTXBVQh16aVNo216sY6aUsEXNgueAyVj7ow0riH2bYoVDUWUtGg3SrAQ
	a+H8jVTkXgnAHcW7fHBAbZuu29OfIcqOTGNbiHSWZGQ5ldygFvvL/4iVWkPm4JNpm0FVxB
	potMxovr+6Xmwmv16IqQkmmplpefKgvtEzwNJbkpOwzjvAiTLlOw/aF1UakBtaGQdP1Wbb
	0oyE/U8U+pJp5U6VKXcGtzD3x1K/rT3b7byR6M+yGVF7Iu5WFCsgjHLjabPp8oTRcd5VRz
	Arx41sEvfOpgRopCmjUbqS6/C0ea+8SDwLCxkzcxzU3U/K9QvfuD8vnLryZyAw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Yoann CONGAL <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Josef Holzmayr <jester@theyoctojester.info>
Subject: [mickledore][PATCH] dev-manual: disk-space: mention faster "find" command to trim sstate cache
Date: Fri,  8 Sep 2023 09:28:00 +0200
Message-Id: <20230908072800.273477-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Sep 2023 07:28:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4204

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #15182]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Yoann CONGAL <yoann.congal@smile.fr>
Reported-by: Randy MacLeod <randy.macleod@windriver.com>
Reported-by: Josef Holzmayr <jester@theyoctojester.info>
---
 documentation/dev-manual/disk-space.rst | 34 ++++++++++++++++++-------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index c63591cc7a..a84bef4511 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -27,19 +27,35 @@ Purging Duplicate Shared State Cache Files
 ==========================================
 
 After multiple build iterations, the Shared State (sstate) cache can contain
-duplicate cache files for a given package, while only the most recent one
-is likely to be reusable. The following command purges all but the
-newest sstate cache file for each package::
+duplicate cache files for a given package, consuming a substantial amount of
+disk space. However, only the most recent cache files are likeky to be reusable.
 
-   sstate-cache-management.sh --remove-duplicated --cache-dir=build/sstate-cache
+The following command is a quick way to purge all the cache files which
+haven't been used for a least a specified number of days::
 
-This command will ask you to confirm the deletions it identifies.
+   find build/sstate-cache -type f -mtime +$DAYS -delete
 
-.. note::
+The above command relies on the fact that BitBake touches the sstate cache
+files as it accesses them, when it has write access to the cache.
 
-   The duplicated sstate cache files of one package must have the same
-   architecture, which means that sstate cache files with multiple
-   architectures are not considered as duplicate.
+You could use ``-atime`` instead of ``-mtime`` if the partition isn't mounted
+with the ``noatime`` option for a read only cache.
 
+For more advanced needs, OpenEmbedded-Core also offers a more elaborate
+command. It has the ability to purge all but the newest cache files on each
+architecture, and also to remove files that it considers unreachable by
+exploring a set of build configurations. However, this command
+requires a full build environment to be available and doesn't work well
+covering multiple releases. It won't work either on limited environments
+such as BSD based NAS::
+
+   sstate-cache-management.sh --remove-duplicated --cache-dir=build/sstate-cache
+
+This command will ask you to confirm the deletions it identifies.
 Run ``sstate-cache-management.sh`` for more details about this script.
 
+.. note::
+
+   As this command is much more cautious and selective, removing only cache files,
+   it will execute much slower than the simple ``find`` command described above.
+   Therefore, it may not be your best option to trim huge cache directories.
-- 
2.34.1


