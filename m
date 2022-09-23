Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64717C6FA83
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.578.1663955607245342557
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q+3fV6zA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7773960003;
	Fri, 23 Sep 2022 17:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5MBJCc8u+IdhLqriVqEWDNn7p3TZyxeD4dToy8eDPow=;
	b=Q+3fV6zAJecv+hmyW5Xph3170RHrRb5dUfRFiKfAjdSzv9PeetfbPFFbhaEAVtAry1WsDG
	Ph7s37UcQ/A+BXy9a2/F7nKB5GieUVM1TFnpFGozyfdvO1tH8tpUgahhU3dktovaYtBPvz
	6B//VxXNNmEE7nLiKmWa6T9L9QEmGRbwEVKdz+LH/w/xQir1sGdJEnby0upAlSE8db256V
	CzsBigZC0JKrek9rDfCoJ8T8Y6mbciiuKMMp+UjOYuk4f1yFAiQvBdmhqpshsHPPtR3/DB
	xigZCvHaH9J8/8SQOmDX/dtVQr2JUH5UL2bHIWMybA0/wFxRrx7XoUgEn4NlmA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 11/30] manuals: add references to the "do_patch" task
Date: Fri, 23 Sep 2022 19:52:00 +0200
Message-Id: <20220923175219.6652-12-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3226

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst        | 2 +-
 documentation/migration-guides/migration-1.3.rst | 2 +-
 documentation/overview-manual/concepts.rst       | 2 +-
 documentation/ref-manual/qa-checks.rst           | 2 +-
 documentation/ref-manual/tasks.rst               | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 74b050f600..947e10560a 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9633,7 +9633,7 @@ Running Specific Tasks
 ----------------------
 
 Any given recipe consists of a set of tasks. The standard BitBake
-behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
+behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, :ref:`ref-tasks-patch`,
 :ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, :ref:`ref-tasks-install`, :ref:`ref-tasks-package`,
 ``do_package_write_*``, and :ref:`ref-tasks-build`. The default task is
 :ref:`ref-tasks-build` and any tasks on which it depends build first. Some tasks,
diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
index 6a1755d1dc..09fc39d3ca 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -62,7 +62,7 @@ Previously, an inconsistent mix of spaces and tabs existed, which made
 extending these functions using ``_append`` or ``_prepend`` complicated
 given that Python treats whitespace as syntactically significant. If you
 are defining or extending any Python functions (e.g.
-``populate_packages``, ``do_unpack``, ``do_patch`` and so forth) in
+``populate_packages``, ``do_unpack``, :ref:`ref-tasks-patch` and so forth) in
 custom recipes or classes, you need to ensure you are using consistent
 four-space indentation.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 36498ba1e1..f1457522da 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1208,7 +1208,7 @@ end result.
 The build system has knowledge of the relationship between these tasks
 and other preceding tasks. For example, if BitBake runs
 ``do_populate_sysroot_setscene`` for something, it does not make sense
-to run any of the :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
+to run any of the :ref:`ref-tasks-fetch`, ``do_unpack``, :ref:`ref-tasks-patch`,
 :ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, and :ref:`ref-tasks-install` tasks. However, if
 :ref:`ref-tasks-package` needs to be run, BitBake needs to run those other tasks.
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index ff8916aedf..9455bec3fd 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -677,7 +677,7 @@ Errors and Warnings
 
 - ``Fuzz detected: <patch output> [patch-fuzz]``
 
-    This check looks for evidence of "fuzz" when applying patches within the ``do_patch``
+    This check looks for evidence of "fuzz" when applying patches within the :ref:`ref-tasks-patch`
     task. Patch fuzz is a situation when the ``patch`` tool ignores some of the context
     lines in order to apply the patch. Consider this example:
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 1bb8bc1918..f0129c1f72 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -327,7 +327,7 @@ file as a patch file::
        "
 
 Conversely, if you have a file whose file type is ``.patch`` or ``.diff``
-and you want to exclude it so that the ``do_patch`` task does not apply
+and you want to exclude it so that the :ref:`ref-tasks-patch` task does not apply
 it during the patch phase, you can use the "apply=no" parameter with the
 :term:`SRC_URI` statement::
 
-- 
2.34.1


