Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481CDEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:46:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8020.1687182401233542433
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 06:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UN/v5LPE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687182399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T8nokSd5GH22xHacQxnjNDC748l5GAgY3PsIqx10MOM=;
	b=UN/v5LPEZqMsXFCWqSNsO7/VXP7bsNjanqIUn8GcUcNTsEdHbZBz9claYRbrFSqHfJ3dyx
	VqgJrqhPX7obyEi5nDvLee1mUsEj7R16GGuo/BQU4PfBiOaSYjXK49HASg3+7cT4CXbq/R
	62ExEoos+rBX2Bi8OIlYo74NqONkddifwaM0hgKVqat4rBNwuSQJwV52LgmgAUQ0mxBgOm
	nF4ZZPBievD6NZEA+NfiE5GLz9bVtvHfxO6UQMEy/tz0nS3TG8u08tK7cdIvqmPY9SzC9i
	47i/Vbp7aFqt035n1dhNj1eIzZLyMClylJWAHhn5yMAszaCfoPMfury3eVHtfw==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3243EC0013;
	Mon, 19 Jun 2023 13:46:38 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Ed Beroset <beroset@ieee.org>
Subject: [PATCH] [mickledore] ref-manual: add clarification for SRCREV
Date: Mon, 19 Jun 2023 15:46:36 +0200
Message-Id: <20230619134636.894445-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Jun 2023 13:46:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4004

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
index 574af2c2f9..d2b83a2cd6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7787,7 +7787,7 @@ system and gives an overview of their function and contents.
       that if you want to build a fixed revision and you want to avoid
       performing a query on the remote repository every time BitBake parses
       your recipe, you should specify a :term:`SRCREV` that is a full revision
-      identifier and not just a tag.
+      identifier (e.g. the full SHA hash in git) and not just a tag.
 
       .. note::
 
-- 
2.34.1


