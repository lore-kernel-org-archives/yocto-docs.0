Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690B4C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:36:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.24449.1707233781318986749
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jDe8E445;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C968F1BF20A;
	Tue,  6 Feb 2024 15:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJlViw66t1QxHzgJkVUuXvRUoiag1QBOdFaRvTcn1lg=;
	b=jDe8E445qsVjs+jABc0/lreE+dXw8GK6vD3YXI7BH+Jpo3BRtgsUyaJT6WXXIYF0UXMOoQ
	xlMzkHVxnwnL2VBVpEnWj3UxrabJqXH5LmbfJKAywiWrZCLL8vFpeBNxcE/EgsrH4ZbmWC
	Qjk3fqCNLXA9sCzecLGRE5TLMQNBdwR89DQXcYSCtD5z7WUy6oOLNBSRUj3A9jpo3lBYSp
	+FXlSl6idfTzNnkN9ERwzz3aiNH/K5ZRut101XnFohGj6wvXllvjp2kEMwMdztpEuAil7r
	ZPaVsa+W8TKkXBw1h0yjWOXgE8xXu0vCBRjIDbizgvofMpL3BkGXXd5b/QBo/w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [dunfell][PATCH 1/1] dev-manual: gen-tapdevs need iptables installed
Date: Tue,  6 Feb 2024 16:36:09 +0100
Message-Id: <20240206153609.77849-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206153609.77849-1-michael.opdenacker@bootlin.com>
References: <20240206153609.77849-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:36:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4824

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Simone Weiß <simone.p.weiss@posteo.com>

Add the hint to the test setup that runqemu-gen-tapdevs will need the
iptables package installed.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 8ee386a678..d1dde6d0f3 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -8652,6 +8652,8 @@ In order to run tests, you need to do the following:
          -  Be sure to use an absolute path when calling this script
             with sudo.
 
+         -  Ensure that your host has the package ``iptables`` installed.
+
          -  The package recipe ``qemu-helper-native`` is required to run
             this script. Build the package using the following command:
             ::
-- 
2.34.1


