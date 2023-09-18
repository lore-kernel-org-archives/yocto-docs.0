Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F71BCD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 15:09:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.53768.1695049766953430779
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GRqMkX1n;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44B75FF80C;
	Mon, 18 Sep 2023 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695049765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Faepx5z5mA4t+iN/9fPXs5oi/IS0W4DaoA0lKTxiIeA=;
	b=GRqMkX1notDSz/J+Mc2ZRdvLsjKD+Tbqbjp+FtdKRcNEncZ3/oGBbDmgJO7EX9W95QeuDe
	hoIHBSn6fqYv4SYPfZ75ay9qANc31RFwa2Ip3XPLa3ReEN5KTVbcw4XJBE/bJFzAe/RYER
	LSEn1cExyML3JGCvXjcOsj6QfAEtWbbqPP4jos+rpiNM1yyWRhsz8jDuAAPiH2j76ZLZ8m
	AnBKKyESO+hwW+aCzdz10f4jcvuH1Uy9OcG2vRHwILY0oAES31rX9YCDsfYl6Q/rtJoSP2
	+qjQ2OtF6oIS7sA7gXo4ha5Cwc+PDB4FQpIKti2plJjxOA9arETj4QL0Vbudjw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] dev-manual: disk-space: improve wording for obsolete sstate cache files
Date: Mon, 18 Sep 2023 17:09:16 +0200
Message-Id: <20230918150916.486857-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Sep 2023 15:09:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4224

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Replace "duplicate" by "obsolete", more appropriate.
"duplicate" probably comes from the "--remove-duplicated"
option of the sstate-cache-management.sh script.

Improve other sentences too.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/dev-manual/disk-space.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index a84bef4511..5b6702f594 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -23,12 +23,12 @@ final disk usage of 22 Gbytes instead of &MIN_DISK_SPACE; Gbytes. However,
 &MIN_DISK_SPACE_RM_WORK; Gbytes of initial free disk space are still needed to
 create temporary files before they can be deleted.
 
-Purging Duplicate Shared State Cache Files
-==========================================
+Purging Obsolete Shared State Cache Files
+=========================================
 
 After multiple build iterations, the Shared State (sstate) cache can contain
-duplicate cache files for a given package, consuming a substantial amount of
-disk space. However, only the most recent cache files are likeky to be reusable.
+multiple cache files for a given package, consuming a substantial amount of
+disk space. However, only the most recent ones are likeky to be reusable.
 
 The following command is a quick way to purge all the cache files which
 haven't been used for a least a specified number of days::
-- 
2.34.1


