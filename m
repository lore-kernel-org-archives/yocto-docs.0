Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7480EC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 07:55:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.15044.1713513333665673577
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Apr 2024 00:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bpk95Z5c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B57911BF20B;
	Fri, 19 Apr 2024 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713513331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hZ3feMHXgZgIKWgm8dMbdbihqnvFI2/YzpUYD28IBS4=;
	b=bpk95Z5cMhKnj1G9aGxIPo897Mq7Cy6/SF9Fxu7/reB5yQ1nO0LPN29EV6vEof8z9Wgztc
	hr+sIOWbncExJ3kqr4zSp4UZGogToWIUHxlMSigrUrW4ivNsKVftEJZ6DqtL0HX/9NP261
	ou1o2/LRtQtemnndOyfji6pS9DippWDq2eVzYHIJVjiR+dvmnuTVS3E8f0rrZuz1TsRl59
	mUE9nJrUX6+gqYxdnIUg8hy+uIvTsoo7ZZQZzX9U0Ci1DWTIXjBPDgkkQivnZxOsTzmohH
	ztHO9dmNMlFsMftyyaKMQsLE28nY4H9gW6agmZParqiJjwiI3z32Dx4E9LKxcA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH v4] manuals: standards.md5: add standard for project names
Date: Fri, 19 Apr 2024 09:55:26 +0200
Message-Id: <20240419075526.4135600-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Apr 2024 07:55:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5170

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

Changes in V4
- Remove the exception for references to section titles (rare case)
- Remove the exception for single quotes in section titles
  (not needed are single quotes are properly processed in this case)

Changes in V3
- Mention that project names don't need single quotes
  when they are part of a hyperlink.

Changes in V2
- Specify that uncapitalized project names should remain so
  even at the beginning of a sentence. This follows what Wikipedia
  seems to be doing, e.g. on https://en.wikipedia.org/wiki/Perf_(Linux)
---
 documentation/standards.md | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/documentation/standards.md b/documentation/standards.md
index e0c0cba83c..bc403e393e 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -70,27 +70,30 @@ cannot be split without infringing syntactic rules
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
+An exception is when project names appear in hyperlinks, as nested markup
+is not supported by Sphinx yet.
 
-### File, tool and command names
+Project names should also be capitalized (or not) in the same way they are on
+Wikipedia, or on their own project pages if they are not described on
+Wikipedia. If a project name isn't capitalized, it should remain so even
+at the beginning of a sentence.
 
-File, tool and command names should be double tick-quoted.
-For example, ``` ``conf/local.conf`` ``` is preferred over
-`"conf/local.conf"`.
+For example:
+
+* ``` `BitBake` ```
+* ``` `ftrace` ```
 
 ### Variables
 
-- 
2.34.1


