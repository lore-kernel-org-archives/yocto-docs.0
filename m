Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90D4C30632
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:56:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.189859.1692284167465049476
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 07:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LKnXQ4Nd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEB4424000C;
	Thu, 17 Aug 2023 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692284165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MB+jpI4TUeeT0IYZBiQw3U8HX1yvVgb53ZkhwvUCRiQ=;
	b=LKnXQ4NdBHY2JprkOtDFeO6MXCRr3U8ulqxc18Tu8cIpbi1My/4UNC3lZOOjcivu1NvDpT
	IvDO31CEEoqeF9gqei3MrkUKAC/Ng2l2UIp3cEBt8sBJUw88Mphx7hAKm5WzwD0jtwzj4W
	H2xJ9am468AyE7SrcbW9hdwmc5YgEjt7puoWMQkEMaMqyoU0xYX1+f6z8VietoaMjqy4mO
	/OSpmj3zSHj5ao8QD4AhIM5la24+ArmQvXGJn5mqdAPMWBzExRSOWZ3dsvO52doOZ9RdY3
	yRhG01Rj44CAJa7jTX7VsJiTjCT/jPs4kiZl1HDMlyZlVHYE6OBlMUqAs/UHZw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Yoann CONGAL <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Josef Holzmayr <jester@theyoctojester.info>
Subject: [PATCH v3] dev-manual: disk-space: mention faster "find" command to trim sstate cache
Date: Thu, 17 Aug 2023 16:56:01 +0200
Message-Id: <20230817145601.2874073-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <10e53fcdf9698dffe46c251150f9789c7aa216d3.camel@linuxfoundation.org>
References: <10e53fcdf9698dffe46c251150f9789c7aa216d3.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 14:56:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4155

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #15182]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Yoann CONGAL <yoann.congal@smile.fr>
Reported-by: Randy MacLeod <randy.macleod@windriver.com>
Reported-by: Josef Holzmayr <jester@theyoctojester.info>

---

- Changes in V3:
  - Mention the use of "-atime" if we don't have the cache on storage
    mounted with the "-noatime" option, as suggested by Richard Purdie.

- Changes in V2:
  - Using a more universal "-mtime" option to find files to remove
    as suggested by Richard Purdie. V1 was using "-atime" which
    won't work with systems mounted with the "noatime" option used
    to increase disk performance.
  - Add more details about sstate-cache-management.sh provided by
    Richard Purdie, perhaps not recommended but useful to document
    as long as it is shipped in OE-core.
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


