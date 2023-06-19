Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB6AEB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:03:04 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8292.1687183380197287351
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 07:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JyZtlczB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687183378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jHsif6Rh0qngpgd3m38ynAtEZ+itVA0UlpllkJBWa5Q=;
	b=JyZtlczB7Vlm4yj9KuXWxyBsqN9akbK19W5ON7aXU5XiVgKBSyHPnW9LoKOju+5SlDjG5L
	Him9HFDS2uQyEU3lac7ZECGxZjeTvU2F/YShfzx4FPXaMAcvLParcTnJCihO/VvlAGXqBr
	l3PDs152f93F4Yv5ninqmcwz8xJ0sTuBq9f6aY3fRJKEBjauker7iyvT34Hx0MYKBB5eyT
	gU2CYzn3WjbgCq56iSe/tB/8UXXMloVpzSiiidhx+hz8iZgg9p8DDj9/Tm61cecWgPvRVC
	8w2Aue0QOVIXx7aStA09XUv/F2wboJB45y/yCWW2ZeVSPAhPDkC5BGzfmPmBig==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C04B71BF213;
	Mon, 19 Jun 2023 14:02:57 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Ed Beroset <beroset@ieee.org>
Subject: [PATCH] [kirkstone] ref-manual: add clarification for SRCREV
Date: Mon, 19 Jun 2023 16:02:55 +0200
Message-Id: <20230619140255.896130-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Jun 2023 14:03:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4005

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Ed Beroset <beroset@ieee.org>

It was not clear to me what a "full revision identifier" was in the
context of the note documenting SRCREV.  After clarification via IRC,
this submission attempts to clarify what is meant to help future
readers.

Signed-off-by: Ed Beroset <beroset@ieee.org>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 968e8d6e05..9aab6e0709 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7298,7 +7298,7 @@ system and gives an overview of their function and contents.
       that if you want to build a fixed revision and you want to avoid
       performing a query on the remote repository every time BitBake parses
       your recipe, you should specify a :term:`SRCREV` that is a full revision
-      identifier and not just a tag.
+      identifier (e.g. the full SHA hash in git) and not just a tag.
 
       .. note::
 
-- 
2.34.1


