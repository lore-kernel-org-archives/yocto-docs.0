Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183ABC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 16:33:10 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.5840.1653669180899620537
 for <docs@lists.yoctoproject.org>;
 Fri, 27 May 2022 09:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GdaWylNU;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D6E2524000B;
	Fri, 27 May 2022 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653669179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gYZyQZHdmS0jdmIuHgDm6GF02jDrNWxhG7J9z7oNvK8=;
	b=GdaWylNU69AIX+R6Jwf+Qa00wxgc/LFJEPdFBNEsDkA5YPbOkHhUgbVk3m1gD2mOrOUYas
	R5RuXpChX4CNu/VmzTzTQhp6CXavzvNcu6x2rhdUJ+2MVNzxxrHDMQfJN+tP2J7RnuGz4b
	sWVH7KCwn+qwBfclhyhDqw3cIKpACEJJmneZSANfsXyJ50zKst1TmfQ8PsM21JwRGVVkko
	Pmaq9h5vXkixl2zgA78gq7EhXOOJx1BEVVuUImlzZHK/Tua8SDST7zO4RcjSV3jADkhA2o
	+7uCA6jdG3bQK3ot62+Dr0kaX2N02xIRZfHPoEiz5sXSNcDK1ZK2GvZD92RNUA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: standards.md: add more rules: line wrapping and
 variables
Date: Fri, 27 May 2022 18:32:49 +0200
Message-Id: <20220527163249.558316-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 May 2022 16:33:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2954

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fix Markdown syntax too

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/standards.md | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/documentation/standards.md b/documentation/standards.md
index 81aff5f193..8d5c4542af 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -7,6 +7,21 @@ It is currently a work in progress.
 
 ## Text standards
 
+### Line wrapping
+
+Source code for the documentation shouldn't have lines
+wider than 80 characters. This makes patch lines more
+readable and code easier to quote in e-mail clients.
+
+If you have to include long commands or lines in configuration
+files, provided the syntax makes this possible, split them
+into multiple lines, using the ``\`` character.
+
+Exceptions are granted for file contents which lines
+cannot be split without infringing syntactic rules
+or reducing readability, as well as for command output
+which should be kept unmodified.
+
 ### Project names
 
 Project names should be capitalized in the same
@@ -25,11 +40,23 @@ in lower case:
 
 ### File names
 
-File names should be quoted as in the below example:
+File, tool and command names should be quoted as in
+the below example:
+
+    ``conf/local.conf``
+
+Using `"conf/local/conf"` would be wrong.
+
+### Variables
+
+Every variable should be mentioned with:
 
-     ``conf/local.conf``
+    :term:`VARIABLE`
 
-Using "conf/local/conf" would be wrong.
+This assumes that `VARIABLE` is described either
+in the Yocto Project documentation variable index (`ref-manual/variables.rst`)
+or in the BitBake User Manual
+(`doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst`)
 
 ## ReStructured Text Syntax standards
 
-- 
2.25.1


