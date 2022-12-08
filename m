Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0695BC63703
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 14:20:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.15050.1670509242885383512
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Dec 2022 06:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nHggfVXd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7B3EDFF80E;
	Thu,  8 Dec 2022 14:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670509240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w2we1ZhljarDDoxX98gDuAVjDdS7NkTukAPQg419/zg=;
	b=nHggfVXdqOxVy+y8yAaU5Ygav2DT5zFrGRVzj6bcMjHwgd8p45dbLaUGMc7GkFw3/6w03t
	H2dGNjET/uGCqYNr4Lf0o4ZiW7cmnFD+xdwyyLr0pj3yjfB8wEHV6o//+9Qoh1KBssLcE/
	FuXh3b3XnzEsB4elLUwGTwoSoz/XB6ky4X1/VWz/lZH/BnnwzchT4U8Sf6DwkwjfxPgqsi
	dSr+zH/xDRs3B+PEG36WTXc69xtxHuXffsHM3/K7wknI4AMtW0fmFmVDfIFf/SF6fQERQW
	dePuwUAF7nkRHnNMpzerKHdj/XuHrWJEr/+w/9/4kfaMXh1GzJBp0v88jj6/Rw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual/images.rst: fix unnumbered list
Date: Thu,  8 Dec 2022 15:20:38 +0100
Message-Id: <20221208142038.14325-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Dec 2022 14:20:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3525

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/images.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index d52b39f3cf..bbbbb55d73 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -18,11 +18,10 @@ image you want.
    are going to build an image using non-GPLv3 and similarly licensed
    components, you must make the following changes in the ``local.conf``
    file before using the BitBake command to build the minimal or base
-   image::
-
-           1. Comment out the EXTRA_IMAGE_FEATURES line
-           2. Set INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0* AGPL-3.0*"
+   image:
 
+   1. Comment out the :term:`EXTRA_IMAGE_FEATURES` line
+   2. Set :term:`INCOMPATIBLE_LICENSE` to "GPL-3.0* LGPL-3.0* AGPL-3.0*"
 
 From within the ``poky`` Git repository, you can use the following
 command to display the list of directories within the :term:`Source Directory`
-- 
2.37.2


