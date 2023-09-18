Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1B5CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 15:31:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.54630.1695051064749706929
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 08:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hDPWQgDy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E25891BF205;
	Mon, 18 Sep 2023 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695051062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YwfBSVKqhfUP35ddYcrLoVTCSoba+I1eceXDKbPaLmk=;
	b=hDPWQgDyX9o9i66ShsqfBCM1K0n9nesKG1iCtIJ54NlJVgTGhAkdbx+gxR/xHM4FaHEunL
	DQteLjx3LuUSx7Tke6Df1CF1V97+Vp8Q+Apq5qwQliUGVeC7EeUMqtt7tpcp8uKbWVXKuz
	qaEWdmOZcge4kKNAKTcJzTGb1K+j/WZh5vfhVm/fNi6GaRfwUyBXl/wyGdDbOvwtzvJ3IJ
	YM3vD55ZEWEePe0XdeLvzsuh8dIu6/4VSQTrFeKNX8iY18XylYBT4T3/gscfs5dcELbval
	rkO5/SzS63XnM6+vHbjN8oKYG0KMdpwzx3/sOYCNjQHhhEPquCnEF0lN8ZdIBg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH v2] dev-manual: disk-space: improve wording for obsolete sstate cache files
Date: Mon, 18 Sep 2023 17:30:48 +0200
Message-Id: <20230918153048.817273-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <178607D39BC70DF5.9824@lists.yoctoproject.org>
References: <178607D39BC70DF5.9824@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Sep 2023 15:31:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4227

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Replace "duplicate" by "obsolete", more appropriate.
"duplicate" probably comes from the "--remove-duplicated"
option of the sstate-cache-management.sh script.

Improve other sentences too.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/dev-manual/disk-space.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index a84bef4511..6d1638a302 100644
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
+disk space. However, only the most recent ones are likely to be reused.
 
 The following command is a quick way to purge all the cache files which
 haven't been used for a least a specified number of days::
-- 
2.34.1


