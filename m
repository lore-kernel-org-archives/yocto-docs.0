Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7672CE79AD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:08:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.31931.1695197284309737655
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kiGW5bSQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAB3040007;
	Wed, 20 Sep 2023 08:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YwfBSVKqhfUP35ddYcrLoVTCSoba+I1eceXDKbPaLmk=;
	b=kiGW5bSQ2tYq/IuIK6hZQVOTLmwwKjWewkZFEW3t5FY36wMyUmBDotdhLRS/FOrc6DCnLB
	m/PTyhJ1QD4Uepd1qrYvlegdvjpt+4All0ioBqd97hkFcOEN3xBtT+0DETT+iiMdxPjc6f
	1d8H/LcK5xVF+DxJ7mbOhJou8i/FBriOdptzCauab12Sm2gRNMTO3mxe5MVlNOzRDmxM7B
	LX7ply7vq1nrFEIUBOD6fTcDFm5hRHEG7+h0JYho29ss0lM8mbrNjJGYhjqg0WO0dfcPA1
	4Tw7OgC6ZmRXAKhP/E3Ywm9QoPmL0uOHwdehKv9jDHa6YyNl0wOH049hX0h12w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [mickledore][PATCH 2/7] dev-manual: disk-space: improve wording for obsolete sstate cache files
Date: Wed, 20 Sep 2023 10:07:49 +0200
Message-Id: <20230920080754.1225508-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
References: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4241

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


