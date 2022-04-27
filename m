Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C9BC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 12:34:10 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.7663.1651062842424765769
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 05:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wyh2VIEO;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8258220000A;
	Wed, 27 Apr 2022 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651062840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FU7voGCGvmgqKcq2is7o9AC4Ce510ilFVyQfiGvP3l4=;
	b=Wyh2VIEOPbrcPOb4vHAXchfWIfPUreaGUky+D34YfusmOqS6yl2UKK8sUA0hQM80Zuximr
	GA5NA6S+1XOPoLhZ2rIWa6wHPMZuNlB4ZSFM4BYh9gBDBk58L2RLLrFQ2q1PbBDjIpuPqY
	G+0CJsVNghUBVPhOpK47z5glMY7G0ggAs1F7e8atFzi6EVHZ1/ruYeFZjqhsdAm55yMgx8
	pc36LZTiPAg43CpQGvbcSy0nCk9eqpi/EN6wf7EPrla1fPuv72w3mo8PmP/K2VOjWhXuib
	pgZ9DSJnzKZoSrriAKHa7kNE2O5qm/zEwcQ1ks0q8xpRmKwGdW1Wo+wxhLPovw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: yocto@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] migration-guides: stop including documents with ".. include"
Date: Wed, 27 Apr 2022 14:33:41 +0200
Message-Id: <20220427123341.228526-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16E9C0CE66240BBD.28362@lists.yoctoproject.org>
References: <16E9C0CE66240BBD.28362@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 12:34:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2888

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

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


