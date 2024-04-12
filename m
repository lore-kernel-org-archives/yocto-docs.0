Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEC1C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 04:13:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.39224.1712895215934624027
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 21:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IWg3HmXB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E24E9FF802;
	Fri, 12 Apr 2024 04:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712895214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ih9RSeXP+0PrHbQxCvfhhtKhczrcAuEbbC1EczP+fN4=;
	b=IWg3HmXBJ+uBnIWo+Gx21W6/b+rVP4wpZGD2rZW0P2YIsifMrvizkLxkd0qaX7stPcqIx9
	eVq7DYVQ7/8dtdy144B2Dm5znKQ3l3CsVkyr4N+THPEEckrZu7Yw4iYNfyXbLcZlUiQagq
	8hQVsyhwvy7CdVVNN7aN/igHrKXqHCpd+xyiGFeoi2SPZ8MYmHFF9ogndPfOBBo1E5l7it
	qcC9YQ8BnoEeJfW7ClQjUhE1RvYnASkxG9yeHCYgWFxUmSPnHCZglMin8/GhhXTAcMmRpi
	qTIjKndtBmg4+uiB+MX/YfNf0DEPfGAHXkjZWSi06+nD+xeUUHWrGsCp5OPPPw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] migration-guides: release-notes-5.0: update docs highlights
Date: Fri, 12 Apr 2024 06:13:31 +0200
Message-Id: <20240412041331.4007987-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Apr 2024 04:13:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5115

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Mention the new section about variable context in the BitBake manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Simone Weiß <simone.p.weiss@posteo.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 2f39fda411..b5fba13e6c 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -195,6 +195,9 @@ New Features / Enhancements in 5.0
    -  Documentation for using the new ``devtool ide-sdk`` command and features.
       See :ref:`using_devtool` for details.
 
+   -  New ":doc:`bitbake:bitbake-user-manual/bitbake-user-manual-ref-variables-context`"
+      section in the BitBake User Manual.
+
    -  New ``make stylecheck`` command to run `Vale <https://vale.sh>`__,
       to perform text style checks and comply with text writing standards in
       the industry.
-- 
2.34.1


