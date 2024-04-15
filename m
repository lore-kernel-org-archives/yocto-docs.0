Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00D0C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 12:47:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.20025.1713185259805706199
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 05:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BY6WYtHX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C112D1BF208;
	Mon, 15 Apr 2024 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713185257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PTrsUlP5AejxWuF6DHoue0bTeLgHzIXw0DCQcaBNGnM=;
	b=BY6WYtHXohl+YtzYnj+XWRn9X2Di70CtPpCH8T2t6+z1NkMc96yCl3/ClWFwOQRC7tp1A9
	rVcV2jblBrujqffk4qLTMWzoi29FKnLJjy1DIujvqI6YeUwhIvyauL8ZRqU8m+RrTfLdWh
	dlmYfu3loNaJmK+KFiLwZP81LfM5Ug71bQi1+BxLwPK6CqGTI7MYjQb3oJ9mJk2HhXYqmD
	tgTGJqgy+7dmVkGL6zpFg6CqD/Y7+tNmupW4v056rCqHNseT/ML0osurYdtWeL7cf+CfWu
	f3DCMstL9C3AJlNCsUOlapIkVZolBOqKn/Sbbe0L6Z2Fu+lAXpq2qYrlDDUBpw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH v2] manuals: standards.md5: add standard for project names
Date: Mon, 15 Apr 2024 14:47:35 +0200
Message-Id: <20240415124735.1060654-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 12:47:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5151

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

Changes in V2
- Specify that uncapitalized project names should remain so
  even at the beginning of a sentence. This follows what Wikipedia
  seems to be doing, e.g. on https://en.wikipedia.org/wiki/Perf_(Linux)
---
 ...s.md5-add-standard-for-project-names.patch | 70 +++++++++++++++++++
 documentation/standards.md                    | 33 +++++----
 2 files changed, 88 insertions(+), 15 deletions(-)
 create mode 100644 documentation/0001-manuals-standards.md5-add-standard-for-project-names.patch

diff --git a/documentation/0001-manuals-standards.md5-add-standard-for-project-names.patch b/documentation/0001-manuals-standards.md5-add-standard-for-project-names.patch
new file mode 100644
index 0000000000..8b9e36dda6
--- /dev/null
+++ b/documentation/0001-manuals-standards.md5-add-standard-for-project-names.patch
@@ -0,0 +1,70 @@
+From 10924847c19a69a8f7fd2acd97f84987cdfea2c8 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Date: Mon, 15 Apr 2024 11:58:54 +0200
+Subject: [RFC][PATCH] manuals: standards.md5: add standard for project names
+
+Set a new standard to introduce project names with single quotes,
+so that they appear in generated text with an italic font,
+to make them easier to distinguish from command names and from
+ordinary English words.
+
+Rework and move the standard for command and file names
+to make the whole description "flow" better.
+
+Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ documentation/standards.md | 31 ++++++++++++++++---------------
+ 1 file changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/documentation/standards.md b/documentation/standards.md
+index e0c0cba83c..05c5afffe8 100644
+--- a/documentation/standards.md
++++ b/documentation/standards.md
+@@ -70,27 +70,28 @@ cannot be split without infringing syntactic rules
+ or reducing readability, as well as for command output
+ which should be kept unmodified.
+ 
+-### Project names
++### File, tool and command names
+ 
+-Project names should be capitalized in the same
+-way they are on Wikipedia, in particular:
++File, tool, command and package names should be double tick-quoted.
++For example, ``` ``conf/local.conf`` ``` is preferred over
++`"conf/local.conf"`.
+ 
+-* BitBake
+-* OpenEmbedded
++### Project names
+ 
+-There are exceptions in which such names can be used
+-in lower case:
++Project names should be introduced with single quotes, to have them rendered
++with an italic font and make them easier to distinguish from command names
++(double tick-quoted) and from regular English words.
+ 
+-* When referring to a package name
+-* When referring to the corresponding command name
+-* When used in a cross-reference title. Such
+-  titles are usually in lower case.
++They should also be capitalized in the same way they are on Wikipedia, or on
++their own project pages if they are not described on Wikipedia.
+ 
+-### File, tool and command names
++For example:
+ 
+-File, tool and command names should be double tick-quoted.
+-For example, ``` ``conf/local.conf`` ``` is preferred over
+-`"conf/local.conf"`.
++* ``` `BitBake` ```
++* ``` `ftrace` ```
++
++An exception is when such names are used in a section title, or in a cross-reference
++to a section. In that case, capitalization and quotes are ignored by Sphinx.
+ 
+ ### Variables
+ 
+-- 
+2.34.1
+
diff --git a/documentation/standards.md b/documentation/standards.md
index e0c0cba83c..3fc5796301 100644
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
+They should also be capitalized (or not) in the same way they are on Wikipedia,
+or on their own project pages if they are not described on Wikipedia. If a
+project name isn't capitalized, it should remain so even at the beginning of a
+sentence.
 
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


