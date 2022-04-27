Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34717C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 14:36:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.9035.1651070197706552057
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 07:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kB0aXVS3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C5AAB1C0012;
	Wed, 27 Apr 2022 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651070196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uOPH3qSwJnKro3J4oL5MERbDBqcZaMVXyyhESLXCyS4=;
	b=kB0aXVS3UtuCuJagRhAiLsIjq2PUseCFxSeZZ2EcI+0bHa9MJq2HZrh4KcyL3rH3lyi2T5
	2Ueozpeqb5REWZYUYlCW4dhJRddVdsBsKjcISrIjSdz/idycY/P5V2TFKUF0BP6QIu5jPd
	Al83NdYjJX51kN8YdVn+4Wxb5aloP7ctis0WszLss8DTdYaZzZl7p8NFxQybF+uwDMsG0z
	aoYU4t6cqpx9WN4T6C+MBg33rTEdZQXGawByhkxXBlIck4nNBIp8qcJLt5hBd21oQK/FoY
	nGws9xNkTZEh9oizBooFXOBP4wGr+cr344NIUDf1BPiKulo58jBK1LjF6ljK+Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] [kirkstone] migration-guides: stop including documents with
 ".. include"
Date: Wed, 27 Apr 2022 16:36:33 +0200
Message-Id: <20220427143633.238292-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 14:36:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2895

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

This prevented variables from being substituted through the
code in yocto-vars.py, at least in the files included this way.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/migration-guides/index.rst         |  4 ++--
 documentation/migration-guides/migration-3.4.rst |  6 ------
 documentation/migration-guides/migration-4.0.rst |  2 --
 documentation/migration-guides/release-3.4.rst   | 10 ++++++++++
 documentation/migration-guides/release-4.0.rst   |  7 +++++++
 5 files changed, 19 insertions(+), 10 deletions(-)
 create mode 100644 documentation/migration-guides/release-3.4.rst
 create mode 100644 documentation/migration-guides/release-4.0.rst

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index 20c6ab9d4e..4597506d05 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,8 +12,8 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
-   migration-4.0
-   migration-3.4
+   release-4.0
+   release-3.4
    migration-3.3
    migration-3.2
    migration-3.1
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index c22ea814d6..d57c955eb4 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -1,6 +1,3 @@
-Release 3.4 (honister)
-======================
-
 Migration notes for 3.4 (honister)
 ----------------------------------
 
@@ -274,6 +271,3 @@ Miscellaneous
   examples in :term:`EXTRA_USERS_PARAMS`.
 
 
-.. include:: release-notes-3.4.rst
-.. include:: release-notes-3.4.1.rst
-.. include:: release-notes-3.4.2.rst
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index d737b9d431..a8e6b4c331 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -265,5 +265,3 @@ Miscellaneous changes
   when parsing recipes. Any code depending on the previous behaviour will no longer
   work - change any such code to explicitly use appropriate path variables instead.
 
-
-.. include:: release-notes-4.0.rst
diff --git a/documentation/migration-guides/release-3.4.rst b/documentation/migration-guides/release-3.4.rst
new file mode 100644
index 0000000000..81476c4adb
--- /dev/null
+++ b/documentation/migration-guides/release-3.4.rst
@@ -0,0 +1,10 @@
+Release 3.4 (honister)
+======================
+
+.. toctree::
+
+   migration-3.4
+   release-notes-3.4
+   release-notes-3.4.1
+   release-notes-3.4.2
+
diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
new file mode 100644
index 0000000000..7062f9d241
--- /dev/null
+++ b/documentation/migration-guides/release-4.0.rst
@@ -0,0 +1,7 @@
+Release 4.0 (kirkstone)
+=======================
+
+.. toctree::
+
+   migration-4.0
+   release-notes-4.0
-- 
2.25.1


