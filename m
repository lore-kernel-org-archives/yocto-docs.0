Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C63C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 13:18:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9219.1651843104104658592
 for <docs@lists.yoctoproject.org>;
 Fri, 06 May 2022 06:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rx/qeW5Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3B5AB1C000F;
	Fri,  6 May 2022 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651843102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMqSgQDPt7gvtXw4zJdlgOMIla3nUuVLLIiEglcNyFs=;
	b=Rx/qeW5QuWighJqR6MRHCPMfh0gjUEz58/IfSF5GihSfkS3eT9QkddzTkGhNSIfbNIv5hz
	mnNKEphmVo60uX7tFMUe6aLc+seZeXRDhJ8Ztc/mRUGUWIQb9zEoZE8i3tt/hOMDmHzlCQ
	vXcXj6Pxcm1c9/Wt73jqNBXIPyXwZ3naxeC9B3G33k1FstsEpBnZXq8PcH9+RP0Ti+lzaS
	0mb/fVdfHWZhpA0FekrNfsxSjmDwCR52yBmO9IKvhhokCDMK8sLgBlkd7mvZTnZwbzWrp9
	s1PKVTZNSZuGH2WyaciAdmuDVgI9I359U5HEcE1LwFZ/Lnkti9UuPwvexsU6ew==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] dev-manual: further gdb usage simplifications
Date: Fri,  6 May 2022 15:18:17 +0200
Message-Id: <20220506131817.814730-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16EC867B7C44633B.7620@lists.yoctoproject.org>
References: <16EC867B7C44633B.7620@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 May 2022 13:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2925

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index c9fc585a05..1da19b8d65 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10312,24 +10312,20 @@ debug on the target hardware.
 
 To support this kind of debugging, you need do the following:
 
--  Ensure that GDB is on the target. You can do this by adding "gdb" to
-   :term:`IMAGE_INSTALL`::
+-  Ensure that GDB is on the target. You can do this by making
+   the following addition to your ``local.conf`` file::
 
-      IMAGE_INSTALL:append = " gdb"
-
-   Alternatively, you can add "tools-debug" to :term:`IMAGE_FEATURES`::
-
-      IMAGE_FEATURES:append = " tools-debug"
+      EXTRA_IMAGE_FEATURES:append = " tools-debug"
 
--  Ensure that debug symbols are present. You can make sure these
-   symbols are present by installing ``-dbg``::
+-  Ensure that debug symbols are present. You can do so by adding the
+   corresponding ``-dbg`` package to :term:`IMAGE_INSTALL`::
 
-      IMAGE_INSTALL:append = "packagename-dbg"
+      IMAGE_INSTALL:append = " packagename-dbg"
 
-   Alternatively, you can do the following to include
+   Alternatively, you can add the following to ``local.conf`` to include
    all the debug symbols::
 
-      IMAGE_FEATURES:append = " dbg-pkgs"
+      EXTRA_IMAGE_FEATURES:append = " dbg-pkgs"
 
 .. note::
 
-- 
2.25.1


