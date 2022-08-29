Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC5DECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 12:01:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.69707.1661774495814461726
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 05:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f2PUbyZY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A78811C0006;
	Mon, 29 Aug 2022 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661774494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b0qdzKi+gJBuzUFOqkMK8Mn0VnV0OQx38jW3WcGwgLE=;
	b=f2PUbyZY0ROq/I9J0jvCZEeQwaEo+VB2jU2JDGc55s1xBqnfx1A/Xcg6ZkdKKrddVq4ukJ
	rdANe18Dll8v1Ae6UZtTjTHvZ3e/i51Wib0jp0fOzZzEva3wm7dgrGVx31quqzeoTSJaFz
	qGtRTaC0mX61wUUA2QemNEpXtJthzmkg3nkLhsJvp9yO0TzXTOWyW+nkZ+pQGCtHVAD/Wt
	XQ9+NdqvdLVbGv69ILzutK1TN8V1+PiTMejY0PNzLzzczn3RMO5Ajz9t46JUNSEYRizLtZ
	2a8199ulusd26O7BzmfU01b3NfVkO0wscOgvEoWM9ssEGtH3zBiJ5oToeGKzDw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Jon Mason <jdmason@kudzu.us>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] [kirkstone] ref-manual: add numa to machine features
Date: Mon, 29 Aug 2022 14:01:31 +0200
Message-Id: <20220829120131.38467-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Aug 2022 12:01:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3125

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Jon Mason <jdmason@kudzu.us>

numa is an existing machine feature, add it to the list so that users
are aware of it.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
---
 documentation/ref-manual/features.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index f7abb417ba..89aeb989c1 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -62,6 +62,8 @@ Project metadata:
 
 -  *keyboard:* Hardware has a keyboard
 
+-  *numa:* Hardware has non-uniform memory access
+
 -  *pcbios:* Support for booting through BIOS
 
 -  *pci:* Hardware has a PCI bus
-- 
2.34.1


