Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F61C6FA83
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:49 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.565.1663955619266287598
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oyWj1NlN;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 596CA240003;
	Fri, 23 Sep 2022 17:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcSKHjW1pCEaNgzb1YaJhXbrOOGi6sUvKa3XyqXfuZg=;
	b=oyWj1NlNzwmfXE/dTSvcNJYHMc/veawd6UW4yWrd9jjaqD2TPqd3rqlDmAb3XRJPTmnEvz
	Rlo5h5lf2Y+CmoHNrF8xbmoXv/Zu1gtlaF0VSnkzEPkyJ2eYOitq3vPQXwDzkcuHpAdnNv
	CwtK6jdkRlXe13r5td8Lw8b/AvapPZhfDZmBizr7T60kYLWYBz3ksSWQGPWThKaILhS00Z
	EghOFQ4BBqSvvHIUVPMrjozaibk1VDg1HJmHLBRReUTMFvKrGu4p0aYrrLPVpWp0vohgN8
	sC99DrcFtCmio8sqnyHftnaGdb5sYuX2m14hCJ8HREIkyabk1wJfQx0UaxDYbQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 17/30] manuals: add references to the "do_unpack" task
Date: Fri, 23 Sep 2022 19:52:06 +0200
Message-Id: <20220923175219.6652-18-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3232

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst        | 2 +-
 documentation/migration-guides/migration-1.3.rst | 2 +-
 documentation/overview-manual/concepts.rst       | 2 +-
 documentation/ref-manual/tasks.rst               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 5332b21c4a..8a087850b6 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9633,7 +9633,7 @@ Running Specific Tasks
 ----------------------
 
 Any given recipe consists of a set of tasks. The standard BitBake
-behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, :ref:`ref-tasks-patch`,
+behavior in most cases is: :ref:`ref-tasks-fetch`, :ref:`ref-tasks-unpack`, :ref:`ref-tasks-patch`,
 :ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, :ref:`ref-tasks-install`, :ref:`ref-tasks-package`,
 :ref:`do_package_write_* <ref-tasks-package_write_deb>`, and :ref:`ref-tasks-build`. The default task is
 :ref:`ref-tasks-build` and any tasks on which it depends build first. Some tasks,
diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
index 09fc39d3ca..3ba189b773 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -62,7 +62,7 @@ Previously, an inconsistent mix of spaces and tabs existed, which made
 extending these functions using ``_append`` or ``_prepend`` complicated
 given that Python treats whitespace as syntactically significant. If you
 are defining or extending any Python functions (e.g.
-``populate_packages``, ``do_unpack``, :ref:`ref-tasks-patch` and so forth) in
+``populate_packages``, :ref:`ref-tasks-unpack`, :ref:`ref-tasks-patch` and so forth) in
 custom recipes or classes, you need to ensure you are using consistent
 four-space indentation.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 423f645740..2aa7676324 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1208,7 +1208,7 @@ end result.
 The build system has knowledge of the relationship between these tasks
 and other preceding tasks. For example, if BitBake runs
 ``do_populate_sysroot_setscene`` for something, it does not make sense
-to run any of the :ref:`ref-tasks-fetch`, ``do_unpack``, :ref:`ref-tasks-patch`,
+to run any of the :ref:`ref-tasks-fetch`, :ref:`ref-tasks-unpack`, :ref:`ref-tasks-patch`,
 :ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, and :ref:`ref-tasks-install` tasks. However, if
 :ref:`ref-tasks-package` needs to be run, BitBake needs to run those other tasks.
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index bf3a038b1a..dcfc2679ee 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -447,7 +447,7 @@ Validates the :term:`SRC_URI` value.
 ------------
 
 Removes all output files for a target from the
-:ref:`ref-tasks-unpack` task forward (i.e. ``do_unpack``,
+:ref:`ref-tasks-unpack` task forward (i.e. :ref:`ref-tasks-unpack`,
 :ref:`ref-tasks-configure`,
 :ref:`ref-tasks-compile`,
 :ref:`ref-tasks-install`, and
-- 
2.34.1


