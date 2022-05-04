Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B07C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 15:28:39 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.941.1651678113754453032
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 08:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OW+5n+lG;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CFF62200003;
	Wed,  4 May 2022 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651678112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yvj2cGeZp9m8UcHt11RKXv7G+RaWTNCZWfbkrizLHYo=;
	b=OW+5n+lGqdxE5KvKYyXXfjgt1X8ZFXX5It5lFc/qbO9Tzr6HdbR8AKSpyQbMjxvAx0Av0k
	KPvthZ4w70E1vC7Zwh3bsMPs5XkGWTc3WfSR9Bxsns0bg4+XaCcy3jnpJyo7Ae/yZ8CMDc
	XdOFlD3xH8cuoioPj0juS3P5W4LwcLoLLI8J9dDK9/Xps1umwcEhsCtGkDycla6uk0VvsB
	EYKHeeF175k0N0EWqU0kZHh84E35ARxid3GU+kwKTyC7TbBw9vfW5H79RPoaNUnfO+yUvc
	HDa14/UhN6I6d7DnRXRAqwUQw4zrEeBTPHH0+fgUboWQ/sQ3BvMP/2/Lf3i1EQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] doc: standards for project and file names
Date: Wed,  4 May 2022 17:28:29 +0200
Message-Id: <20220504152829.689363-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 15:28:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2913

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/standards.md | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/documentation/standards.md b/documentation/standards.md
index a2274f6d6e..d288376828 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -7,7 +7,29 @@ It is currently a work in progress.
 
 ## Text standards
 
-This section has not been filled yet
+### Project names
+
+Project names should be capitalized in the same
+way they are on Wikipedia, in particular:
+
+* BitBake
+* OpenEmbedded
+
+There are exceptions in which such names can be used
+in lower case:
+
+* When referring to a package name
+* When referring to the corresponding command name
+* When used in a cross-reference title. Such
+  titles are usually in lower case.
+
+### File names
+
+File names should be quoted as in the below example:
+
+     ``conf/local.conf``
+
+Using "conf/local/conf" would be wrong.
 
 ## ReStructured Text Syntax standards
 
-- 
2.25.1


