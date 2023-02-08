Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1228FC636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 17:46:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.4957.1675878385422608688
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 09:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H7+HW2Ez;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D2B0FE0005;
	Wed,  8 Feb 2023 17:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675878383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TFeKLTaOpcVxdf9Itji67qX7f+nLrIsoVV4RGu5gKxM=;
	b=H7+HW2EzrgbkVY6ZG6PHLg1dBy+N1jgZxO7rth5pyoHzFRtAkG8RFOTPuZ5tyILwS8ZCuu
	vbg0Z6t7fXwljfC0CNN6Y0Dv0HUxcYjlMGjH//eBh401lvAk0OBmNORA1oV2Gr67WvbA42
	iQpGs9DgjJj3jRoPb9e+H3dCPZBZjdD3XXN3e9dkYag+IzVhxC2untWV1X5BGLIpJFCUH6
	qp9Lb1VKEee5ZMIGwZ0nVulo+VhF4oBFKUN/X8KxKzb5HC03jMGVWsU68nfxG3CLeYj5ab
	xOoBn3guxDC9tU4hfbIbTtKXD4z3jj7XrR+UFvU0oxNKauvsStUL5eyaLT2CUw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables.rst: fix broken hyperlink
Date: Wed,  8 Feb 2023 18:46:15 +0100
Message-Id: <20230208174615.103749-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Feb 2023 17:46:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3651

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index edc3aa6523..1989bd6206 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7794,7 +7794,7 @@ system and gives an overview of their function and contents.
 
       :term:`SSTATE_EXCLUDEDEPS_SYSROOT` is evaluated as two regular
       expressions of recipe and dependency to ignore. An example
-      is the rule in :oe_git:`meta/conf/layer.conf </meta/conf/layer.conf>`::
+      is the rule in :oe_git:`meta/conf/layer.conf </openembedded-core/tree/meta/conf/layer.conf>`::
 
          # Nothing needs to depend on libc-initial
          # base-passwd/shadow-sysroot don't need their dependencies
-- 
2.37.2


