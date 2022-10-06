Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66382C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 15:55:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.785.1665071717649679717
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 08:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ezrpxY6w;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C58381C0008;
	Thu,  6 Oct 2022 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665071714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A2K7mDd0C6OjxSnPPENWFRVmnPOtOWQ5epokL3FKY4A=;
	b=ezrpxY6wK4k3hLEQR2a2v/KOpkITWJMg6B+mmEIPug5aou+FsT8qEGZI3lo1CL5U+jwfdf
	Cky9aNjfUwGe5F9+ME5Z2rRbsqljD3rEcR5EHKoIMWOW576mEcxkaCWAvTOJRNmm3flzmk
	6/nLFr2YsRu3o07Dvb//x8mOsO7DGp9pZvtW2Bn9a4vW3tzeOIx3LQ62aJ4/7MePOtI4u6
	XGGqLT93gtuQRPhRqkaNCazgLleXLGXELjMuc/LqYXRqFYiIjvdqo7AjeqlX4M/1bSOVMF
	/VoCuZcNVcWDXo4/CZnvSsL+v1pB9qJrTjEKEcic//ZfS+soso3tcSGZvpbLpw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables.rst: fix trivial typo
Date: Thu,  6 Oct 2022 17:55:12 +0200
Message-Id: <20221006155512.3092935-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Oct 2022 15:55:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3298

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1685a26776..29ce22bafc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3546,7 +3546,7 @@ system and gives an overview of their function and contents.
 
 
          Although you can use other settings, you might be required to
-         remove dependencies on or provide alternatives to components that
+         remove dependencies or provide alternatives to components that
          are required to produce a functional system image.
 
    :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
-- 
2.34.1


