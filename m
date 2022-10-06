Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7901BC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 09:50:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.3948.1665049835567248981
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 02:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NGC+O8+1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9F49C24000D;
	Thu,  6 Oct 2022 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665049833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PALPwaqUF4l5b4gAluswg9ztHnTkKvIC704tfvWlxcI=;
	b=NGC+O8+1BFHehNJTEnl3fxX9M6pjG7ThC0x9ePGWQ6XiS9Ng7PVkrOpTwbFnIJNSW8afRZ
	Vw3tOSIsnD7Xl/l5vfT9btZNbLSLXpySuRoXhHynuF61yhBWIYVEFQKyM8r6YkHjgsyd/t
	xV35lIkhfg+J8PT4mYm8UdaJYHbcWkapxVf1PhJStONnvv5NNVFX7Xy3/agAfLRxql6TMt
	zpNlPu010xHN10PX4XQLxdNojUCfGb62n0dCbxqun6VODfELbO4496Cvnzr1xuHIhBWaYQ
	4p/mOC7D8CbVdMiA12Mbt94gLj6kFKtelZFhdg64sg4FTuw0CvSEb2oNtDonZA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [dunfell] dev-manual: fix reference to BitBake user manual
Date: Thu,  6 Oct 2022 11:50:31 +0200
Message-Id: <20221006095031.435941-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Oct 2022 09:50:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3296

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fix a wrong reference no longer tolerated by Sphinx 5.x
(missing "bitbake:" prefix)

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 7c0fc662bd..9dcafb2783 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -2628,7 +2628,7 @@ Recipe Syntax
 Understanding recipe file syntax is important for writing recipes. The
 following list overviews the basic items that make up a BitBake recipe
 file. For more complete BitBake syntax descriptions, see the
-":doc:`bitbake-user-manual/bitbake-user-manual-metadata`"
+":doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata`"
 chapter of the BitBake User Manual.
 
 -  *Variable Assignments and Manipulations:* Variable assignments allow
-- 
2.34.1


