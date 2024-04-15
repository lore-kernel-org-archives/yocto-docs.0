Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F70C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 10:06:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.17256.1713175564341190927
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 03:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nqPZtnqM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CEFBE0009;
	Mon, 15 Apr 2024 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713175562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CP76UcgAAhBjiaaOsR9r6GbMJdCKHiC8/2y2bQ4s+7U=;
	b=nqPZtnqMo60ErBvuerh8oYhLcSRChGdiUMjs9K5OpIRgrOJB1k9WNzXrFwQ9zlbVWkhSHr
	WtVI0OXrUWnOGKZ7s3zQD1S5ejyxj0+IKVHaeQHzLJK6+85fgQ/GTs+AjKRHiMExxXMv5t
	vR48qob73OwNw6JrJFUuEd0TGKcBBERQ+Vt6eIRCGCwWzGhQ4AAf/BehZAs9BEOpxkZfJ7
	FwOZVxJVnhKNIP9KnTfSSrJboTSkRt6Uj6DROTNiN0T7pi6UPdx/tv7ppmEelh9aU+fr2z
	+EDAWTRJ3WZ55PGZXx0QtvDVaCpK+Jy09kkvy/55XoSvopb52UdjVTf0HawtEw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [RFC][PATCH] manuals: standards.md5: add standard for project names
Date: Mon, 15 Apr 2024 12:05:55 +0200
Message-Id: <20240415100555.1054695-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 10:06:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5146

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Set a new standard to introduce project names with single quotes,
so that they appear in generated text with an italic font,
to make them easier to distinguish from command names and from
ordinary English words.

Rework and move the standard for command and file names
to make the whole description "flow" better.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/standards.md | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/documentation/standards.md b/documentation/standards.md
index e0c0cba83c..05c5afffe8 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -70,27 +70,28 @@ cannot be split without infringing syntactic rules
 or reducing readability, as well as for command output
 which should be kept unmodified.
 
-### Project names
+### File, tool and command names
 
-Project names should be capitalized in the same
-way they are on Wikipedia, in particular:
+File, tool, command and package names should be double tick-quoted.
+For example, ``` ``conf/local.conf`` ``` is preferred over
+`"conf/local.conf"`.
 
-* BitBake
-* OpenEmbedded
+### Project names
 
-There are exceptions in which such names can be used
-in lower case:
+Project names should be introduced with single quotes, to have them rendered
+with an italic font and make them easier to distinguish from command names
+(double tick-quoted) and from regular English words.
 
-* When referring to a package name
-* When referring to the corresponding command name
-* When used in a cross-reference title. Such
-  titles are usually in lower case.
+They should also be capitalized in the same way they are on Wikipedia, or on
+their own project pages if they are not described on Wikipedia.
 
-### File, tool and command names
+For example:
 
-File, tool and command names should be double tick-quoted.
-For example, ``` ``conf/local.conf`` ``` is preferred over
-`"conf/local.conf"`.
+* ``` `BitBake` ```
+* ``` `ftrace` ```
+
+An exception is when such names are used in a section title, or in a cross-reference
+to a section. In that case, capitalization and quotes are ignored by Sphinx.
 
 ### Variables
 
-- 
2.34.1


