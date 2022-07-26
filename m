Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31D7C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 17:26:44 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.9653.1658856401645253928
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 10:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ATwxdUQx;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5B26224000B;
	Tue, 26 Jul 2022 17:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658856399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ng5MhkhJyk2L0YFodQmYWjAsSHX98ws4SmPXvZ/jVYs=;
	b=ATwxdUQxn+r6z1+bxmNsqJ43cOvS8DyxoE2XVs97+rn42gbG8HEtauszxSgoqTSF3QKbvb
	bek7NAyCtrsJdHq8pkBMNsTE5ZTXsL/Ip/lhDnYCiWZcN/aDUAGuGBKtS1Kj+gDgxDYVuw
	x2ElRvUfN8x1+RjqD47xKNhGQXyVkKRoWYcR+/BvyOpExSrV3JNx0YEqFUYiZ5V9CMRccj
	BdVGm1jfA0e98lJdmMhvjrBLNbCZbVMqOrn+vQe8xxQ/q3RpGWL3qICdpFrUN+Qk26xicO
	Enydh/n7SyCGM/+UPOhjfF3/hG9mJRvg4+Jn5kluBpLUrveaKPfBvRolKM67NQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: use proper note directive
Date: Tue, 26 Jul 2022 19:26:33 +0200
Message-Id: <20220726172633.1732800-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Jul 2022 17:26:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3087

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

For correct rendering of the note

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 8be3c7c0e8..b08a55331d 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -6527,7 +6527,7 @@ newest sstate cache file for each package::
 
 This command will ask you to confirm the deletions it identifies.
 
-Note::
+.. note::
 
    The duplicated sstate cache files of one package must have the same
    architecture, which means that sstate cache files with multiple
-- 
2.34.1


