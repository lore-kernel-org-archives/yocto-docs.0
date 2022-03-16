Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316A2C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:16:49 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.25786.1647440207340791988
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 07:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LWxpOICy;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7365524000B;
	Wed, 16 Mar 2022 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647440205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uqAskzijWev2tc+RtD+kDQeu5T4OXj4T6s+EvaAZynk=;
	b=LWxpOICy0eCdXKw9Ij6Rg8FsT6uB5Z+4tkUfU21NeRbW7siNeLSU4S0tx3imT5/omxC1jm
	9dnnL1pe3swRb+Q1boPrCkJEqlzXbjTJCGAJTtplKbiz2cd/0XZjdtEvr7OvzMMzk5WjEP
	mOsJSgBIZkeDC5zE6V0JRva3DMTIEc3PBz5DXnIwXeI7D5eosvDAgHlS5beWgWa9L9bNfO
	Q1q1JXeeTM+K2JVBwjHgCnGlWHLMZcP8skHRSNa0bovjPyLtr5U1CBLm9+whmfsrQJBA9i
	AQR1AtOKpWTfJ+vCfi2EeCjfBDwwIAV7yucQJZnZjZ/8vbiPF5Qy47vBeVwUwA==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] doc: migration-3.5: variable changes for inclusive language
Date: Wed, 16 Mar 2022 15:16:43 +0100
Message-Id: <20220316141643.185590-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 14:16:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2609

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-3.5.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index da09b6f449..b4816b8171 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -7,6 +7,17 @@ Project 3.5 Release (codename "kirkstone") from the prior release.
 Recipe changes
 --------------
 
+- To use more `inclusive language <https://inclusivenaming.org/>`__
+  in the code and documentation, some variable have been renamed or even
+  deleted. BitBake will stop with an error when renamed or removed variables
+  still exist in your recipes or configuration.
+
+  An :oe_git:`convert-variable-renames.py
+  </openembedded-core/tree/scripts/contrib/convert-variable-renames.py>`
+  script is provided to convert your recipes and configuration,
+  and also warn you about the uses of problematic words such as "blacklist",
+  "whitelist" and "abort".
+
 - Because of the uncertainty in future default branch names in git repositories,
   it is now required to add a branch name to all URLs described
   by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example::
-- 
2.25.1


