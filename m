Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF70C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 20:41:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.66516.1699303307240104018
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 12:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X4HGENna;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 482C5C0004;
	Mon,  6 Nov 2023 20:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699303304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hCeZ8f04kBH2cD04Gc14LS/PyHAP6dehu0kbHAEnIWo=;
	b=X4HGENnavfHDRkfMBzAi5AggqR6csgn+k6LutF/ME6incN3BIj80Xj13RpsDgpl8yIAiYV
	WSy+B/ZT3nE8K66GqZyuxJgl9WgTJWGPjAhFt6OWwxqOHv1mjPb3Zoe5DV+nuNW4YuXQma
	sUrQpedVkYzXMmf8sg9ZVlU1C+9gvCP28jBwsWD3I+ebgBnQF1fHlCl7JWWkOfS5LczM9R
	LOZXCm3OQJt+xIYaxofk82AcH6no4BOSHu3hx4IeFFoHfOi2G/4I4ovhLOxFXQYDzs0qw7
	frJipc+wRJdUc0tfzbxgVREQYeGMFP6cSSGRsF3jmHeHvZ7IhMlqBqTaQ4MM3g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: fix empty sections
Date: Mon,  6 Nov 2023 21:41:40 +0100
Message-Id: <20231106204140.3692357-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 20:41:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4607

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.3.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 87d85bb19b..3221372f98 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -168,8 +168,6 @@ New Features / Enhancements in 4.3
       available to C and C++ programs. See
       ``meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb`` for an example.
 
--  Image-related enhancements:
-
 -  wic Image Creator enhancements:
 
    -  ``bootimg-efi``: if ``fixed-size`` is set then use that for mkdosfs
@@ -322,6 +320,7 @@ New Features / Enhancements in 4.3
 Known Issues in 4.3
 ~~~~~~~~~~~~~~~~~~~
 
+-  N/A
 
 
 Recipe License changes in 4.3
-- 
2.34.1


