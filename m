Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0EDC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 09:34:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.62366.1643794488020029451
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 01:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FpmoK384;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AC61824000B;
	Wed,  2 Feb 2022 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643794484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2SspSxKgLcQKwB+idg81zwtF3X0/IwhXfDmZnje4ErA=;
	b=FpmoK384DeZ6rixRnE1krSFErE6FBiRALNZk7xqd2iB7wkilUcEOfmeoiijQIYjm3iee0l
	DI97gc5l7cBu+UnDhwFLCWkh4TsY7XYnIFdYl2natExIVTvKCZD/wm7HNNmwB18fV68jY6
	pyXbSNIN+htO7fdnucZdofxgG8DConcOdMzob2UO2jya4NjcWEjUIDl1GHgN25qjxiFWdq
	xgoXu9ImLj7d0AM3eE16YUUzgTdPA8e+8HKVs4jc1YTT7PSwBz09P6KiS0vjYIdmnR213E
	+e/XH3v7IUK8H96dimw9iBxnsLTtdMDIwXsHKfIQ6y6Cd+62SidBu+nRsqkPBg==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: update TCLIBC description
Date: Wed,  2 Feb 2022 10:34:41 +0100
Message-Id: <20220202093441.35141-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Feb 2022 09:34:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2458

Stop mentioning the long gone POKYLIBC variable and fix punctuation

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d4f40b6929..998e129d07 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7789,10 +7789,9 @@ system and gives an overview of their function and contents.
 
    :term:`TCLIBC`
       Specifies the GNU standard C library (``libc``) variant to use during
-      the build process. This variable replaces ``POKYLIBC``, which is no
-      longer supported.
+      the build process.
 
-      You can select "glibc", "musl", "newlib", or "baremetal"
+      You can select "glibc", "musl", "newlib", or "baremetal".
 
    :term:`TCLIBCAPPEND`
       Specifies a suffix to be appended onto the
-- 
2.25.1


