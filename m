Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEDFC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 07:42:58 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.4614.1665474175777284100
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 00:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cUPOG2ZE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 310C5C0007;
	Tue, 11 Oct 2022 07:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665474173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0kxoHndnhN1W7NJm1XtEKHW2fa792pCKfhED+Xla7uY=;
	b=cUPOG2ZEdNhW9X+Wvodt29hsJ8okW5TAbLr2vQJ86Xq/xpZe9TtlIE6HpodkyI3bPEmkok
	dFdPHBeR5FsytPqSetvK9ReJn9RVvC8rvwJ9/aPAqAjnvTTakl/M8MqU0Kh15RNZ8iX3If
	nVQfvx5RYerao1lfbhjEADlVaMAEd0/XUI3Uxx/isM1C8h8iovnjWPrxfVQwkXNF5XI+RX
	muL1ml6bbczV0zhnQtGTK35e4zab/FIZXoiMxC9Jebc8xP78AkrUbX0/T6gUUKO79TLstQ
	CGFtmErJDgw4/tolS3dCWqAS+2X+fJy5aujRIt0gUbOA+2pnAbN4M9V16MAkRg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] test-manual: fix typo in machine name
Date: Tue, 11 Oct 2022 09:42:51 +0200
Message-Id: <20221011074251.2852210-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Oct 2022 07:42:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3345

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/understand-autobuilder.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index b6809ce7bd..c5e32cfe09 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -56,7 +56,7 @@ the "templates" section, which looks like::
 
 Combining these two entries you can see that "qemux86-64" is a three step build where the
 ``bitbake BBTARGETS`` would be run, then ``bitbake SANITYTARGETS`` for each step; all for
-``MACHINE="qemx86-64"`` but with differing SDKMACHINE settings. In step
+``MACHINE="qemux86-64"`` but with differing SDKMACHINE settings. In step
 1 an extra variable is added to the ``auto.conf`` file to enable wic
 image generation.
 
-- 
2.34.1


