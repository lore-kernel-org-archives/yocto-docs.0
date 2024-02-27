Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E457EC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:02:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.12870.1709042568633542295
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hxmDVVu4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3203C1C000C;
	Tue, 27 Feb 2024 14:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/N25zrBjv2ro7mFKGOLQwEYAseCv3jxlFrru2hSb8Ng=;
	b=hxmDVVu4cVEmV/ar7/NKVdnYS+M0qCpx8EDU1+UcoaOK+bLw5MVzMB8cK6YPH/Puq0Ert2
	kRnSOrqEvDHRTlqdTeSaHCalouT05gUaGPQ69nYI84vi/igObRSmALF5y29IMh6EeTIM/C
	idgVrifGbQ3/14nwJNeMfa5guASiZDYTfCD5JYBD/xdP9lglkUTyHXLj3hmdLvAHAXLr25
	gea0BHYBUhge3zmG05bkPm+WPw8mu6Qn6H8x9Ssdy4OexBoqXXc/coYXipS4dr90ssUyjQ
	jyVhWYFytvs0XKt8OFc4V7my5PMPeqN5kcbVfiMEp9QQjD46yoHgSuLlKcXq+A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [dunfell][PATCH] ref-manual: release-process: grammar fix
Date: Tue, 27 Feb 2024 15:02:45 +0100
Message-Id: <20240227140245.481689-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:02:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4908

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/ref-release-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-release-process.rst b/documentation/ref-manual/ref-release-process.rst
index a6d9ff60ec..8dcbea7beb 100644
--- a/documentation/ref-manual/ref-release-process.rst
+++ b/documentation/ref-manual/ref-release-process.rst
@@ -138,7 +138,7 @@ consists of the following pieces:
    piece of software. The test allows the packages to be be run within a
    target image.
 
--  ``oe-selftest``: Tests combination BitBake invocations. These tests
+-  ``oe-selftest``: Tests combinations of BitBake invocations. These tests
    operate outside the OpenEmbedded build system itself. The
    ``oe-selftest`` can run all tests by default or can run selected
    tests or test suites.
-- 
2.34.1


