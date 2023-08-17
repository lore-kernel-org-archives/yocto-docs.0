Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8A6C2FC37
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:15:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.188774.1692281733555362831
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 07:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SitkM8EW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0271BC0007;
	Thu, 17 Aug 2023 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692281731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DIuu43m3daaz9ZoPs7Chin+2mFue3XD8s569qMpgXXE=;
	b=SitkM8EW9lmsbyL+9kykXEswjgmQ5axVzcxmxyBwqCEkkZWSd1iZQskSd0LpTJBcfFfQbU
	g0vQAwRnL5SuCF+wrtxDKtZENB/OrgpgbnI/oM3Ot7DCOHBieH3ortrynAWtbrI1Kn/A/j
	TLwlb2ArjPnQsGnFUdN0KSnVJAgOb+E5w3Twk3SXY3ivmDIXk2MiCc3+BTYwSmp0Iez8/U
	9/pkTpNmZxmQNb7W/dLL/uqtXAREEIJ5VdkrdGyjaYhcARBqyw0UMR+fB9P+peTJy9XyA9
	Imq41TsmTeQjY59FeUUXY0GLEcUQS7eWoz19VyUOkP3hB1AvBktjnGt0o2AOlg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Yoann CONGAL <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Josef Holzmayr <jester@theyoctojester.info>
Subject: [PATCH v2] dev-manual: disk-space: mention faster "find" command to trim sstate cache
Date: Thu, 17 Aug 2023 16:15:28 +0200
Message-Id: <20230817141528.2869208-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <177A5EF47817BA65.8497@lists.yoctoproject.org>
References: <177A5EF47817BA65.8497@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 14:15:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4153

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #15182]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Yoann CONGAL <yoann.congal@smile.fr>
Reported-by: Randy MacLeod <randy.macleod@windriver.com>
Reported-by: Josef Holzmayr <jester@theyoctojester.info>

---

- Changes in V2:
  - Using a more universal "-mtime" option to find files to remove
    as suggested by Richard Purdie. V1 was using "-atime" which
    won't work with systems mounted with the "noatime" option used
    to increase disk performance.
  - Add more details about sstate-cache-management.sh provided by
    Richard Purdie, perhaps not recommended but useful to document
    as long as it is shipped in OE-core.
---
 documentation/dev-manual/disk-space.rst | 31 ++++++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index c63591cc7a..01cdf911c4 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -27,19 +27,32 @@ Purging Duplicate Shared State Cache Files
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
+
+For more advanced needs, OpenEmbedded-Core also offers a more elaborate
+command. It has the ability to purge all but the newest cache files on each
+architecture, and also to remove files that it considers unreachable by
+exploring a set of build configurations. However, this command
+requires a full build environment to be available and doesn't work well
+covering multiple releases. It won't work either on limited environments
+such as BSD based NAS::
 
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


